program project1;

uses
  fp_qrencode;

  procedure main;
  const
    text = 'Hello World !';
  var
    qr: PQRcode;
    size: longint;
    x, y: integer;
  begin
    qr := QRcode_encodeString(text, 0, QR_ECLEVEL_L, QR_MODE_8, 1);
    if qr = nil then  begin
      WriteLn('Konnte QR-Code nicht erzeugen!');
      Exit;
    end;

    size := qr^.width;
    Write(#27'[1;37m'#10);
    for x := 0 to size + 1 do begin
      Write('██');
    end;
    WriteLn;

    for  y := 0 to size - 1 do begin
      Write('██');
      for x := 0 to size - 1 do begin
        if qr^.data[y * size + x] and 1 <> 0 then begin
          Write('  ');
        end else begin
          Write('██');
        end;
      end;
      WriteLn('██');
    end;

    size := qr^.width;
    for x := 0 to size + 1 do begin
      Write('██');
    end;
    WriteLn(#10);

    QRcode_free(qr);
  end;

begin
  main;
end.
