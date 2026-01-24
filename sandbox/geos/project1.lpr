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
var
  reader: PGEOSWKTReader;
  poly1, poly2, intersection: PGEOSGeometry;
  writer: PGEOSWKTWriter;
  wkt_result: PChar;
begin

//  initGEOS(@notice_handler, @notice_handler);
  initGEOS(nil,nil);

  reader := GEOSWKTReader_create;

  poly1 := GEOSWKTReader_read(reader, 'POLYGON((0 0, 10 0, 10 10, 0 10, 0 0))');
poly2 := GEOSWKTReader_read(reader, 'POLYGON((5 5, 15 5, 15 15, 5 15, 5 5))');

  if GEOSIntersects(poly1, poly2)<>#0 then begin
      WriteLn('Die Geometrien schneiden sich!');

   intersection := GEOSIntersection(poly1, poly2);

  writer := GEOSWKTWriter_create();
      wkt_result := GEOSWKTWriter_write(writer, intersection);

      WriteLn('Schnittmenge: ', wkt_result);

      GEOSFree(wkt_result);
      GEOSWKTWriter_destroy(writer);
      GEOSGeom_destroy(intersection);
  end;

  GEOSGeom_destroy(poly1);
  GEOSGeom_destroy(poly2);
  GEOSWKTReader_destroy(reader);
  finishGEOS;
end;

begin
  main;
end.

