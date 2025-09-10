
unit path;
interface

{
  Automatically converted by H2Pas 1.0.0 from path.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    path.h
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
Pdword  = ^dword;
Plongint  = ^longint;
PTCOD_Dijkstra  = ^TCOD_Dijkstra;
PTCOD_dijkstra_t  = ^TCOD_dijkstra_t;
PTCOD_Path  = ^TCOD_Path;
PTCOD_path_t  = ^TCOD_path_t;
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
{$ifndef _TCOD_PATH_H}
{$define _TCOD_PATH_H}
{$include "fov_types.h"}
{$include "list.h"}
{$include "portability.h"}
{ C++ extern C conditionnal removed }
type

  TTCOD_path_func_t = function (xFrom:longint; yFrom:longint; xTo:longint; yTo:longint; user_data:pointer):single;cdecl;
  PTCOD_Path = ^TTCOD_Path;
  TTCOD_Path = record
      {undefined structure}
    end;


  PTCOD_path_t = ^TTCOD_path_t;
  TTCOD_path_t = PTCOD_Path;

function TCOD_path_new_using_map(map:TTCOD_map_t; diagonalCost:single):TTCOD_path_t;cdecl;external;
function TCOD_path_new_using_function(map_width:longint; map_height:longint; func:TTCOD_path_func_t; user_data:pointer; diagonalCost:single):TTCOD_path_t;cdecl;external;
function TCOD_path_compute(path:TTCOD_path_t; ox:longint; oy:longint; dx:longint; dy:longint):Tbool;cdecl;external;
function TCOD_path_walk(path:TTCOD_path_t; x:Plongint; y:Plongint; recalculate_when_needed:Tbool):Tbool;cdecl;external;
function TCOD_path_is_empty(path:TTCOD_path_t):Tbool;cdecl;external;
function TCOD_path_size(path:TTCOD_path_t):longint;cdecl;external;
procedure TCOD_path_reverse(path:TTCOD_path_t);cdecl;external;
procedure TCOD_path_get(path:TTCOD_path_t; index:longint; x:Plongint; y:Plongint);cdecl;external;
procedure TCOD_path_get_origin(path:TTCOD_path_t; x:Plongint; y:Plongint);cdecl;external;
procedure TCOD_path_get_destination(path:TTCOD_path_t; x:Plongint; y:Plongint);cdecl;external;
procedure TCOD_path_delete(path:TTCOD_path_t);cdecl;external;
{ Dijkstra stuff - by Mingos }
{*
 *  Dijkstra data structure
 *
 *  All attributes are considered private.
  }
{ a TCODMap with walkability data  }
{ distances grid  }
{ the processed nodes  }
type
  PTCOD_Dijkstra = ^TTCOD_Dijkstra;
  TTCOD_Dijkstra = record
      diagonal_cost : longint;
      width : longint;
      height : longint;
      nodes_max : longint;
      map : TTCOD_map_t;
      func : TTCOD_path_func_t;
      user_data : pointer;
      distances : Pdword;
      nodes : Pdword;
      path : TTCOD_list_t;
    end;

  PTCOD_dijkstra_t = ^TTCOD_dijkstra_t;
  TTCOD_dijkstra_t = PTCOD_Dijkstra;

function TCOD_dijkstra_new(map:TTCOD_map_t; diagonalCost:single):TTCOD_dijkstra_t;cdecl;external;
function TCOD_dijkstra_new_using_function(map_width:longint; map_height:longint; func:TTCOD_path_func_t; user_data:pointer; diagonalCost:single):TTCOD_dijkstra_t;cdecl;external;
procedure TCOD_dijkstra_compute(dijkstra:TTCOD_dijkstra_t; root_x:longint; root_y:longint);cdecl;external;
function TCOD_dijkstra_get_distance(dijkstra:TTCOD_dijkstra_t; x:longint; y:longint):single;cdecl;external;
function TCOD_dijkstra_path_set(dijkstra:TTCOD_dijkstra_t; x:longint; y:longint):Tbool;cdecl;external;
function TCOD_dijkstra_is_empty(path:TTCOD_dijkstra_t):Tbool;cdecl;external;
function TCOD_dijkstra_size(path:TTCOD_dijkstra_t):longint;cdecl;external;
procedure TCOD_dijkstra_reverse(path:TTCOD_dijkstra_t);cdecl;external;
procedure TCOD_dijkstra_get(path:TTCOD_dijkstra_t; index:longint; x:Plongint; y:Plongint);cdecl;external;
function TCOD_dijkstra_path_walk(dijkstra:TTCOD_dijkstra_t; x:Plongint; y:Plongint):Tbool;cdecl;external;
procedure TCOD_dijkstra_delete(dijkstra:TTCOD_dijkstra_t);cdecl;external;
{ C++ end of extern C conditionnal removed }
{$endif}

implementation


end.
