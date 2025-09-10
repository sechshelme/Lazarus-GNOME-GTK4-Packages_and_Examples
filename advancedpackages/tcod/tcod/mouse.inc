{$IFDEF read_interface}



procedure TCOD_mouse_show_cursor(visible: Tbool); cdecl; external libtcod; deprecated'Use SDL_ShowCursor to handle the mouse cursor.';
function TCOD_mouse_get_status: TTCOD_mouse_t; cdecl; external libtcod; deprecated'Use SDL_GetMouseState to check the mouse state.';
function TCOD_mouse_is_cursor_visible: Tbool; cdecl; external libtcod; deprecated'Use SDL_ShowCursor to check the mouse cursor.';
procedure TCOD_mouse_move(x: longint; y: longint); cdecl; external libtcod; deprecated'Use SDL_WarpMouseInWindow to move mouse cursor instead.';
procedure TCOD_mouse_includes_touch(enable: Tbool); cdecl; external libtcod;

// === Konventiert am: 10-9-25 15:53:49 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
