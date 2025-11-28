{$IFDEF read_interface}



procedure librdf_world_set_raptor(world: Plibrdf_world; raptor_world_ptr: Praptor_world); cdecl; external librdf;
function librdf_world_get_raptor(world: Plibrdf_world): Praptor_world; cdecl; external librdf;

// === Konventiert am: 27-11-25 17:39:17 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
