
unit context;
interface

{
  Automatically converted by H2Pas 1.0.0 from context.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    context.h
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
Pdouble  = ^double;
Plongint  = ^longint;
PSDL_Rect  = ^SDL_Rect;
PSDL_Renderer  = ^SDL_Renderer;
PSDL_Window  = ^SDL_Window;
PTCOD_Console  = ^TCOD_Console;
PTCOD_Context  = ^TCOD_Context;
PTCOD_Tileset  = ^TCOD_Tileset;
PTCOD_ViewportOptions  = ^TCOD_ViewportOptions;
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
{$ifndef LIBTCOD_CONTEXT_H_}
{$define LIBTCOD_CONTEXT_H_}
{ __cplusplus }
{$include "config.h"}
{$include "console.h"}
{$include "context_viewport.h"}
{$include "error.h"}
{$include "tileset.h"}
type
  PSDL_Window = ^TSDL_Window;
  TSDL_Window = record
      {undefined structure}
    end;

  PSDL_Renderer = ^TSDL_Renderer;
  TSDL_Renderer = record
      {undefined structure}
    end;

  PSDL_Rect = ^TSDL_Rect;
  TSDL_Rect = record
      {undefined structure}
    end;

  PTCOD_Context = ^TTCOD_Context;
  TTCOD_Context = record
      {undefined structure}
    end;

{ Defined in this header later. }
{ C++ extern C conditionnal removed }
{ __cplusplus }
{*
 *  Delete a rendering context.
 *  \rst
 *  .. versionadded:: 1.16
 *  \endrst
  }

procedure TCOD_context_delete(renderer:PTCOD_Context);cdecl;external;
{*
 *  Create an uninitialized rendering context.
 *
 *  Used internally.
  }
function TCOD_context_new_:PTCOD_Context;cdecl;external;
{*
    Present a console to the screen, using a rendering context.

    `console` is the console to present, the console can be any size.

    `viewport` is the optional viewport options to use.
    This will affect the scaling of the console with the current context.
    This can be NULL to use the default options, which are to stretch the
    console to fit the screen.

    \rst
    .. versionadded:: 1.16
    \endrst
  }
(* Const before type ignored *)
(* Const before type ignored *)
function TCOD_context_present(context:PTCOD_Context; console:PTCOD_Console; viewport:PTCOD_ViewportOptions):TTCOD_Error;cdecl;external;
{*
    Convert the screen coordinates to tile coordinates for this context.

    `x` and `y` are the pointers to the screen coordinates, these will be
    converted to tile coordinates after the call to this function.

    The parameters given to the last call to `TCOD_context_present` will
    determine where the tiles are for this call.

    \rst
    .. versionadded:: 1.16
    \endrst
  }
function TCOD_context_screen_pixel_to_tile_d(context:PTCOD_Context; x:Pdouble; y:Pdouble):TTCOD_Error;cdecl;external;
{*
    Convert the screen coordinates to integer tile coordinates for this context.

    Save as `TCOD_context_screen_pixel_to_tile` but the inputs and results are
    integers.  This is useful if you don't need sub-tile coordinates.

    \rst
    .. versionadded:: 1.16
    \endrst
  }
function TCOD_context_screen_pixel_to_tile_i(context:PTCOD_Context; x:Plongint; y:Plongint):TTCOD_Error;cdecl;external;
{*
    Save the last presented console to a PNG file.

    \rst
    .. versionadded:: 1.16
    \endrst
  }
(* Const before type ignored *)
function TCOD_context_save_screenshot(context:PTCOD_Context; filename:Pchar):TTCOD_Error;cdecl;external;
{*
    Return a pointer the SDL_Window for this context if it uses one.

    \rst
    .. versionadded:: 1.16
    \endrst
  }
function TCOD_context_get_sdl_window(context:PTCOD_Context):PSDL_Window;cdecl;external;
{*
    Return a pointer the SDL_Renderer for this context if it uses one.

    \rst
    .. versionadded:: 1.16
    \endrst
  }
function TCOD_context_get_sdl_renderer(context:PTCOD_Context):PSDL_Renderer;cdecl;external;
{*
    Change the active tileset for this context.

    \rst
    .. versionadded:: 1.16
    \endrst
  }
function TCOD_context_change_tileset(self:PTCOD_Context; tileset:PTCOD_Tileset):TTCOD_Error;cdecl;external;
{*
    Return the `TCOD_renderer_t` renderer type for this context.

    Returns a negative number on error, such as `context` being NULL.

    \rst
    .. versionadded:: 1.16
    \endrst
  }
function TCOD_context_get_renderer_type(context:PTCOD_Context):longint;cdecl;external;
{*
    Set `columns` and `rows` to the recommended console size for this context.

    `magnification` determines the apparent size of the tiles on the output.
    Values of 0.0f or lower will default to 1.0f.

    \rst
    .. versionadded:: 1.16
    \endrst
  }
function TCOD_context_recommended_console_size(context:PTCOD_Context; magnification:single; columns:Plongint; rows:Plongint):TTCOD_Error;cdecl;external;
{ __cplusplus }
{*
    A rendering context for libtcod.
    \rst
    .. versionadded:: 1.16
    \endrst
  }
{ __cplusplus }
{ All remaining members are private. }
{*
      The TCOD_renderer_t value of this context.
    }
{*
      A pointer to this contexts unique data.
    }
{ Context C callback are prefixed with 'c_', always check if see if these are NULL. }
{*
      Called when this context is deleted.
    }
{*
      Called to present a console to a contexts display.

      `console` must not be NULL.

      `viewport` may be NULL.
    }
(* Const before type ignored *)
(* Const before type ignored *)
{*
      Convert pixel coordinates to the contexts tile coordinates.
    }
{*
      Ask this context to save a screenshot.
    }
(* Const before type ignored *)
{*
      Return this contexts SDL_Window, if any.
    }
{*
      Return this contexts SDL_Renderer, if any.
    }
{*
      Draw a console without flipping the display.
      This method of drawing is deprecated.
    }
(* Const before type ignored *)
(* Const before type ignored *)
{*
      Change the tileset used by this context.
   }
{*
      Output the recommended console size to `columns` and `rows`.

      `magnification` determines the apparent size of tiles,
      but might be ignored.
   }
type
  PTCOD_Context = ^TTCOD_Context;
  TTCOD_Context = record
      _type : longint;
      contextdata_ : pointer;
      c_destructor_ : procedure (self:PTCOD_Context);cdecl;
      c_present_ : function (self:PTCOD_Context; console:PTCOD_Console; viewport:PTCOD_ViewportOptions):TTCOD_Error;cdecl;
      c_pixel_to_tile_ : procedure (self:PTCOD_Context; x:Pdouble; y:Pdouble);cdecl;
      c_save_screenshot_ : function (self:PTCOD_Context; filename:Pchar):TTCOD_Error;cdecl;
      c_get_sdl_window_ : function (self:PTCOD_Context):PSDL_Window;cdecl;
      c_get_sdl_renderer_ : function (self:PTCOD_Context):PSDL_Renderer;cdecl;
      c_accumulate_ : function (self:PTCOD_Context; console:PTCOD_Console; viewport:PTCOD_ViewportOptions):TTCOD_Error;cdecl;
      c_set_tileset_ : function (self:PTCOD_Context; tileset:PTCOD_Tileset):TTCOD_Error;cdecl;
      c_recommended_console_size_ : function (self:PTCOD_Context; magnification:single; columns:Plongint; rows:Plongint):TTCOD_Error;cdecl;
    end;

{ __cplusplus }
{$endif}
{ LIBTCOD_CONTEXT_H_ }

implementation


end.
