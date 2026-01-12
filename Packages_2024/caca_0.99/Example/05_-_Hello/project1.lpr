program project1;

uses
  fp_caca;

  procedure main;
  var
    dp: Pcaca_display_t;
    cv: Pcaca_canvas_t;
    ev: Tcaca_event_t;
  begin
    dp := caca_create_display(nil);
    if dp = nil then begin
      Exit;
    end;

    cv := caca_get_canvas(dp);
    caca_disable_dirty_rect(cv);
    caca_clear_canvas(cv);

    caca_set_color_ansi(cv, CACA_BLACK, CACA_GREEN);
    caca_put_str(cv, 5, 5, 'GRUEN = OK');

    caca_set_color_ansi(cv, CACA_BLACK, CACA_RED);
    caca_put_str(cv, 5, 7, 'ROT = OK');

    caca_set_color_ansi(cv, CACA_BLACK, CACA_BLUE);
    caca_put_str(cv, 5, 9, 'BLAU = OK');

    caca_set_color_ansi(cv, CACA_BLACK, CACA_CYAN);
    caca_put_str(cv, 5, 11, 'CYAN = OK');

    caca_refresh_display(dp);
    caca_get_event(dp, CACA_EVENT_KEY_PRESS, @ev, -1);
    caca_free_display(dp);
  end;

begin
  main;
end.
