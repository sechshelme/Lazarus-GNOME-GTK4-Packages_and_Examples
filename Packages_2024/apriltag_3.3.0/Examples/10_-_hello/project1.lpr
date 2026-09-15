program project1;
uses
  fp_apriltag;

  procedure PrintPattern(tf: Papriltag_family_t);
  var
    y, x, p: integer;
    pixel_val: Tuint8_t;
    tag_pattern: Pimage_u8_t;
    max_tags: Tuint32_t;
  begin
    max_tags := tf^.ncodes;
    for p := 0 to max_tags - 1 do begin
      tag_pattern := apriltag_to_image(tf, p);

      for  y := 0 to tag_pattern^.height - 1 do begin
        for  x := 0 to tag_pattern^.width - 1 do begin
          pixel_val := tag_pattern^.buf[y * tag_pattern^.stride + x];

          if pixel_val = 0 then begin
            printf('##');
          end else begin
            printf('  ');
          end;
        end;
        printf(#10);
      end;

      image_u8_destroy(tag_pattern);
    end;

  end;

  procedure main;
  var
    td: Papriltag_detector_t;
    tf: Papriltag_family_t;
    pixel_buffer: Puint8_t;
    tag_id, ty, tx, scale, start_x, start_y, sy, sx, px, py,
    num_detections, i: integer;
    tag_pattern: Pimage_u8_t;
    pixel_val: Tuint8_t;
    detections: Pzarray_t;
    im: Timage_u8_t;
    det: Papriltag_detection_t;
  const
    width = 640;
    height = 480;
  begin
    td := apriltag_detector_create;
    tf := tag36h11_create();
    apriltag_detector_add_family(td, tf);

    pixel_buffer := Puint8_t(calloc(width * height, SizeOf(Tuint8_t)));

    tag_id := 586;

    tag_pattern := apriltag_to_image(tf, tag_id);
    if tag_pattern = nil then begin
      Exit;
    end;

    printf(#10'--- VISUELLE DARSTELLUNG DES APRILTAGS (ID: %d) ---'#10, tag_id);
    PrintPattern(tf);

    printf('--------------------------------------------------'#10#10);

    scale := 15;

    start_x := (width - (tag_pattern^.width * scale)) div 2;
    start_y := (height - (tag_pattern^.height * scale)) div 2;

    for  ty := 0 to tag_pattern^.height - 1 do begin
      for  tx := 0 to tag_pattern^.width - 1 do begin
        pixel_val := tag_pattern^.buf[ty * tag_pattern^.stride + tx];

        for  sy := 0 to scale - 1 do begin
          for  sx := 0 to scale - 1 do begin
            px := start_x + (tx * scale) + sx;
            py := start_y + (ty * scale) + sy;
            pixel_buffer[py * width + px] := pixel_val;
          end;
        end;
      end;
    end;

    image_u8_destroy(tag_pattern);
    printf('AprilTag mit ID %d im Speicher generiert!'#10, tag_id);

    im.width := width;
    im.height := height;
    im.stride := width;
    im.buf := pixel_buffer;

    printf('Starte AprilTag-Erkennung...'#10);
    detections := apriltag_detector_detect(td, @im);

    num_detections := zarray_size(detections);
    printf('%d Tags gefunden.'#10, num_detections);

    for i := 0 to num_detections - 1 do begin
      zarray_get(detections, i, @det);
      printf('->. Tag gefunden! ID: %d bei Mittelpunkt: (X: %f, Y: %f)'#10, det^.id, det^.c[0], det^.c[1]);
    end;

    apriltag_detections_destroy(detections);
    free(pixel_buffer);
    apriltag_detector_destroy(td);
    tag36h11_destroy(tf);
  end;

begin
  main;
end.
