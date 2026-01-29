program project1;

uses
  fp_zint;

  procedure main;
  const
    text = '12345678';
  var
    symbol: Pzint_symbol;
    ret, width, height: longint;
    x, y: integer;
    red: byte;
  begin
    symbol := ZBarcode_Create;
    ret := ZBarcode_Encode(symbol, text, 0);
    if ret <> 0 then begin
      WriteLn('Kodierfehler: ', symbol^.errtxt);
      ZBarcode_Delete(symbol);
      Exit;
    end;

    ret := ZBarcode_Buffer(symbol, 0);  // 0 = keine Rotation
    if ret <> 0 then begin
      WriteLn('Buffer-Fehler: ', symbol^.errtxt);
      ZBarcode_Delete(symbol);
      Exit;
    end;

    width := symbol^.bitmap_width;
    height := symbol^.bitmap_height;

    WriteLn('Barcode: ', width, 'x', height, ' Pixel');

    Write(#27'[1;37m'#10);
    for x := 0 to width + 1 do begin
      Write('█');
    end;
    WriteLn;

    for  y := 0 to height - 1 do begin
      Write('█');
      for x := 0 to width - 1 do begin

        red := symbol^.bitmap[(x + y * width) * 3];

        if red < 128 then begin
          Write(' ');
        end else begin
          Write('█');
        end;
      end;
      WriteLn('█');
    end;

    for x := 0 to width + 1 do begin
      Write('█');
    end;
    WriteLn(#27'[0m'#10#10#10);

    ZBarcode_Delete(symbol);
  end;

begin
  main;
end.
