{$IFDEF read_interface}


function gsl_sf_lambert_W0_e(x: Tdouble; result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_lambert_W0(x: Tdouble): Tdouble; cdecl; external libgsl;
function gsl_sf_lambert_Wm1_e(x: Tdouble; result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_lambert_Wm1(x: Tdouble): Tdouble; cdecl; external libgsl;

// === Konventiert am: 22-8-25 13:58:36 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
