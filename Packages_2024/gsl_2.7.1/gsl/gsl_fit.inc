{$IFDEF read_interface}



function gsl_fit_linear(x: Pdouble; xstride: Tsize_t; y: Pdouble; ystride: Tsize_t; n: Tsize_t;
  c0: Pdouble; c1: Pdouble; cov00: Pdouble; cov01: Pdouble; cov11: Pdouble;
  sumsq: Pdouble): longint; cdecl; external libgsl;
function gsl_fit_wlinear(x: Pdouble; xstride: Tsize_t; w: Pdouble; wstride: Tsize_t; y: Pdouble;
  ystride: Tsize_t; n: Tsize_t; c0: Pdouble; c1: Pdouble; cov00: Pdouble;
  cov01: Pdouble; cov11: Pdouble; chisq: Pdouble): longint; cdecl; external libgsl;
function gsl_fit_linear_est(x: double; c0: double; c1: double; cov00: double; cov01: double;
  cov11: double; y: Pdouble; y_err: Pdouble): longint; cdecl; external libgsl;
function gsl_fit_mul(x: Pdouble; xstride: Tsize_t; y: Pdouble; ystride: Tsize_t; n: Tsize_t;
  c1: Pdouble; cov11: Pdouble; sumsq: Pdouble): longint; cdecl; external libgsl;
function gsl_fit_wmul(x: Pdouble; xstride: Tsize_t; w: Pdouble; wstride: Tsize_t; y: Pdouble;
  ystride: Tsize_t; n: Tsize_t; c1: Pdouble; cov11: Pdouble; sumsq: Pdouble): longint; cdecl; external libgsl;
function gsl_fit_mul_est(x: double; c1: double; cov11: double; y: Pdouble; y_err: Pdouble): longint; cdecl; external libgsl;

// === Konventiert am: 21-8-25 19:09:46 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
