program project1;

uses
  error,
  color,
  context_viewport,
  tileset,
  list,
  console_types,
  console,
  console_init,      // SDL2 Zeugs
  console_printing,
  console_etc,
  console_drawing,
  console_rexpaint,
  mersenne_types,
  noise_defaults,
  noise,
  tree,
  bresenham,
  bsp,
  context,                     // SDL2 Zeugs
  context_init,
  fov_types,
  fov,
  globals,
  heapq,
  heightmap,
  image,
  lex,




  fp_tcod;

  procedure main;
  var
    key: TTCOD_key_t;
  begin
    TCOD_console_init_root(80, 50, 'libtcod C Beispiel', False, TCOD_RENDERER_SDL2);

    while not TCOD_console_is_window_closed do begin
      TCOD_console_clear(nil);
      TCOD_console_printf(nil, 1, 1, 'Druecke ESC oder Q zum Beenden.');
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
