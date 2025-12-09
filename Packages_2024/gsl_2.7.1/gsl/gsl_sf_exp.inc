{$IFDEF read_interface}


function gsl_sf_exp_e(x: double; result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_exp(x: double): double; cdecl; external libgsl;
function gsl_sf_exp_e10_e(x: double; result: Pgsl_sf_result_e10): longint; cdecl; external libgsl;
function gsl_sf_exp_mult_e(x: double; y: double; result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_exp_mult(x: double; y: double): double; cdecl; external libgsl;
function gsl_sf_exp_mult_e10_e(x: double; y: double; result: Pgsl_sf_result_e10): longint; cdecl; external libgsl;
function gsl_sf_expm1_e(x: double; result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_expm1(x: double): double; cdecl; external libgsl;
function gsl_sf_exprel_e(x: double; result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_exprel(x: double): double; cdecl; external libgsl;
function gsl_sf_exprel_2_e(x: double; result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_exprel_2(x: double): double; cdecl; external libgsl;
function gsl_sf_exprel_n_e(n: longint; x: double; result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_exprel_n(n: longint; x: double): double; cdecl; external libgsl;
function gsl_sf_exprel_n_CF_e(n: double; x: double; result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_exp_err_e(x: double; dx: double; result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_exp_err_e10_e(x: double; dx: double; result: Pgsl_sf_result_e10): longint; cdecl; external libgsl;
function gsl_sf_exp_mult_err_e(x: double; dx: double; y: double; dy: double; result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_exp_mult_err_e10_e(x: double; dx: double; y: double; dy: double; result: Pgsl_sf_result_e10): longint; cdecl; external libgsl;

// === Konventiert am: 22-8-25 14:04:33 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
