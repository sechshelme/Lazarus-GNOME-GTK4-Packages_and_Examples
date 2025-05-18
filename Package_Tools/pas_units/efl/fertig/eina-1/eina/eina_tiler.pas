unit eina_tiler;

interface

uses
  ctypes, efl, eina_types, eina_iterator, eina_rectangle;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  TEina_Tile_Grid_Info = record
    col: dword;
    row: dword;
    rect: TEina_Rectangle;
    full: TEina_Bool;
  end;
  PEina_Tile_Grid_Info = ^TEina_Tile_Grid_Info;

  TEina_Tiler = record
  end;
  PEina_Tiler = ^TEina_Tiler;

function eina_tiler_new(w: longint; h: longint): PEina_Tiler; cdecl; external libeina;
procedure eina_tiler_free(t: PEina_Tiler); cdecl; external libeina;
procedure eina_tiler_tile_size_set(t: PEina_Tiler; w: longint; h: longint); cdecl; external libeina;
procedure eina_tiler_area_size_set(t: PEina_Tiler; w: longint; h: longint); cdecl; external libeina;
procedure eina_tiler_area_size_get(t: PEina_Tiler; w: Plongint; h: Plongint); cdecl; external libeina;
procedure eina_tiler_strict_set(t: PEina_Tiler; strict: TEina_Bool); cdecl; external libeina;
function eina_tiler_empty(t: PEina_Tiler): TEina_Bool; cdecl; external libeina;
function eina_tiler_rect_add(t: PEina_Tiler; r: PEina_Rectangle): TEina_Bool; cdecl; external libeina;
procedure eina_tiler_rect_del(t: PEina_Tiler; r: PEina_Rectangle); cdecl; external libeina;
procedure eina_tiler_clear(t: PEina_Tiler); cdecl; external libeina;
function eina_tiler_iterator_new(t: PEina_Tiler): PEina_Iterator; cdecl; external libeina;
function eina_tile_grid_slicer_iterator_new(x: longint; y: longint; w: longint; h: longint; tile_w: longint; tile_h: longint): PEina_Iterator; cdecl; external libeina;
function eina_tiler_union(dst: PEina_Tiler; src: PEina_Tiler): TEina_Bool; cdecl; external libeina;
function eina_tiler_subtract(dst: PEina_Tiler; src: PEina_Tiler): TEina_Bool; cdecl; external libeina;
function eina_tiler_intersection(t1: PEina_Tiler; t2: PEina_Tiler): PEina_Tiler; cdecl; external libeina;
function eina_tiler_equal(t1: PEina_Tiler; t2: PEina_Tiler): TEina_Bool; cdecl; external libeina;

// === Konventiert am: 16-5-25 19:39:42 ===


implementation



end.
