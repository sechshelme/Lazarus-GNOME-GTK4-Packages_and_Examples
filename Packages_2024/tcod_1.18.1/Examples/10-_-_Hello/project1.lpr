program project1;

uses
  fp_tcod;

const
  FontPath = '../font/t.fnt_9x16.png';

  procedure main;
  var
    key: TTCOD_key_t;
    counter: integer = 0;
    i, x, y: integer;
  begin
    TCOD_console_set_custom_font(FontPath, TCOD_FONT_LAYOUT_ASCII_INROW, 256, 1);
    WriteLn(TCOD_get_error);
    TCOD_console_init_root(80, 25, 'libtcod C Beispiel', False, TCOD_RENDERER_OPENGL2);

    while not TCOD_console_is_window_closed do begin
      Inc(counter);
      TCOD_console_clear(nil);

      TCOD_console_set_default_foreground(nil, TCOD_blue);
      TCOD_console_set_default_background(nil, TCOD_lighter_gray);

      for x := 0 to 79 do begin
        for y := 0 to 24 do begin
          TCOD_console_put_char(nil, x, y, 178, TCOD_BKGND_SET);
        end;
      end;

      TCOD_console_set_default_foreground(nil, TCOD_black);
      TCOD_console_set_default_background(nil, TCOD_lighter_gray);

      TCOD_console_printf(nil, 0, 0, ' TCOD-Demo                                                                      ');
      TCOD_console_printf(nil, 0, 24, 'Druecke ESC oder Q zum Beenden. (%8d)                                          ', counter);

      TCOD_console_set_default_foreground(nil, TCOD_yellow);
      TCOD_console_set_default_background(nil, TCOD_black);

      for i := 0 to 255 do begin
        TCOD_console_put_char(nil, i mod 16 + 10, i div 16 + 4, i, TCOD_BKGND_SET);
      end;

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
