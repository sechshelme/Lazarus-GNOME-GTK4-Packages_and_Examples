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

  function printPoly(poly: PGEOSGeometry): string;
  var
    writer: PGEOSWKTWriter;
    wkt_result: pchar;
  begin
    writer := GEOSWKTWriter_create();
    wkt_result := GEOSWKTWriter_write(writer, poly);
    Result := wkt_result;
    GEOSFree(wkt_result);
    GEOSWKTWriter_destroy(writer);
  end;

  procedure printPolygon(poly: PGEOSGeometry; const name: string);
  var
    f: double;
    centroid: PGEOSGeometry;
  begin
    WriteLn('Name: ', name);
    WriteLn('  ', printPoly(poly));

    GEOSArea(poly, @f);
    WriteLn('  Fläche: ', f: 4: 2);

    GEOSLength(poly, @f);
    WriteLn('  Länge: ', f: 4: 2);

    centroid := GEOSGetCentroid(poly);
    WriteLn('  Schwerpunkt: ', printPoly(centroid));
    GEOSGeom_destroy(centroid);

    WriteLn();
  end;

  procedure main;
  var
    reader: PGEOSWKTReader;
    poly1, poly2, tmpPoly: PGEOSGeometry;
  begin
    initGEOS(@notice_handler, @notice_handler);

    reader := GEOSWKTReader_create;

    poly1 := GEOSWKTReader_read(reader, 'POLYGON((0 0, 10 0, 10 10, 0 10, 0 0))');
    poly2 := GEOSWKTReader_read(reader, 'POLYGON((5 5, 15 5, 15 15, 5 15, 5 5))');

    printPolygon(poly1, 'poly1');
    printPolygon(poly2, 'poly2');

    if GEOSIntersects(poly1, poly2) <> #0 then begin
      WriteLn('Die Geometrien schneiden sich!'#10);

      // Intersection
      tmpPoly := GEOSIntersection(poly1, poly2);
      printPolygon(tmpPoly, 'Intersection');
      GEOSGeom_destroy(tmpPoly);

      // Union
      tmpPoly := GEOSUnion(poly1, poly2);
      printPolygon(tmpPoly, 'Union');
      GEOSGeom_destroy(tmpPoly);

      // Difference
      tmpPoly:=  GEOSDifference(poly1, poly2);
      printPolygon(tmpPoly, 'Difference');
      GEOSGeom_destroy(tmpPoly);
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
