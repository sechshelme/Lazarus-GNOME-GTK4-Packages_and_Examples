program project1;

uses
  fp_sixel;

const
  breite = 512;
  hoehe = 512;
  max_iter = 50;
type
  TPixels = array[0..breite * hoehe * 3 - 1] of byte;
  PPixels = ^TPixels;

  procedure paint(pixel: PPixels; colOfs: byte);
  var
    y, x, iter: integer;
    r, g, b: byte;
    cx, cy, zx, zy, zx2, zy2: extended;

  begin
    for y := 0 to hoehe - 1 do begin
      for x := 0 to breite - 1 do begin
        cx := 3.0 * (x / breite) - 2.0;
        cy := 3.0 * (y / hoehe) - 1.5;
        zx := 0.0;
        zy := 0.0;
        iter := 0;
        repeat
          zx2 := zx * zx;
          zy2 := zy * zy;
          zy := 2.0 * zx * zy + cy;
          zx := zx2 - zy2 + cx;
          inc(iter);
        until (zx2 + zy2 > 4.0) or (iter = max_iter);

        if iter = max_iter then begin
          r := 0;
          g := 0;
          b := 0;
        end else begin
          r := iter * 21;
          g := iter * 15;
          b := iter * 33;
        end;

        pixel^[(y * breite + x) * 3 + 0] := r + colOfs;
        pixel^[(y * breite + x) * 3 + 1] := g + colOfs;
        pixel^[(y * breite + x) * 3 + 2] := b + colOfs;
      end;
    end;
  end;

  procedure main;
  var
    pixel: TPixels;
    status: TSIXELSTATUS;
    encoder: Psixel_encoder_t;
    colOfs: byte = 0;

  begin
    status := sixel_encoder_new(@encoder, nil);
    if status <> SIXEL_OK then begin
      WriteLn('Konnte SIXEL-Encoder nicht erstellen.');
      Exit;
    end;

    Write(#27'[2J');   // Bildschirm löschen
    Write(#27'[?25l'); // Cursor ausblenden
    repeat
      paint(@pixel, colOfs);
      Write(#27'[H'); // Cursor Home

      status := sixel_encoder_encode_bytes(encoder, pbyte(pixel), breite, hoehe, SIXEL_PIXELFORMAT_RGB888, nil, 0);
      if status <> SIXEL_OK then begin
        sixel_encoder_unref(encoder);
        WriteLn('Fehler bei der Kodierung des SIXEL-Bildes.');
        Exit;
      end;
      Inc(colOfs);
      WriteLn('<Ctrl+C)> = Abbruch');
    until False;
    Write(#27'[?25h'); // Cursor einblenden

    sixel_encoder_unref(encoder);
  end;

begin
  main;
end.
