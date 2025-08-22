unit gsl_sf_airy;

interface

uses
  fp_gsl, gsl_mode, gsl_sf_result;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


function gsl_sf_airy_Ai_e(x: Tdouble; mode: Tgsl_mode_t; result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_airy_Ai(x: Tdouble; mode: Tgsl_mode_t): Tdouble; cdecl; external libgsl;
function gsl_sf_airy_Bi_e(x: Tdouble; mode: Tgsl_mode_t; result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_airy_Bi(x: Tdouble; mode: Tgsl_mode_t): Tdouble; cdecl; external libgsl;
function gsl_sf_airy_Ai_scaled_e(x: Tdouble; mode: Tgsl_mode_t; result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_airy_Ai_scaled(x: Tdouble; mode: Tgsl_mode_t): Tdouble; cdecl; external libgsl;
function gsl_sf_airy_Bi_scaled_e(x: Tdouble; mode: Tgsl_mode_t; result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_airy_Bi_scaled(x: Tdouble; mode: Tgsl_mode_t): Tdouble; cdecl; external libgsl;
function gsl_sf_airy_Ai_deriv_e(x: Tdouble; mode: Tgsl_mode_t; result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_airy_Ai_deriv(x: Tdouble; mode: Tgsl_mode_t): Tdouble; cdecl; external libgsl;
function gsl_sf_airy_Bi_deriv_e(x: Tdouble; mode: Tgsl_mode_t; result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_airy_Bi_deriv(x: Tdouble; mode: Tgsl_mode_t): Tdouble; cdecl; external libgsl;
function gsl_sf_airy_Ai_deriv_scaled_e(x: Tdouble; mode: Tgsl_mode_t; result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_airy_Ai_deriv_scaled(x: Tdouble; mode: Tgsl_mode_t): Tdouble; cdecl; external libgsl;
function gsl_sf_airy_Bi_deriv_scaled_e(x: Tdouble; mode: Tgsl_mode_t; result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_airy_Bi_deriv_scaled(x: Tdouble; mode: Tgsl_mode_t): Tdouble; cdecl; external libgsl;
function gsl_sf_airy_zero_Ai_e(s: dword; result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_airy_zero_Ai(s: dword): Tdouble; cdecl; external libgsl;
function gsl_sf_airy_zero_Bi_e(s: dword; result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_airy_zero_Bi(s: dword): Tdouble; cdecl; external libgsl;
function gsl_sf_airy_zero_Ai_deriv_e(s: dword; result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_airy_zero_Ai_deriv(s: dword): Tdouble; cdecl; external libgsl;
function gsl_sf_airy_zero_Bi_deriv_e(s: dword; result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_airy_zero_Bi_deriv(s: dword): Tdouble; cdecl; external libgsl;

// === Konventiert am: 22-8-25 14:04:05 ===


implementation



end.
