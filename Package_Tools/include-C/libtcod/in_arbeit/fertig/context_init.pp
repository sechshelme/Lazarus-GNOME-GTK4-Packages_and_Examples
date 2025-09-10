
unit context_init;
interface

{
  Automatically converted by H2Pas 1.0.0 from context_init.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    context_init.h
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
PTCOD_Context  = ^TCOD_Context;
PTCOD_ContextParams  = ^TCOD_ContextParams;
PTCOD_Tileset  = ^TCOD_Tileset;
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
{$ifndef LIBTCOD_CONTEXT_INIT_H_}
{$define LIBTCOD_CONTEXT_INIT_H_}
{$include <stdbool.h>}
{$include "config.h"}
{$include "context.h"}
{$include "error.h"}
{$include "tileset.h"}
{*
    A struct of paramers used to create a new context with `TCOD_context_new`.
  }
{*
      Must be `TCOD_COMPILEDVERSION`.
    }
{*
      `window_x` and `window_y` are the starting position of the window.
      These are SDL parameters so values like `SDL_WINDOWPOS_UNDEFINED` and
      `SDL_WINDOWPOS_CENTERED` are acceptable.

      Values of zero will be converted to `SDL_WINDOWPOS_UNDEFINED` unless
      `window_xy_defined` is true.
    }
{*
      `pixel_width` and `pixel_height` are the desired size of the window in pixels.
      If these are zero then they'll be derived from `columns`, `rows`, and the `tileset`.
    }
{*
      `columns` and `rows` are the desired size of the terminal window.
      Usually you'll set either these or the pixel resolution.
    }
{*
      `renderer_type` is one of the `TCOD_renderer_t` values.
    }
{*
      `tileset` is an optional pointer to a tileset object.
      If this is NULL then a platform specific fallback tileset will be used.
      This fallback is known to be unreliable, but it should work well enough
      for prototyping code.
    }
{*
      If `vsync` is true, then vertical sync will be enabled whenever possible.
      A value of true is recommended.
    }
{*
      `sdl_window_flags` is a bitfield of SDL_WindowFlags flags.
      For a window, a value of ``SDL_WINDOW_RESIZABLE`` is recommended.
      For fullscreen, a value of
      ``SDL_WINDOW_RESIZABLE | SDL_WINDOW_FULLSCREEN_DESKTOP`` is recommended.
      You should avoid the ``SDL_WINDOW_FULLSCREEN`` flag whenever possible.
    }
{*
      `window_title` will be the title of the opened window.
    }
(* Const before type ignored *)
{*
      The number of items in `argv`.
    }
{*
      `argc` and `argv` are optional CLI parameters.
      You can pass `0` and `NULL` respectfully to ignore them.
      If unsure then you should pass the `argc` and `argv` arguments from your
      `main` function.
    }
(* Const before type ignored *)
(* Const before declarator ignored *)
{*
      If user attention is required for the given CLI parameters then
      `cli_output` will be called with `cli_userdata` and an error or help
      message.
      If `cli_output` is NULL then it will print the message to stdout and
      terminate the program.  If `cli_output` returns normally then
      TCOD_E_REQUIRES_ATTENTION will be returned from `TCOD_context_new`.
    }
(* Const before type ignored *)
{*
      This is passed to the `userdata` parameter of `cli_output` if called.
    }
{*
      If this is false then `window_x`/`window_y` parameters of zero are
      assumed to be undefined and will be changed to `SDL_WINDOWPOS_UNDEFINED`.
    }
type
  PTCOD_ContextParams = ^TTCOD_ContextParams;
  TTCOD_ContextParams = record
      tcod_version : longint;
      window_x : longint;
      window_y : longint;
      pixel_width : longint;
      pixel_height : longint;
      columns : longint;
      rows : longint;
      renderer_type : longint;
      tileset : PTCOD_Tileset;
      vsync : longint;
      sdl_window_flags : longint;
      window_title : Pchar;
      argc : longint;
      argv : ^Pchar;
      cli_output : procedure (userdata:pointer; output:Pchar);cdecl;
      cli_userdata : pointer;
      window_xy_defined : Tbool;
    end;
{ C++ extern C conditionnal removed }
{ __cplusplus }
{*
    Create a new context with the given parameters.

    `params` is a non-NULL pointer to a TCOD_ContextParams struct.
    See its documentation for info on the parameters.

    `out` is the output for the `TCOD_Context`, must not be NULL.

    \rst
    .. versionadded:: 1.16
    \endrst
  }
(* Const before type ignored *)

function TCOD_context_new(params:PTCOD_ContextParams; out:PPTCOD_Context):TTCOD_Error;cdecl;external;
{ __cplusplus }
{$endif}
{ LIBTCOD_CONTEXT_INIT_H_ }

implementation


end.
