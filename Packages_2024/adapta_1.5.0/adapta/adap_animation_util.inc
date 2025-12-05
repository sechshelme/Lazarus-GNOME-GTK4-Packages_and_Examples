{$IFDEF read_interface}



function adap_lerp(a: double; b: double; t: double): double; cdecl; external libadapta;
function adap_get_enable_animations(widget: PGtkWidget): Tgboolean; cdecl; external libadapta;

// === Konventiert am: 4-12-25 17:00:48 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
