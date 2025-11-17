{$IFDEF read_interface}


function gp_setting_set(id: pchar; key: pchar; value: pchar): longint; cdecl; external libgphoto2;
function gp_setting_get(id: pchar; key: pchar; value: pchar): longint; cdecl; external libgphoto2;

// === Konventiert am: 17-11-25 15:47:18 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
