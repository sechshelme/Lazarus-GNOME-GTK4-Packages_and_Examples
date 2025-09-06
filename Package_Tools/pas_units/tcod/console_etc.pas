unit console_etc;

interface

uses
  fp_tcod, error, context_viewport, console, console_types;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


function TCOD_BKGND_ALPHA(alpha: single): TTCOD_bkgnd_flag_t;
function TCOD_BKGND_ADDALPHA(alpha: single): TTCOD_bkgnd_flag_t;

function TCOD_console_set_custom_font(fontFile: pchar; flags: longint; nb_char_horiz: longint; nb_char_vertic: longint): TTCOD_Error; cdecl; external libtcod;
procedure TCOD_console_map_ascii_code_to_font(asciiCode: longint; fontCharX: longint; fontCharY: longint); cdecl; external libtcod;
procedure TCOD_console_map_ascii_codes_to_font(asciiCode: longint; nbCodes: longint; fontCharX: longint; fontCharY: longint); cdecl; external libtcod;
procedure TCOD_console_map_string_to_font(s: pchar; fontCharX: longint; fontCharY: longint); cdecl; external libtcod;
procedure TCOD_console_map_string_to_font_utf(s: Pwchar_t; fontCharX: longint; fontCharY: longint); cdecl; external libtcod;

procedure TCOD_console_set_dirty(x: longint; y: longint; w: longint; h: longint); cdecl; external libtcod; deprecated'This function does nothing.';
function TCOD_console_flush_ex(console: PTCOD_Console; viewport: PTCOD_ViewportOptions): TTCOD_Error; cdecl; external libtcod;
function TCOD_console_flush: TTCOD_Error; cdecl; external libtcod;

function TCOD_console_is_key_pressed(key: TTCOD_keycode_t): Tbool; cdecl; external libtcod; deprecated'Use SDL to check the keyboard state.';
function TCOD_console_from_file(filename: pchar): TTCOD_console_t; cdecl; external libtcod;
function TCOD_console_load_asc(con: TTCOD_console_t; filename: pchar): Tbool; cdecl; external libtcod;
function TCOD_console_load_apf(con: TTCOD_console_t; filename: pchar): Tbool; cdecl; external libtcod;
function TCOD_console_save_asc(con: TTCOD_console_t; filename: pchar): Tbool; cdecl; external libtcod;
function TCOD_console_save_apf(con: TTCOD_console_t; filename: pchar): Tbool; cdecl; external libtcod;

function TCOD_console_check_for_keypress(flags: longint): TTCOD_key_t; cdecl; external libtcod; deprecated'This API is deprecated, use SDL_PollEvent instead.';
function TCOD_console_wait_for_keypress(flush: Tbool): TTCOD_key_t; cdecl; external libtcod; deprecated'This API is deprecated, use SDL_WaitEvent instead.';
procedure TCOD_console_credits; cdecl; external libtcod;
procedure TCOD_console_credits_reset; cdecl; external libtcod;
function TCOD_console_credits_render(x: longint; y: longint; alpha: Tbool): Tbool; cdecl; external libtcod;

procedure TCOD_console_set_keyboard_repeat(initial_delay: longint; interval: longint); cdecl; external libtcod; deprecated'This function is a stub and will do nothing.';
procedure TCOD_console_disable_keyboard_repeat; cdecl; external libtcod; deprecated'This function is a stub and will do nothing.';

// === Konventiert am: 6-9-25 16:54:02 ===


implementation

function TCOD_BKGND_ALPHA(alpha: single): TTCOD_bkgnd_flag_t;
begin
  Result := TCOD_BKGND_ALPH or (longint(Trunc(alpha * 255)) shl 8);
end;

function TCOD_BKGND_ADDALPHA(alpha: single): TTCOD_bkgnd_flag_t;
begin
  Result := TCOD_BKGND_ADDA or (longint(Trunc(alpha * 255)) shl 8);
end;



end.
