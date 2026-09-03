program project1;

uses
  fp_lerc_c;

  procedure main;
  const
    nCols: integer = 3;
    nRows: integer = 2;
    nBands: integer = 1;
    nDepth: integer = 1;
    originalData: array[0..5] of single = (
      10.5, 11.2, 12.1,
      20.0, 21.5, 22.3);
    maxZError: double = 0.1;
  var
    bufferSizeNeeded: int32 = 0;
    bytesWritten: int32 = 0;

  var
    i: integer;
    compressedBuffer: PByte;
    lercResult: Tlerc_status;
    decompressedData: PSingle;

  begin

    WriteLn('--- Originaldaten ---');
    for i := 0 to nRows * nCols - 1 do begin
      Write(originalData[i]: 4: 2, '  ');
    end;
    WriteLn(#10);


    lerc_computeCompressedSize(@originalData, 6, nDepth, nCols, nRows, nBands, 0, nil, maxZError, @bufferSizeNeeded);

    compressedBuffer := GetMem(bufferSizeNeeded);

    lercResult := lerc_encode(@originalData, 6, nDepth, nCols, nRows, nBands, 0, nil, maxZError, compressedBuffer, bufferSizeNeeded, @bytesWritten);

    if lercResult <> 0 then begin
      WriteLn('Fehler bei der Komprimierung! Code: ', lercResult);
      Freemem(compressedBuffer);
      Exit;
    end;

    WriteLn('Erfolgreich komprimiert. Originalgrösse: ', sizeof(originalData), ' Bytes. LERC-Grösse: ', bytesWritten, ' Bytes.'#10);

    decompressedData := GetMem(nRows * nCols * sizeof(single));

    lercResult := lerc_decode(compressedBuffer, bytesWritten, 0, nil, nDepth, nCols, nRows, nBands, 6, decompressedData);

    if lercResult <> 0 then begin
      WriteLn('Fehler bei der Dekomprimierung! Code: ', lercResult);
      Freemem(compressedBuffer);
      Freemem(decompressedData);
    end;

    WriteLn('--- Dekomprimierte Daten (Maximaler Fehler: ', maxZError: 4: 2, ') ---');
    for  i := 0 to nRows * nCols - 1 do begin
      Write(decompressedData[i]: 3: 2, '  ');
    end;
    WriteLn;

    Freemem(compressedBuffer);
    Freemem(decompressedData);
  end;

begin
  main;
end.
