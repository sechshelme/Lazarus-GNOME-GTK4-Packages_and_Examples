program project1;
uses
fp_aa;
procedure main;
begin
  // 1. Initialisierung
  // aa_autoinit wählt automatisch den besten verfügbaren Treiber (ncurses, stdout, X11, etc.)
  aa_context *context = aa_autoinit(&aa_defparams);

  if (context == NULL) {
      fprintf(stderr, "Fehler: AAlib konnte nicht initialisiert werden.\n");
      return 1;
  }

  // Falls die Tastaturunterstützung nicht automatisch aktiv ist, versuchen wir sie zu aktivieren
if (aa_autoinitkbd(context, 0) == 0) {
      fprintf(stderr, "Konnte Tastatur nicht initialisieren (eventuell ignorierbar)\n");
  }
  // Variabel für die Animation
  double t = 0.0;

  // 2. Hauptschleife
  while (1) {
      // Tastatureingabe prüfen (non-blocking)
      int event = aa_getevent(context, 0);
      if (event == AA_ESC) { // Programm beenden mit ESC
          break;
      }

      // Bildparameter abrufen
      int width = aa_imgwidth(context);
      int height = aa_imgheight(context);
      unsigned char *buffer = aa_image(context);

      // 3. Zeichnen (in den Puffer schreiben)
      // Wir füllen das Array 'buffer' mit Werten zwischen 0 (schwarz) und 255 (weiß)
      for (int y = 0; y < height; y++) {
          for (int x = 0; x < width; x++) {
              // Eine mathematische Funktion für hübsche Wellenmuster
              double v = sin(x * 0.1 + t) + cos(y * 0.1 + t * 0.5);

              // Normalisieren von -2..2 auf 0..255
              int pixel = (int)((v + 2.0) * 63.75);

              // Pixel setzen
              buffer[x + y * width] = (unsigned char)pixel;
          }
      }

      // 4. Rendern und Anzeigen
      // Rendert den Puffer in ASCII-Zeichen
      aa_render(context, &aa_defrenderparams, 0, 0, width, height);

      // Gibt das Ergebnis auf dem Bildschirm aus
      aa_flush(context);

      // Animationsschritt erhöhen
      t += 0.1;
  }

  // 5. Aufräumen
  aa_close(context);
end;

begin
  main;
end.

