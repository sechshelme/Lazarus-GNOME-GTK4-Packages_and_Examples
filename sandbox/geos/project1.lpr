program project1;

           uses
             fp_geos_c;


//void notice_handler(const char *fmt, ...) {
//    va_list ap;
//    va_start(ap, fmt);
//    vfprintf(stderr, fmt, ap);
//    va_end(ap);
//}


procedure main;
begin

  initGEOS(notice_handler, notice_handler);

  // WKT (Well-Known Text) Reader erstellen
  GEOSWKTReader* reader = GEOSWKTReader_create();

  // 2. Zwei Geometrien definieren
  // Ein großes Rechteck
  GEOSGeometry* poly1 = GEOSWKTReader_read(reader, "POLYGON((0 0, 10 0, 10 10, 0 10, 0 0))");
  // Ein kleineres, verschobenes Quadrat
  GEOSGeometry* poly2 = GEOSWKTReader_read(reader, "POLYGON((5 5, 15 5, 15 15, 5 15, 5 5))");

  // 3. Prüfung: Schneiden sich die Geometrien?
  if (GEOSIntersects(poly1, poly2)) {
      printf("Die Geometrien schneiden sich!\n");

      // 4. Schnittmenge (Intersection) berechnen
      GEOSGeometry* intersection = GEOSIntersection(poly1, poly2);

      // Ergebnis als WKT ausgeben
      GEOSWKTWriter* writer = GEOSWKTWriter_create();
      char* wkt_result = GEOSWKTWriter_write(writer, intersection);

      printf("Schnittmenge: %s\n", wkt_result);

      // Speicher aufräumen
      GEOSFree(wkt_result);
      GEOSWKTWriter_destroy(writer);
      GEOSGeom_destroy(intersection);
  }

  // 5. Aufräumen
  GEOSGeom_destroy(poly1);
  GEOSGeom_destroy(poly2);
  GEOSWKTReader_destroy(reader);
  finishGEOS();

end;

begin
  main;
end.

