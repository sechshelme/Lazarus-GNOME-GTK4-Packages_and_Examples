program project1;

uses
  fp_caca;

  procedure main;
  const
    ITER = 128;
    BUFSIZ = 1024;
  var
    w, h: longint;
    cv: Pcaca_canvas_t;
    i, j: integer;
    buf: array[0..BUFSIZ - 1] of char;
  begin
    WriteLn('testing caca_create_canvas()');
    for i := 0 to ITER - 1 do begin
      w := caca_rand(1, 1000);
      h := caca_rand(1, 1000);
      cv := caca_create_canvas(w, h);
      caca_put_char(cv, w - 1, h - 1, DWord('x'));
      if caca_get_char(cv, w - 1, h - 1) <> DWord('x') then begin
        WriteLn('  failed  ', w, 'x', h);
      end;
      caca_free_canvas(cv);
    end;

    WriteLn('testing caca_set_frame_name()');
    cv := caca_create_canvas(1, 1);
    if cv = nil then begin
      WriteLn('Failed to create canvas');
      Exit;;
    end;

    for i := 0 to ITER - 1 do begin
      caca_create_frame(cv, 0);
      for j := 0 to ITER - 1 do begin
        w := caca_rand(1, BUFSIZ - 1);
        FillChar(buf, w, 'x');
        buf[w] := #0;
        caca_set_frame_name(cv, buf);
      end;
    end;
    caca_free_canvas(cv);

    WriteLn('all tests passed');
  end;

begin
  main;
end.
