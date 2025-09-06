unit console_printing;

interface

uses
  fp_tcod, error, console, color;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}



procedure TCOD_console_print(con: PTCOD_Console; x: longint; y: longint; fmt: pchar); cdecl; varargs; external libtcod;
procedure TCOD_console_print_ex(con: PTCOD_Console; x: longint; y: longint; flag: TTCOD_bkgnd_flag_t; alignment: TTCOD_alignment_t;
  fmt: pchar); cdecl; varargs; external libtcod; deprecated 'Use TCOD_console_printf_ex instead.';
function TCOD_console_print_rect(con: PTCOD_Console; x: longint; y: longint; w: longint; h: longint;
  fmt: pchar): longint; cdecl; varargs; external libtcod; deprecated 'Use TCOD_console_printf_rect instead.';
function TCOD_console_print_rect_ex(con: PTCOD_Console; x: longint; y: longint; w: longint; h: longint;
  flag: TTCOD_bkgnd_flag_t; alignment: TTCOD_alignment_t; fmt: pchar): longint; cdecl; varargs; external libtcod; deprecated'Use TCOD_console_printf_rect_ex instead.';
procedure TCOD_console_print_frame(con: TTCOD_console_t; x: longint; y: longint; w: longint; h: longint;
  empty: Tbool; flag: TTCOD_bkgnd_flag_t; fmt: pchar); cdecl; varargs; external libtcod; deprecated'Use TCOD_console_printf_frame instead.';
function TCOD_console_get_height_rect(con: PTCOD_Console; x: longint; y: longint; w: longint; h: longint;
  fmt: pchar): longint; cdecl; varargs; external libtcod; deprecated'Use TCOD_console_get_height_rect_fmt instead.';
procedure TCOD_console_print_utf(con: PTCOD_Console; x: longint; y: longint; fmt: Pwchar_t); cdecl; varargs; external libtcod; deprecated'Use TCOD_console_printf instead.';
procedure TCOD_console_print_ex_utf(con: PTCOD_Console; x: longint; y: longint; flag: TTCOD_bkgnd_flag_t; alignment: TTCOD_alignment_t;
  fmt: Pwchar_t); cdecl; varargs; external libtcod; deprecated'Use TCOD_console_printf_ex instead.';
function TCOD_console_print_rect_utf(con: PTCOD_Console; x: longint; y: longint; w: longint; h: longint;
  fmt: Pwchar_t): longint; cdecl; varargs; external libtcod; deprecated'Use TCOD_console_printf_rect instead.';
function TCOD_console_print_rect_ex_utf(con: PTCOD_Console; x: longint; y: longint; w: longint; h: longint;
  flag: TTCOD_bkgnd_flag_t; alignment: TTCOD_alignment_t; fmt: Pwchar_t): longint; cdecl; varargs; external libtcod; deprecated'Use TCOD_console_printf_rect_ex instead.';
function TCOD_console_get_height_rect_utf(con: PTCOD_Console; x: longint; y: longint; w: longint; h: longint;
  fmt: Pwchar_t): longint; cdecl; varargs; external libtcod; deprecated'Use TCOD_console_get_height_rect_fmt instead.';

type
  PTCOD_colctrl_t = ^TTCOD_colctrl_t;
  TTCOD_colctrl_t = longint;

const
  TCOD_COLCTRL_1 = 1;
  TCOD_COLCTRL_2 = 2;
  TCOD_COLCTRL_3 = 3;
  TCOD_COLCTRL_4 = 4;
  TCOD_COLCTRL_5 = 5;
  TCOD_COLCTRL_NUMBER = 5;
  TCOD_COLCTRL_FORE_RGB = 6;
  TCOD_COLCTRL_BACK_RGB = 7;
  TCOD_COLCTRL_STOP = 8;

procedure TCOD_console_set_color_control(con: TTCOD_colctrl_t; fore: TTCOD_color_t; back: TTCOD_color_t); cdecl; external libtcod;
function TCOD_console_printf(con: PTCOD_Console; x: longint; y: longint; fmt: pchar): TTCOD_Error; cdecl; varargs; external libtcod;
function TCOD_console_printf_ex(con: PTCOD_Console; x: longint; y: longint; flag: TTCOD_bkgnd_flag_t; alignment: TTCOD_alignment_t;
  fmt: pchar): TTCOD_Error; cdecl; varargs; external libtcod;
function TCOD_console_printf_rect(con: PTCOD_Console; x: longint; y: longint; w: longint; h: longint;
  fmt: pchar): longint; cdecl; varargs; external libtcod;
function TCOD_console_printf_rect_ex(con: PTCOD_Console; x: longint; y: longint; w: longint; h: longint;
  flag: TTCOD_bkgnd_flag_t; alignment: TTCOD_alignment_t; fmt: pchar): longint; cdecl; varargs; external libtcod;
function TCOD_console_printf_frame(con: PTCOD_Console; x: longint; y: longint; w: longint; h: longint;
  empty: longint; flag: TTCOD_bkgnd_flag_t; fmt: pchar): TTCOD_Error; cdecl; varargs; external libtcod;
function TCOD_console_get_height_rect_fmt(con: PTCOD_Console; x: longint; y: longint; w: longint; h: longint;
  fmt: pchar): longint; cdecl; varargs; external libtcod;
function TCOD_console_printn(con: PTCOD_Console; x: longint; y: longint; n: Tsize_t; str: pchar;
  fg: PTCOD_color_t; bg: PTCOD_color_t; flag: TTCOD_bkgnd_flag_t; alignment: TTCOD_alignment_t): TTCOD_Error; cdecl; external libtcod;
function TCOD_console_printn_rect(con: PTCOD_Console; x: longint; y: longint; width: longint; height: longint;
  n: Tsize_t; str: pchar; fg: PTCOD_color_t; bg: PTCOD_color_t; flag: TTCOD_bkgnd_flag_t;
  alignment: TTCOD_alignment_t): longint; cdecl; external libtcod;
function TCOD_console_get_height_rect_n(console: PTCOD_Console; x: longint; y: longint; width: longint; height: longint;
  n: Tsize_t; str: pchar): longint; cdecl; external libtcod;
function TCOD_console_get_height_rect_wn(width: longint; n: Tsize_t; str: pchar): longint; cdecl; external libtcod;
function TCOD_console_printn_frame(con: PTCOD_Console; x: longint; y: longint; width: longint; height: longint;
  n: Tsize_t; title: pchar; fg: PTCOD_color_t; bg: PTCOD_color_t; flag: TTCOD_bkgnd_flag_t;
  empty: Tbool): TTCOD_Error; cdecl; external libtcod;

// === Konventiert am: 6-9-25 16:43:13 ===


implementation



end.
