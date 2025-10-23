{$IFDEF read_interface}


type
  Pgsl_multilarge_nlinear_fdtype = ^Tgsl_multilarge_nlinear_fdtype;
  Tgsl_multilarge_nlinear_fdtype = longint;

const
  GSL_MULTILARGE_NLINEAR_FWDIFF = 0;
  GSL_MULTILARGE_NLINEAR_CTRDIFF = 1;

type
  Tgsl_multilarge_nlinear_fdf = record
    f: function(x: Pgsl_vector; params: pointer; f: Pgsl_vector): longint; cdecl;
    df: function(TransJ: TCBLAS_TRANSPOSE_t; x: Pgsl_vector; u: Pgsl_vector; params: pointer; v: Pgsl_vector;
      JTJ: Pgsl_matrix): longint; cdecl;
    fvv: function(x: Pgsl_vector; v: Pgsl_vector; params: pointer; fvv: Pgsl_vector): longint; cdecl;
    n: Tsize_t;
    p: Tsize_t;
    params: pointer;
    nevalf: Tsize_t;
    nevaldfu: Tsize_t;
    nevaldf2: Tsize_t;
    nevalfvv: Tsize_t;
  end;
  Pgsl_multilarge_nlinear_fdf = ^Tgsl_multilarge_nlinear_fdf;

  Tgsl_multilarge_nlinear_trs = record
    name: pchar;
    alloc: function(params: pointer; n: Tsize_t; p: Tsize_t): pointer; cdecl;
    init: function(vtrust_state: pointer; vstate: pointer): longint; cdecl;
    preloop: function(vtrust_state: pointer; vstate: pointer): longint; cdecl;
    step: function(vtrust_state: pointer; delta: Tdouble; dx: Pgsl_vector; vstate: pointer): longint; cdecl;
    preduction: function(vtrust_state: pointer; dx: Pgsl_vector; pred: Pdouble; vstate: pointer): longint; cdecl;
    free: procedure(vstate: pointer); cdecl;
  end;
  Pgsl_multilarge_nlinear_trs = ^Tgsl_multilarge_nlinear_trs;

  Tgsl_multilarge_nlinear_scale = record
    name: pchar;
    init: function(JTJ: Pgsl_matrix; diag: Pgsl_vector): longint; cdecl;
    update: function(JTJ: Pgsl_matrix; diag: Pgsl_vector): longint; cdecl;
  end;
  Pgsl_multilarge_nlinear_scale = ^Tgsl_multilarge_nlinear_scale;

  Tgsl_multilarge_nlinear_solver = record
    name: pchar;
    alloc: function(n: Tsize_t; p: Tsize_t): pointer; cdecl;
    init: function(vtrust_state: pointer; vstate: pointer): longint; cdecl;
    presolve: function(mu: Tdouble; vtrust_state: pointer; vstate: pointer): longint; cdecl;
    solve: function(g: Pgsl_vector; x: Pgsl_vector; vtrust_state: pointer; vstate: pointer): longint; cdecl;
    rcond: function(rcond: Pdouble; JTJ: Pgsl_matrix; vstate: pointer): longint; cdecl;
    covar: function(JTJ: Pgsl_matrix; covar: Pgsl_matrix; vstate: pointer): longint; cdecl;
    free: procedure(vstate: pointer); cdecl;
  end;
  Pgsl_multilarge_nlinear_solver = ^Tgsl_multilarge_nlinear_solver;

  Tgsl_multilarge_nlinear_parameters = record
    trs: Pgsl_multilarge_nlinear_trs;
    scale: Pgsl_multilarge_nlinear_scale;
    solver: Pgsl_multilarge_nlinear_solver;
    fdtype: Tgsl_multilarge_nlinear_fdtype;
    factor_up: Tdouble;
    factor_down: Tdouble;
    avmax: Tdouble;
    h_df: Tdouble;
    h_fvv: Tdouble;
    max_iter: Tsize_t;
    tol: Tdouble;
  end;
  Pgsl_multilarge_nlinear_parameters = ^Tgsl_multilarge_nlinear_parameters;

  Tgsl_multilarge_nlinear_type = record
    name: pchar;
    alloc: function(params: Pgsl_multilarge_nlinear_parameters; n: Tsize_t; p: Tsize_t): pointer; cdecl;
    init: function(state: pointer; wts: Pgsl_vector; fdf: Pgsl_multilarge_nlinear_fdf; x: Pgsl_vector; f: Pgsl_vector;
      g: Pgsl_vector; JTJ: Pgsl_matrix): longint; cdecl;
    iterate: function(state: pointer; wts: Pgsl_vector; fdf: Pgsl_multilarge_nlinear_fdf; x: Pgsl_vector; f: Pgsl_vector;
      g: Pgsl_vector; JTJ: Pgsl_matrix; dx: Pgsl_vector): longint; cdecl;
    rcond: function(rcond: Pdouble; JTJ: Pgsl_matrix; state: pointer): longint; cdecl;
    covar: function(JTJ: Pgsl_matrix; covar: Pgsl_matrix; state: pointer): longint; cdecl;
    avratio: function(state: pointer): Tdouble; cdecl;
    free: procedure(state: pointer); cdecl;
  end;
  Pgsl_multilarge_nlinear_type = ^Tgsl_multilarge_nlinear_type;

  Tgsl_multilarge_nlinear_trust_state = record
    x: Pgsl_vector;
    f: Pgsl_vector;
    g: Pgsl_vector;
    JTJ: Pgsl_matrix;
    diag: Pgsl_vector;
    sqrt_wts: Pgsl_vector;
    mu: Pdouble;
    params: Pgsl_multilarge_nlinear_parameters;
    solver_state: pointer;
    fdf: Pgsl_multilarge_nlinear_fdf;
    avratio: Pdouble;
  end;
  Pgsl_multilarge_nlinear_trust_state = ^Tgsl_multilarge_nlinear_trust_state;

  Tgsl_multilarge_nlinear_workspace = record
    _type: Pgsl_multilarge_nlinear_type;
    fdf: Pgsl_multilarge_nlinear_fdf;
    x: Pgsl_vector;
    f: Pgsl_vector;
    dx: Pgsl_vector;
    g: Pgsl_vector;
    JTJ: Pgsl_matrix;
    sqrt_wts_work: Pgsl_vector;
    sqrt_wts: Pgsl_vector;
    n: Tsize_t;
    p: Tsize_t;
    niter: Tsize_t;
    params: Tgsl_multilarge_nlinear_parameters;
    state: pointer;
  end;
  Pgsl_multilarge_nlinear_workspace = ^Tgsl_multilarge_nlinear_workspace;

function gsl_multilarge_nlinear_alloc(T: Pgsl_multilarge_nlinear_type; params: Pgsl_multilarge_nlinear_parameters; n: Tsize_t; p: Tsize_t): Pgsl_multilarge_nlinear_workspace; cdecl; external libgsl;
procedure gsl_multilarge_nlinear_free(w: Pgsl_multilarge_nlinear_workspace); cdecl; external libgsl;
function gsl_multilarge_nlinear_default_parameters: Tgsl_multilarge_nlinear_parameters; cdecl; external libgsl;
function gsl_multilarge_nlinear_init(x: Pgsl_vector; fdf: Pgsl_multilarge_nlinear_fdf; w: Pgsl_multilarge_nlinear_workspace): longint; cdecl; external libgsl;
function gsl_multilarge_nlinear_winit(x: Pgsl_vector; wts: Pgsl_vector; fdf: Pgsl_multilarge_nlinear_fdf; w: Pgsl_multilarge_nlinear_workspace): longint; cdecl; external libgsl;
function gsl_multilarge_nlinear_iterate(w: Pgsl_multilarge_nlinear_workspace): longint; cdecl; external libgsl;
function gsl_multilarge_nlinear_avratio(w: Pgsl_multilarge_nlinear_workspace): Tdouble; cdecl; external libgsl;
function gsl_multilarge_nlinear_rcond(rcond: Pdouble; w: Pgsl_multilarge_nlinear_workspace): longint; cdecl; external libgsl;
function gsl_multilarge_nlinear_covar(covar: Pgsl_matrix; w: Pgsl_multilarge_nlinear_workspace): longint; cdecl; external libgsl;

type
  Tliner_cp = procedure(iter: Tsize_t; params: pointer; w: Pgsl_multilarge_nlinear_workspace);

function gsl_multilarge_nlinear_driver(maxiter: Tsize_t; xtol: Tdouble; gtol: Tdouble; ftol: Tdouble; callback: Tliner_cp;
  callback_params: pointer; info: Plongint; w: Pgsl_multilarge_nlinear_workspace): longint; cdecl; external libgsl;
function gsl_multilarge_nlinear_name(w: Pgsl_multilarge_nlinear_workspace): pchar; cdecl; external libgsl;
function gsl_multilarge_nlinear_position(w: Pgsl_multilarge_nlinear_workspace): Pgsl_vector; cdecl; external libgsl;
function gsl_multilarge_nlinear_residual(w: Pgsl_multilarge_nlinear_workspace): Pgsl_vector; cdecl; external libgsl;
function gsl_multilarge_nlinear_step(w: Pgsl_multilarge_nlinear_workspace): Pgsl_vector; cdecl; external libgsl;
function gsl_multilarge_nlinear_niter(w: Pgsl_multilarge_nlinear_workspace): Tsize_t; cdecl; external libgsl;
function gsl_multilarge_nlinear_trs_name(w: Pgsl_multilarge_nlinear_workspace): pchar; cdecl; external libgsl;
function gsl_multilarge_nlinear_eval_f(fdf: Pgsl_multilarge_nlinear_fdf; x: Pgsl_vector; swts: Pgsl_vector; y: Pgsl_vector): longint; cdecl; external libgsl;
function gsl_multilarge_nlinear_eval_df(TransJ: TCBLAS_TRANSPOSE_t; x: Pgsl_vector; f: Pgsl_vector; u: Pgsl_vector; swts: Pgsl_vector;
  h: Tdouble; fdtype: Tgsl_multilarge_nlinear_fdtype; fdf: Pgsl_multilarge_nlinear_fdf; v: Pgsl_vector; JTJ: Pgsl_matrix;
  work: Pgsl_vector): longint; cdecl; external libgsl;
function gsl_multilarge_nlinear_eval_fvv(h: Tdouble; x: Pgsl_vector; v: Pgsl_vector; f: Pgsl_vector; swts: Pgsl_vector;
  fdf: Pgsl_multilarge_nlinear_fdf; yvv: Pgsl_vector; work: Pgsl_vector): longint; cdecl; external libgsl;
function gsl_multilarge_nlinear_test(xtol: Tdouble; gtol: Tdouble; ftol: Tdouble; info: Plongint; w: Pgsl_multilarge_nlinear_workspace): longint; cdecl; external libgsl;
function gsl_multilarge_nlinear_df(h: Tdouble; fdtype: Tgsl_multilarge_nlinear_fdtype; x: Pgsl_vector; wts: Pgsl_vector; fdf: Pgsl_multilarge_nlinear_fdf;
  f: Pgsl_vector; J: Pgsl_matrix; work: Pgsl_vector): longint; cdecl; external libgsl;
function gsl_multilarge_nlinear_fdfvv(h: Tdouble; x: Pgsl_vector; v: Pgsl_vector; f: Pgsl_vector; J: Pgsl_matrix;
  swts: Pgsl_vector; fdf: Pgsl_multilarge_nlinear_fdf; fvv: Pgsl_vector; work: Pgsl_vector): longint; cdecl; external libgsl;

var
  gsl_multilarge_nlinear_trust: Pgsl_multilarge_nlinear_type; cvar;external libgsl;
  gsl_multilarge_nlinear_trs_lm: Pgsl_multilarge_nlinear_trs; cvar;external libgsl;
  gsl_multilarge_nlinear_trs_lmaccel: Pgsl_multilarge_nlinear_trs; cvar;external libgsl;
  gsl_multilarge_nlinear_trs_dogleg: Pgsl_multilarge_nlinear_trs; cvar;external libgsl;
  gsl_multilarge_nlinear_trs_ddogleg: Pgsl_multilarge_nlinear_trs; cvar;external libgsl;
  gsl_multilarge_nlinear_trs_subspace2D: Pgsl_multilarge_nlinear_trs; cvar;external libgsl;
  gsl_multilarge_nlinear_trs_cgst: Pgsl_multilarge_nlinear_trs; cvar;external libgsl;
  gsl_multilarge_nlinear_scale_levenberg: Pgsl_multilarge_nlinear_scale; cvar;external libgsl;
  gsl_multilarge_nlinear_scale_marquardt: Pgsl_multilarge_nlinear_scale; cvar;external libgsl;
  gsl_multilarge_nlinear_scale_more: Pgsl_multilarge_nlinear_scale; cvar;external libgsl;
  gsl_multilarge_nlinear_solver_cholesky: Pgsl_multilarge_nlinear_solver; cvar;external libgsl;
  gsl_multilarge_nlinear_solver_mcholesky: Pgsl_multilarge_nlinear_solver; cvar;external libgsl;
  gsl_multilarge_nlinear_solver_none: Pgsl_multilarge_nlinear_solver; cvar;external libgsl;

  // === Konventiert am: 21-8-25 19:43:39 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
