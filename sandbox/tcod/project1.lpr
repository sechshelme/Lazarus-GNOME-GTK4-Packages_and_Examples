program project1;
uses
console_types,
error,
tileset,             // const macro
color,
console,

console_init,      // SDL2 Zeugs


fp_tcod;

procedure main;
begin
  TCOD_console_init_root(80, 50, 'libtcod C Beispiel', false, TCOD_RENDERER_SDL2);

  while not TCOD_console_is_window_closed do begin
      TCOD_console_clear(nil);
      TCOD_console_printf(nil, 1, 1, 'Druecke ESC oder Q zum Beenden.');
      TCOD_console_flush;

      key := TCOD_console_check_for_keypress(TCOD_KEY_PRESSED);
      if (key.vk == TCODK_ESCAPE || key.c == 'q' || key.c == 'Q') {
          break; // Schleife verlassen, Programm wird sauber beendet
      }
  }

end;

begin
  main;
end.

