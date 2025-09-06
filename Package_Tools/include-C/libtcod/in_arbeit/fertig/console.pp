
unit console;
interface

{
  Automatically converted by H2Pas 1.0.0 from console.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    console.h
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
PTCOD_alignment_t  = ^TCOD_alignment_t;
PTCOD_bkgnd_flag_t  = ^TCOD_bkgnd_flag_t;
PTCOD_color_t  = ^TCOD_color_t;
PTCOD_Console  = ^TCOD_Console;
PTCOD_console_t  = ^TCOD_console_t;
PTCOD_ConsoleTile  = ^TCOD_ConsoleTile;
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
{$ifndef TCOD_CONSOLE_H_}
{$define TCOD_CONSOLE_H_}
{$include <stdbool.h>}
{ __cplusplus }
{$include "color.h"}
{$include "config.h"}
{$include "error.h"}
{$include "tileset.h"}
{*
 *  \enum TCOD_bkgnd_flag_t
 *
 *  Background color blend modes.
  }
type
  PTCOD_bkgnd_flag_t = ^TTCOD_bkgnd_flag_t;
  TTCOD_bkgnd_flag_t =  Longint;
  Const
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
;
{*
 *  \enum TCOD_alignment_t
 *
 *  Print justification options.
  }
type
  PTCOD_alignment_t = ^TTCOD_alignment_t;
  TTCOD_alignment_t =  Longint;
  Const
    TCOD_LEFT = 0;
    TCOD_RIGHT = 1;
    TCOD_CENTER = 2;
;
{*
    A console tile.
  }
{ __cplusplus }
{*
      The Unicode codepoint for this tile.
    }
{*
      The tile glyph color, rendered on top of the background.
    }
{*
      The tile background color, rendered behind the glyph.
    }
type
  PTCOD_ConsoleTile = ^TTCOD_ConsoleTile;
  TTCOD_ConsoleTile = record
      ch : longint;
      fg : TTCOD_ColorRGBA;
      bg : TTCOD_ColorRGBA;
    end;
{*
    The libtcod console struct.

    All attributes should be considered private.

    All C++ methods should be considered provisional, and are subject to
    change.
  }
{ __cplusplus }
{* Console width and height (in characters, not pixels.)  }
{* A contiguous array of console tiles.  }
{* Default background operator for print & print_rect functions.  }
{* Default alignment for print & print_rect functions.  }
{* Foreground (text) and background colors.  }
{* True if a key color is being used.  }
{* The current key color for this console.  }
{*
      The total length of the tiles array.  Same as `w * h`.

      \rst
      .. versionadded:: 1.16
      \endrst
    }
{*
      \rst
      .. versionadded:: 1.16
      \endrst
    }
{* Internal use.  }
  PTCOD_Console = ^TTCOD_Console;
  TTCOD_Console = record
      w : longint;
      h : longint;
      tiles : PTCOD_ConsoleTile;
      bkgnd_flag : TTCOD_bkgnd_flag_t;
      alignment : TTCOD_alignment_t;
      fore : TTCOD_color_t;
      back : TTCOD_color_t;
      has_key_color : Tbool;
      key_color : TTCOD_color_t;
      elements : longint;
      userdata : pointer;
      on_delete : procedure (self:PTCOD_Console);cdecl;
    end;


  PTCOD_console_t = ^TTCOD_console_t;
  TTCOD_console_t = PTCOD_Console;
{ C++ extern C conditionnal removed }
{ __cplusplus }
{*
 *  Return a new console with a specific number of columns and rows.
 *
 *  \param w Number of columns.
 *  \param h Number of columns.
 *  \return A pointer to the new console, or NULL on error.
  }

function TCOD_console_new(w:longint; h:longint):PTCOD_Console;cdecl;external;
{*
 *  Return the width of a console.
  }
(* Const before type ignored *)
function TCOD_console_get_width(con:PTCOD_Console):longint;cdecl;external;
{*
 *  Return the height of a console.
  }
(* Const before type ignored *)
function TCOD_console_get_height(con:PTCOD_Console):longint;cdecl;external;
procedure TCOD_console_set_key_color(con:PTCOD_Console; col:TTCOD_color_t);cdecl;external;
{*
 *  Blit from one console to another.
 *
 *  \param srcCon Pointer to the source console.
 *  \param xSrc The left region of the source console to blit from.
 *  \param ySrc The top region of the source console to blit from.
 *  \param wSrc The width of the region to blit from.
 *              If 0 then it will fill to the maximum width.
 *  \param hSrc The height of the region to blit from.
 *              If 0 then it will fill to the maximum height.
 *  \param dstCon Pointer to the destination console.
 *  \param xDst The left corner to blit onto the destination console.
 *  \param yDst The top corner to blit onto the destination console.
 *  \param foreground_alpha Foreground blending alpha.
 *  \param background_alpha Background blending alpha.
 *
 *  If the source console has a key color, this function will use it.
 *  \rst
 *  .. versionchanged:: 1.16
 *      Blits can now handle per-cell alpha transparency.
 *  \endrst
  }
(* Const before type ignored *)
procedure TCOD_console_blit(src:PTCOD_Console; xSrc:longint; ySrc:longint; wSrc:longint; hSrc:longint; 
            dst:PTCOD_Console; xDst:longint; yDst:longint; foreground_alpha:single; background_alpha:single);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure TCOD_console_blit_key_color(src:PTCOD_Console; xSrc:longint; ySrc:longint; wSrc:longint; hSrc:longint; 
            dst:PTCOD_Console; xDst:longint; yDst:longint; foreground_alpha:single; background_alpha:single; 
            key_color:PTCOD_color_t);cdecl;external;
{*
 *  Delete a console.
 *
 *  \param con A console pointer.
 *
 *  If the console being deleted is the root console, then the display will be
 *  uninitialized.
  }
procedure TCOD_console_delete(console:PTCOD_Console);cdecl;external;
procedure TCOD_console_set_default_background(con:PTCOD_Console; col:TTCOD_color_t);cdecl;external;
procedure TCOD_console_set_default_foreground(con:PTCOD_Console; col:TTCOD_color_t);cdecl;external;
{*
 *  Clear a console to its default colors and the space character code.
  }
procedure TCOD_console_clear(con:PTCOD_Console);cdecl;external;
{*
 *  Blend a background color onto a console tile.
 *
 *  \param con A console pointer.
 *  \param x The X coordinate, the left-most position being 0.
 *  \param y The Y coordinate, the top-most position being 0.
 *  \param col The background color to blend.
 *  \param flag The blend mode to use.
  }
procedure TCOD_console_set_char_background(con:PTCOD_Console; x:longint; y:longint; col:TTCOD_color_t; flag:TTCOD_bkgnd_flag_t);cdecl;external;
{*
 *  Change the foreground color of a console tile.
 *
 *  \param con A console pointer.
 *  \param x The X coordinate, the left-most position being 0.
 *  \param y The Y coordinate, the top-most position being 0.
 *  \param col The foreground color to set.
  }
procedure TCOD_console_set_char_foreground(con:PTCOD_Console; x:longint; y:longint; col:TTCOD_color_t);cdecl;external;
{*
 *  Change a character on a console tile, without changing its colors.
 *
 *  \param con A console pointer.
 *  \param x The X coordinate, the left-most position being 0.
 *  \param y The Y coordinate, the top-most position being 0.
 *  \param c The character code to set.
  }
procedure TCOD_console_set_char(con:PTCOD_Console; x:longint; y:longint; c:longint);cdecl;external;
{*
 *  Draw a character on a console using the default colors.
 *
 *  \param con A console pointer.
 *  \param x The X coordinate, the left-most position being 0.
 *  \param y The Y coordinate, the top-most position being 0.
 *  \param c The character code to place.
 *  \param flag A TCOD_bkgnd_flag_t flag.
  }
procedure TCOD_console_put_char(con:PTCOD_Console; x:longint; y:longint; c:longint; flag:TTCOD_bkgnd_flag_t);cdecl;external;
{*
 *  Draw a character on the console with the given colors.
 *
 *  \param con A console pointer.
 *  \param x The X coordinate, the left-most position being 0.
 *  \param y The Y coordinate, the top-most position being 0.
 *  \param c The character code to place.
 *  \param fore The foreground color.
 *  \param back The background color.  This color will not be blended.
  }
procedure TCOD_console_put_char_ex(con:PTCOD_Console; x:longint; y:longint; c:longint; fore:TTCOD_color_t; 
            back:TTCOD_color_t);cdecl;external;
{*
 *  Set a consoles default background flag.
 *
 *  \param con A console pointer.
 *  \param flag One of `TCOD_bkgnd_flag_t`.
  }
procedure TCOD_console_set_background_flag(con:PTCOD_Console; flag:TTCOD_bkgnd_flag_t);cdecl;external;
{*
 *  Return a consoles default background flag.
  }
function TCOD_console_get_background_flag(con:PTCOD_Console):TTCOD_bkgnd_flag_t;cdecl;external;
{*
 *  Set a consoles default alignment.
 *
 *  \param con A console pointer.
 *  \param alignment One of TCOD_alignment_t
  }
procedure TCOD_console_set_alignment(con:PTCOD_Console; alignment:TTCOD_alignment_t);cdecl;external;
{*
 *  Return a consoles default alignment.
  }
function TCOD_console_get_alignment(con:PTCOD_Console):TTCOD_alignment_t;cdecl;external;
function TCOD_console_get_default_background(con:PTCOD_Console):TTCOD_color_t;cdecl;external;
function TCOD_console_get_default_foreground(con:PTCOD_Console):TTCOD_color_t;cdecl;external;
{*
 *  Return the background color of a console at x,y
 *
 *  \param con A console pointer.
 *  \param x The X coordinate, the left-most position being 0.
 *  \param y The Y coordinate, the top-most position being 0.
 *  \return A TCOD_color_t struct with a copy of the background color.
  }
(* Const before type ignored *)
function TCOD_console_get_char_background(con:PTCOD_Console; x:longint; y:longint):TTCOD_color_t;cdecl;external;
{*
 *  Return the foreground color of a console at x,y
 *
 *  \param con A console pointer.
 *  \param x The X coordinate, the left-most position being 0.
 *  \param y The Y coordinate, the top-most position being 0.
 *  \return A TCOD_color_t struct with a copy of the foreground color.
  }
(* Const before type ignored *)
function TCOD_console_get_char_foreground(con:PTCOD_Console; x:longint; y:longint):TTCOD_color_t;cdecl;external;
{*
 *  Return a character code of a console at x,y
 *
 *  \param con A console pointer.
 *  \param x The X coordinate, the left-most position being 0.
 *  \param y The Y coordinate, the top-most position being 0.
 *  \return The character code.
  }
(* Const before type ignored *)
function TCOD_console_get_char(con:PTCOD_Console; x:longint; y:longint):longint;cdecl;external;
{*
 *  Fade the color of the display.
 *
 *  \param val Where at 255 colors are normal and at 0 colors are completely
 *             faded.
 *  \param fadecol Color to fade towards.
  }
procedure TCOD_console_set_fade(val:Tuint8_t; fade:TTCOD_color_t);cdecl;external;
{*
 *  Return the fade value.
 *
 *  \return At 255 colors are normal and at 0 colors are completely faded.
  }
function TCOD_console_get_fade:Tuint8_t;cdecl;external;
{*
 *  Return the fade color.
 *
 *  \return The current fading color.
  }
function TCOD_console_get_fading_color:TTCOD_color_t;cdecl;external;
procedure TCOD_console_resize_(console:PTCOD_Console; width:longint; height:longint);cdecl;external;
{ __cplusplus }
{$endif}
{ TCOD_CONSOLE_H_ }

implementation


end.
