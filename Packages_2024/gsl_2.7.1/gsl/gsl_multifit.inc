{$IFDEF read_interface}


type
  Tgsl_multifit_linear_workspace = record
    nmax: Tsize_t;
    pmax: Tsize_t;
    n: Tsize_t;
    p: Tsize_t;
    A: Pgsl_matrix;
    Q: Pgsl_matrix;
    QSI: Pgsl_matrix;
    S: Pgsl_vector;
    t: Pgsl_vector;
    xt: Pgsl_vector;
    D: Pgsl_vector;
    rcond: Tdouble;
  end;
  Pgsl_multifit_linear_workspace = ^Tgsl_multifit_linear_workspace;

function gsl_multifit_linear_alloc(n: Tsize_t; p: Tsize_t): Pgsl_multifit_linear_workspace; cdecl; external libgsl;
procedure gsl_multifit_linear_free(w: Pgsl_multifit_linear_workspace); cdecl; external libgsl;
function gsl_multifit_linear(X: Pgsl_matrix; y: Pgsl_vector; c: Pgsl_vector; cov: Pgsl_matrix; chisq: Pdouble;
  work: Pgsl_multifit_linear_workspace): longint; cdecl; external libgsl;
function gsl_multifit_linear_tsvd(X: Pgsl_matrix; y: Pgsl_vector; tol: Tdouble; c: Pgsl_vector; cov: Pgsl_matrix;
  chisq: Pdouble; rank: Psize_t; work: Pgsl_multifit_linear_workspace): longint; cdecl; external libgsl;
function gsl_multifit_linear_svd(X: Pgsl_matrix; work: Pgsl_multifit_linear_workspace): longint; cdecl; external libgsl;
function gsl_multifit_linear_bsvd(X: Pgsl_matrix; work: Pgsl_multifit_linear_workspace): longint; cdecl; external libgsl;
function gsl_multifit_linear_rank(tol: Tdouble; work: Pgsl_multifit_linear_workspace): Tsize_t; cdecl; external libgsl;
function gsl_multifit_linear_solve(lambda: Tdouble; X: Pgsl_matrix; y: Pgsl_vector; c: Pgsl_vector; rnorm: Pdouble;
  snorm: Pdouble; work: Pgsl_multifit_linear_workspace): longint; cdecl; external libgsl;
function gsl_multifit_linear_applyW(X: Pgsl_matrix; w: Pgsl_vector; y: Pgsl_vector; WX: Pgsl_matrix; Wy: Pgsl_vector): longint; cdecl; external libgsl;
function gsl_multifit_linear_stdform1(L: Pgsl_vector; X: Pgsl_matrix; y: Pgsl_vector; Xs: Pgsl_matrix; ys: Pgsl_vector;
  work: Pgsl_multifit_linear_workspace): longint; cdecl; external libgsl;
function gsl_multifit_linear_wstdform1(L: Pgsl_vector; X: Pgsl_matrix; w: Pgsl_vector; y: Pgsl_vector; Xs: Pgsl_matrix;
  ys: Pgsl_vector; work: Pgsl_multifit_linear_workspace): longint; cdecl; external libgsl;
function gsl_multifit_linear_L_decomp(L: Pgsl_matrix; tau: Pgsl_vector): longint; cdecl; external libgsl;
function gsl_multifit_linear_stdform2(LQR: Pgsl_matrix; Ltau: Pgsl_vector; X: Pgsl_matrix; y: Pgsl_vector; Xs: Pgsl_matrix;
  ys: Pgsl_vector; M: Pgsl_matrix; work: Pgsl_multifit_linear_workspace): longint; cdecl; external libgsl;
function gsl_multifit_linear_wstdform2(LQR: Pgsl_matrix; Ltau: Pgsl_vector; X: Pgsl_matrix; w: Pgsl_vector; y: Pgsl_vector;
  Xs: Pgsl_matrix; ys: Pgsl_vector; M: Pgsl_matrix; work: Pgsl_multifit_linear_workspace): longint; cdecl; external libgsl;
function gsl_multifit_linear_genform1(L: Pgsl_vector; cs: Pgsl_vector; c: Pgsl_vector; work: Pgsl_multifit_linear_workspace): longint; cdecl; external libgsl;
function gsl_multifit_linear_genform2(LQR: Pgsl_matrix; Ltau: Pgsl_vector; X: Pgsl_matrix; y: Pgsl_vector; cs: Pgsl_vector;
  M: Pgsl_matrix; c: Pgsl_vector; work: Pgsl_multifit_linear_workspace): longint; cdecl; external libgsl;
function gsl_multifit_linear_wgenform2(LQR: Pgsl_matrix; Ltau: Pgsl_vector; X: Pgsl_matrix; w: Pgsl_vector; y: Pgsl_vector;
  cs: Pgsl_vector; M: Pgsl_matrix; c: Pgsl_vector; work: Pgsl_multifit_linear_workspace): longint; cdecl; external libgsl;
function gsl_multifit_linear_lreg(smin: Tdouble; smax: Tdouble; reg_param: Pgsl_vector): longint; cdecl; external libgsl;
function gsl_multifit_linear_lcurve(y: Pgsl_vector; reg_param: Pgsl_vector; rho: Pgsl_vector; eta: Pgsl_vector; work: Pgsl_multifit_linear_workspace): longint; cdecl; external libgsl;
function gsl_multifit_linear_lcurvature(y: Pgsl_vector; reg_param: Pgsl_vector; rho: Pgsl_vector; eta: Pgsl_vector; kappa: Pgsl_vector;
  work: Pgsl_multifit_linear_workspace): longint; cdecl; external libgsl;
function gsl_multifit_linear_lcorner(rho: Pgsl_vector; eta: Pgsl_vector; idx: Psize_t): longint; cdecl; external libgsl;
function gsl_multifit_linear_lcorner2(reg_param: Pgsl_vector; eta: Pgsl_vector; idx: Psize_t): longint; cdecl; external libgsl;
function gsl_multifit_linear_Lk(p: Tsize_t; k: Tsize_t; L: Pgsl_matrix): longint; cdecl; external libgsl;
function gsl_multifit_linear_Lsobolev(p: Tsize_t; kmax: Tsize_t; alpha: Pgsl_vector; L: Pgsl_matrix; work: Pgsl_multifit_linear_workspace): longint; cdecl; external libgsl;
function gsl_multifit_wlinear(X: Pgsl_matrix; w: Pgsl_vector; y: Pgsl_vector; c: Pgsl_vector; cov: Pgsl_matrix;
  chisq: Pdouble; work: Pgsl_multifit_linear_workspace): longint; cdecl; external libgsl;
function gsl_multifit_wlinear_tsvd(X: Pgsl_matrix; w: Pgsl_vector; y: Pgsl_vector; tol: Tdouble; c: Pgsl_vector;
  cov: Pgsl_matrix; chisq: Pdouble; rank: Psize_t; work: Pgsl_multifit_linear_workspace): longint; cdecl; external libgsl;
function gsl_multifit_wlinear_svd(X: Pgsl_matrix; w: Pgsl_vector; y: Pgsl_vector; tol: Tdouble; rank: Psize_t;
  c: Pgsl_vector; cov: Pgsl_matrix; chisq: Pdouble; work: Pgsl_multifit_linear_workspace): longint; cdecl; external libgsl;
function gsl_multifit_wlinear_usvd(X: Pgsl_matrix; w: Pgsl_vector; y: Pgsl_vector; tol: Tdouble; rank: Psize_t;
  c: Pgsl_vector; cov: Pgsl_matrix; chisq: Pdouble; work: Pgsl_multifit_linear_workspace): longint; cdecl; external libgsl;
function gsl_multifit_linear_est(x: Pgsl_vector; c: Pgsl_vector; cov: Pgsl_matrix; y: Pdouble; y_err: Pdouble): longint; cdecl; external libgsl;
function gsl_multifit_linear_rcond(w: Pgsl_multifit_linear_workspace): Tdouble; cdecl; external libgsl;
function gsl_multifit_linear_residuals(X: Pgsl_matrix; y: Pgsl_vector; c: Pgsl_vector; r: Pgsl_vector): longint; cdecl; external libgsl;
function gsl_multifit_linear_gcv_init(y: Pgsl_vector; reg_param: Pgsl_vector; UTy: Pgsl_vector; delta0: Pdouble; work: Pgsl_multifit_linear_workspace): longint; cdecl; external libgsl;
function gsl_multifit_linear_gcv_curve(reg_param: Pgsl_vector; UTy: Pgsl_vector; delta0: Tdouble; G: Pgsl_vector; work: Pgsl_multifit_linear_workspace): longint; cdecl; external libgsl;
function gsl_multifit_linear_gcv_min(reg_param: Pgsl_vector; UTy: Pgsl_vector; G: Pgsl_vector; delta0: Tdouble; lambda: Pdouble;
  work: Pgsl_multifit_linear_workspace): longint; cdecl; external libgsl;
function gsl_multifit_linear_gcv_calc(lambda: Tdouble; UTy: Pgsl_vector; delta0: Tdouble; work: Pgsl_multifit_linear_workspace): Tdouble; cdecl; external libgsl;
function gsl_multifit_linear_gcv(y: Pgsl_vector; reg_param: Pgsl_vector; G: Pgsl_vector; lambda: Pdouble; G_lambda: Pdouble;
  work: Pgsl_multifit_linear_workspace): longint; cdecl; external libgsl;

type
  Tgsl_multifit_robust_type = record
    name: pchar;
    wfun: function(r: Pgsl_vector; w: Pgsl_vector): longint; cdecl;
    psi_deriv: function(r: Pgsl_vector; dpsi: Pgsl_vector): longint; cdecl;
    tuning_default: Tdouble;
  end;
  Pgsl_multifit_robust_type = ^Tgsl_multifit_robust_type;

  Tgsl_multifit_robust_stats = record
    sigma_ols: Tdouble;
    sigma_mad: Tdouble;
    sigma_rob: Tdouble;
    sigma: Tdouble;
    Rsq: Tdouble;
    adj_Rsq: Tdouble;
    rmse: Tdouble;
    sse: Tdouble;
    dof: Tsize_t;
    numit: Tsize_t;
    weights: Pgsl_vector;
    r: Pgsl_vector;
  end;
  Pgsl_multifit_robust_stats = ^Tgsl_multifit_robust_stats;

  Tgsl_multifit_robust_workspace = record
    n: Tsize_t;
    p: Tsize_t;
    numit: Tsize_t;
    maxiter: Tsize_t;
    _type: Pgsl_multifit_robust_type;
    tune: Tdouble;
    r: Pgsl_vector;
    weights: Pgsl_vector;
    c_prev: Pgsl_vector;
    resfac: Pgsl_vector;
    psi: Pgsl_vector;
    dpsi: Pgsl_vector;
    QSI: Pgsl_matrix;
    D: Pgsl_vector;
    workn: Pgsl_vector;
    stats: Tgsl_multifit_robust_stats;
    multifit_p: Pgsl_multifit_linear_workspace;
  end;
  Pgsl_multifit_robust_workspace = ^Tgsl_multifit_robust_workspace;

var
  gsl_multifit_robust_default: Pgsl_multifit_robust_type; cvar;external libgsl;
  gsl_multifit_robust_bisquare: Pgsl_multifit_robust_type; cvar;external libgsl;
  gsl_multifit_robust_cauchy: Pgsl_multifit_robust_type; cvar;external libgsl;
  gsl_multifit_robust_fair: Pgsl_multifit_robust_type; cvar;external libgsl;
  gsl_multifit_robust_huber: Pgsl_multifit_robust_type; cvar;external libgsl;
  gsl_multifit_robust_ols: Pgsl_multifit_robust_type; cvar;external libgsl;
  gsl_multifit_robust_welsch: Pgsl_multifit_robust_type; cvar;external libgsl;

function gsl_multifit_robust_alloc(T: Pgsl_multifit_robust_type; n: Tsize_t; p: Tsize_t): Pgsl_multifit_robust_workspace; cdecl; external libgsl;
procedure gsl_multifit_robust_free(w: Pgsl_multifit_robust_workspace); cdecl; external libgsl;
function gsl_multifit_robust_tune(tune: Tdouble; w: Pgsl_multifit_robust_workspace): longint; cdecl; external libgsl;
function gsl_multifit_robust_maxiter(maxiter: Tsize_t; w: Pgsl_multifit_robust_workspace): longint; cdecl; external libgsl;
function gsl_multifit_robust_name(w: Pgsl_multifit_robust_workspace): pchar; cdecl; external libgsl;
function gsl_multifit_robust_statistics(w: Pgsl_multifit_robust_workspace): Tgsl_multifit_robust_stats; cdecl; external libgsl;
function gsl_multifit_robust_weights(r: Pgsl_vector; wts: Pgsl_vector; w: Pgsl_multifit_robust_workspace): longint; cdecl; external libgsl;
function gsl_multifit_robust(X: Pgsl_matrix; y: Pgsl_vector; c: Pgsl_vector; cov: Pgsl_matrix; w: Pgsl_multifit_robust_workspace): longint; cdecl; external libgsl;
function gsl_multifit_robust_est(x: Pgsl_vector; c: Pgsl_vector; cov: Pgsl_matrix; y: Pdouble; y_err: Pdouble): longint; cdecl; external libgsl;
function gsl_multifit_robust_residuals(X: Pgsl_matrix; y: Pgsl_vector; c: Pgsl_vector; r: Pgsl_vector; w: Pgsl_multifit_robust_workspace): longint; cdecl; external libgsl;

// === Konventiert am: 21-8-25 19:43:30 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
