
unit fov;
interface

{
  Automatically converted by H2Pas 1.0.0 from fov.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    fov.h
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
PTCOD_Map  = ^TCOD_Map;
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
{$ifndef _TCOD_FOV_H}
{$define _TCOD_FOV_H}
{$include <stdbool.h>}
{ __cplusplus }
{$include "config.h"}
{$include "error.h"}
{$include "fov_types.h"}
{ C++ extern C conditionnal removed }
{*
    Return a new TCOD_Map with `width` and `height`.
  }

function TCOD_map_new(width:longint; height:longint):PTCOD_Map;cdecl;external;
{*
    Set all cell values on `map` to the given parameters.

    This call also zeroes out the field-of-view attribute.
  }
procedure TCOD_map_clear(map:PTCOD_Map; transparent:Tbool; walkable:Tbool);cdecl;external;
{*
    Clone map data from `source` to `dest`.

    `dest` will be resized to match `source` if necessary.
  }
(* Const before type ignored *)
function TCOD_map_copy(source:PTCOD_Map; dest:PTCOD_Map):TTCOD_Error;cdecl;external;
{*
    Change the properties of a single cell.
  }
procedure TCOD_map_set_properties(map:PTCOD_Map; x:longint; y:longint; is_transparent:Tbool; is_walkable:Tbool);cdecl;external;
{*
    Free a TCOD_Map object.
  }
procedure TCOD_map_delete(map:PTCOD_Map);cdecl;external;
{*
    Calculate the field-of-view.

    \rst
    `pov_x` and `pov_y` are the used as the field-of-view source.
    These coordinates must be within the map.

    `max_radius` is the maximum distance for the field-of-view algorithm.

    If `light_walls` is false then only transparent cells will be touched by
    the field-of-view.

    `algo` is one of the :any:`TCOD_fov_algorithm_t` algorithms.

    After this call you may check if a cell is within the field-of-view by
    calling :any:`TCOD_map_is_in_fov`.

    Returns an error code on failure.  See :any:`TCOD_get_error` for details.
    \endrst
  }
function TCOD_map_compute_fov(map:PTCOD_Map; pov_x:longint; pov_y:longint; max_radius:longint; light_walls:Tbool; 
           algo:TTCOD_fov_algorithm_t):TTCOD_Error;cdecl;external;
{*
    Return true if this cell was touched by the current field-of-view.
  }
(* Const before type ignored *)
function TCOD_map_is_in_fov(map:PTCOD_Map; x:longint; y:longint):Tbool;cdecl;external;
{*
    Set the fov flag on a specific cell.
  }
procedure TCOD_map_set_in_fov(map:PTCOD_Map; x:longint; y:longint; fov:Tbool);cdecl;external;
{*
    Return true if this cell is transparent.
  }
(* Const before type ignored *)
function TCOD_map_is_transparent(map:PTCOD_Map; x:longint; y:longint):Tbool;cdecl;external;
{*
    Return true if this cell is walkable.
  }
function TCOD_map_is_walkable(map:PTCOD_Map; x:longint; y:longint):Tbool;cdecl;external;
{*
    Return the width of `map`.
  }
(* Const before type ignored *)
function TCOD_map_get_width(map:PTCOD_Map):longint;cdecl;external;
{*
    Return the height of `map`.
  }
(* Const before type ignored *)
function TCOD_map_get_height(map:PTCOD_Map):longint;cdecl;external;
{*
    Return the total number of cells in `map`.
  }
(* Const before type ignored *)
function TCOD_map_get_nb_cells(map:PTCOD_Map):longint;cdecl;external;
{ __cplusplus }
{$endif}
{ _TCOD_FOV_H }

implementation


end.
