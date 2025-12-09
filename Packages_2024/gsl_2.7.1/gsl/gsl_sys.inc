{$IFDEF read_interface}



function gsl_log1p(x: double): double; cdecl; external libgsl;
function gsl_expm1(x: double): double; cdecl; external libgsl;
function gsl_hypot(x: double; y: double): double; cdecl; external libgsl;
function gsl_hypot3(x: double; y: double; z: double): double; cdecl; external libgsl;
function gsl_acosh(x: double): double; cdecl; external libgsl;
function gsl_asinh(x: double): double; cdecl; external libgsl;
function gsl_atanh(x: double): double; cdecl; external libgsl;
function gsl_isnan(x: double): longint; cdecl; external libgsl;
function gsl_isinf(x: double): longint; cdecl; external libgsl;
function gsl_finite(x: double): longint; cdecl; external libgsl;
function gsl_nan: double; cdecl; external libgsl;
function gsl_posinf: double; cdecl; external libgsl;
function gsl_neginf: double; cdecl; external libgsl;
function gsl_fdiv(x: double; y: double): double; cdecl; external libgsl;
function gsl_coerce_double(x: double): double; cdecl; external libgsl;
function gsl_coerce_float(x: single): single; cdecl; external libgsl;
function gsl_coerce_long_double(x: Tlong_double): Tlong_double; cdecl; external libgsl;
function gsl_ldexp(x: double; e: longint): double; cdecl; external libgsl;
function gsl_frexp(x: double; e: Plongint): double; cdecl; external libgsl;
function gsl_fcmp(x1: double; x2: double; epsilon: double): longint; cdecl; external libgsl;

// === Konventiert am: 22-8-25 13:49:20 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
