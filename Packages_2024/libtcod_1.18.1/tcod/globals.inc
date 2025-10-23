{$IFDEF read_interface}


function TCOD_get_default_tileset: PTCOD_Tileset; cdecl; external libtcod;
procedure TCOD_set_default_tileset(tileset: PTCOD_Tileset); cdecl; external libtcod;

// === Konventiert am: 10-9-25 13:49:18 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
