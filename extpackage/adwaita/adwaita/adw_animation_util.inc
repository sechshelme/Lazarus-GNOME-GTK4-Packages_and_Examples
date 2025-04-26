{$IFDEF read_interface}


function adw_lerp(a: Tdouble; b: Tdouble; t: Tdouble): Tdouble; cdecl; external libadwaita;
function adw_get_enable_animations(widget: PGtkWidget): Tgboolean; cdecl; external libadwaita;

// === Konventiert am: 10-1-25 15:07:00 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
