program project1;

uses
  fp_geos_c;

  procedure notice_handler(fmt: pchar; args: pchar); cdecl;
  begin
    if fmt = '%s' then begin
      WriteLn('Fehler: ', args);
    end else begin
      WriteLn('fmt unbekannt!');
    end;
  end;

  procedure main;
  var
    reader: PGEOSWKTReader;
    poly1, poly2, intersection, union: PGEOSGeometry;
    writer: PGEOSWKTWriter;
    wkt_result: pchar;
  begin
    initGEOS(@notice_handler, @notice_handler);

    reader := GEOSWKTReader_create;

    poly1 := GEOSWKTReader_read(reader, 'POLYGON((0 0, 10 0, 10 10, 0 10, 0 0))');
    poly2 := GEOSWKTReader_read(reader, 'POLYGON((5 5, 15 5, 15 15, 5 15, 5 5))');

    if GEOSIntersects(poly1, poly2) <> #0 then begin
      WriteLn('Die Geometrien schneiden sich!'#10);

      // Intersection
      intersection := GEOSIntersection(poly1, poly2);

      writer := GEOSWKTWriter_create();
      wkt_result := GEOSWKTWriter_write(writer, intersection);
      WriteLn('Schnittmenge: ', wkt_result);

      GEOSFree(wkt_result);
      GEOSWKTWriter_destroy(writer);
      GEOSGeom_destroy(intersection);

      // Union
      union := GEOSUnion(poly1, poly2);

      writer := GEOSWKTWriter_create();
      wkt_result := GEOSWKTWriter_write(writer, union);
      WriteLn('Union: ', wkt_result);

      GEOSFree(wkt_result);
      GEOSWKTWriter_destroy(writer);
      GEOSGeom_destroy(union);
    end else begin
      WriteLn('Die Geometrien schneiden sich NICHT!');
    end;;

    GEOSGeom_destroy(poly1);
    GEOSGeom_destroy(poly2);
    GEOSWKTReader_destroy(reader);
    finishGEOS;
  end;

begin
  main;
end.
