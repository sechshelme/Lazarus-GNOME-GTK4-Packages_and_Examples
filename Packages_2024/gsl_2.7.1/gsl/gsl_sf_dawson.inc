{$IFDEF read_interface}



function gsl_sf_dawson_e(x: Tdouble; result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_dawson(x: Tdouble): Tdouble; cdecl; external libgsl;

// === Konventiert am: 22-8-25 14:04:17 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
