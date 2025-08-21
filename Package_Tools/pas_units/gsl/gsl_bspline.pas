unit gsl_bspline;

interface

uses
  fp_gsl, gsl_vector_double, gsl_matrix_double;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  Tgsl_bspline_workspace = record
    k: Tsize_t;
    km1: Tsize_t;
    l: Tsize_t;
    nbreak: Tsize_t;
    n: Tsize_t;
    knots: Pgsl_vector;
    deltal: Pgsl_vector;
    deltar: Pgsl_vector;
    B: Pgsl_vector;
    A: Pgsl_matrix;
    dB: Pgsl_matrix;
  end;
  Pgsl_bspline_workspace = ^Tgsl_bspline_workspace;

function gsl_bspline_alloc(k: Tsize_t; nbreak: Tsize_t): Pgsl_bspline_workspace; cdecl; external libgsl;
procedure gsl_bspline_free(w: Pgsl_bspline_workspace); cdecl; external libgsl;
function gsl_bspline_ncoeffs(w: Pgsl_bspline_workspace): Tsize_t; cdecl; external libgsl;
function gsl_bspline_order(w: Pgsl_bspline_workspace): Tsize_t; cdecl; external libgsl;
function gsl_bspline_nbreak(w: Pgsl_bspline_workspace): Tsize_t; cdecl; external libgsl;
function gsl_bspline_breakpoint(i: Tsize_t; w: Pgsl_bspline_workspace): Tdouble; cdecl; external libgsl;
function gsl_bspline_greville_abscissa(i: Tsize_t; w: Pgsl_bspline_workspace): Tdouble; cdecl; external libgsl;
function gsl_bspline_knots(breakpts: Pgsl_vector; w: Pgsl_bspline_workspace): longint; cdecl; external libgsl;
function gsl_bspline_knots_uniform(a: Tdouble; b: Tdouble; w: Pgsl_bspline_workspace): longint; cdecl; external libgsl;
function gsl_bspline_knots_greville(abscissae: Pgsl_vector; w: Pgsl_bspline_workspace; abserr: Pdouble): longint; cdecl; external libgsl;
function gsl_bspline_eval(x: Tdouble; B: Pgsl_vector; w: Pgsl_bspline_workspace): longint; cdecl; external libgsl;
function gsl_bspline_eval_nonzero(x: Tdouble; Bk: Pgsl_vector; istart: Psize_t; iend: Psize_t; w: Pgsl_bspline_workspace): longint; cdecl; external libgsl;
function gsl_bspline_deriv_eval(x: Tdouble; nderiv: Tsize_t; dB: Pgsl_matrix; w: Pgsl_bspline_workspace): longint; cdecl; external libgsl;
function gsl_bspline_deriv_eval_nonzero(x: Tdouble; nderiv: Tsize_t; dB: Pgsl_matrix; istart: Psize_t; iend: Psize_t;
  w: Pgsl_bspline_workspace): longint; cdecl; external libgsl;

// === Konventiert am: 21-8-25 16:51:45 ===


implementation



end.
