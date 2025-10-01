program project1;

uses
  fp_tcod;

const
  FontPath = '../font/t.fnt_9x16.png';

  procedure DrawRect(x1, y1, x2, y2: integer);
  var
    x, y: integer;
  begin
    TCOD_console_put_char(nil, x1, y1, 218, TCOD_BKGND_SET);
    for x := x1 + 1 to x2 - 1 do begin
      TCOD_console_put_char(nil, x, y1, 196, TCOD_BKGND_SET);
    end;
    TCOD_console_put_char(nil, x2, y1, 191, TCOD_BKGND_SET);

    for y := y1 + 1 to y2 - 1 do begin
      TCOD_console_put_char(nil, x1, y, 179, TCOD_BKGND_SET);
      TCOD_console_put_char(nil, x2, y, 179, TCOD_BKGND_SET);
    end;

    TCOD_console_put_char(nil, x1, y2, 192, TCOD_BKGND_SET);
    for x := x1 + 1 to x2 - 1 do begin
      TCOD_console_put_char(nil, x, y2, 196, TCOD_BKGND_SET);
    end;
    TCOD_console_put_char(nil, x2, y2, 217, TCOD_BKGND_SET);
  end;

  procedure WriteASCII(x, y: integer);
  var
    i: integer;
  begin
    TCOD_console_set_default_foreground(nil, TCOD_yellow);
    TCOD_console_set_default_background(nil, TCOD_black);

    DrawRect(x, y, x + 17, y + 17);

    for i := 0 to 255 do begin
      TCOD_console_put_char(nil, i mod 16 + (x + 1), i div 16 + (y + 1), i, TCOD_BKGND_SET);
    end;
  end;

  procedure WriteMenu(x, y: integer; items: array of string; index: integer);
  var
    cnt, i, j: SizeInt;
    maxlen: SizeInt = 0;

    procedure ColBG;
    begin
      TCOD_console_set_default_foreground(nil, TCOD_black);
      TCOD_console_set_default_background(nil, TCOD_lighter_gray);
    end;

    procedure ColAct;
    begin
      TCOD_console_set_default_foreground(nil, TCOD_white);
      TCOD_console_set_default_background(nil, TCOD_blue);
    end;

  begin
    ColBG;

    cnt := Length(items);
    for i := 0 to cnt - 1 do begin
      if Length(items[i]) > maxlen then begin
        maxlen := Length(items[i]);
      end;
    end;

    DrawRect(x, y, x + maxlen + 1, cnt + 4);

    for i := 0 to cnt - 1 do begin
      if i = index then begin
        ColAct;
      end else begin
        ColBG;
      end;

      for j := 1 to Length(items[i]) do begin
        TCOD_console_put_char(nil, j + 5, y + i + 1, byte(items[i, j]), TCOD_BKGND_SET);
      end;

      for j := x + Length(items[i]) to x + maxlen - 1 do begin
        TCOD_console_put_char(nil, j + 1, y + i + 1, 32, TCOD_BKGND_SET);
      end;
    end;
  end;

  procedure main;
  const
    MenuIimes: array of string = (#153'ffnen', 'Speichern', 'Drucken', 'Hilfe', 'Beenden');
  var
    key: TTCOD_key_t;
    counter: integer = 0;
    Index: integer = 0;
    x, y: integer;
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

      WriteASCII(50, 5);
      WriteMenu(5, 3, MenuIimes, Index);

      TCOD_console_flush;

      if counter mod 20 = 0 then  begin
        Inc(Index);
        if Index >= Length(MenuIimes) then begin
          Index := 0;
        end;
      end;

      key := TCOD_console_check_for_keypress(TCOD_KEY_PRESSED);
      if (key.vk = TCODK_ESCAPE) or (key.c = 'q') or (key.c = 'Q') then begin
        break;
      end;
    end;
  end;

begin
  main;
end.
