{$IFDEF read_interface}


function gsl_sf_psi_int_e(n: longint; result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_psi_int(n: longint): double; cdecl; external libgsl;
function gsl_sf_psi_e(x: double; result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_psi(x: double): double; cdecl; external libgsl;
function gsl_sf_psi_1piy_e(y: double; result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_psi_1piy(y: double): double; cdecl; external libgsl;
function gsl_sf_complex_psi_e(x: double; y: double; result_re: Pgsl_sf_result; result_im: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_psi_1_int_e(n: longint; result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_psi_1_int(n: longint): double; cdecl; external libgsl;
function gsl_sf_psi_1_e(x: double; result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_psi_1(x: double): double; cdecl; external libgsl;
function gsl_sf_psi_n_e(n: longint; x: double; result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_psi_n(n: longint; x: double): double; cdecl; external libgsl;

// === Konventiert am: 22-8-25 13:58:49 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
