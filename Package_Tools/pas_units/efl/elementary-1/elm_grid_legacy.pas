unit elm_grid_legacy;

interface

uses
  efl, fp_eo, fp_eina, fp_efl, fp_evas, fp_ecore, fp_edje, fp_elementary;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


function elm_grid_add(parent: PEvas_Object): PEvas_Object; cdecl; external libelementary;
procedure elm_grid_pack_set(subobj: PEvas_Object; x: TEvas_Coord; y: TEvas_Coord; w: TEvas_Coord; h: TEvas_Coord); cdecl; external libelementary;
procedure elm_grid_pack_get(subobj: PEvas_Object; x: PEvas_Coord; y: PEvas_Coord; w: PEvas_Coord; h: PEvas_Coord); cdecl; external libelementary;

// === Konventiert am: 1-6-25 13:32:05 ===


implementation



end.
