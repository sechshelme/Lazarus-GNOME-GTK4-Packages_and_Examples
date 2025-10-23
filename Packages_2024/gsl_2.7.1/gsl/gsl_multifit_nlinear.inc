{$IFDEF read_interface}


type
  Pgsl_multifit_nlinear_fdtype = ^Tgsl_multifit_nlinear_fdtype;
  Tgsl_multifit_nlinear_fdtype = longint;

const
  GSL_MULTIFIT_NLINEAR_FWDIFF = 0;
  GSL_MULTIFIT_NLINEAR_CTRDIFF = 1;

type
  Tgsl_multifit_nlinear_fdf = record
    f: function(x: Pgsl_vector; params: pointer; f: Pgsl_vector): longint; cdecl;
    df: function(x: Pgsl_vector; params: pointer; df: Pgsl_matrix): longint; cdecl;
    fvv: function(x: Pgsl_vector; v: Pgsl_vector; params: pointer; fvv: Pgsl_vector): longint; cdecl;
    n: Tsize_t;
    p: Tsize_t;
    params: pointer;
    nevalf: Tsize_t;
    nevaldf: Tsize_t;
    nevalfvv: Tsize_t;
  end;
  Pgsl_multifit_nlinear_fdf = ^Tgsl_multifit_nlinear_fdf;

  Tgsl_multifit_nlinear_trs = record
    name: pchar;
    alloc: function(params: pointer; n: Tsize_t; p: Tsize_t): pointer; cdecl;
    init: function(vtrust_state: pointer; vstate: pointer): longint; cdecl;
    preloop: function(vtrust_state: pointer; vstate: pointer): longint; cdecl;
    step: function(vtrust_state: pointer; delta: Tdouble; dx: Pgsl_vector; vstate: pointer): longint; cdecl;
    preduction: function(vtrust_state: pointer; dx: Pgsl_vector; pred: Pdouble; vstate: pointer): longint; cdecl;
    free: procedure(vstate: pointer); cdecl;
  end;
  Pgsl_multifit_nlinear_trs = ^Tgsl_multifit_nlinear_trs;

  Tgsl_multifit_nlinear_scale = record
    name: pchar;
    init: function(J: Pgsl_matrix; diag: Pgsl_vector): longint; cdecl;
    update: function(J: Pgsl_matrix; diag: Pgsl_vector): longint; cdecl;
  end;
  Pgsl_multifit_nlinear_scale = ^Tgsl_multifit_nlinear_scale;

  Tgsl_multifit_nlinear_solver = record
    name: pchar;
    alloc: function(n: Tsize_t; p: Tsize_t): pointer; cdecl;
    init: function(vtrust_state: pointer; vstate: pointer): longint; cdecl;
    presolve: function(mu: Tdouble; vtrust_state: pointer; vstate: pointer): longint; cdecl;
    solve: function(f: Pgsl_vector; x: Pgsl_vector; vtrust_state: pointer; vstate: pointer): longint; cdecl;
    rcond: function(rcond: Pdouble; vstate: pointer): longint; cdecl;
    free: procedure(vstate: pointer); cdecl;
  end;
  Pgsl_multifit_nlinear_solver = ^Tgsl_multifit_nlinear_solver;

  Tgsl_multifit_nlinear_parameters = record
    trs: Pgsl_multifit_nlinear_trs;
    scale: Pgsl_multifit_nlinear_scale;
    solver: Pgsl_multifit_nlinear_solver;
    fdtype: Tgsl_multifit_nlinear_fdtype;
    factor_up: Tdouble;
    factor_down: Tdouble;
    avmax: Tdouble;
    h_df: Tdouble;
    h_fvv: Tdouble;
  end;
  Pgsl_multifit_nlinear_parameters = ^Tgsl_multifit_nlinear_parameters;

  Tgsl_multifit_nlinear_type = record
    name: pchar;
    alloc: function(params: Pgsl_multifit_nlinear_parameters; n: Tsize_t; p: Tsize_t): pointer; cdecl;
    init: function(state: pointer; wts: Pgsl_vector; fdf: Pgsl_multifit_nlinear_fdf; x: Pgsl_vector; f: Pgsl_vector;
      J: Pgsl_matrix; g: Pgsl_vector): longint; cdecl;
    iterate: function(state: pointer; wts: Pgsl_vector; fdf: Pgsl_multifit_nlinear_fdf; x: Pgsl_vector; f: Pgsl_vector;
      J: Pgsl_matrix; g: Pgsl_vector; dx: Pgsl_vector): longint; cdecl;
    rcond: function(rcond: Pdouble; state: pointer): longint; cdecl;
    avratio: function(state: pointer): Tdouble; cdecl;
    free: procedure(state: pointer); cdecl;
  end;
  Pgsl_multifit_nlinear_type = ^Tgsl_multifit_nlinear_type;

  Tgsl_multifit_nlinear_trust_state = record
    x: Pgsl_vector;
    f: Pgsl_vector;
    g: Pgsl_vector;
    J: Pgsl_matrix;
    diag: Pgsl_vector;
    sqrt_wts: Pgsl_vector;
    mu: Pdouble;
    params: Pgsl_multifit_nlinear_parameters;
    solver_state: pointer;
    fdf: Pgsl_multifit_nlinear_fdf;
    avratio: Pdouble;
  end;
  Pgsl_multifit_nlinear_trust_state = ^Tgsl_multifit_nlinear_trust_state;

  Tgsl_multifit_nlinear_workspace = record
    _type: Pgsl_multifit_nlinear_type;
    fdf: Pgsl_multifit_nlinear_fdf;
    x: Pgsl_vector;
    f: Pgsl_vector;
    dx: Pgsl_vector;
    g: Pgsl_vector;
    J: Pgsl_matrix;
    sqrt_wts_work: Pgsl_vector;
    sqrt_wts: Pgsl_vector;
    niter: Tsize_t;
    params: Tgsl_multifit_nlinear_parameters;
    state: pointer;
  end;
  Pgsl_multifit_nlinear_workspace = ^Tgsl_multifit_nlinear_workspace;

function gsl_multifit_nlinear_alloc(T: Pgsl_multifit_nlinear_type; params: Pgsl_multifit_nlinear_parameters; n: Tsize_t; p: Tsize_t): Pgsl_multifit_nlinear_workspace; cdecl; external libgsl;
procedure gsl_multifit_nlinear_free(w: Pgsl_multifit_nlinear_workspace); cdecl; external libgsl;
function gsl_multifit_nlinear_default_parameters: Tgsl_multifit_nlinear_parameters; cdecl; external libgsl;
function gsl_multifit_nlinear_init(x: Pgsl_vector; fdf: Pgsl_multifit_nlinear_fdf; w: Pgsl_multifit_nlinear_workspace): longint; cdecl; external libgsl;
function gsl_multifit_nlinear_winit(x: Pgsl_vector; wts: Pgsl_vector; fdf: Pgsl_multifit_nlinear_fdf; w: Pgsl_multifit_nlinear_workspace): longint; cdecl; external libgsl;
function gsl_multifit_nlinear_iterate(w: Pgsl_multifit_nlinear_workspace): longint; cdecl; external libgsl;
function gsl_multifit_nlinear_avratio(w: Pgsl_multifit_nlinear_workspace): Tdouble; cdecl; external libgsl;

type
  tnliner_func = procedure(iter: Tsize_t; params: pointer; w: Pgsl_multifit_nlinear_workspace);

function gsl_multifit_nlinear_driver(maxiter: Tsize_t; xtol: Tdouble; gtol: Tdouble; ftol: Tdouble; callback: tnliner_func;
  callback_params: pointer; info: Plongint; w: Pgsl_multifit_nlinear_workspace): longint; cdecl; external libgsl;
function gsl_multifit_nlinear_jac(w: Pgsl_multifit_nlinear_workspace): Pgsl_matrix; cdecl; external libgsl;
function gsl_multifit_nlinear_name(w: Pgsl_multifit_nlinear_workspace): pchar; cdecl; external libgsl;
function gsl_multifit_nlinear_position(w: Pgsl_multifit_nlinear_workspace): Pgsl_vector; cdecl; external libgsl;
function gsl_multifit_nlinear_residual(w: Pgsl_multifit_nlinear_workspace): Pgsl_vector; cdecl; external libgsl;
function gsl_multifit_nlinear_niter(w: Pgsl_multifit_nlinear_workspace): Tsize_t; cdecl; external libgsl;
function gsl_multifit_nlinear_rcond(rcond: Pdouble; w: Pgsl_multifit_nlinear_workspace): longint; cdecl; external libgsl;
function gsl_multifit_nlinear_trs_name(w: Pgsl_multifit_nlinear_workspace): pchar; cdecl; external libgsl;
function gsl_multifit_nlinear_eval_f(fdf: Pgsl_multifit_nlinear_fdf; x: Pgsl_vector; swts: Pgsl_vector; y: Pgsl_vector): longint; cdecl; external libgsl;
function gsl_multifit_nlinear_eval_df(x: Pgsl_vector; f: Pgsl_vector; swts: Pgsl_vector; h: Tdouble; fdtype: Tgsl_multifit_nlinear_fdtype;
  fdf: Pgsl_multifit_nlinear_fdf; df: Pgsl_matrix; work: Pgsl_vector): longint; cdecl; external libgsl;
function gsl_multifit_nlinear_eval_fvv(h: Tdouble; x: Pgsl_vector; v: Pgsl_vector; f: Pgsl_vector; J: Pgsl_matrix;
  swts: Pgsl_vector; fdf: Pgsl_multifit_nlinear_fdf; yvv: Pgsl_vector; work: Pgsl_vector): longint; cdecl; external libgsl;
function gsl_multifit_nlinear_covar(J: Pgsl_matrix; epsrel: Tdouble; covar: Pgsl_matrix): longint; cdecl; external libgsl;
function gsl_multifit_nlinear_test(xtol: Tdouble; gtol: Tdouble; ftol: Tdouble; info: Plongint; w: Pgsl_multifit_nlinear_workspace): longint; cdecl; external libgsl;
function gsl_multifit_nlinear_df(h: Tdouble; fdtype: Tgsl_multifit_nlinear_fdtype; x: Pgsl_vector; wts: Pgsl_vector; fdf: Pgsl_multifit_nlinear_fdf;
  f: Pgsl_vector; J: Pgsl_matrix; work: Pgsl_vector): longint; cdecl; external libgsl;
function gsl_multifit_nlinear_fdfvv(h: Tdouble; x: Pgsl_vector; v: Pgsl_vector; f: Pgsl_vector; J: Pgsl_matrix;
  swts: Pgsl_vector; fdf: Pgsl_multifit_nlinear_fdf; fvv: Pgsl_vector; work: Pgsl_vector): longint; cdecl; external libgsl;

var
  gsl_multifit_nlinear_trust: Pgsl_multifit_nlinear_type; cvar;external libgsl;
  gsl_multifit_nlinear_trs_lm: Pgsl_multifit_nlinear_trs; cvar;external libgsl;
  gsl_multifit_nlinear_trs_lmaccel: Pgsl_multifit_nlinear_trs; cvar;external libgsl;
  gsl_multifit_nlinear_trs_dogleg: Pgsl_multifit_nlinear_trs; cvar;external libgsl;
  gsl_multifit_nlinear_trs_ddogleg: Pgsl_multifit_nlinear_trs; cvar;external libgsl;
  gsl_multifit_nlinear_trs_subspace2D: Pgsl_multifit_nlinear_trs; cvar;external libgsl;
  gsl_multifit_nlinear_scale_levenberg: Pgsl_multifit_nlinear_scale; cvar;external libgsl;
  gsl_multifit_nlinear_scale_marquardt: Pgsl_multifit_nlinear_scale; cvar;external libgsl;
  gsl_multifit_nlinear_scale_more: Pgsl_multifit_nlinear_scale; cvar;external libgsl;
  gsl_multifit_nlinear_solver_cholesky: Pgsl_multifit_nlinear_solver; cvar;external libgsl;
  gsl_multifit_nlinear_solver_mcholesky: Pgsl_multifit_nlinear_solver; cvar;external libgsl;
  gsl_multifit_nlinear_solver_qr: Pgsl_multifit_nlinear_solver; cvar;external libgsl;
  gsl_multifit_nlinear_solver_svd: Pgsl_multifit_nlinear_solver; cvar;external libgsl;

  // === Konventiert am: 21-8-25 19:43:34 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
