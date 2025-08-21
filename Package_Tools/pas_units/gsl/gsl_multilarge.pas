unit gsl_multilarge;

interface

uses
  fp_gsl, gsl_vector_double, gsl_matrix_double;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  Tgsl_multilarge_linear_type = record
    name: pchar;
    alloc: function(p: Tsize_t): pointer; cdecl;
    reset: function(para1: pointer): longint; cdecl;
    accumulate: function(X: Pgsl_matrix; y: Pgsl_vector; para3: pointer): longint; cdecl;
    solve: function(lambda: Tdouble; c: Pgsl_vector; rnorm: Pdouble; snorm: Pdouble; para5: pointer): longint; cdecl;
    rcond: function(rcond: Pdouble; para2: pointer): longint; cdecl;
    lcurve: function(reg_param: Pgsl_vector; rho: Pgsl_vector; eta: Pgsl_vector; para4: pointer): longint; cdecl;
    matrix_ptr: function(para1: pointer): Pgsl_matrix; cdecl;
    rhs_ptr: function(para1: pointer): Pgsl_vector; cdecl;
    free: procedure(para1: pointer); cdecl;
  end;
  Pgsl_multilarge_linear_type = ^Tgsl_multilarge_linear_type;

  Tgsl_multilarge_linear_workspace = record
    _type: Pgsl_multilarge_linear_type;
    state: pointer;
    p: Tsize_t;
  end;
  Pgsl_multilarge_linear_workspace = ^Tgsl_multilarge_linear_workspace;

var
  gsl_multilarge_linear_normal: Pgsl_multilarge_linear_type; cvar;external libgsl;
  gsl_multilarge_linear_tsqr: Pgsl_multilarge_linear_type; cvar;external libgsl;

function gsl_multilarge_linear_alloc(T: Pgsl_multilarge_linear_type; p: Tsize_t): Pgsl_multilarge_linear_workspace; cdecl; external libgsl;
procedure gsl_multilarge_linear_free(w: Pgsl_multilarge_linear_workspace); cdecl; external libgsl;
function gsl_multilarge_linear_name(w: Pgsl_multilarge_linear_workspace): pchar; cdecl; external libgsl;
function gsl_multilarge_linear_reset(w: Pgsl_multilarge_linear_workspace): longint; cdecl; external libgsl;
function gsl_multilarge_linear_accumulate(X: Pgsl_matrix; y: Pgsl_vector; w: Pgsl_multilarge_linear_workspace): longint; cdecl; external libgsl;
function gsl_multilarge_linear_solve(lambda: Tdouble; c: Pgsl_vector; rnorm: Pdouble; snorm: Pdouble; w: Pgsl_multilarge_linear_workspace): longint; cdecl; external libgsl;
function gsl_multilarge_linear_rcond(rcond: Pdouble; w: Pgsl_multilarge_linear_workspace): longint; cdecl; external libgsl;
function gsl_multilarge_linear_lcurve(reg_param: Pgsl_vector; rho: Pgsl_vector; eta: Pgsl_vector; w: Pgsl_multilarge_linear_workspace): longint; cdecl; external libgsl;
function gsl_multilarge_linear_wstdform1(L: Pgsl_vector; X: Pgsl_matrix; w: Pgsl_vector; y: Pgsl_vector; Xs: Pgsl_matrix;
  ys: Pgsl_vector; work: Pgsl_multilarge_linear_workspace): longint; cdecl; external libgsl;
function gsl_multilarge_linear_stdform1(L: Pgsl_vector; X: Pgsl_matrix; y: Pgsl_vector; Xs: Pgsl_matrix; ys: Pgsl_vector;
  work: Pgsl_multilarge_linear_workspace): longint; cdecl; external libgsl;
function gsl_multilarge_linear_L_decomp(L: Pgsl_matrix; tau: Pgsl_vector): longint; cdecl; external libgsl;
function gsl_multilarge_linear_wstdform2(LQR: Pgsl_matrix; Ltau: Pgsl_vector; X: Pgsl_matrix; w: Pgsl_vector; y: Pgsl_vector;
  Xs: Pgsl_matrix; ys: Pgsl_vector; work: Pgsl_multilarge_linear_workspace): longint; cdecl; external libgsl;
function gsl_multilarge_linear_stdform2(LQR: Pgsl_matrix; Ltau: Pgsl_vector; X: Pgsl_matrix; y: Pgsl_vector; Xs: Pgsl_matrix;
  ys: Pgsl_vector; work: Pgsl_multilarge_linear_workspace): longint; cdecl; external libgsl;
function gsl_multilarge_linear_genform1(L: Pgsl_vector; cs: Pgsl_vector; c: Pgsl_vector; work: Pgsl_multilarge_linear_workspace): longint; cdecl; external libgsl;
function gsl_multilarge_linear_genform2(LQR: Pgsl_matrix; Ltau: Pgsl_vector; cs: Pgsl_vector; c: Pgsl_vector; work: Pgsl_multilarge_linear_workspace): longint; cdecl; external libgsl;
function gsl_multilarge_linear_matrix_ptr(work: Pgsl_multilarge_linear_workspace): Pgsl_matrix; cdecl; external libgsl;
function gsl_multilarge_linear_rhs_ptr(work: Pgsl_multilarge_linear_workspace): Pgsl_vector; cdecl; external libgsl;

// === Konventiert am: 21-8-25 19:43:37 ===


implementation



end.
