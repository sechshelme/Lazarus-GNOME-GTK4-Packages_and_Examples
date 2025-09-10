
unit mouse_types;
interface

{
  Automatically converted by H2Pas 1.0.0 from mouse_types.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    mouse_types.h
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
{$ifndef _TCOD_MOUSE_TYPES_H}
{$define _TCOD_MOUSE_TYPES_H}
{$include "portability.h"}
{ mouse data  }
{ absolute position  }
{ movement since last update in pixels  }
{ cell coordinates in the root console  }
{ movement since last update in console cells  }
{ left button status  }
{ right button status  }
{ middle button status  }
{ left button pressed event  }
{ right button pressed event  }
{ middle button pressed event  }
{ wheel up event  }
{ wheel down event  }
type
  PTCOD_mouse_t = ^TTCOD_mouse_t;
  TTCOD_mouse_t = record
      x : longint;
      y : longint;
      dx : longint;
      dy : longint;
      cx : longint;
      cy : longint;
      dcx : longint;
      dcy : longint;
      lbutton : Tbool;
      rbutton : Tbool;
      mbutton : Tbool;
      lbutton_pressed : Tbool;
      rbutton_pressed : Tbool;
      mbutton_pressed : Tbool;
      wheel_up : Tbool;
      wheel_down : Tbool;
    end;
{$endif}
{ _TCOD_MOUSE_TYPES_H  }

implementation


end.
