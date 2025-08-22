{$IFDEF read_interface}


function gsl_sf_multiply_e(x: Tdouble; y: Tdouble; result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_multiply(x: Tdouble; y: Tdouble): Tdouble; cdecl; external libgsl;
function gsl_sf_multiply_err_e(x: Tdouble; dx: Tdouble; y: Tdouble; dy: Tdouble; result: Pgsl_sf_result): longint; cdecl; external libgsl;

// === Konventiert am: 22-8-25 14:04:24 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
