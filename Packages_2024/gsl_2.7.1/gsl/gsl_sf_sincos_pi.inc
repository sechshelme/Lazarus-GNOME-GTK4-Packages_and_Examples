{$IFDEF read_interface}


function gsl_sf_sin_pi_e(x: double; result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_sin_pi(x: double): double; cdecl; external libgsl;
function gsl_sf_cos_pi_e(x: double; result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_cos_pi(x: double): double; cdecl; external libgsl;

// === Konventiert am: 22-8-25 13:59:12 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
