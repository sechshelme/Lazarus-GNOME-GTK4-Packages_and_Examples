{$IFDEF read_interface}


function TCOD_console_init_root(w: longint; h: longint; title: pchar; fullscreen: Tbool; renderer: TTCOD_renderer_t): TTCOD_Error; cdecl; external libtcod;
function TCOD_console_init_root_(w: longint; h: longint; title: pchar; fullscreen: Tbool; renderer: TTCOD_renderer_t; vsync: Tbool): TTCOD_Error; cdecl; external libtcod;
procedure TCOD_quit; cdecl; external libtcod;
procedure TCOD_console_set_window_title(title: pchar); cdecl; external libtcod;
procedure TCOD_console_set_fullscreen(fullscreen: Tbool); cdecl; external libtcod;
function TCOD_console_is_fullscreen: Tbool; cdecl; external libtcod;
function TCOD_console_has_mouse_focus: Tbool; cdecl; external libtcod;
function TCOD_console_is_active: Tbool; cdecl; external libtcod;
function TCOD_console_is_window_closed: Tbool; cdecl; external libtcod;
function TCOD_sys_get_sdl_window: PSDL_Window; cdecl; external libtcod;
function TCOD_sys_get_sdl_renderer: PSDL_Renderer; cdecl; external libtcod;
function TCOD_sys_accumulate_console(console: PTCOD_Console): longint; cdecl; external libtcod;
function TCOD_sys_accumulate_console_(console: PTCOD_Console; viewport: PSDL_Rect): longint; cdecl; external libtcod;

// === Konventiert am: 6-9-25 15:36:41 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
