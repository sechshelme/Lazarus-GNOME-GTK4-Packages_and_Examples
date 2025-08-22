unit gsl_sf_expint;

interface

uses
  fp_gsl, gsl_sf_result;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


function gsl_sf_expint_E1_e(x: Tdouble; result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_expint_E1(x: Tdouble): Tdouble; cdecl; external libgsl;
function gsl_sf_expint_E2_e(x: Tdouble; result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_expint_E2(x: Tdouble): Tdouble; cdecl; external libgsl;
function gsl_sf_expint_En_e(n: longint; x: Tdouble; result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_expint_En(n: longint; x: Tdouble): Tdouble; cdecl; external libgsl;
function gsl_sf_expint_E1_scaled_e(x: Tdouble; result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_expint_E1_scaled(x: Tdouble): Tdouble; cdecl; external libgsl;
function gsl_sf_expint_E2_scaled_e(x: Tdouble; result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_expint_E2_scaled(x: Tdouble): Tdouble; cdecl; external libgsl;
function gsl_sf_expint_En_scaled_e(n: longint; x: Tdouble; result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_expint_En_scaled(n: longint; x: Tdouble): Tdouble; cdecl; external libgsl;
function gsl_sf_expint_Ei_e(x: Tdouble; result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_expint_Ei(x: Tdouble): Tdouble; cdecl; external libgsl;
function gsl_sf_expint_Ei_scaled_e(x: Tdouble; result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_expint_Ei_scaled(x: Tdouble): Tdouble; cdecl; external libgsl;
function gsl_sf_Shi_e(x: Tdouble; result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_Shi(x: Tdouble): Tdouble; cdecl; external libgsl;
function gsl_sf_Chi_e(x: Tdouble; result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_Chi(x: Tdouble): Tdouble; cdecl; external libgsl;
function gsl_sf_expint_3_e(x: Tdouble; result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_expint_3(x: Tdouble): Tdouble; cdecl; external libgsl;
function gsl_sf_Si_e(x: Tdouble; result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_Si(x: Tdouble): Tdouble; cdecl; external libgsl;
function gsl_sf_Ci_e(x: Tdouble; result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_Ci(x: Tdouble): Tdouble; cdecl; external libgsl;
function gsl_sf_atanint_e(x: Tdouble; result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_atanint(x: Tdouble): Tdouble; cdecl; external libgsl;

// === Konventiert am: 22-8-25 14:04:35 ===


implementation



end.
