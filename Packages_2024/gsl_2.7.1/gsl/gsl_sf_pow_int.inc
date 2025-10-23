{$IFDEF read_interface}



function gsl_sf_pow_int_e(x: Tdouble; n: longint; result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_pow_int(x: Tdouble; n: longint): Tdouble; cdecl; external libgsl;

// === Konventiert am: 22-8-25 13:58:46 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
