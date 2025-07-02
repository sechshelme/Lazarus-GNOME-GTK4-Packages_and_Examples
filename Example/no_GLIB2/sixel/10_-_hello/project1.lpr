program project1;

uses
  fp_sixel;

  procedure main;
  const
    breite = 256;
    hoehe = 256;
  var
    pixel: array[0..breite * hoehe * 3-1] of byte;
    y, x: integer;
    status: TSIXELSTATUS;
    encoder: Psixel_encoder_t;

  begin
    for  y := 0 to hoehe - 1 do begin
      for  x := 0 to breite - 1 do begin
        pixel[(y * breite + x) * 3 + 0] := x;
        pixel[(y * breite + x) * 3 + 1] := y;
        pixel[(y * breite + x) * 3 + 2] := 255 - x;
      end;
    end;

    status := sixel_encoder_new(@encoder, nil);
    if status <> SIXEL_OK then begin
      WriteLn('Konnte SIXEL-Encoder nicht erstellen.');
      Exit;
    end;

    status := sixel_encoder_encode_bytes(encoder, pbyte(pixel), breite, hoehe, SIXEL_PIXELFORMAT_RGB888, nil, 0);
    if status <> SIXEL_OK then begin
      sixel_encoder_unref(encoder);
      WriteLn('Fehler bei der Kodierung des SIXEL-Bildes.');
      Exit;
    end;

    sixel_encoder_unref(encoder);
  end;

begin
  main;
end.
