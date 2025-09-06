
unit console_init;
interface

{
  Automatically converted by H2Pas 1.0.0 from console_init.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    console_init.h
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
PSDL_Rect  = ^SDL_Rect;
PSDL_Renderer  = ^SDL_Renderer;
PSDL_Window  = ^SDL_Window;
PTCOD_Console  = ^TCOD_Console;
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
{$ifndef LIBTCOD_CONSOLE_INIT_H_}
{$define LIBTCOD_CONSOLE_INIT_H_}
{$include "config.h"}
{$include "console_types.h"}
{$include "error.h"}
{$include "tileset.h"}
{ C++ extern C conditionnal removed }
{ __cplusplus }
type
  PSDL_Rect = ^TSDL_Rect;
  TSDL_Rect = record
      {undefined structure}
    end;

  PSDL_Window = ^TSDL_Window;
  TSDL_Window = record
      {undefined structure}
    end;

  PSDL_Renderer = ^TSDL_Renderer;
  TSDL_Renderer = record
      {undefined structure}
    end;

{*
 *  \brief Initialize the libtcod graphical engine.
 *
 *  \param w The width in tiles.
 *  \param h The height in tiles.
 *  \param title The title for the window.
 *  \param fullscreen Fullscreen option.
 *  \param renderer Which renderer to use when rendering the console.
 *
 *  You may want to call TCOD_console_set_custom_font BEFORE calling this
 *  function.  By default this function loads libtcod's `terminal.png` image
 *  from the working directory.
 *
 *  Afterwards TCOD_quit must be called before the program exits.
 *
 *  Returns 0 on success, or -1 on an error, you can check the error with
 *  TCOD_sys_get_error()
 *
 *  `renderer` and vsync settings can be overridden by the `TCOD_RENDERER` or
 *  `TCOD_VSYNC` environment variables.
 *
 *  Valid case-sensitive options for `TCOD_RENDERER` are:
 *  - sdl
 *  - opengl
 *  - glsl
 *  - sdl2
 *  - opengl2
 *
 *  Valid options for `TCOD_VSYNC` are `0` or `1`.
 *
 *  \rst
 *  .. versionchanged:: 1.12
 *      Now returns -1 on error instead of crashing.
 *
 *  .. versionchanged:: 1.13
 *      Added the `TCOD_RENDERER` and `TCOD_VSYNC` overrides.
 *  \endrst
  }
(* Const before type ignored *)

function TCOD_console_init_root(w:longint; h:longint; title:Pchar; fullscreen:Tbool; renderer:TTCOD_renderer_t):TTCOD_Error;cdecl;external;
(* Const before type ignored *)
function TCOD_console_init_root_(w:longint; h:longint; title:Pchar; fullscreen:Tbool; renderer:TTCOD_renderer_t; 
           vsync:Tbool):TTCOD_Error;cdecl;external;
{*
 *  Shutdown libtcod.  This must be called before your program exits.
 *  \rst
 *  .. versionadded:: 1.8
 *  \endrst
  }
procedure TCOD_quit;cdecl;external;
{*
 *  Change the title string of the active window.
 *
 *  \param title A utf8 string.
  }
(* Const before type ignored *)
procedure TCOD_console_set_window_title(title:Pchar);cdecl;external;
{*
 *  Set the display to be full-screen or windowed.
 *
 *  \param fullscreen If true the display will go full-screen.
  }
procedure TCOD_console_set_fullscreen(fullscreen:Tbool);cdecl;external;
{*
 *  Return true if the display is full-screen.
  }
function TCOD_console_is_fullscreen:Tbool;cdecl;external;
{*
 *  Return true if the window has mouse focus.
  }
function TCOD_console_has_mouse_focus:Tbool;cdecl;external;
{*
 *  Return true if the window has keyboard focus.
 *
 *  \verbatim embed:rst:leading-asterisk
 *  .. versionchanged: 1.7
 *      This function was previously broken.  It now keeps track of keyboard
 *      focus.
 *  \endverbatim
  }
function TCOD_console_is_active:Tbool;cdecl;external;
{*
 *  Return true if the window is closing.
  }
function TCOD_console_is_window_closed:Tbool;cdecl;external;
{*
 *  Return an SDL_Window pointer if one is in use, returns NULL otherwise.
 *  \rst
 *  .. versionadded:: 1.11
 *  \endrst
  }
function TCOD_sys_get_sdl_window:PSDL_Window;cdecl;external;
{*
 *  Return an SDL_Renderer pointer if one is in use, returns NULL otherwise.
 *  \rst
 *  .. versionadded:: 1.11
 *  \endrst
  }
function TCOD_sys_get_sdl_renderer:PSDL_Renderer;cdecl;external;
{*
 *  Render a console over the display.
 *  \rst
 *  `console` can be any size, the active render will try to scale it to fit
 *  the screen.
 *
 *  The function will only work for the SDL2/OPENGL2 renderers.
 *
 *  Unlike :any:`TCOD_console_flush` this will not present the display.
 *  You will need to do that manually, likely with the SDL API.
 *
 *  Returns 0 on success, or a negative number on a failure such as the
 *  incorrect renderer being active.
 *
 *  .. versionadded:: 1.11
 *
 *  .. seealso::
 *      :any:`TCOD_sys_get_sdl_window` :any:`TCOD_sys_get_sdl_renderer`
 *  \endrst
  }
(* Const before type ignored *)
function TCOD_sys_accumulate_console(console:PTCOD_Console):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function TCOD_sys_accumulate_console_(console:PTCOD_Console; viewport:PSDL_Rect):longint;cdecl;external;
{ __cplusplus }
{$endif}
{ LIBTCOD_CONSOLE_INIT_H_ }

implementation


end.
