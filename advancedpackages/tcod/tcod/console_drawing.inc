{$IFDEF read_interface}



procedure TCOD_console_rect(con: PTCOD_Console; x: longint; y: longint; w: longint; h: longint;
  clear: Tbool; flag: TTCOD_bkgnd_flag_t); cdecl; external libtcod;
procedure TCOD_console_hline(con: PTCOD_Console; x: longint; y: longint; l: longint; flag: TTCOD_bkgnd_flag_t); cdecl; external libtcod;
procedure TCOD_console_vline(con: PTCOD_Console; x: longint; y: longint; l: longint; flag: TTCOD_bkgnd_flag_t); cdecl; external libtcod;
procedure TCOD_console_put_rgb(console: PTCOD_Console; x: longint; y: longint; ch: longint; fg: PTCOD_color_t;
  bg: PTCOD_color_t; flag: TTCOD_bkgnd_flag_t); cdecl; external libtcod;
procedure TCOD_console_draw_rect_rgb(console: PTCOD_Console; x: longint; y: longint; width: longint; height: longint;
  ch: longint; fg: PTCOD_color_t; bg: PTCOD_color_t; flag: TTCOD_bkgnd_flag_t); cdecl; external libtcod;
function TCOD_console_draw_frame_rgb(con: PTCOD_Console; x: longint; y: longint; width: longint; height: longint;
  decoration: Plongint; fg: PTCOD_ColorRGB; bg: PTCOD_ColorRGB; flag: TTCOD_bkgnd_flag_t; clear: Tbool): TTCOD_Error; cdecl; external libtcod;

// === Konventiert am: 10-9-25 13:16:15 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
