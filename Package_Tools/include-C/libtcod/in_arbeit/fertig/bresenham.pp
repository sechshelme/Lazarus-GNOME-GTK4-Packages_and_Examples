
unit bresenham;
interface

{
  Automatically converted by H2Pas 1.0.0 from bresenham.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    bresenham.h
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
PTCOD_bresenham_data_t  = ^TCOD_bresenham_data_t;
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
{$ifndef _TCOD_BRESENHAM_H}
{$define _TCOD_BRESENHAM_H}
{ __cplusplus }
{$include "portability.h"}
{ C++ extern C conditionnal removed }
{*
 *  \brief A callback to be passed to TCOD_line
 *
 *  The points given to the callback include both the starting and ending
 *  positions.
 *
 *  \param x
 *  \param y
 *  \return As long as this callback returns true it will be called with the
 *          next x,y point on the line.
  }
type

  TTCOD_line_listener_t = function (x:longint; y:longint):Tbool;cdecl;

procedure TCOD_line_init(xFrom:longint; yFrom:longint; xTo:longint; yTo:longint);cdecl;external;
{xxxxxxxxxxxx  TCOD_DEPRECATED("This function is not reentrant. Use TCOD_line_init_mt instead.")  }
{* advance one step. returns true if we reach destination  }
function TCOD_line_step(xCur:Plongint; yCur:Plongint):Tbool;cdecl;external;
{ xxxxxxxxxxxxxx  TCOD_DEPRECATED("This function is not reentrant.")  }
{ atomic callback function. Stops when the callback returns false  }
function TCOD_line(xFrom:longint; yFrom:longint; xTo:longint; yTo:longint; listener:TTCOD_line_listener_t):Tbool;cdecl;external;
{*
 *  \brief A struct used for computing a bresenham line.
  }
type
  PTCOD_bresenham_data_t = ^TTCOD_bresenham_data_t;
  TTCOD_bresenham_data_t = record
      stepx : longint;
      stepy : longint;
      e : longint;
      deltax : longint;
      deltay : longint;
      origx : longint;
      origy : longint;
      destx : longint;
      desty : longint;
    end;

procedure TCOD_line_init_mt(xFrom:longint; yFrom:longint; xTo:longint; yTo:longint; data:PTCOD_bresenham_data_t);cdecl;external;
function TCOD_line_step_mt(xCur:Plongint; yCur:Plongint; data:PTCOD_bresenham_data_t):Tbool;cdecl;external;
function TCOD_line_mt(xFrom:longint; yFrom:longint; xTo:longint; yTo:longint; listener:TTCOD_line_listener_t; 
           data:PTCOD_bresenham_data_t):Tbool;cdecl;external;
{ xxxxxxxxxx TCOD_DEPRECATED("Use TCOD_line instead.") }
{ __cplusplus }
{$endif}
{ _TCOD_BRESENHAM_H }

implementation


end.
