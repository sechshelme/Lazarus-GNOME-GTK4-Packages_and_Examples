unit elm_grid_eo_legacy;

interface

uses
  efl, fp_eo, fp_eina, fp_efl, fp_evas, fp_ecore, fp_edje, fp_elementary;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PElm_Grid = ^TElm_Grid;
  TElm_Grid = TEo;

procedure elm_grid_size_set(obj: PElm_Grid; w: longint; h: longint); cdecl; external libelementary;
procedure elm_grid_size_get(obj: PElm_Grid; w: Plongint; h: Plongint); cdecl; external libelementary;
function elm_grid_children_get(obj: PElm_Grid): PEina_List; cdecl; external libelementary;
procedure elm_grid_clear(obj: PElm_Grid; clear: TEina_Bool); cdecl; external libelementary;
procedure elm_grid_unpack(obj: PElm_Grid; subobj: PEfl_Canvas_Object); cdecl; external libelementary;
procedure elm_grid_pack(obj: PElm_Grid; subobj: PEfl_Canvas_Object; x: longint; y: longint; w: longint; h: longint); cdecl; external libelementary;

// === Konventiert am: 1-6-25 13:32:02 ===


implementation



end.
