program project1;

uses
  fp_tcod;

  procedure main;
  var
    key: TTCOD_key_t;
    counter: integer = 0;
    tileset: PTCOD_Tileset;
    i, codepoint: Integer;
  begin
    TCOD_console_set_custom_font('t.fnt.png', TCOD_FONT_LAYOUT_ASCII_INROW, 256, 1);
    TCOD_console_init_root(80, 25, 'libtcod C Beispiel', False, TCOD_RENDERER_SDL);

    TCOD_console_set_default_foreground(nil, TCOD_yellow);

    while not TCOD_console_is_window_closed do begin
      Inc(counter);
      TCOD_console_clear(nil);
      TCOD_console_printf(nil, 1, 1, 'Druecke ESC oder Q zum Beenden. (%d)', counter);

      for i:=0 to 255 do begin
        codepoint := TCOD_CHARMAP_CP437[i];
  TCOD_console_put_char(nil, i mod 16, i div 16 + 2, codepoint, TCOD_BKGND_SET);
//        TCOD_console_printf(nil, i mod 16, i div 16 + 2, '%c', i);
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
