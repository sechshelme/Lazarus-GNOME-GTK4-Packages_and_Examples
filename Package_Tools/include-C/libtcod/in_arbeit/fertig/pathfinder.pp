
unit pathfinder;
interface

{
  Automatically converted by H2Pas 1.0.0 from pathfinder.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    pathfinder.h
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
Psize_t  = ^size_t;
PTCOD_ArrayData  = ^TCOD_ArrayData;
PTCOD_BasicGraph2D  = ^TCOD_BasicGraph2D;
PTCOD_Pathfinder  = ^TCOD_Pathfinder;
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
{$ifndef TCOD_PATHFINDER_H}
{$define TCOD_PATHFINDER_H}
{$include <stdbool.h>}
{$include <stddef.h>}
{$include <stdint.h>}
{$include "heapq.h"}
{$include "portability.h"}

const
  TCOD_PATHFINDER_MAX_DIMENSIONS = 4;  
type
  PTCOD_ArrayData = ^TTCOD_ArrayData;
  TTCOD_ArrayData = record
      ndim : Tint8_t;
      int_type : longint;
      shape : array[0..(TCOD_PATHFINDER_MAX_DIMENSIONS+1)-1] of Tsize_t;
      strides : array[0..(TCOD_PATHFINDER_MAX_DIMENSIONS+1)-1] of Tsize_t;
      data : Pbyte;
    end;

  PTCOD_BasicGraph2D = ^TTCOD_BasicGraph2D;
  TTCOD_BasicGraph2D = record
      cost : TTCOD_ArrayData;
      cardinal : longint;
      diagonal : longint;
    end;

  PTCOD_Pathfinder = ^TTCOD_Pathfinder;
  TTCOD_Pathfinder = record
      ndim : Tint8_t;
      shape : array[0..(TCOD_PATHFINDER_MAX_DIMENSIONS)-1] of Tsize_t;
      owns_distance : Tbool;
      owns_graph : Tbool;
      owns_traversal : Tbool;
      distance : TTCOD_ArrayData;
      graph : TTCOD_BasicGraph2D;
      traversal : TTCOD_ArrayData;
      heap : TTCOD_Heap;
    end;

(* Const before type ignored *)

function TCOD_pf_new(ndim:longint; shape:Psize_t):PTCOD_Pathfinder;cdecl;external;
procedure TCOD_pf_delete(path:PTCOD_Pathfinder);cdecl;external;
(* Const before type ignored *)
procedure TCOD_pf_set_distance_pointer(path:PTCOD_Pathfinder; data:pointer; int_type:longint; strides:Psize_t);cdecl;external;
(* Const before type ignored *)
procedure TCOD_pf_set_graph2d_pointer(path:PTCOD_Pathfinder; data:pointer; int_type:longint; strides:Psize_t; cardinal:longint; 
            diagonal:longint);cdecl;external;
(* Const before type ignored *)
procedure TCOD_pf_set_traversal_pointer(path:PTCOD_Pathfinder; data:pointer; int_type:longint; strides:Psize_t);cdecl;external;
function TCOD_pf_recompile(path:PTCOD_Pathfinder):longint;cdecl;external;
function TCOD_pf_compute(path:PTCOD_Pathfinder):longint;cdecl;external;
function TCOD_pf_compute_step(path:PTCOD_Pathfinder):longint;cdecl;external;
{$endif}
{ TCOD_PATHFINDER_H }

implementation


end.
