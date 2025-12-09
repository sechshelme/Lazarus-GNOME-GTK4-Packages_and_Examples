{$IFDEF read_interface}


function gsl_sf_gegenpoly_1_e(lambda: double; x: double; result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_gegenpoly_2_e(lambda: double; x: double; result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_gegenpoly_3_e(lambda: double; x: double; result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_gegenpoly_1(lambda: double; x: double): double; cdecl; external libgsl;
function gsl_sf_gegenpoly_2(lambda: double; x: double): double; cdecl; external libgsl;
function gsl_sf_gegenpoly_3(lambda: double; x: double): double; cdecl; external libgsl;
function gsl_sf_gegenpoly_n_e(n: longint; lambda: double; x: double; result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_gegenpoly_n(n: longint; lambda: double; x: double): double; cdecl; external libgsl;
function gsl_sf_gegenpoly_array(nmax: longint; lambda: double; x: double; result_array: Pdouble): longint; cdecl; external libgsl;

// === Konventiert am: 22-8-25 13:58:26 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
