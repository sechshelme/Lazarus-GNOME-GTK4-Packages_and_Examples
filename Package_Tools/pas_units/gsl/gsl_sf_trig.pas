unit gsl_sf_trig;

interface

uses
  fp_gsl, gsl_sf_result;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


function gsl_sf_sin_e(x: Tdouble; result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_sin(x: Tdouble): Tdouble; cdecl; external libgsl;
function gsl_sf_cos_e(x: Tdouble; result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_cos(x: Tdouble): Tdouble; cdecl; external libgsl;
function gsl_sf_hypot_e(x: Tdouble; y: Tdouble; result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_hypot(x: Tdouble; y: Tdouble): Tdouble; cdecl; external libgsl;
function gsl_sf_complex_sin_e(zr: Tdouble; zi: Tdouble; szr: Pgsl_sf_result; szi: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_complex_cos_e(zr: Tdouble; zi: Tdouble; czr: Pgsl_sf_result; czi: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_complex_logsin_e(zr: Tdouble; zi: Tdouble; lszr: Pgsl_sf_result; lszi: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_sinc_e(x: Tdouble; result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_sinc(x: Tdouble): Tdouble; cdecl; external libgsl;
function gsl_sf_lnsinh_e(x: Tdouble; result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_lnsinh(x: Tdouble): Tdouble; cdecl; external libgsl;
function gsl_sf_lncosh_e(x: Tdouble; result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_lncosh(x: Tdouble): Tdouble; cdecl; external libgsl;
function gsl_sf_polar_to_rect(r: Tdouble; theta: Tdouble; x: Pgsl_sf_result; y: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_rect_to_polar(x: Tdouble; y: Tdouble; r: Pgsl_sf_result; theta: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_sin_err_e(x: Tdouble; dx: Tdouble; result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_cos_err_e(x: Tdouble; dx: Tdouble; result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_angle_restrict_symm_e(theta: Pdouble): longint; cdecl; external libgsl;
function gsl_sf_angle_restrict_symm(theta: Tdouble): Tdouble; cdecl; external libgsl;
function gsl_sf_angle_restrict_pos_e(theta: Pdouble): longint; cdecl; external libgsl;
function gsl_sf_angle_restrict_pos(theta: Tdouble): Tdouble; cdecl; external libgsl;
function gsl_sf_angle_restrict_symm_err_e(theta: Tdouble; result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_angle_restrict_pos_err_e(theta: Tdouble; result: Pgsl_sf_result): longint; cdecl; external libgsl;

// === Konventiert am: 22-8-25 13:59:21 ===


implementation



end.
