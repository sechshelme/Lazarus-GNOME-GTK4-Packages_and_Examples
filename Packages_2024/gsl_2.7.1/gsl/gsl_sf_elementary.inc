{$IFDEF read_interface}


function gsl_sf_multiply_e(x: double; y: double; result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_multiply(x: double; y: double): double; cdecl; external libgsl;
function gsl_sf_multiply_err_e(x: double; dx: double; y: double; dy: double; result: Pgsl_sf_result): longint; cdecl; external libgsl;

// === Konventiert am: 22-8-25 14:04:24 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
