program project1;

uses
  fp_tcod;

  procedure main;
  var
    key: TTCOD_key_t;
    counter:Integer=0;
  begin
    TCOD_console_init_root(80, 50, 'libtcod C Beispiel', False, TCOD_RENDERER_SDL);
    TCOD_console_set_default_foreground(nil, TCOD_yellow);
//    TCOD_console_set_custom_font();


    while not TCOD_console_is_window_closed do begin
      Inc(counter);
      TCOD_console_clear(nil);
      TCOD_console_printf(nil, 1, 1, 'Druecke ESC oder Q zum Beenden. (%d)', counter);
      TCOD_console_flush;

      key := TCOD_console_check_for_keypress(TCOD_KEY_PRESSED);
      if (key.vk = TCODK_ESCAPE) or (key.c = 'q') or (key.c = 'Q') then begin
        break;
      end;
    end;
  end;

begin
  main;
end.
