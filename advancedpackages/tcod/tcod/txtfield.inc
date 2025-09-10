{$IFDEF read_interface}


type
  PTCOD_Text = type Pointer;

  PTCOD_text_t = ^TTCOD_text_t;
  TTCOD_text_t = PTCOD_Text;

function TCOD_text_init(x: longint; y: longint; w: longint; h: longint; max_chars: longint): TTCOD_text_t; cdecl; external libtcod;
function TCOD_text_init2(w: longint; h: longint; max_chars: longint): TTCOD_text_t; cdecl; external libtcod;
procedure TCOD_text_set_pos(txt: TTCOD_text_t; x: longint; y: longint); cdecl; external libtcod;
procedure TCOD_text_set_properties(txt: TTCOD_text_t; cursor_char: longint; blink_interval: longint; prompt: pchar; tab_size: longint); cdecl; external libtcod;
procedure TCOD_text_set_colors(txt: TTCOD_text_t; fore: TTCOD_color_t; back: TTCOD_color_t; back_transparency: single); cdecl; external libtcod;
function TCOD_text_update(txt: TTCOD_text_t; key: TTCOD_key_t): Tbool; cdecl; external libtcod;
procedure TCOD_text_render(txt: TTCOD_text_t; con: TTCOD_console_t); cdecl; external libtcod;
function TCOD_text_get(txt: TTCOD_text_t): pchar; cdecl; external libtcod;
procedure TCOD_text_reset(txt: TTCOD_text_t); cdecl; external libtcod;
procedure TCOD_text_delete(txt: TTCOD_text_t); cdecl; external libtcod;

// === Konventiert am: 10-9-25 16:24:56 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
