{$IFDEF read_interface}



function gsl_sf_laguerre_1_e(a: double; x: double; result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_laguerre_2_e(a: double; x: double; result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_laguerre_3_e(a: double; x: double; result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_laguerre_1(a: double; x: double): double; cdecl; external libgsl;
function gsl_sf_laguerre_2(a: double; x: double): double; cdecl; external libgsl;
function gsl_sf_laguerre_3(a: double; x: double): double; cdecl; external libgsl;
function gsl_sf_laguerre_n_e(n: longint; a: double; x: double; result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_laguerre_n(n: longint; a: double; x: double): double; cdecl; external libgsl;

// === Konventiert am: 22-8-25 13:58:34 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
