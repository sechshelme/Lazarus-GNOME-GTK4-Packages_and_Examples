{$IFDEF read_interface}


function tag16h5_create: Papriltag_family_t; cdecl; external libapriltag;
procedure tag16h5_destroy(tf: Papriltag_family_t); cdecl; external libapriltag;

// === Konventiert am: 12-9-26 17:04:26 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
