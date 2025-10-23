{$IFDEF read_interface}


function TCOD_load_truetype_font_(path: pchar; tile_width: longint; tile_height: longint): PTCOD_Tileset; cdecl; external libtcod;
function TCOD_tileset_load_truetype_(path: pchar; tile_width: longint; tile_height: longint): TTCOD_Error; cdecl; external libtcod;

// === Konventiert am: 10-9-25 16:24:52 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
