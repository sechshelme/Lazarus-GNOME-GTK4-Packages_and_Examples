program project1;
uses
  fp_apriltag;

const
  INPUT_FILE = 'input.jpg';

  procedure main;
  var
    tf: Papriltag_family_t;
    td: Papriltag_detector_t;
    pjpeg: Ppjpeg_t;
    err: longint;
    im: Pimage_u8_t = nil;
    detections: Pzarray_t;
    det: Papriltag_detection_t;
    i: integer;
  begin
    tf := tag36h11_create;
    td := apriltag_detector_create;
    apriltag_detector_add_family_bits(td, tf, 2);

    td^.quad_decimate := 2.0;
    td^.quad_sigma := 0.0;
    td^.nthreads := 1;
    td^.debug := False;
    td^.refine_edges := True;

    pjpeg := pjpeg_create_from_file(INPUT_FILE, 0, @err);
    if pjpeg <> nil then begin
      im := pjpeg_to_u8_baseline(pjpeg);
      pjpeg_destroy(pjpeg);
    end else begin
      printf('Fehler beim Laden der JPG-Datei: %d'#10, err);
    end;

    if im = nil then begin
      printf('Bild konnte nicht geladen werden: %s'#10, INPUT_FILE);
      apriltag_detector_destroy(td);
      tag36h11_destroy(tf);
      Exit;
    end;

    printf('Verarbeite Bild: %s (%dx%d)'#10, INPUT_FILE, im^.width, im^.height);

    detections := apriltag_detector_detect(td, im);
    printf('Gefundene Tags: %d'#10, zarray_size(detections));
    for  i := 0 to zarray_size(detections) - 1 do begin
      zarray_get(detections, i, @det);
      printf('Erkennung %3d: ID %-4d (Hamming: %d, Margin: %8.3f)'#10, i, det^.id, det^.hamming, det^.decision_margin);
    end;

    apriltag_detections_destroy(detections);
    image_u8_destroy(im);
    apriltag_detector_destroy(td);
    tag36h11_destroy(tf);
  end;

begin
  main;
end.
