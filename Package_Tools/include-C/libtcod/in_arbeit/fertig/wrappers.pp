
unit wrappers;
interface

{
  Automatically converted by H2Pas 1.0.0 from wrappers.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    wrappers.h
}

{ Pointers to basic pascal types, inserted by h2pas conversion program.}
Type
  PLongint  = ^Longint;
  PSmallInt = ^SmallInt;
  PByte     = ^Byte;
  PWord     = ^Word;
  PDWord    = ^DWord;
  PDouble   = ^Double;

Type
Pchar  = ^char;
Pcolornum_t  = ^colornum_t;
Plongint  = ^longint;
Psingle  = ^single;
PTCOD_key_t  = ^TCOD_key_t;
PTCOD_mouse_t  = ^TCOD_mouse_t;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ BSD 3-Clause License
 *
 * Copyright © 2008-2021, Jice and the libtcod contributors.
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions are met:
 *
 * 1. Redistributions of source code must retain the above copyright notice,
 *    this list of conditions and the following disclaimer.
 *
 * 2. Redistributions in binary form must reproduce the above copyright notice,
 *    this list of conditions and the following disclaimer in the documentation
 *    and/or other materials provided with the distribution.
 *
 * 3. Neither the name of the copyright holder nor the names of its
 *    contributors may be used to endorse or promote products derived from
 *    this software without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
 * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
 * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
 * ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE
 * LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
 * CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
 * SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
 * INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
 * CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
 * ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
 * POSSIBILITY OF SUCH DAMAGE.
  }
{$ifndef WRAPPERS_H}
{$define WRAPPERS_H}
{$include "console_printing.h"}
{$include "console_types.h"}
{$include "image.h"}
{$include "mouse.h"}
{$include "parser.h"}
{$include "portability.h"}
{ wrappers to ease other languages integration  }
type
  Pcolornum_t = ^Tcolornum_t;
  Tcolornum_t = dword;
{ C++ extern C conditionnal removed }
{$ifndef NO_SDL}
{ color module  }

function TCOD_color_equals_wrapper(c1:Tcolornum_t; c2:Tcolornum_t):Tbool;cdecl;external;
function TCOD_color_add_wrapper(c1:Tcolornum_t; c2:Tcolornum_t):Tcolornum_t;cdecl;external;
function TCOD_color_subtract_wrapper(c1:Tcolornum_t; c2:Tcolornum_t):Tcolornum_t;cdecl;external;
function TCOD_color_multiply_wrapper(c1:Tcolornum_t; c2:Tcolornum_t):Tcolornum_t;cdecl;external;
function TCOD_color_multiply_scalar_wrapper(c1:Tcolornum_t; value:single):Tcolornum_t;cdecl;external;
function TCOD_color_lerp_wrapper(c1:Tcolornum_t; c2:Tcolornum_t; coef:single):Tcolornum_t;cdecl;external;
procedure TCOD_color_get_HSV_wrapper(c:Tcolornum_t; h:Psingle; s:Psingle; v:Psingle);cdecl;external;
function TCOD_color_get_hue_wrapper(c:Tcolornum_t):single;cdecl;external;
function TCOD_color_get_saturation_wrapper(c:Tcolornum_t):single;cdecl;external;
function TCOD_color_get_value_wrapper(c:Tcolornum_t):single;cdecl;external;
{ console module  }
{  void TCOD_console_set_custom_font_wrapper(const char *fontFile,
                        int char_width, int char_height, int nb_char_horiz,
                        int nb_char_vertic, bool chars_by_row,
                        colornum_t key_color);  }
procedure TCOD_console_set_default_background_wrapper(con:TTCOD_console_t; col:Tcolornum_t);cdecl;external;
procedure TCOD_console_set_default_foreground_wrapper(con:TTCOD_console_t; col:Tcolornum_t);cdecl;external;
function TCOD_console_get_default_background_wrapper(con:TTCOD_console_t):Tcolornum_t;cdecl;external;
function TCOD_console_get_default_foreground_wrapper(con:TTCOD_console_t):Tcolornum_t;cdecl;external;
function TCOD_console_get_char_background_wrapper(con:TTCOD_console_t; x:longint; y:longint):Tcolornum_t;cdecl;external;
procedure TCOD_console_set_char_background_wrapper(con:TTCOD_console_t; x:longint; y:longint; col:Tcolornum_t; flag:TTCOD_bkgnd_flag_t);cdecl;external;
function TCOD_console_get_char_foreground_wrapper(con:TTCOD_console_t; x:longint; y:longint):Tcolornum_t;cdecl;external;
procedure TCOD_console_set_char_foreground_wrapper(con:TTCOD_console_t; x:longint; y:longint; col:Tcolornum_t);cdecl;external;
procedure TCOD_console_put_char_ex_wrapper(con:TTCOD_console_t; x:longint; y:longint; c:longint; fore:Tcolornum_t; 
            back:Tcolornum_t);cdecl;external;
procedure TCOD_console_set_fade_wrapper(val:Tuint8_t; fade:Tcolornum_t);cdecl;external;
function TCOD_console_get_fading_color_wrapper:Tcolornum_t;cdecl;external;
procedure TCOD_console_set_color_control_wrapper(con:TTCOD_colctrl_t; fore:Tcolornum_t; back:Tcolornum_t);cdecl;external;
function TCOD_console_check_for_keypress_wrapper(holder:PTCOD_key_t; flags:longint):Tbool;cdecl;external;
procedure TCOD_console_wait_for_keypress_wrapper(holder:PTCOD_key_t; flush:Tbool);cdecl;external;
procedure TCOD_console_fill_background(con:TTCOD_console_t; r:Plongint; g:Plongint; b:Plongint);cdecl;external;
procedure TCOD_console_fill_foreground(con:TTCOD_console_t; r:Plongint; g:Plongint; b:Plongint);cdecl;external;
procedure TCOD_console_fill_char(con:TTCOD_console_t; arr:Plongint);cdecl;external;
procedure TCOD_console_double_hline(con:TTCOD_console_t; x:longint; y:longint; l:longint; flag:TTCOD_bkgnd_flag_t);cdecl;external;
procedure TCOD_console_double_vline(con:TTCOD_console_t; x:longint; y:longint; l:longint; flag:TTCOD_bkgnd_flag_t);cdecl;external;
(* Const before type ignored *)
procedure TCOD_console_print_double_frame(con:TTCOD_console_t; x:longint; y:longint; w:longint; h:longint; 
            empty:Tbool; flag:TTCOD_bkgnd_flag_t; fmt:Pchar; args:array of const);cdecl;external;
procedure TCOD_console_print_double_frame(con:TTCOD_console_t; x:longint; y:longint; w:longint; h:longint; 
            empty:Tbool; flag:TTCOD_bkgnd_flag_t; fmt:Pchar);cdecl;external;
function TCOD_console_print_return_string(con:TTCOD_console_t; x:longint; y:longint; rw:longint; rh:longint; 
           flag:TTCOD_bkgnd_flag_t; align:TTCOD_alignment_t; msg:Pchar; can_split:Tbool; count_only:Tbool):Pchar;cdecl;external;
procedure TCOD_console_set_key_color_wrapper(con:TTCOD_console_t; c:Tcolornum_t);cdecl;external;
{ image module  }
procedure TCOD_image_clear_wrapper(image:TTCOD_image_t; color:Tcolornum_t);cdecl;external;
function TCOD_image_get_pixel_wrapper(image:TTCOD_image_t; x:longint; y:longint):Tcolornum_t;cdecl;external;
function TCOD_image_get_mipmap_pixel_wrapper(image:TTCOD_image_t; x0:single; y0:single; x1:single; y1:single):Tcolornum_t;cdecl;external;
procedure TCOD_image_put_pixel_wrapper(image:TTCOD_image_t; x:longint; y:longint; col:Tcolornum_t);cdecl;external;
procedure TCOD_image_set_key_color_wrapper(image:TTCOD_image_t; key_color:Tcolornum_t);cdecl;external;
{ mouse module  }
procedure TCOD_mouse_get_status_wrapper(holder:PTCOD_mouse_t);cdecl;external;
{ parser module  }
(* Const before type ignored *)
function TCOD_parser_get_color_property_wrapper(parser:TTCOD_parser_t; name:Pchar):Tcolornum_t;cdecl;external;
{ namegen module  }
function TCOD_namegen_get_nb_sets_wrapper:longint;cdecl;external;
procedure TCOD_namegen_get_sets_wrapper(sets:PPchar);cdecl;external;
{ sys module  }
function TCOD_sys_get_current_resolution_x:longint;cdecl;external;
function TCOD_sys_get_current_resolution_y:longint;cdecl;external;
{$endif}
{ NO_SDL }
{$endif}
{ WRAPPERS_H  }

implementation


end.
