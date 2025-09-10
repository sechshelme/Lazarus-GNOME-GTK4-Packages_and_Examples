unit path;

interface

uses
  fp_tcod, fov_types, list;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  TTCOD_path_func_t = function(xFrom: longint; yFrom: longint; xTo: longint; yTo: longint; user_data: pointer): single; cdecl;
  PTCOD_Path = type Pointer;

  PTCOD_path_t = ^TTCOD_path_t;
  TTCOD_path_t = PTCOD_Path;

function TCOD_path_new_using_map(map: TTCOD_map_t; diagonalCost: single): TTCOD_path_t; cdecl; external libtcod;
function TCOD_path_new_using_function(map_width: longint; map_height: longint; func: TTCOD_path_func_t; user_data: pointer; diagonalCost: single): TTCOD_path_t; cdecl; external libtcod;
function TCOD_path_compute(path: TTCOD_path_t; ox: longint; oy: longint; dx: longint; dy: longint): Tbool; cdecl; external libtcod;
function TCOD_path_walk(path: TTCOD_path_t; x: Plongint; y: Plongint; recalculate_when_needed: Tbool): Tbool; cdecl; external libtcod;
function TCOD_path_is_empty(path: TTCOD_path_t): Tbool; cdecl; external libtcod;
function TCOD_path_size(path: TTCOD_path_t): longint; cdecl; external libtcod;
procedure TCOD_path_reverse(path: TTCOD_path_t); cdecl; external libtcod;
procedure TCOD_path_get(path: TTCOD_path_t; index: longint; x: Plongint; y: Plongint); cdecl; external libtcod;
procedure TCOD_path_get_origin(path: TTCOD_path_t; x: Plongint; y: Plongint); cdecl; external libtcod;
procedure TCOD_path_get_destination(path: TTCOD_path_t; x: Plongint; y: Plongint); cdecl; external libtcod;
procedure TCOD_path_delete(path: TTCOD_path_t); cdecl; external libtcod;

type
  TTCOD_Dijkstra = record
    diagonal_cost: longint;
    width: longint;
    height: longint;
    nodes_max: longint;
    map: TTCOD_map_t;
    func: TTCOD_path_func_t;
    user_data: pointer;
    distances: Pdword;
    nodes: Pdword;
    path: TTCOD_list_t;
  end;
  PTCOD_Dijkstra = ^TTCOD_Dijkstra;

  PTCOD_dijkstra_t = ^TTCOD_dijkstra_t;
  TTCOD_dijkstra_t = PTCOD_Dijkstra;

function TCOD_dijkstra_new(map: TTCOD_map_t; diagonalCost: single): TTCOD_dijkstra_t; cdecl; external libtcod;
function TCOD_dijkstra_new_using_function(map_width: longint; map_height: longint; func: TTCOD_path_func_t; user_data: pointer; diagonalCost: single): TTCOD_dijkstra_t; cdecl; external libtcod;
procedure TCOD_dijkstra_compute(dijkstra: TTCOD_dijkstra_t; root_x: longint; root_y: longint); cdecl; external libtcod;
function TCOD_dijkstra_get_distance(dijkstra: TTCOD_dijkstra_t; x: longint; y: longint): single; cdecl; external libtcod;
function TCOD_dijkstra_path_set(dijkstra: TTCOD_dijkstra_t; x: longint; y: longint): Tbool; cdecl; external libtcod;
function TCOD_dijkstra_is_empty(path: TTCOD_dijkstra_t): Tbool; cdecl; external libtcod;
function TCOD_dijkstra_size(path: TTCOD_dijkstra_t): longint; cdecl; external libtcod;
procedure TCOD_dijkstra_reverse(path: TTCOD_dijkstra_t); cdecl; external libtcod;
procedure TCOD_dijkstra_get(path: TTCOD_dijkstra_t; index: longint; x: Plongint; y: Plongint); cdecl; external libtcod;
function TCOD_dijkstra_path_walk(dijkstra: TTCOD_dijkstra_t; x: Plongint; y: Plongint): Tbool; cdecl; external libtcod;
procedure TCOD_dijkstra_delete(dijkstra: TTCOD_dijkstra_t); cdecl; external libtcod;

// === Konventiert am: 10-9-25 15:54:00 ===


implementation



end.
