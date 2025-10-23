{$IFDEF read_interface}


function gsl_sf_exp_e(x: Tdouble; result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_exp(x: Tdouble): Tdouble; cdecl; external libgsl;
function gsl_sf_exp_e10_e(x: Tdouble; result: Pgsl_sf_result_e10): longint; cdecl; external libgsl;
function gsl_sf_exp_mult_e(x: Tdouble; y: Tdouble; result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_exp_mult(x: Tdouble; y: Tdouble): Tdouble; cdecl; external libgsl;
function gsl_sf_exp_mult_e10_e(x: Tdouble; y: Tdouble; result: Pgsl_sf_result_e10): longint; cdecl; external libgsl;
function gsl_sf_expm1_e(x: Tdouble; result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_expm1(x: Tdouble): Tdouble; cdecl; external libgsl;
function gsl_sf_exprel_e(x: Tdouble; result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_exprel(x: Tdouble): Tdouble; cdecl; external libgsl;
function gsl_sf_exprel_2_e(x: Tdouble; result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_exprel_2(x: Tdouble): Tdouble; cdecl; external libgsl;
function gsl_sf_exprel_n_e(n: longint; x: Tdouble; result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_exprel_n(n: longint; x: Tdouble): Tdouble; cdecl; external libgsl;
function gsl_sf_exprel_n_CF_e(n: Tdouble; x: Tdouble; result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_exp_err_e(x: Tdouble; dx: Tdouble; result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_exp_err_e10_e(x: Tdouble; dx: Tdouble; result: Pgsl_sf_result_e10): longint; cdecl; external libgsl;
function gsl_sf_exp_mult_err_e(x: Tdouble; dx: Tdouble; y: Tdouble; dy: Tdouble; result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_exp_mult_err_e10_e(x: Tdouble; dx: Tdouble; y: Tdouble; dy: Tdouble; result: Pgsl_sf_result_e10): longint; cdecl; external libgsl;

// === Konventiert am: 22-8-25 14:04:33 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
