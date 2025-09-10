unit wrappers;

interface

uses
  fp_tcod, console, console_printing, console_types, image, mouse_types, parser;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  Pcolornum_t = ^Tcolornum_t;
  Tcolornum_t = dword;

function TCOD_color_equals_wrapper(c1: Tcolornum_t; c2: Tcolornum_t): Tbool; cdecl; external libtcod;
function TCOD_color_add_wrapper(c1: Tcolornum_t; c2: Tcolornum_t): Tcolornum_t; cdecl; external libtcod;
function TCOD_color_subtract_wrapper(c1: Tcolornum_t; c2: Tcolornum_t): Tcolornum_t; cdecl; external libtcod;
function TCOD_color_multiply_wrapper(c1: Tcolornum_t; c2: Tcolornum_t): Tcolornum_t; cdecl; external libtcod;
function TCOD_color_multiply_scalar_wrapper(c1: Tcolornum_t; value: single): Tcolornum_t; cdecl; external libtcod;
function TCOD_color_lerp_wrapper(c1: Tcolornum_t; c2: Tcolornum_t; coef: single): Tcolornum_t; cdecl; external libtcod;
procedure TCOD_color_get_HSV_wrapper(c: Tcolornum_t; h: Psingle; s: Psingle; v: Psingle); cdecl; external libtcod;
function TCOD_color_get_hue_wrapper(c: Tcolornum_t): single; cdecl; external libtcod;
function TCOD_color_get_saturation_wrapper(c: Tcolornum_t): single; cdecl; external libtcod;
function TCOD_color_get_value_wrapper(c: Tcolornum_t): single; cdecl; external libtcod;
procedure TCOD_console_set_default_background_wrapper(con: TTCOD_console_t; col: Tcolornum_t); cdecl; external libtcod;
procedure TCOD_console_set_default_foreground_wrapper(con: TTCOD_console_t; col: Tcolornum_t); cdecl; external libtcod;
function TCOD_console_get_default_background_wrapper(con: TTCOD_console_t): Tcolornum_t; cdecl; external libtcod;
function TCOD_console_get_default_foreground_wrapper(con: TTCOD_console_t): Tcolornum_t; cdecl; external libtcod;
function TCOD_console_get_char_background_wrapper(con: TTCOD_console_t; x: longint; y: longint): Tcolornum_t; cdecl; external libtcod;
procedure TCOD_console_set_char_background_wrapper(con: TTCOD_console_t; x: longint; y: longint; col: Tcolornum_t; flag: TTCOD_bkgnd_flag_t); cdecl; external libtcod;
function TCOD_console_get_char_foreground_wrapper(con: TTCOD_console_t; x: longint; y: longint): Tcolornum_t; cdecl; external libtcod;
procedure TCOD_console_set_char_foreground_wrapper(con: TTCOD_console_t; x: longint; y: longint; col: Tcolornum_t); cdecl; external libtcod;
procedure TCOD_console_put_char_ex_wrapper(con: TTCOD_console_t; x: longint; y: longint; c: longint; fore: Tcolornum_t;
  back: Tcolornum_t); cdecl; external libtcod;
procedure TCOD_console_set_fade_wrapper(val: Tuint8_t; fade: Tcolornum_t); cdecl; external libtcod;
function TCOD_console_get_fading_color_wrapper: Tcolornum_t; cdecl; external libtcod;
procedure TCOD_console_set_color_control_wrapper(con: TTCOD_colctrl_t; fore: Tcolornum_t; back: Tcolornum_t); cdecl; external libtcod;
function TCOD_console_check_for_keypress_wrapper(holder: PTCOD_key_t; flags: longint): Tbool; cdecl; external libtcod;
procedure TCOD_console_wait_for_keypress_wrapper(holder: PTCOD_key_t; flush: Tbool); cdecl; external libtcod;
procedure TCOD_console_fill_background(con: TTCOD_console_t; r: Plongint; g: Plongint; b: Plongint); cdecl; external libtcod;
procedure TCOD_console_fill_foreground(con: TTCOD_console_t; r: Plongint; g: Plongint; b: Plongint); cdecl; external libtcod;
procedure TCOD_console_fill_char(con: TTCOD_console_t; arr: Plongint); cdecl; external libtcod;
procedure TCOD_console_double_hline(con: TTCOD_console_t; x: longint; y: longint; l: longint; flag: TTCOD_bkgnd_flag_t); cdecl; external libtcod;
procedure TCOD_console_double_vline(con: TTCOD_console_t; x: longint; y: longint; l: longint; flag: TTCOD_bkgnd_flag_t); cdecl; external libtcod;
procedure TCOD_console_print_double_frame(con: TTCOD_console_t; x: longint; y: longint; w: longint; h: longint;
  empty: Tbool; flag: TTCOD_bkgnd_flag_t; fmt: pchar; args: array of const); cdecl; external libtcod;
procedure TCOD_console_print_double_frame(con: TTCOD_console_t; x: longint; y: longint; w: longint; h: longint;
  empty: Tbool; flag: TTCOD_bkgnd_flag_t; fmt: pchar); cdecl; external libtcod;
function TCOD_console_print_return_string(con: TTCOD_console_t; x: longint; y: longint; rw: longint; rh: longint;
  flag: TTCOD_bkgnd_flag_t; align: TTCOD_alignment_t; msg: pchar; can_split: Tbool; count_only: Tbool): pchar; cdecl; external libtcod;
procedure TCOD_console_set_key_color_wrapper(con: TTCOD_console_t; c: Tcolornum_t); cdecl; external libtcod;
procedure TCOD_image_clear_wrapper(image: TTCOD_image_t; color: Tcolornum_t); cdecl; external libtcod;
function TCOD_image_get_pixel_wrapper(image: TTCOD_image_t; x: longint; y: longint): Tcolornum_t; cdecl; external libtcod;
function TCOD_image_get_mipmap_pixel_wrapper(image: TTCOD_image_t; x0: single; y0: single; x1: single; y1: single): Tcolornum_t; cdecl; external libtcod;
procedure TCOD_image_put_pixel_wrapper(image: TTCOD_image_t; x: longint; y: longint; col: Tcolornum_t); cdecl; external libtcod;
procedure TCOD_image_set_key_color_wrapper(image: TTCOD_image_t; key_color: Tcolornum_t); cdecl; external libtcod;
procedure TCOD_mouse_get_status_wrapper(holder: PTCOD_mouse_t); cdecl; external libtcod;
function TCOD_parser_get_color_property_wrapper(parser: TTCOD_parser_t; name: pchar): Tcolornum_t; cdecl; external libtcod;
function TCOD_namegen_get_nb_sets_wrapper: longint; cdecl; external libtcod;
procedure TCOD_namegen_get_sets_wrapper(sets: PPchar); cdecl; external libtcod;
function TCOD_sys_get_current_resolution_x: longint; cdecl; external libtcod;
function TCOD_sys_get_current_resolution_y: longint; cdecl; external libtcod;

// === Konventiert am: 10-9-25 16:25:05 ===


implementation



end.
