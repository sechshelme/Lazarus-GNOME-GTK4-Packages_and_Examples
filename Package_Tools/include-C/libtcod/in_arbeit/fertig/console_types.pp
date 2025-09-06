
unit console_types;
interface

{
  Automatically converted by H2Pas 1.0.0 from console_types.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    console_types.h
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
PTCOD_chars_t  = ^TCOD_chars_t;
PTCOD_font_flags_t  = ^TCOD_font_flags_t;
PTCOD_key_status_t  = ^TCOD_key_status_t;
PTCOD_key_t  = ^TCOD_key_t;
PTCOD_keycode_t  = ^TCOD_keycode_t;
PTCOD_renderer_t  = ^TCOD_renderer_t;
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
{$ifndef _TCOD_CONSOLE_TYPES_H}
{$define _TCOD_CONSOLE_TYPES_H}
{$include "color.h"}
{$include "config.h"}
{$include "console.h"}
type
  PTCOD_keycode_t = ^TTCOD_keycode_t;
  TTCOD_keycode_t =  Longint;
  Const
    TCODK_NONE = 0;
    TCODK_ESCAPE = 1;
    TCODK_BACKSPACE = 2;
    TCODK_TAB = 3;
    TCODK_ENTER = 4;
    TCODK_SHIFT = 5;
    TCODK_CONTROL = 6;
    TCODK_ALT = 7;
    TCODK_PAUSE = 8;
    TCODK_CAPSLOCK = 9;
    TCODK_PAGEUP = 10;
    TCODK_PAGEDOWN = 11;
    TCODK_END = 12;
    TCODK_HOME = 13;
    TCODK_UP = 14;
    TCODK_LEFT = 15;
    TCODK_RIGHT = 16;
    TCODK_DOWN = 17;
    TCODK_PRINTSCREEN = 18;
    TCODK_INSERT = 19;
    TCODK_DELETE = 20;
    TCODK_LWIN = 21;
    TCODK_RWIN = 22;
    TCODK_APPS = 23;
    TCODK_0 = 24;
    TCODK_1 = 25;
    TCODK_2 = 26;
    TCODK_3 = 27;
    TCODK_4 = 28;
    TCODK_5 = 29;
    TCODK_6 = 30;
    TCODK_7 = 31;
    TCODK_8 = 32;
    TCODK_9 = 33;
    TCODK_KP0 = 34;
    TCODK_KP1 = 35;
    TCODK_KP2 = 36;
    TCODK_KP3 = 37;
    TCODK_KP4 = 38;
    TCODK_KP5 = 39;
    TCODK_KP6 = 40;
    TCODK_KP7 = 41;
    TCODK_KP8 = 42;
    TCODK_KP9 = 43;
    TCODK_KPADD = 44;
    TCODK_KPSUB = 45;
    TCODK_KPDIV = 46;
    TCODK_KPMUL = 47;
    TCODK_KPDEC = 48;
    TCODK_KPENTER = 49;
    TCODK_F1 = 50;
    TCODK_F2 = 51;
    TCODK_F3 = 52;
    TCODK_F4 = 53;
    TCODK_F5 = 54;
    TCODK_F6 = 55;
    TCODK_F7 = 56;
    TCODK_F8 = 57;
    TCODK_F9 = 58;
    TCODK_F10 = 59;
    TCODK_F11 = 60;
    TCODK_F12 = 61;
    TCODK_NUMLOCK = 62;
    TCODK_SCROLLLOCK = 63;
    TCODK_SPACE = 64;
    TCODK_CHAR = 65;
    TCODK_TEXT = 66;
;
  TCOD_KEY_TEXT_SIZE = 32;  
{ key data : special code or character or text  }
{  key code  }
{ character if vk == TCODK_CHAR else 0  }
{ text if vk == TCODK_TEXT else text[0] == '\0'  }
{ does this correspond to a key press or key release event ?  }
type
  PTCOD_key_t = ^TTCOD_key_t;
  TTCOD_key_t = record
      vk : TTCOD_keycode_t;
      c : char;
      text : array[0..(TCOD_KEY_TEXT_SIZE)-1] of char;
      pressed : Tbool;
      lalt : Tbool;
      lctrl : Tbool;
      lmeta : Tbool;
      ralt : Tbool;
      rctrl : Tbool;
      rmeta : Tbool;
      shift : Tbool;
    end;
{ single walls  }
{ double walls  }
{ blocks  }
{ arrows  }
{ arrows without tail  }
{ double arrows  }
{ GUI stuff  }
{ sub-pixel resolution kit  }
{ miscellaneous  }
{ diacritics  }

  PTCOD_chars_t = ^TTCOD_chars_t;
  TTCOD_chars_t =  Longint;
  Const
    TCOD_CHAR_HLINE = 196;
    TCOD_CHAR_VLINE = 179;
    TCOD_CHAR_NE = 191;
    TCOD_CHAR_NW = 218;
    TCOD_CHAR_SE = 217;
    TCOD_CHAR_SW = 192;
    TCOD_CHAR_TEEW = 180;
    TCOD_CHAR_TEEE = 195;
    TCOD_CHAR_TEEN = 193;
    TCOD_CHAR_TEES = 194;
    TCOD_CHAR_CROSS = 197;
    TCOD_CHAR_DHLINE = 205;
    TCOD_CHAR_DVLINE = 186;
    TCOD_CHAR_DNE = 187;
    TCOD_CHAR_DNW = 201;
    TCOD_CHAR_DSE = 188;
    TCOD_CHAR_DSW = 200;
    TCOD_CHAR_DTEEW = 185;
    TCOD_CHAR_DTEEE = 204;
    TCOD_CHAR_DTEEN = 202;
    TCOD_CHAR_DTEES = 203;
    TCOD_CHAR_DCROSS = 206;
    TCOD_CHAR_BLOCK1 = 176;
    TCOD_CHAR_BLOCK2 = 177;
    TCOD_CHAR_BLOCK3 = 178;
    TCOD_CHAR_ARROW_N = 24;
    TCOD_CHAR_ARROW_S = 25;
    TCOD_CHAR_ARROW_E = 26;
    TCOD_CHAR_ARROW_W = 27;
    TCOD_CHAR_ARROW2_N = 30;
    TCOD_CHAR_ARROW2_S = 31;
    TCOD_CHAR_ARROW2_E = 16;
    TCOD_CHAR_ARROW2_W = 17;
    TCOD_CHAR_DARROW_H = 29;
    TCOD_CHAR_DARROW_V = 18;
    TCOD_CHAR_CHECKBOX_UNSET = 224;
    TCOD_CHAR_CHECKBOX_SET = 225;
    TCOD_CHAR_RADIO_UNSET = 9;
    TCOD_CHAR_RADIO_SET = 10;
    TCOD_CHAR_SUBP_NW = 226;
    TCOD_CHAR_SUBP_NE = 227;
    TCOD_CHAR_SUBP_N = 228;
    TCOD_CHAR_SUBP_SE = 229;
    TCOD_CHAR_SUBP_DIAG = 230;
    TCOD_CHAR_SUBP_E = 231;
    TCOD_CHAR_SUBP_SW = 232;
    TCOD_CHAR_SMILIE = 1;
    TCOD_CHAR_SMILIE_INV = 2;
    TCOD_CHAR_HEART = 3;
    TCOD_CHAR_DIAMOND = 4;
    TCOD_CHAR_CLUB = 5;
    TCOD_CHAR_SPADE = 6;
    TCOD_CHAR_BULLET = 7;
    TCOD_CHAR_BULLET_INV = 8;
    TCOD_CHAR_MALE = 11;
    TCOD_CHAR_FEMALE = 12;
    TCOD_CHAR_NOTE = 13;
    TCOD_CHAR_NOTE_DOUBLE = 14;
    TCOD_CHAR_LIGHT = 15;
    TCOD_CHAR_EXCLAM_DOUBLE = 19;
    TCOD_CHAR_PILCROW = 20;
    TCOD_CHAR_SECTION = 21;
    TCOD_CHAR_POUND = 156;
    TCOD_CHAR_MULTIPLICATION = 158;
    TCOD_CHAR_FUNCTION = 159;
    TCOD_CHAR_RESERVED = 169;
    TCOD_CHAR_HALF = 171;
    TCOD_CHAR_ONE_QUARTER = 172;
    TCOD_CHAR_COPYRIGHT = 184;
    TCOD_CHAR_CENT = 189;
    TCOD_CHAR_YEN = 190;
    TCOD_CHAR_CURRENCY = 207;
    TCOD_CHAR_THREE_QUARTERS = 243;
    TCOD_CHAR_DIVISION = 246;
    TCOD_CHAR_GRADE = 248;
    TCOD_CHAR_UMLAUT = 249;
    TCOD_CHAR_POW1 = 251;
    TCOD_CHAR_POW3 = 252;
    TCOD_CHAR_POW2 = 253;
    TCOD_CHAR_BULLET_SQUARE = 254;
;
type
  PTCOD_key_status_t = ^TTCOD_key_status_t;
  TTCOD_key_status_t =  Longint;
  Const
    TCOD_KEY_PRESSED = 1;
    TCOD_KEY_RELEASED = 2;
;
{*
 *  These font flags can be OR'd together into a bit-field and passed to
 *  TCOD_console_set_custom_font
  }
{* Tiles are arranged in column-major order.
   *
   *       0 3 6
   *       1 4 7
   *       2 5 8
    }
{* Tiles are arranged in row-major order.
   *
   *       0 1 2
   *       3 4 5
   *       6 7 8
    }
{* Converts all tiles into a monochrome gradient.  }
{* A unique layout used by some of libtcod's fonts.  }
{*
   *  Decode a code page 437 tileset into Unicode code-points.
   *  \rst
   *  .. versionadded:: 1.10
   *  \endrst
    }
type
  PTCOD_font_flags_t = ^TTCOD_font_flags_t;
  TTCOD_font_flags_t =  Longint;
  Const
    TCOD_FONT_LAYOUT_ASCII_INCOL = 1;
    TCOD_FONT_LAYOUT_ASCII_INROW = 2;
    TCOD_FONT_TYPE_GREYSCALE = 4;
    TCOD_FONT_TYPE_GRAYSCALE = 4;
    TCOD_FONT_LAYOUT_TCOD = 8;
    TCOD_FONT_LAYOUT_CP437 = 16;
;
{*
 *  The available renderers.
  }
{* Alias for TCOD_RENDERER_OPENGL2.  }
{*
   *  An OpenGL 1.1 implementation.
   *
   *  Performs worse than TCOD_RENDERER_GLSL without many benefits.
    }
{*
   *  A software based renderer.
   *
   *  The font file is loaded into RAM instead of VRAM in this implementation.
    }
{*
      A new SDL2 renderer.  Allows the window to be resized.

      You may set `SDL_HINT_RENDER_SCALE_QUALITY` to determine the tileset
      upscaling filter.  Either nearest or linear.  The hint will only take
      effect if it's set before this renderer is created.

      \rst
      .. versionadded:: 1.8
      \endrst
    }
{*
      A new OpenGL 2.0 core renderer.  Allows the window to be resized.

      You may set `SDL_HINT_RENDER_SCALE_QUALITY` to determine the tileset
      upscaling filter.  Either nearest or linear.  The hint will take effect
      on the next frame.

      \rst
      .. versionadded:: 1.9

      .. versionchanged:: 1.11
          This renderer now uses OpenGL 2.0 instead of 2.1.

      .. versionchanged:: 1.16
          Now checks the `SDL_HINT_RENDER_SCALE_QUALITY` hint.

      \endrst
    }
type
  PTCOD_renderer_t = ^TTCOD_renderer_t;
  TTCOD_renderer_t =  Longint;
  Const
    TCOD_RENDERER_GLSL = 0;
    TCOD_RENDERER_OPENGL = 1;
    TCOD_RENDERER_SDL = 2;
    TCOD_RENDERER_SDL2 = 3;
    TCOD_RENDERER_OPENGL2 = 4;
    TCOD_NB_RENDERERS = 5;
;
{$endif}
{ _TCOD_CONSOLE_TYPES_H  }

implementation


end.
