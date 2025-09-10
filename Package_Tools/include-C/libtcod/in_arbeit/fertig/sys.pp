
unit sys;
interface

{
  Automatically converted by H2Pas 1.0.0 from sys.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    sys.h
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
Pbyte  = ^byte;
Pchar  = ^char;
Plongint  = ^longint;
PSDL_Renderer  = ^SDL_Renderer;
PSDL_Surface  = ^SDL_Surface;
PSDL_Window  = ^SDL_Window;
Psize_t  = ^size_t;
PTCOD_cond_t  = ^TCOD_cond_t;
PTCOD_event_t  = ^TCOD_event_t;
PTCOD_key_t  = ^TCOD_key_t;
PTCOD_library_t  = ^TCOD_library_t;
PTCOD_mouse_t  = ^TCOD_mouse_t;
PTCOD_mutex_t  = ^TCOD_mutex_t;
PTCOD_semaphore_t  = ^TCOD_semaphore_t;
PTCOD_thread_t  = ^TCOD_thread_t;
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
{$ifndef _TCOD_SYS_H}
{$define _TCOD_SYS_H}
{$include "image.h"}
{$include "list.h"}
{$include "mouse_types.h"}
{$include "portability.h"}
{ #ifdef TCOD_TOUCH_INPUT  }
{ #endif  }
type
  PTCOD_event_t = ^TTCOD_event_t;
  TTCOD_event_t =  Longint;
  Const
    TCOD_EVENT_NONE = 0;
    TCOD_EVENT_KEY_PRESS = 1;
    TCOD_EVENT_KEY_RELEASE = 2;
    TCOD_EVENT_KEY = TCOD_EVENT_KEY_PRESS or TCOD_EVENT_KEY_RELEASE;
    TCOD_EVENT_MOUSE_MOVE = 4;
    TCOD_EVENT_MOUSE_PRESS = 8;
    TCOD_EVENT_MOUSE_RELEASE = 16;
    TCOD_EVENT_MOUSE = (TCOD_EVENT_MOUSE_MOVE or TCOD_EVENT_MOUSE_PRESS) or TCOD_EVENT_MOUSE_RELEASE;
    TCOD_EVENT_FINGER_MOVE = 32;
    TCOD_EVENT_FINGER_PRESS = 64;
    TCOD_EVENT_FINGER_RELEASE = 128;
    TCOD_EVENT_FINGER = (TCOD_EVENT_FINGER_MOVE or TCOD_EVENT_FINGER_PRESS) or TCOD_EVENT_FINGER_RELEASE;
    TCOD_EVENT_ANY = (TCOD_EVENT_KEY or TCOD_EVENT_MOUSE) or TCOD_EVENT_FINGER;
;
type
  PSDL_Surface = ^TSDL_Surface;
  TSDL_Surface = record
      {undefined structure}
    end;


  TSDL_renderer_t = procedure (sdl_renderer:PSDL_Surface);cdecl;
{ thread stuff  }

  PTCOD_thread_t = ^TTCOD_thread_t;
  TTCOD_thread_t = pointer;

  PTCOD_semaphore_t = ^TTCOD_semaphore_t;
  TTCOD_semaphore_t = pointer;

  PTCOD_mutex_t = ^TTCOD_mutex_t;
  TTCOD_mutex_t = pointer;

  PTCOD_cond_t = ^TTCOD_cond_t;
  TTCOD_cond_t = pointer;
{ C++ extern C conditionnal removed }

procedure TCOD_sys_startup;cdecl;external;
procedure TCOD_sys_shutdown;cdecl;external;
{ xxxxxxx dep }
{ filesystem stuff  }
(* Const before type ignored *)
function TCOD_sys_create_directory(path:Pchar):Tbool;cdecl;external;
(* Const before type ignored *)
function TCOD_sys_delete_file(path:Pchar):Tbool;cdecl;external;
(* Const before type ignored *)
function TCOD_sys_delete_directory(path:Pchar):Tbool;cdecl;external;
(* Const before type ignored *)
function TCOD_sys_is_directory(path:Pchar):Tbool;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function TCOD_sys_get_directory_content(path:Pchar; pattern:Pchar):TTCOD_list_t;cdecl;external;
(* Const before type ignored *)
function TCOD_sys_file_exists(filename:Pchar; args:array of const):Tbool;cdecl;external;
function TCOD_sys_file_exists(filename:Pchar):Tbool;cdecl;external;
(* Const before type ignored *)
function TCOD_sys_read_file(filename:Pchar; buf:PPbyte; size:Psize_t):Tbool;cdecl;external;
(* Const before type ignored *)
function TCOD_sys_write_file(filename:Pchar; buf:Pbyte; size:Tuint32_t):Tbool;cdecl;external;
{ threads  }
function TCOD_thread_new(func:function (para1:pointer):longint; data:pointer):TTCOD_thread_t;cdecl;external;
procedure TCOD_thread_delete(th:TTCOD_thread_t);cdecl;external;
function TCOD_sys_get_num_cores:longint;cdecl;external;
procedure TCOD_thread_wait(th:TTCOD_thread_t);cdecl;external;
{ mutex  }
function TCOD_mutex_new:TTCOD_mutex_t;cdecl;external;
procedure TCOD_mutex_in(mut:TTCOD_mutex_t);cdecl;external;
procedure TCOD_mutex_out(mut:TTCOD_mutex_t);cdecl;external;
procedure TCOD_mutex_delete(mut:TTCOD_mutex_t);cdecl;external;
{ semaphore  }
function TCOD_semaphore_new(initVal:longint):TTCOD_semaphore_t;cdecl;external;
procedure TCOD_semaphore_lock(sem:TTCOD_semaphore_t);cdecl;external;
procedure TCOD_semaphore_unlock(sem:TTCOD_semaphore_t);cdecl;external;
procedure TCOD_semaphore_delete(sem:TTCOD_semaphore_t);cdecl;external;
{ condition  }
function TCOD_condition_new:TTCOD_cond_t;cdecl;external;
procedure TCOD_condition_signal(sem:TTCOD_cond_t);cdecl;external;
procedure TCOD_condition_broadcast(sem:TTCOD_cond_t);cdecl;external;
procedure TCOD_condition_wait(sem:TTCOD_cond_t; mut:TTCOD_mutex_t);cdecl;external;
procedure TCOD_condition_delete(sem:TTCOD_cond_t);cdecl;external;
{ dynamic library  }
type
  PTCOD_library_t = ^TTCOD_library_t;
  TTCOD_library_t = pointer;
(* Const before type ignored *)

function TCOD_load_library(path:Pchar):TTCOD_library_t;cdecl;external;
(* Const before type ignored *)
function TCOD_get_function_address(library:TTCOD_library_t; function_name:Pchar):pointer;cdecl;external;
procedure TCOD_close_library(para1:TTCOD_library_t);cdecl;external;
{ xxxxxxxxxxxxxxxxxxxxxxx end dep }
{$ifndef NO_SDL}

function TCOD_sys_elapsed_milli:Tuint32_t;cdecl;external;
function TCOD_sys_elapsed_seconds:single;cdecl;external;
procedure TCOD_sys_sleep_milli(val:Tuint32_t);cdecl;external;
procedure TCOD_sys_set_fps(val:longint);cdecl;external;
function TCOD_sys_get_fps:longint;cdecl;external;
function TCOD_sys_get_last_frame_length:single;cdecl;external;
(* Const before type ignored *)
procedure TCOD_sys_save_screenshot(filename:Pchar);cdecl;external;
procedure TCOD_sys_force_fullscreen_resolution(width:longint; height:longint);cdecl;external;
function TCOD_sys_set_renderer(renderer:TTCOD_renderer_t):longint;cdecl;external;
function TCOD_sys_get_renderer:TTCOD_renderer_t;cdecl;external;
{*
    Return the resolution of the current monitor.
  }
function TCOD_sys_get_current_resolution(w:Plongint; h:Plongint):TTCOD_Error;cdecl;external;
{ TCOD_DEPRECATED("Use SDL to determine the screen resolution instead.") }
procedure TCOD_sys_get_fullscreen_offsets(offset_x:Plongint; offset_y:Plongint);cdecl;external;
procedure TCOD_sys_get_char_size(w:Plongint; h:Plongint);cdecl;external;
{*
 *  Upload a tile to the active tileset.
 *
 *  `asciiCode` is the Unicode codepoint for this tile.
 *
 *  `font_x` and `font_y` are the tile-coordinates on the active tilemap.
 *
 *  `img` is the tile to upload.
 *
 *  `x` and `y` are the upper-left pixel-coordinates of the tile on the `img`.
  }
procedure TCOD_sys_update_char(asciiCode:longint; font_x:longint; font_y:longint; img:TTCOD_image_t; x:longint; 
            y:longint);cdecl;external;
function TCOD_sys_get_SDL_window:PSDL_Window;cdecl;external;
function TCOD_sys_get_SDL_renderer:PSDL_Renderer;cdecl;external;
function TCOD_sys_wait_for_event(eventMask:longint; key:PTCOD_key_t; mouse:PTCOD_mouse_t; flush:Tbool):TTCOD_event_t;cdecl;external;
{TCOD_DEPRECATED("This API is deprecated, use SDL_WaitEvent instead.") }
function TCOD_sys_check_for_event(eventMask:longint; key:PTCOD_key_t; mouse:PTCOD_mouse_t):TTCOD_event_t;cdecl;external;
{TCOD_DEPRECATED("This API is deprecated, use SDL_PollEvent instead.") }
{ clipboard  }
(* Const before type ignored *)
function TCOD_sys_clipboard_set(value:Pchar):Tbool;cdecl;external;
{TCOD_DEPRECATED("Use the SDL2 API to handle the clipboard.") }
function TCOD_sys_clipboard_get:Pchar;cdecl;external;
{TCOD_DEPRECATED("Use the SDL2 API to handle the clipboard.") }
{ SDL renderer callback  }
procedure TCOD_sys_register_SDL_renderer(renderer:TSDL_renderer_t);cdecl;external;
{ TCOD__DEPRECATED_NOMESSAGE }
{$endif}
{ NO_SDL }
{$endif}

implementation


end.
