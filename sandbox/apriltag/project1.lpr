program project1;

uses
matd,
zarray,
time_util,
timeprofile,
//doubles,
//doubles_floats_impl,
//floats,
g2d,
getopt,
homography,
image_types,
image_u8,
image_u8x3,
image_u8x4,
//math_util,
pam,
pjpeg,
pnm,
postscript_utils,
pthreads_cross,
//string_util,
svd22,
//unionfind,
workerpool,
//zhash,
zmaxheap,
// ====

apriltag,
//apriltag_math,
apriltag_pose,
tag16h5,
tag25h9,
tag36h10,
tag36h11,
tagCircle21h7,
tagCircle49h12,
tagCustom48h12,
tagStandard41h12,
tagStandard52h13,

 fp_apriltag;




procedure main;
begin
  zarray_add( // ????????
  zarray_get( //???????

  apriltag_detector_t *td = apriltag_detector_create();
  apriltag_family_t *tf = tag36h11_create();
  apriltag_detector_add_family(td, tf);

  int width = 640;
  int height = 480;
  uint8_t *pixel_buffer = (uint8_t *)calloc(width * height, sizeof(uint8_t));

  // =========================================================================
  // NEU: Ein echtes AprilTag direkt im Speicher generieren
  // =========================================================================
  int tag_id = 586; // Wir generieren das Tag mit der ID 0

  // Holt das interne Bit-Layout für dieses spezifische Tag (z.B. 10x10 Bits gross)
  image_u8_t *tag_pattern = apriltag_to_image(tf, tag_id);

  if (tag_pattern) {
   // --- NEU: Direkt nach dem Erstellen das Tag im Terminal ausgeben ---
      printf("\n--- VISUELLE DARSTELLUNG DES APRILTAGS (ID: %d) ---\n", tag_id);
      for (int ty = 0; ty < tag_pattern->height; ty++) {
          for (int tx = 0; tx < tag_pattern->width; tx++) {
              uint8_t pixel_val = tag_pattern->buf[ty * tag_pattern->stride + tx];

              // Wenn der Pixelwert 0 ist -> Schwarz (#)
              // Wenn der Pixelwert 255 ist -> Weiss (zwei Leerzeichen für quadratische Optik)
              if (pixel_val == 0) {
                  printf("##");
              } else {
                  printf("  ");
              }
          }
          printf("\n"); // Zeilenumbruch nach jeder Pixelzeile
      }
      printf("--------------------------------------------------\n\n");
      // ------------------------------------------------------------------



      int scale = 15; // Jedes Tag-Bit wird 15x15 Pixel gross gezeichnet

      // Berechne die Startposition, um das Tag in die Mitte des 640x480 Bildes zu setzen
      int start_x = (width - (tag_pattern->width * scale)) / 2;
      int start_y = (height - (tag_pattern->height * scale)) / 2;

      // Kopiere das Tag-Bitmuster vergrössert in unseren pixel_buffer
      for (int ty = 0; ty < tag_pattern->height; ty++) {
          for (int tx = 0; tx < tag_pattern->width; tx++) {
              // Hol den Helligkeitswert des originalen Tag-Pixels (0 oder 255)
              uint8_t pixel_val = tag_pattern->buf[ty * tag_pattern->stride + tx];

              // Zeichne den skalierten Block im Ziel-Buffer
              for (int sy = 0; sy < scale; sy++) {
                  for (int sx = 0; sx < scale; sx++) {
                      int px = start_x + (tx * scale) + sx;
                      int py = start_y + (ty * scale) + sy;
                      pixel_buffer[py * width + px] = pixel_val;
                  }
              }
          }
      }

      // Temporäres Muster-Bild wieder freigeben
      // Da wir uns im Repository befinden, nutzen wir zur Sicherheit das originale free()
      free(tag_pattern->buf);
      free(tag_pattern);
      printf("AprilTag mit ID %d im Speicher generiert!\n", tag_id);
  }
  // =========================================================================

  // 2. Detektion ausführen
  image_u8_t im = {
      .width = width,
      .height = height,
      .stride = width,
      .buf = pixel_buffer
  };

  printf("Starte AprilTag-Erkennung...\n");
  zarray_t *detections = apriltag_detector_detect(td, &im);

  int num_detections = zarray_size(detections);
  printf("%d Tags gefunden.\n", num_detections);

  for (int i = 0; i < num_detections; i++) {
      apriltag_detection_t *det;
      zarray_get(detections, i, &det);
      printf("-> Tag gefunden! ID: %d bei Mittelpunkt: (X: %f, Y: %f)\n", det->id, det->c[0], det->c[1]);
  }

  // 3. Aufräumen
  apriltag_detections_destroy(detections);
  free(pixel_buffer);
  apriltag_detector_destroy(td);
  tag36h11_destroy(tf);

end;

begin
    main;
end.

