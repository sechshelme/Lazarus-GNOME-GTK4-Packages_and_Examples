unit fov_types;

interface

uses
  fp_tcod;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  TTCOD_MapCell = record
    transparent: Tbool;
    walkable: Tbool;
    fov: Tbool;
  end;
  PTCOD_MapCell = ^TTCOD_MapCell;

  TTCOD_Map = record
    width: longint;
    height: longint;
    nbcells: longint;
    cells: PTCOD_MapCell;
  end;
  PTCOD_Map = ^TTCOD_Map;

  PTCOD_map_t = ^TTCOD_map_t;
  TTCOD_map_t = PTCOD_Map;

  PTCOD_fov_algorithm_t = ^TTCOD_fov_algorithm_t;
  TTCOD_fov_algorithm_t = longint;

const
  FOV_BASIC = 0;
  FOV_DIAMOND = 1;
  FOV_SHADOW = 2;
  FOV_PERMISSIVE_0 = 3;
  FOV_PERMISSIVE_1 = 4;
  FOV_PERMISSIVE_2 = 5;
  FOV_PERMISSIVE_3 = 6;
  FOV_PERMISSIVE_4 = 7;
  FOV_PERMISSIVE_5 = 8;
  FOV_PERMISSIVE_6 = 9;
  FOV_PERMISSIVE_7 = 10;
  FOV_PERMISSIVE_8 = 11;
  FOV_RESTRICTIVE = 12;
  FOV_SYMMETRIC_SHADOWCAST = 13;
  NB_FOV_ALGORITHMS = 14;

function FOV_PERMISSIVE(x: longint): TTCOD_fov_algorithm_t;


// === Konventiert am: 10-9-25 13:49:12 ===


implementation


function FOV_PERMISSIVE(x: longint): TTCOD_fov_algorithm_t;
begin
  FOV_PERMISSIVE := TTCOD_fov_algorithm_t(FOV_PERMISSIVE_0 + x);
end;


end.
