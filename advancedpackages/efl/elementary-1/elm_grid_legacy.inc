{$IFDEF read_interface}


function elm_grid_add(parent: PEvas_Object): PEvas_Object; cdecl; external libelementary;
procedure elm_grid_pack_set(subobj: PEvas_Object; x: TEvas_Coord; y: TEvas_Coord; w: TEvas_Coord; h: TEvas_Coord); cdecl; external libelementary;
procedure elm_grid_pack_get(subobj: PEvas_Object; x: PEvas_Coord; y: PEvas_Coord; w: PEvas_Coord; h: PEvas_Coord); cdecl; external libelementary;

// === Konventiert am: 1-6-25 13:32:05 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
