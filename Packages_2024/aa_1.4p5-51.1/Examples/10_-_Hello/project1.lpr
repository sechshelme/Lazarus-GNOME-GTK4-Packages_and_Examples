program project1;

uses
  fp_aa;

  procedure main;
  var
    context: Paa_context;
    t: double = 0.0;
    event, width, height: longint;
    buffer: pchar;
    v: double;
    y, x: integer;
    pixel: byte;
    quit: boolean = False;
  begin
    context := aa_autoinit(@aa_defparams);

    if context = nil then begin
      WriteLn('Fehler: AAlib konnte nicht initialisiert werden.');
      Exit;
    end;

    if aa_autoinitkbd(context, 0) = 0 then begin
      WriteLn('Konnte Tastatur nicht initialisieren (eventuell ignorierbar)');
    end;

    while not quit do begin
      event := aa_getevent(context, 0);
      case event of
        AA_ESC: begin
          quit := True;
        end;
      end;

      width := aa_imgwidth(context);
      height := aa_imgheight(context);
      buffer := aa_image(context);

      for y := 0 to height - 1 do begin
        for x := 0 to width - 1 do begin
          v := sin(x * 0.1 + t) + cos(y * 0.1 + t * 0.5);

          pixel := Round((v + 2.0) * 63.75);
          buffer[x + y * width] := char(pixel);
        end;
      end;

      aa_render(context, @aa_defrenderparams, 0, 0, width, height);
      aa_flush(context);

      t += 0.1;
    end;

    aa_close(context);
  end;

begin
  main;
end.
