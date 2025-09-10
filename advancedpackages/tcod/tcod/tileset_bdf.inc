{$IFDEF read_interface}


function TCOD_load_bdf(path: pchar): PTCOD_Tileset; cdecl; external libtcod;
function TCOD_load_bdf_memory(size: longint; buffer: pbyte): PTCOD_Tileset; cdecl; external libtcod;

// === Konventiert am: 10-9-25 16:24:44 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
