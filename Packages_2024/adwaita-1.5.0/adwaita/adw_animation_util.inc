{$IFDEF read_interface}


function adw_lerp(a: double; b: double; t: double): double; cdecl; external libadwaita;
function adw_get_enable_animations(widget: PGtkWidget): Tgboolean; cdecl; external libadwaita;

// === Konventiert am: 10-1-25 15:07:00 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
