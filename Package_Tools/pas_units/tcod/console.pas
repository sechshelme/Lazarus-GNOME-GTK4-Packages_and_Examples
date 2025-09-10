unit console;

interface

uses
  fp_tcod, color;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PTCOD_bkgnd_flag_t = ^TTCOD_bkgnd_flag_t;
  TTCOD_bkgnd_flag_t = longint;

const
  TCOD_BKGND_NONE = 0;
  TCOD_BKGND_SET = 1;
  TCOD_BKGND_MULTIPLY = 2;
  TCOD_BKGND_LIGHTEN = 3;
  TCOD_BKGND_DARKEN = 4;
  TCOD_BKGND_SCREEN = 5;
  TCOD_BKGND_COLOR_DODGE = 6;
  TCOD_BKGND_COLOR_BURN = 7;
  TCOD_BKGND_ADD = 8;
  TCOD_BKGND_ADDA = 9;
  TCOD_BKGND_BURN = 10;
  TCOD_BKGND_OVERLAY = 11;
  TCOD_BKGND_ALPH = 12;
  TCOD_BKGND_DEFAULT = 13;

type
  PTCOD_alignment_t = ^TTCOD_alignment_t;
  TTCOD_alignment_t = longint;

const
  TCOD_LEFT = 0;
  TCOD_RIGHT = 1;
  TCOD_CENTER = 2;

type
  TTCOD_ConsoleTile = record
    ch: longint;
    fg: TTCOD_ColorRGBA;
    bg: TTCOD_ColorRGBA;
  end;
  PTCOD_ConsoleTile = ^TTCOD_ConsoleTile;

  PPTCOD_Console = ^PTCOD_Console;
  PTCOD_Console = ^TTCOD_Console;
  TTCOD_Console = record
    w: longint;
    h: longint;
    tiles: PTCOD_ConsoleTile;
    bkgnd_flag: TTCOD_bkgnd_flag_t;
    alignment: TTCOD_alignment_t;
    fore: TTCOD_color_t;
    back: TTCOD_color_t;
    has_key_color: Tbool;
    key_color: TTCOD_color_t;
    elements: longint;
    userdata: pointer;
    on_delete: procedure(self: PTCOD_Console); cdecl;
  end;

  PTCOD_console_t = ^TTCOD_console_t;
  TTCOD_console_t = PTCOD_Console;

function TCOD_console_new(w: longint; h: longint): PTCOD_Console; cdecl; external libtcod;
function TCOD_console_get_width(con: PTCOD_Console): longint; cdecl; external libtcod;
function TCOD_console_get_height(con: PTCOD_Console): longint; cdecl; external libtcod;
procedure TCOD_console_set_key_color(con: PTCOD_Console; col: TTCOD_color_t); cdecl; external libtcod;
procedure TCOD_console_blit(src: PTCOD_Console; xSrc: longint; ySrc: longint; wSrc: longint; hSrc: longint;
  dst: PTCOD_Console; xDst: longint; yDst: longint; foreground_alpha: single; background_alpha: single); cdecl; external libtcod;
procedure TCOD_console_blit_key_color(src: PTCOD_Console; xSrc: longint; ySrc: longint; wSrc: longint; hSrc: longint;
  dst: PTCOD_Console; xDst: longint; yDst: longint; foreground_alpha: single; background_alpha: single;
  key_color: PTCOD_color_t); cdecl; external libtcod;
procedure TCOD_console_delete(console: PTCOD_Console); cdecl; external libtcod;
procedure TCOD_console_set_default_background(con: PTCOD_Console; col: TTCOD_color_t); cdecl; external libtcod;
procedure TCOD_console_set_default_foreground(con: PTCOD_Console; col: TTCOD_color_t); cdecl; external libtcod;
procedure TCOD_console_clear(con: PTCOD_Console); cdecl; external libtcod;
procedure TCOD_console_set_char_background(con: PTCOD_Console; x: longint; y: longint; col: TTCOD_color_t; flag: TTCOD_bkgnd_flag_t); cdecl; external libtcod;
procedure TCOD_console_set_char_foreground(con: PTCOD_Console; x: longint; y: longint; col: TTCOD_color_t); cdecl; external libtcod;
procedure TCOD_console_set_char(con: PTCOD_Console; x: longint; y: longint; c: longint); cdecl; external libtcod;
procedure TCOD_console_put_char(con: PTCOD_Console; x: longint; y: longint; c: longint; flag: TTCOD_bkgnd_flag_t); cdecl; external libtcod;
procedure TCOD_console_put_char_ex(con: PTCOD_Console; x: longint; y: longint; c: longint; fore: TTCOD_color_t;
  back: TTCOD_color_t); cdecl; external libtcod;
procedure TCOD_console_set_background_flag(con: PTCOD_Console; flag: TTCOD_bkgnd_flag_t); cdecl; external libtcod;
function TCOD_console_get_background_flag(con: PTCOD_Console): TTCOD_bkgnd_flag_t; cdecl; external libtcod;
procedure TCOD_console_set_alignment(con: PTCOD_Console; alignment: TTCOD_alignment_t); cdecl; external libtcod;
function TCOD_console_get_alignment(con: PTCOD_Console): TTCOD_alignment_t; cdecl; external libtcod;
function TCOD_console_get_default_background(con: PTCOD_Console): TTCOD_color_t; cdecl; external libtcod;
function TCOD_console_get_default_foreground(con: PTCOD_Console): TTCOD_color_t; cdecl; external libtcod;
function TCOD_console_get_char_background(con: PTCOD_Console; x: longint; y: longint): TTCOD_color_t; cdecl; external libtcod;
function TCOD_console_get_char_foreground(con: PTCOD_Console; x: longint; y: longint): TTCOD_color_t; cdecl; external libtcod;
function TCOD_console_get_char(con: PTCOD_Console; x: longint; y: longint): longint; cdecl; external libtcod;
procedure TCOD_console_set_fade(val: Tuint8_t; fade: TTCOD_color_t); cdecl; external libtcod;
function TCOD_console_get_fade: Tuint8_t; cdecl; external libtcod;
function TCOD_console_get_fading_color: TTCOD_color_t; cdecl; external libtcod;
procedure TCOD_console_resize_(console: PTCOD_Console; width: longint; height: longint); cdecl; external libtcod;

// === Konventiert am: 6-9-25 15:55:34 ===


implementation



end.
