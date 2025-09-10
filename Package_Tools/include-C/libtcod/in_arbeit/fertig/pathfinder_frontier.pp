
unit pathfinder_frontier;
interface

{
  Automatically converted by H2Pas 1.0.0 from pathfinder_frontier.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    pathfinder_frontier.h
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
PTCOD_Frontier  = ^TCOD_Frontier;
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
{$ifndef TCOD_PATHFINDER_FRONTIER_H}
{$define TCOD_PATHFINDER_FRONTIER_H}
{$include <stdint.h>}
{$include "config.h"}
{$include "error.h"}
{$include "heapq.h"}

const
  TCOD_PATHFINDER_MAX_DIMENSIONS = 4;  
type
  PTCOD_Frontier = ^TTCOD_Frontier;
  TTCOD_Frontier = record
      ndim : Tint8_t;
      active_dist : longint;
      active_index : array[0..(TCOD_PATHFINDER_MAX_DIMENSIONS)-1] of longint;
      heap : TTCOD_Heap;
    end;

{ C++ extern C conditionnal removed }
{ __cplusplus }
{*
    Create a new pathfinder frontier.

    `ndim` is the number of dimensions.  Must be in the range `1 <= n <= 4`.
  }

function TCOD_frontier_new(ndim:longint):PTCOD_Frontier;cdecl;external;
{*
    Delete a pathfinder frontier.
  }
procedure TCOD_frontier_delete(frontier:PTCOD_Frontier);cdecl;external;
{*
    Pop the next node from this frontier.

    The popped node variables will placed in the `active_dist` and
    `active_index` attributes.
  }
function TCOD_frontier_pop(frontier:PTCOD_Frontier):TTCOD_Error;cdecl;external;
{*
    Add a node to this frontier.

    `index[frontier->ndim]` is the position of the node to add to the frontier.

    `dist` is the total distance of the node.  This should be a low number
    like 0, but can also be a negative number such as `INT_MIN`.
    When adding a node as an edge then `dist` is `frontier->active_dist` plus
    the cost of the edge.

    `heuristic` is the true priority of the node, used to affect node order.
    For Dijkstra-like algorithms this should be the same as `dist`.
    For A* this should be `dist` plus the maximum possible distance to the
    goal.
  }
(* Const before type ignored *)
function TCOD_frontier_push(frontier:PTCOD_Frontier; index:Plongint; dist:longint; heuristic:longint):TTCOD_Error;cdecl;external;
{*
    Return the current number of nodes in this frontier.
  }
(* Const before type ignored *)
function TCOD_frontier_size(frontier:PTCOD_Frontier):longint;cdecl;external;
{*
    Remove all nodes from this frontier.
  }
function TCOD_frontier_clear(frontier:PTCOD_Frontier):TTCOD_Error;cdecl;external;
{ __cplusplus }
{$endif}
{ TCOD_PATHFINDER_FRONTIER_H }

implementation


end.
