
unit color;
interface

{
  Automatically converted by H2Pas 1.0.0 from color.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    color.h
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
Plongint  = ^longint;
Psingle  = ^single;
PTCOD_color_t  = ^TCOD_color_t;
PTCOD_ColorRGB  = ^TCOD_ColorRGB;
PTCOD_ColorRGBA  = ^TCOD_ColorRGBA;
Pxxxxxxxxxxx  = ^xxxxxxxxxxx;
Pxxxxxxxxxxxx  = ^xxxxxxxxxxxx;
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
{$ifndef _TCOD_COLOR_H}
{$define _TCOD_COLOR_H}
{$include <stdbool.h>}
{$include <stdint.h>}
{$include "config.h"}
{*
 *  A three channel color struct.
  }
{ __cplusplus }
type
  PTCOD_ColorRGB = ^TTCOD_ColorRGB;
  TTCOD_ColorRGB = record
      r : Tuint8_t;
      g : Tuint8_t;
      b : Tuint8_t;
    end;

  TTCOD_ColorRGB = TTCOD_color_t;
{*
 *  A four channel color struct.
  }
  PTCOD_ColorRGBA = ^TTCOD_ColorRGBA;
  TTCOD_ColorRGBA = record
      r : Tuint8_t;
      g : Tuint8_t;
      b : Tuint8_t;
      a : Tuint8_t;
    end;

{ C++ extern C conditionnal removed }
{ constructors  }

function TCOD_color_RGB(r:Tuint8_t; g:Tuint8_t; b:Tuint8_t):TTCOD_color_t;cdecl;external;
function TCOD_color_HSV(hue:single; saturation:single; value:single):TTCOD_color_t;cdecl;external;
{ basic operations  }
function TCOD_color_equals(c1:TTCOD_color_t; c2:TTCOD_color_t):Tbool;cdecl;external;
function TCOD_color_add(c1:TTCOD_color_t; c2:TTCOD_color_t):TTCOD_color_t;cdecl;external;
function TCOD_color_subtract(c1:TTCOD_color_t; c2:TTCOD_color_t):TTCOD_color_t;cdecl;external;
function TCOD_color_multiply(c1:TTCOD_color_t; c2:TTCOD_color_t):TTCOD_color_t;cdecl;external;
function TCOD_color_multiply_scalar(c1:TTCOD_color_t; value:single):TTCOD_color_t;cdecl;external;
function TCOD_color_lerp(c1:TTCOD_color_t; c2:TTCOD_color_t; coef:single):TTCOD_color_t;cdecl;external;
{*
 *  Blend `src` into `dst` as an alpha blending operation.
 *  \rst
 *  .. versionadded:: 1.16
 *  \endrst
  }
(* Const before type ignored *)
procedure TCOD_color_alpha_blend(dst:PTCOD_ColorRGBA; src:PTCOD_ColorRGBA);cdecl;external;
{ HSV transformations  }
procedure TCOD_color_set_HSV(color:PTCOD_color_t; hue:single; saturation:single; value:single);cdecl;external;
procedure TCOD_color_get_HSV(color:TTCOD_color_t; hue:Psingle; saturation:Psingle; value:Psingle);cdecl;external;
function TCOD_color_get_hue(color:TTCOD_color_t):single;cdecl;external;
procedure TCOD_color_set_hue(color:PTCOD_color_t; hue:single);cdecl;external;
function TCOD_color_get_saturation(color:TTCOD_color_t):single;cdecl;external;
procedure TCOD_color_set_saturation(color:PTCOD_color_t; saturation:single);cdecl;external;
function TCOD_color_get_value(color:TTCOD_color_t):single;cdecl;external;
procedure TCOD_color_set_value(color:PTCOD_color_t; value:single);cdecl;external;
procedure TCOD_color_shift_hue(color:PTCOD_color_t; shift:single);cdecl;external;
procedure TCOD_color_scale_HSV(color:PTCOD_color_t; saturation_coef:single; value_coef:single);cdecl;external;
{ color map  }
(* Const before type ignored *)
(* Const before type ignored *)
procedure TCOD_color_gen_map(map:PTCOD_color_t; nb_key:longint; key_color:PTCOD_color_t; key_index:Plongint);cdecl;external;
{ color names  }
type
  Txxxxxxxxxxx =  Longint;
  Const
    TCOD_COLOR_RED = 0;
    TCOD_COLOR_FLAME = 1;
    TCOD_COLOR_ORANGE = 2;
    TCOD_COLOR_AMBER = 3;
    TCOD_COLOR_YELLOW = 4;
    TCOD_COLOR_LIME = 5;
    TCOD_COLOR_CHARTREUSE = 6;
    TCOD_COLOR_GREEN = 7;
    TCOD_COLOR_SEA = 8;
    TCOD_COLOR_TURQUOISE = 9;
    TCOD_COLOR_CYAN = 10;
    TCOD_COLOR_SKY = 11;
    TCOD_COLOR_AZURE = 12;
    TCOD_COLOR_BLUE = 13;
    TCOD_COLOR_HAN = 14;
    TCOD_COLOR_VIOLET = 15;
    TCOD_COLOR_PURPLE = 16;
    TCOD_COLOR_FUCHSIA = 17;
    TCOD_COLOR_MAGENTA = 18;
    TCOD_COLOR_PINK = 19;
    TCOD_COLOR_CRIMSON = 20;
    TCOD_COLOR_NB = 21;

{ color levels  }
type
  Txxxxxxxxxxxx =  Longint;
  Const
    TCOD_COLOR_DESATURATED = 0;
    TCOD_COLOR_LIGHTEST = 1;
    TCOD_COLOR_LIGHTER = 2;
    TCOD_COLOR_LIGHT = 3;
    TCOD_COLOR_NORMAL = 4;
    TCOD_COLOR_DARK = 5;
    TCOD_COLOR_DARKER = 6;
    TCOD_COLOR_DARKEST = 7;
    TCOD_COLOR_LEVELS = 8;

{ color array  }
(* Const before type ignored *)
  var
    TCOD_colors : array[0..(TCOD_COLOR_NB)-1] of array[0..(TCOD_COLOR_LEVELS)-1] of TTCOD_color_t;cvar;external;
{ grey levels  }
(* Const before type ignored *)
    TCOD_black : TTCOD_color_t;cvar;external;
(* Const before type ignored *)
    TCOD_darkest_grey : TTCOD_color_t;cvar;external;
(* Const before type ignored *)
    TCOD_darker_grey : TTCOD_color_t;cvar;external;
(* Const before type ignored *)
    TCOD_dark_grey : TTCOD_color_t;cvar;external;
(* Const before type ignored *)
    TCOD_grey : TTCOD_color_t;cvar;external;
(* Const before type ignored *)
    TCOD_light_grey : TTCOD_color_t;cvar;external;
(* Const before type ignored *)
    TCOD_lighter_grey : TTCOD_color_t;cvar;external;
(* Const before type ignored *)
    TCOD_lightest_grey : TTCOD_color_t;cvar;external;
(* Const before type ignored *)
    TCOD_darkest_gray : TTCOD_color_t;cvar;external;
(* Const before type ignored *)
    TCOD_darker_gray : TTCOD_color_t;cvar;external;
(* Const before type ignored *)
    TCOD_dark_gray : TTCOD_color_t;cvar;external;
(* Const before type ignored *)
    TCOD_gray : TTCOD_color_t;cvar;external;
(* Const before type ignored *)
    TCOD_light_gray : TTCOD_color_t;cvar;external;
(* Const before type ignored *)
    TCOD_lighter_gray : TTCOD_color_t;cvar;external;
(* Const before type ignored *)
    TCOD_lightest_gray : TTCOD_color_t;cvar;external;
(* Const before type ignored *)
    TCOD_white : TTCOD_color_t;cvar;external;
{ sepia  }
(* Const before type ignored *)
    TCOD_darkest_sepia : TTCOD_color_t;cvar;external;
(* Const before type ignored *)
    TCOD_darker_sepia : TTCOD_color_t;cvar;external;
(* Const before type ignored *)
    TCOD_dark_sepia : TTCOD_color_t;cvar;external;
(* Const before type ignored *)
    TCOD_sepia : TTCOD_color_t;cvar;external;
(* Const before type ignored *)
    TCOD_light_sepia : TTCOD_color_t;cvar;external;
(* Const before type ignored *)
    TCOD_lighter_sepia : TTCOD_color_t;cvar;external;
(* Const before type ignored *)
    TCOD_lightest_sepia : TTCOD_color_t;cvar;external;
{ standard colors  }
(* Const before type ignored *)
    TCOD_red : TTCOD_color_t;cvar;external;
(* Const before type ignored *)
    TCOD_flame : TTCOD_color_t;cvar;external;
(* Const before type ignored *)
    TCOD_orange : TTCOD_color_t;cvar;external;
(* Const before type ignored *)
    TCOD_amber : TTCOD_color_t;cvar;external;
(* Const before type ignored *)
    TCOD_yellow : TTCOD_color_t;cvar;external;
(* Const before type ignored *)
    TCOD_lime : TTCOD_color_t;cvar;external;
(* Const before type ignored *)
    TCOD_chartreuse : TTCOD_color_t;cvar;external;
(* Const before type ignored *)
    TCOD_green : TTCOD_color_t;cvar;external;
(* Const before type ignored *)
    TCOD_sea : TTCOD_color_t;cvar;external;
(* Const before type ignored *)
    TCOD_turquoise : TTCOD_color_t;cvar;external;
(* Const before type ignored *)
    TCOD_cyan : TTCOD_color_t;cvar;external;
(* Const before type ignored *)
    TCOD_sky : TTCOD_color_t;cvar;external;
(* Const before type ignored *)
    TCOD_azure : TTCOD_color_t;cvar;external;
(* Const before type ignored *)
    TCOD_blue : TTCOD_color_t;cvar;external;
(* Const before type ignored *)
    TCOD_han : TTCOD_color_t;cvar;external;
(* Const before type ignored *)
    TCOD_violet : TTCOD_color_t;cvar;external;
(* Const before type ignored *)
    TCOD_purple : TTCOD_color_t;cvar;external;
(* Const before type ignored *)
    TCOD_fuchsia : TTCOD_color_t;cvar;external;
(* Const before type ignored *)
    TCOD_magenta : TTCOD_color_t;cvar;external;
(* Const before type ignored *)
    TCOD_pink : TTCOD_color_t;cvar;external;
(* Const before type ignored *)
    TCOD_crimson : TTCOD_color_t;cvar;external;
{ dark colors  }
(* Const before type ignored *)
    TCOD_dark_red : TTCOD_color_t;cvar;external;
(* Const before type ignored *)
    TCOD_dark_flame : TTCOD_color_t;cvar;external;
(* Const before type ignored *)
    TCOD_dark_orange : TTCOD_color_t;cvar;external;
(* Const before type ignored *)
    TCOD_dark_amber : TTCOD_color_t;cvar;external;
(* Const before type ignored *)
    TCOD_dark_yellow : TTCOD_color_t;cvar;external;
(* Const before type ignored *)
    TCOD_dark_lime : TTCOD_color_t;cvar;external;
(* Const before type ignored *)
    TCOD_dark_chartreuse : TTCOD_color_t;cvar;external;
(* Const before type ignored *)
    TCOD_dark_green : TTCOD_color_t;cvar;external;
(* Const before type ignored *)
    TCOD_dark_sea : TTCOD_color_t;cvar;external;
(* Const before type ignored *)
    TCOD_dark_turquoise : TTCOD_color_t;cvar;external;
(* Const before type ignored *)
    TCOD_dark_cyan : TTCOD_color_t;cvar;external;
(* Const before type ignored *)
    TCOD_dark_sky : TTCOD_color_t;cvar;external;
(* Const before type ignored *)
    TCOD_dark_azure : TTCOD_color_t;cvar;external;
(* Const before type ignored *)
    TCOD_dark_blue : TTCOD_color_t;cvar;external;
(* Const before type ignored *)
    TCOD_dark_han : TTCOD_color_t;cvar;external;
(* Const before type ignored *)
    TCOD_dark_violet : TTCOD_color_t;cvar;external;
(* Const before type ignored *)
    TCOD_dark_purple : TTCOD_color_t;cvar;external;
(* Const before type ignored *)
    TCOD_dark_fuchsia : TTCOD_color_t;cvar;external;
(* Const before type ignored *)
    TCOD_dark_magenta : TTCOD_color_t;cvar;external;
(* Const before type ignored *)
    TCOD_dark_pink : TTCOD_color_t;cvar;external;
(* Const before type ignored *)
    TCOD_dark_crimson : TTCOD_color_t;cvar;external;
{ darker colors  }
(* Const before type ignored *)
    TCOD_darker_red : TTCOD_color_t;cvar;external;
(* Const before type ignored *)
    TCOD_darker_flame : TTCOD_color_t;cvar;external;
(* Const before type ignored *)
    TCOD_darker_orange : TTCOD_color_t;cvar;external;
(* Const before type ignored *)
    TCOD_darker_amber : TTCOD_color_t;cvar;external;
(* Const before type ignored *)
    TCOD_darker_yellow : TTCOD_color_t;cvar;external;
(* Const before type ignored *)
    TCOD_darker_lime : TTCOD_color_t;cvar;external;
(* Const before type ignored *)
    TCOD_darker_chartreuse : TTCOD_color_t;cvar;external;
(* Const before type ignored *)
    TCOD_darker_green : TTCOD_color_t;cvar;external;
(* Const before type ignored *)
    TCOD_darker_sea : TTCOD_color_t;cvar;external;
(* Const before type ignored *)
    TCOD_darker_turquoise : TTCOD_color_t;cvar;external;
(* Const before type ignored *)
    TCOD_darker_cyan : TTCOD_color_t;cvar;external;
(* Const before type ignored *)
    TCOD_darker_sky : TTCOD_color_t;cvar;external;
(* Const before type ignored *)
    TCOD_darker_azure : TTCOD_color_t;cvar;external;
(* Const before type ignored *)
    TCOD_darker_blue : TTCOD_color_t;cvar;external;
(* Const before type ignored *)
    TCOD_darker_han : TTCOD_color_t;cvar;external;
(* Const before type ignored *)
    TCOD_darker_violet : TTCOD_color_t;cvar;external;
(* Const before type ignored *)
    TCOD_darker_purple : TTCOD_color_t;cvar;external;
(* Const before type ignored *)
    TCOD_darker_fuchsia : TTCOD_color_t;cvar;external;
(* Const before type ignored *)
    TCOD_darker_magenta : TTCOD_color_t;cvar;external;
(* Const before type ignored *)
    TCOD_darker_pink : TTCOD_color_t;cvar;external;
(* Const before type ignored *)
    TCOD_darker_crimson : TTCOD_color_t;cvar;external;
{ darkest colors  }
(* Const before type ignored *)
    TCOD_darkest_red : TTCOD_color_t;cvar;external;
(* Const before type ignored *)
    TCOD_darkest_flame : TTCOD_color_t;cvar;external;
(* Const before type ignored *)
    TCOD_darkest_orange : TTCOD_color_t;cvar;external;
(* Const before type ignored *)
    TCOD_darkest_amber : TTCOD_color_t;cvar;external;
(* Const before type ignored *)
    TCOD_darkest_yellow : TTCOD_color_t;cvar;external;
(* Const before type ignored *)
    TCOD_darkest_lime : TTCOD_color_t;cvar;external;
(* Const before type ignored *)
    TCOD_darkest_chartreuse : TTCOD_color_t;cvar;external;
(* Const before type ignored *)
    TCOD_darkest_green : TTCOD_color_t;cvar;external;
(* Const before type ignored *)
    TCOD_darkest_sea : TTCOD_color_t;cvar;external;
(* Const before type ignored *)
    TCOD_darkest_turquoise : TTCOD_color_t;cvar;external;
(* Const before type ignored *)
    TCOD_darkest_cyan : TTCOD_color_t;cvar;external;
(* Const before type ignored *)
    TCOD_darkest_sky : TTCOD_color_t;cvar;external;
(* Const before type ignored *)
    TCOD_darkest_azure : TTCOD_color_t;cvar;external;
(* Const before type ignored *)
    TCOD_darkest_blue : TTCOD_color_t;cvar;external;
(* Const before type ignored *)
    TCOD_darkest_han : TTCOD_color_t;cvar;external;
(* Const before type ignored *)
    TCOD_darkest_violet : TTCOD_color_t;cvar;external;
(* Const before type ignored *)
    TCOD_darkest_purple : TTCOD_color_t;cvar;external;
(* Const before type ignored *)
    TCOD_darkest_fuchsia : TTCOD_color_t;cvar;external;
(* Const before type ignored *)
    TCOD_darkest_magenta : TTCOD_color_t;cvar;external;
(* Const before type ignored *)
    TCOD_darkest_pink : TTCOD_color_t;cvar;external;
(* Const before type ignored *)
    TCOD_darkest_crimson : TTCOD_color_t;cvar;external;
{ light colors  }
(* Const before type ignored *)
    TCOD_light_red : TTCOD_color_t;cvar;external;
(* Const before type ignored *)
    TCOD_light_flame : TTCOD_color_t;cvar;external;
(* Const before type ignored *)
    TCOD_light_orange : TTCOD_color_t;cvar;external;
(* Const before type ignored *)
    TCOD_light_amber : TTCOD_color_t;cvar;external;
(* Const before type ignored *)
    TCOD_light_yellow : TTCOD_color_t;cvar;external;
(* Const before type ignored *)
    TCOD_light_lime : TTCOD_color_t;cvar;external;
(* Const before type ignored *)
    TCOD_light_chartreuse : TTCOD_color_t;cvar;external;
(* Const before type ignored *)
    TCOD_light_green : TTCOD_color_t;cvar;external;
(* Const before type ignored *)
    TCOD_light_sea : TTCOD_color_t;cvar;external;
(* Const before type ignored *)
    TCOD_light_turquoise : TTCOD_color_t;cvar;external;
(* Const before type ignored *)
    TCOD_light_cyan : TTCOD_color_t;cvar;external;
(* Const before type ignored *)
    TCOD_light_sky : TTCOD_color_t;cvar;external;
(* Const before type ignored *)
    TCOD_light_azure : TTCOD_color_t;cvar;external;
(* Const before type ignored *)
    TCOD_light_blue : TTCOD_color_t;cvar;external;
(* Const before type ignored *)
    TCOD_light_han : TTCOD_color_t;cvar;external;
(* Const before type ignored *)
    TCOD_light_violet : TTCOD_color_t;cvar;external;
(* Const before type ignored *)
    TCOD_light_purple : TTCOD_color_t;cvar;external;
(* Const before type ignored *)
    TCOD_light_fuchsia : TTCOD_color_t;cvar;external;
(* Const before type ignored *)
    TCOD_light_magenta : TTCOD_color_t;cvar;external;
(* Const before type ignored *)
    TCOD_light_pink : TTCOD_color_t;cvar;external;
(* Const before type ignored *)
    TCOD_light_crimson : TTCOD_color_t;cvar;external;
{ lighter colors  }
(* Const before type ignored *)
    TCOD_lighter_red : TTCOD_color_t;cvar;external;
(* Const before type ignored *)
    TCOD_lighter_flame : TTCOD_color_t;cvar;external;
(* Const before type ignored *)
    TCOD_lighter_orange : TTCOD_color_t;cvar;external;
(* Const before type ignored *)
    TCOD_lighter_amber : TTCOD_color_t;cvar;external;
(* Const before type ignored *)
    TCOD_lighter_yellow : TTCOD_color_t;cvar;external;
(* Const before type ignored *)
    TCOD_lighter_lime : TTCOD_color_t;cvar;external;
(* Const before type ignored *)
    TCOD_lighter_chartreuse : TTCOD_color_t;cvar;external;
(* Const before type ignored *)
    TCOD_lighter_green : TTCOD_color_t;cvar;external;
(* Const before type ignored *)
    TCOD_lighter_sea : TTCOD_color_t;cvar;external;
(* Const before type ignored *)
    TCOD_lighter_turquoise : TTCOD_color_t;cvar;external;
(* Const before type ignored *)
    TCOD_lighter_cyan : TTCOD_color_t;cvar;external;
(* Const before type ignored *)
    TCOD_lighter_sky : TTCOD_color_t;cvar;external;
(* Const before type ignored *)
    TCOD_lighter_azure : TTCOD_color_t;cvar;external;
(* Const before type ignored *)
    TCOD_lighter_blue : TTCOD_color_t;cvar;external;
(* Const before type ignored *)
    TCOD_lighter_han : TTCOD_color_t;cvar;external;
(* Const before type ignored *)
    TCOD_lighter_violet : TTCOD_color_t;cvar;external;
(* Const before type ignored *)
    TCOD_lighter_purple : TTCOD_color_t;cvar;external;
(* Const before type ignored *)
    TCOD_lighter_fuchsia : TTCOD_color_t;cvar;external;
(* Const before type ignored *)
    TCOD_lighter_magenta : TTCOD_color_t;cvar;external;
(* Const before type ignored *)
    TCOD_lighter_pink : TTCOD_color_t;cvar;external;
(* Const before type ignored *)
    TCOD_lighter_crimson : TTCOD_color_t;cvar;external;
{ lightest colors  }
(* Const before type ignored *)
    TCOD_lightest_red : TTCOD_color_t;cvar;external;
(* Const before type ignored *)
    TCOD_lightest_flame : TTCOD_color_t;cvar;external;
(* Const before type ignored *)
    TCOD_lightest_orange : TTCOD_color_t;cvar;external;
(* Const before type ignored *)
    TCOD_lightest_amber : TTCOD_color_t;cvar;external;
(* Const before type ignored *)
    TCOD_lightest_yellow : TTCOD_color_t;cvar;external;
(* Const before type ignored *)
    TCOD_lightest_lime : TTCOD_color_t;cvar;external;
(* Const before type ignored *)
    TCOD_lightest_chartreuse : TTCOD_color_t;cvar;external;
(* Const before type ignored *)
    TCOD_lightest_green : TTCOD_color_t;cvar;external;
(* Const before type ignored *)
    TCOD_lightest_sea : TTCOD_color_t;cvar;external;
(* Const before type ignored *)
    TCOD_lightest_turquoise : TTCOD_color_t;cvar;external;
(* Const before type ignored *)
    TCOD_lightest_cyan : TTCOD_color_t;cvar;external;
(* Const before type ignored *)
    TCOD_lightest_sky : TTCOD_color_t;cvar;external;
(* Const before type ignored *)
    TCOD_lightest_azure : TTCOD_color_t;cvar;external;
(* Const before type ignored *)
    TCOD_lightest_blue : TTCOD_color_t;cvar;external;
(* Const before type ignored *)
    TCOD_lightest_han : TTCOD_color_t;cvar;external;
(* Const before type ignored *)
    TCOD_lightest_violet : TTCOD_color_t;cvar;external;
(* Const before type ignored *)
    TCOD_lightest_purple : TTCOD_color_t;cvar;external;
(* Const before type ignored *)
    TCOD_lightest_fuchsia : TTCOD_color_t;cvar;external;
(* Const before type ignored *)
    TCOD_lightest_magenta : TTCOD_color_t;cvar;external;
(* Const before type ignored *)
    TCOD_lightest_pink : TTCOD_color_t;cvar;external;
(* Const before type ignored *)
    TCOD_lightest_crimson : TTCOD_color_t;cvar;external;
{ desaturated  }
(* Const before type ignored *)
    TCOD_desaturated_red : TTCOD_color_t;cvar;external;
(* Const before type ignored *)
    TCOD_desaturated_flame : TTCOD_color_t;cvar;external;
(* Const before type ignored *)
    TCOD_desaturated_orange : TTCOD_color_t;cvar;external;
(* Const before type ignored *)
    TCOD_desaturated_amber : TTCOD_color_t;cvar;external;
(* Const before type ignored *)
    TCOD_desaturated_yellow : TTCOD_color_t;cvar;external;
(* Const before type ignored *)
    TCOD_desaturated_lime : TTCOD_color_t;cvar;external;
(* Const before type ignored *)
    TCOD_desaturated_chartreuse : TTCOD_color_t;cvar;external;
(* Const before type ignored *)
    TCOD_desaturated_green : TTCOD_color_t;cvar;external;
(* Const before type ignored *)
    TCOD_desaturated_sea : TTCOD_color_t;cvar;external;
(* Const before type ignored *)
    TCOD_desaturated_turquoise : TTCOD_color_t;cvar;external;
(* Const before type ignored *)
    TCOD_desaturated_cyan : TTCOD_color_t;cvar;external;
(* Const before type ignored *)
    TCOD_desaturated_sky : TTCOD_color_t;cvar;external;
(* Const before type ignored *)
    TCOD_desaturated_azure : TTCOD_color_t;cvar;external;
(* Const before type ignored *)
    TCOD_desaturated_blue : TTCOD_color_t;cvar;external;
(* Const before type ignored *)
    TCOD_desaturated_han : TTCOD_color_t;cvar;external;
(* Const before type ignored *)
    TCOD_desaturated_violet : TTCOD_color_t;cvar;external;
(* Const before type ignored *)
    TCOD_desaturated_purple : TTCOD_color_t;cvar;external;
(* Const before type ignored *)
    TCOD_desaturated_fuchsia : TTCOD_color_t;cvar;external;
(* Const before type ignored *)
    TCOD_desaturated_magenta : TTCOD_color_t;cvar;external;
(* Const before type ignored *)
    TCOD_desaturated_pink : TTCOD_color_t;cvar;external;
(* Const before type ignored *)
    TCOD_desaturated_crimson : TTCOD_color_t;cvar;external;
{ metallic  }
(* Const before type ignored *)
    TCOD_brass : TTCOD_color_t;cvar;external;
(* Const before type ignored *)
    TCOD_copper : TTCOD_color_t;cvar;external;
(* Const before type ignored *)
    TCOD_gold : TTCOD_color_t;cvar;external;
(* Const before type ignored *)
    TCOD_silver : TTCOD_color_t;cvar;external;
{ miscellaneous  }
(* Const before type ignored *)
    TCOD_celadon : TTCOD_color_t;cvar;external;
(* Const before type ignored *)
    TCOD_peach : TTCOD_color_t;cvar;external;
{ C++ end of extern C conditionnal removed }
{$endif}

implementation


end.
