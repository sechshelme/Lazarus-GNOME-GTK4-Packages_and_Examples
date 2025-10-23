{$IFDEF read_interface}


function gsl_sf_synchrotron_1_e(x: Tdouble; result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_synchrotron_1(x: Tdouble): Tdouble; cdecl; external libgsl;
function gsl_sf_synchrotron_2_e(x: Tdouble; result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_synchrotron_2(x: Tdouble): Tdouble; cdecl; external libgsl;

// === Konventiert am: 22-8-25 13:59:15 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
