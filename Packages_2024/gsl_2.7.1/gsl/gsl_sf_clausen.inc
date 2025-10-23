{$IFDEF read_interface}



function gsl_sf_clausen_e(x: Tdouble; result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_clausen(x: Tdouble): Tdouble; cdecl; external libgsl;

// === Konventiert am: 22-8-25 14:04:10 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
