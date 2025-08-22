unit gsl_sys;

interface

uses
  fp_gsl;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}



function gsl_log1p(x: Tdouble): Tdouble; cdecl; external libgsl;
function gsl_expm1(x: Tdouble): Tdouble; cdecl; external libgsl;
function gsl_hypot(x: Tdouble; y: Tdouble): Tdouble; cdecl; external libgsl;
function gsl_hypot3(x: Tdouble; y: Tdouble; z: Tdouble): Tdouble; cdecl; external libgsl;
function gsl_acosh(x: Tdouble): Tdouble; cdecl; external libgsl;
function gsl_asinh(x: Tdouble): Tdouble; cdecl; external libgsl;
function gsl_atanh(x: Tdouble): Tdouble; cdecl; external libgsl;
function gsl_isnan(x: Tdouble): longint; cdecl; external libgsl;
function gsl_isinf(x: Tdouble): longint; cdecl; external libgsl;
function gsl_finite(x: Tdouble): longint; cdecl; external libgsl;
function gsl_nan: Tdouble; cdecl; external libgsl;
function gsl_posinf: Tdouble; cdecl; external libgsl;
function gsl_neginf: Tdouble; cdecl; external libgsl;
function gsl_fdiv(x: Tdouble; y: Tdouble): Tdouble; cdecl; external libgsl;
function gsl_coerce_double(x: Tdouble): Tdouble; cdecl; external libgsl;
function gsl_coerce_float(x: single): single; cdecl; external libgsl;
function gsl_coerce_long_double(x: Tlong_double): Tlong_double; cdecl; external libgsl;
function gsl_ldexp(x: Tdouble; e: longint): Tdouble; cdecl; external libgsl;
function gsl_frexp(x: Tdouble; e: Plongint): Tdouble; cdecl; external libgsl;
function gsl_fcmp(x1: Tdouble; x2: Tdouble; epsilon: Tdouble): longint; cdecl; external libgsl;

// === Konventiert am: 22-8-25 13:49:20 ===


implementation



end.
