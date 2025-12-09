{$IFDEF read_interface}


function gsl_sf_sin_e(x: double; result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_sin(x: double): double; cdecl; external libgsl;
function gsl_sf_cos_e(x: double; result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_cos(x: double): double; cdecl; external libgsl;
function gsl_sf_hypot_e(x: double; y: double; result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_hypot(x: double; y: double): double; cdecl; external libgsl;
function gsl_sf_complex_sin_e(zr: double; zi: double; szr: Pgsl_sf_result; szi: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_complex_cos_e(zr: double; zi: double; czr: Pgsl_sf_result; czi: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_complex_logsin_e(zr: double; zi: double; lszr: Pgsl_sf_result; lszi: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_sinc_e(x: double; result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_sinc(x: double): double; cdecl; external libgsl;
function gsl_sf_lnsinh_e(x: double; result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_lnsinh(x: double): double; cdecl; external libgsl;
function gsl_sf_lncosh_e(x: double; result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_lncosh(x: double): double; cdecl; external libgsl;
function gsl_sf_polar_to_rect(r: double; theta: double; x: Pgsl_sf_result; y: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_rect_to_polar(x: double; y: double; r: Pgsl_sf_result; theta: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_sin_err_e(x: double; dx: double; result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_cos_err_e(x: double; dx: double; result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_angle_restrict_symm_e(theta: Pdouble): longint; cdecl; external libgsl;
function gsl_sf_angle_restrict_symm(theta: double): double; cdecl; external libgsl;
function gsl_sf_angle_restrict_pos_e(theta: Pdouble): longint; cdecl; external libgsl;
function gsl_sf_angle_restrict_pos(theta: double): double; cdecl; external libgsl;
function gsl_sf_angle_restrict_symm_err_e(theta: double; result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_angle_restrict_pos_err_e(theta: double; result: Pgsl_sf_result): longint; cdecl; external libgsl;

// === Konventiert am: 22-8-25 13:59:21 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
