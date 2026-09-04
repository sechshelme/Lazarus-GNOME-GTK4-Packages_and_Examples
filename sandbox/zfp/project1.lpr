program project1;

uses
  fp_zfp;

procedure main;
const
  nx = 8;
  ny = 8;
  count = nx * ny;
var
  data: PDouble;
  y, x, idx, typ, i: integer;
  field, dec_field: Pzfp_field;
  zfp: Pzfp_stream;
  bufsize, compressed_bytes: Tsize_t;
  stream: Pbitstream;
  decompressed_data: PDouble;
  orig, decomp, diff: double;
  buffer: Pointer;
begin
  // Speicher allozieren
  data := GetMem(count * sizeof(double));

  // 1. Quelldaten initialisieren
  for y := 0 to ny - 1 do begin
    for x := 0 to nx - 1 do begin
      idx := y * nx + x;
      // Wichtig: x und y müssen als Double in den Sinus/Cosinus (wie im C-Code)
      data[idx] := sin(Double(x) * 0.5) * cos(Double(y) * 0.5) * 10.0;
    end;
  end;

  typ := zfp_type_double;
  // Hier nx und ny als Variablen-Referenzen übergeben (bzw. an Ihren funktionierenden Wrapper anpassen)
  field := zfp_field_2d(data, typ, nx, ny);

  zfp := zfp_stream_open(nil);
  zfp_stream_set_rate(zfp, 16.0, typ, 2, zfp_true);

  bufsize := zfp_stream_maximum_size(zfp, field);
  buffer := GetMem(bufsize);

  stream := stream_open(buffer, bufsize);
  zfp_stream_set_bit_stream(zfp, stream);
  zfp_stream_rewind(zfp);

  // Kompression
  compressed_bytes := zfp_compress(zfp, field);
  if compressed_bytes = 0 then begin
    WriteLn('Kompression fehlgeschlagen.');
    Exit;
  end;

  // Dekompression vorbereiten
  decompressed_data := GetMem(count * sizeof(double));
  dec_field := zfp_field_2d(decompressed_data, typ, nx, ny);

  zfp_stream_rewind(zfp);
  if zfp_decompress(zfp, dec_field) = 0 then begin
    WriteLn('Dekompression fehlgeschlagen.');
    Exit;
  end;

  // 9. REINER VERGLEICH
  WriteLn('Statistik: ', count * sizeof(double), ' Bytes -> ', compressed_bytes, ' Bytes'#10);
  WriteLn('Index | Original     | ZFP-Ausgabe  | Differenz');
  WriteLn('-----------------------------------------------------');

  for i := 0 to count - 1 do begin
    orig := data[i];
    decomp := decompressed_data[i];
    // Abs() sorgt dafür, dass wie bei fabs() in C immer der absolute Fehler gemessen wird
    diff := Abs(orig - decomp);

    // Ausgabe formatieren (mit :0:6 für 6 Nachkommastellen wie bei %-12.6f in C)
    WriteLn('[', i:02, ']  | ', orig:12:6, ' | ', decomp:12:6, ' | ', diff:12:6);
  end;

  // 10. Ressourcen freigeben
  zfp_field_free(field);
  zfp_field_free(dec_field);
  zfp_stream_close(zfp);
  stream_close(stream);
  FreeMem(buffer);
  FreeMem(data);
  FreeMem(decompressed_data);
end;

begin
  main;
end.
