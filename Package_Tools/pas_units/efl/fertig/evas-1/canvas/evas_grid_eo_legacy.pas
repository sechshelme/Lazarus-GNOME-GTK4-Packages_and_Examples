unit evas_grid_eo_legacy;

interface

uses
  ctypes, efl, fp_eina,fp_eo, Evas_Common;
  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

type
  PEvas_Grid = ^TEvas_Grid;
  TEvas_Grid = TEo;

procedure evas_object_grid_size_set(obj: PEvas_Grid; w: longint; h: longint); cdecl; external libevas;
procedure evas_object_grid_size_get(obj: PEvas_Grid; w: Plongint; h: Plongint); cdecl; external libevas;
function evas_object_grid_children_get(obj: PEvas_Grid): PEina_List; cdecl; external libevas;
function evas_object_grid_accessor_new(obj: PEvas_Grid): PEina_Accessor; cdecl; external libevas;
procedure evas_object_grid_clear(obj: PEvas_Grid; clear: TEina_Bool); cdecl; external libevas;
function evas_object_grid_iterator_new(obj: PEvas_Grid): PEina_Iterator; cdecl; external libevas;
function evas_object_grid_add_to(obj: PEvas_Grid): PEfl_Canvas_Object; cdecl; external libevas;
function evas_object_grid_unpack(obj: PEvas_Grid; child: PEfl_Canvas_Object): TEina_Bool; cdecl; external libevas;
function evas_object_grid_pack_get(obj: PEvas_Grid; child: PEfl_Canvas_Object; x: Plongint; y: Plongint; w: Plongint; h: Plongint): TEina_Bool; cdecl; external libevas;
function evas_object_grid_pack(obj: PEvas_Grid; child: PEfl_Canvas_Object; x: longint; y: longint; w: longint; h: longint): TEina_Bool; cdecl; external libevas;

// === Konventiert am: 13-5-25 17:21:01 ===


implementation



end.
