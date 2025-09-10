
unit event;
interface

{
  Automatically converted by H2Pas 1.0.0 from event.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    event.h
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
PSDL_Event  = ^SDL_Event;
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
{$ifndef LIBTCOD_SDL2_EVENT_H_}
{$define LIBTCOD_SDL2_EVENT_H_}
{$include "../console_types.h"}
{$include "../mouse.h"}
{$include "../sys.h"}
type
  PSDL_Event = ^TSDL_Event;
  TSDL_Event = record
      {undefined structure}
    end;

{ __cplusplus }
{*
 *  Parse an SDL_Event into a key event and return the relevant TCOD_event_t.
 *
 *  Returns TCOD_EVENT_NONE if the event wasn't keyboard related.
 *  \rst
 *  .. versionadded:: 1.11
 *  \endrst
  }
(* Const before type ignored *)

function TCOD_sys_process_key_event(in:PSDL_Event; out:PTCOD_key_t):TTCOD_event_t;cdecl;external;
{*
 *  Parse an SDL_Event into a mouse event and return the relevant TCOD_event_t.
 *
 *  Returns TCOD_EVENT_NONE if the event wasn't mouse related.
 *  \rst
 *  .. versionadded:: 1.11
 *  \endrst
  }
(* Const before type ignored *)
function TCOD_sys_process_mouse_event(in:PSDL_Event; out:PTCOD_mouse_t):TTCOD_event_t;cdecl;external;
{$endif}
{ LIBTCOD_SDL2_EVENT_H_ }

implementation


end.
