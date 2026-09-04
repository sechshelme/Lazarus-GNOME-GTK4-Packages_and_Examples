program project1;

uses
  fp_lerc;

  procedure main;
  const
    nDepth = 1;
    nCols = 3;
    nRows = 2;
    nBands = 1;
    srcData: array[0..nDepth * nCols * nRows * nBands - 1] of single = (
      10.5, 11.2, 12.1, 20.0, 21.5, 22.3);
    maxZError: double = 0.1;
  var
    Buffer: pbyte;
    bufSize: int32;
    bytesWritten: int32;

    i: integer;
    lRes: Tlerc_status;
    desData: PSingle;

  begin

    WriteLn('--- Originaldaten ---');
    for i := 0 to nRows * nCols - 1 do begin
      Write(srcData[i]: 4: 2, '  ');
    end;
    WriteLn(#10);

    lerc_computeCompressedSize(@srcData, 6, nDepth, nCols, nRows, nBands, 0, nil, maxZError, @bufSize);
    Buffer := GetMem(bufSize);
    lRes := lerc_encode(@srcData, 6, nDepth, nCols, nRows, nBands, 0, nil, maxZError, Buffer, bufSize, @bytesWritten);

    if lRes <> 0 then begin
      WriteLn('Fehler bei der Komprimierung! Code: ', lRes);
      Freemem(Buffer);
      Exit;
    end;

    WriteLn('Erfolgreich komprimiert. Originalgrösse: ', sizeof(srcData), ' Bytes. LERC-Grösse: ', bytesWritten, ' Bytes.'#10);

    desData := GetMem(nRows * nCols * sizeof(single));
    lRes := lerc_decode(Buffer, bytesWritten, 0, nil, nDepth, nCols, nRows, nBands, 6, desData);

    if lRes <> 0 then begin
      WriteLn('Fehler bei der Dekomprimierung! Code: ', lRes);
      Freemem(Buffer);
      Freemem(desData);
    end;

    WriteLn('--- Dekomprimierte Daten (Maximaler Fehler: ', maxZError: 4: 2, ') ---');
    for  i := 0 to nRows * nCols - 1 do begin
      Write(desData[i]: 3: 2, '  ');
    end;
    WriteLn;

    Freemem(Buffer);
    Freemem(desData);
  end;

begin
  main;
end.
