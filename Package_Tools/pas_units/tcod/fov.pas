unit fov;

interface

uses
  fp_tcod, error, fov_types;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


function TCOD_map_new(width: longint; height: longint): PTCOD_Map; cdecl; external libtcod;
procedure TCOD_map_clear(map: PTCOD_Map; transparent: Tbool; walkable: Tbool); cdecl; external libtcod;
function TCOD_map_copy(source: PTCOD_Map; dest: PTCOD_Map): TTCOD_Error; cdecl; external libtcod;
procedure TCOD_map_set_properties(map: PTCOD_Map; x: longint; y: longint; is_transparent: Tbool; is_walkable: Tbool); cdecl; external libtcod;
procedure TCOD_map_delete(map: PTCOD_Map); cdecl; external libtcod;
function TCOD_map_compute_fov(map: PTCOD_Map; pov_x: longint; pov_y: longint; max_radius: longint; light_walls: Tbool;
  algo: TTCOD_fov_algorithm_t): TTCOD_Error; cdecl; external libtcod;
function TCOD_map_is_in_fov(map: PTCOD_Map; x: longint; y: longint): Tbool; cdecl; external libtcod;
procedure TCOD_map_set_in_fov(map: PTCOD_Map; x: longint; y: longint; fov: Tbool); cdecl; external libtcod;
function TCOD_map_is_transparent(map: PTCOD_Map; x: longint; y: longint): Tbool; cdecl; external libtcod;
function TCOD_map_is_walkable(map: PTCOD_Map; x: longint; y: longint): Tbool; cdecl; external libtcod;
function TCOD_map_get_width(map: PTCOD_Map): longint; cdecl; external libtcod;
function TCOD_map_get_height(map: PTCOD_Map): longint; cdecl; external libtcod;
function TCOD_map_get_nb_cells(map: PTCOD_Map): longint; cdecl; external libtcod;

// === Konventiert am: 10-9-25 13:49:10 ===


implementation



end.
