program project1;

uses
  fp_caca;

  procedure main;
  var
    cv: Pcaca_canvas_t;
    dp: Pcaca_display_t;
    i, j, y_offset, x_offset: integer;
  begin
    cv := caca_create_canvas(80, 24);
    if cv = nil then begin
      WriteLn('Failed to create canvas');
      Exit;;
    end;

    dp := caca_create_display(cv);
    if dp = nil then begin
      WriteLn('Failed to create display');
      Exit;;
    end;

    caca_set_color_ansi(cv, CACA_LIGHTGRAY, CACA_BLACK);
    caca_clear_canvas(cv);
    for i := 0 to 15 do begin
      caca_set_color_ansi(cv, CACA_LIGHTGRAY, CACA_BLACK);

      if i >= 8 then begin
        x_offset := 3;
      end else begin
        x_offset := 2;
      end;
      caca_printf(cv, 3, x_offset, 'ANSI %i', i);

      for j := 0 to 15 do begin
        caca_set_color_ansi(cv, i, j);
        if i >= 8 then begin
          y_offset := 3 + i;
        end else begin
          y_offset := 2 + i;
        end;

        if j >= 8 then begin
          x_offset := 13 + j * 4;
        end else begin
          x_offset := 12 + j * 4;
        end;
        caca_put_str(cv, x_offset, y_offset, 'Aaホ');
//        caca_put_str(cv, x_offset, y_offset, '😀🔥안녕');
      end;
    end;

    caca_set_color_ansi(cv, CACA_LIGHTGRAY, CACA_BLACK);
    caca_put_str(cv, 3, 20, 'This is bold    This is blink    This is italics    This is underline');
    caca_set_attr(cv, CACA_BOLD);
    caca_put_str(cv, 3 + 8, 20, 'bold');
    caca_set_attr(cv, CACA_BLINK);
    caca_put_str(cv, 3 + 24, 20, 'blink');
    caca_set_attr(cv, CACA_ITALICS);
    caca_put_str(cv, 3 + 41, 20, 'italics');
    caca_set_attr(cv, CACA_UNDERLINE);
    caca_put_str(cv, 3 + 60, 20, 'underline');

    caca_refresh_display(dp);
    caca_get_event(dp, CACA_EVENT_KEY_PRESS, nil, -1);

    caca_free_display(dp);
    caca_free_canvas(cv);
  end;

begin
  main;
end.
