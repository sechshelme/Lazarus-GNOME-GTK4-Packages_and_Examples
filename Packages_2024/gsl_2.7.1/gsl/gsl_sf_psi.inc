{$IFDEF read_interface}


function gsl_sf_psi_int_e(n: longint; result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_psi_int(n: longint): Tdouble; cdecl; external libgsl;
function gsl_sf_psi_e(x: Tdouble; result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_psi(x: Tdouble): Tdouble; cdecl; external libgsl;
function gsl_sf_psi_1piy_e(y: Tdouble; result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_psi_1piy(y: Tdouble): Tdouble; cdecl; external libgsl;
function gsl_sf_complex_psi_e(x: Tdouble; y: Tdouble; result_re: Pgsl_sf_result; result_im: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_psi_1_int_e(n: longint; result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_psi_1_int(n: longint): Tdouble; cdecl; external libgsl;
function gsl_sf_psi_1_e(x: Tdouble; result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_psi_1(x: Tdouble): Tdouble; cdecl; external libgsl;
function gsl_sf_psi_n_e(n: longint; x: Tdouble; result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_psi_n(n: longint; x: Tdouble): Tdouble; cdecl; external libgsl;

// === Konventiert am: 22-8-25 13:58:49 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
