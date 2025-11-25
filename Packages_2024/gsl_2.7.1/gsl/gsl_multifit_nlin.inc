{$IFDEF read_interface}



function gsl_multifit_gradient(J: Pgsl_matrix; f: Pgsl_vector; g: Pgsl_vector): longint; cdecl; external libgsl;
function gsl_multifit_covar(J: Pgsl_matrix; epsrel: Tdouble; covar: Pgsl_matrix): longint; cdecl; external libgsl;
function gsl_multifit_covar_QRPT(r: Pgsl_matrix; perm: Pgsl_permutation; epsrel: Tdouble; covar: Pgsl_matrix): longint; cdecl; external libgsl;

type
  Tgsl_multifit_function_struct = record
    f: function(x: Pgsl_vector; params: pointer; f: Pgsl_vector): longint; cdecl;
    n: Tsize_t;
    p: Tsize_t;
    params: pointer;
  end;
  Pgsl_multifit_function_struct = ^Tgsl_multifit_function_struct;

  Tgsl_multifit_function = Tgsl_multifit_function_struct;
  Pgsl_multifit_function = ^Tgsl_multifit_function;

  Tgsl_multifit_fsolver_type = record
    name: pchar;
    size: Tsize_t;
    alloc: function(state: pointer; n: Tsize_t; p: Tsize_t): longint; cdecl;
    set_: function(state: pointer; _function: Pgsl_multifit_function; x: Pgsl_vector; f: Pgsl_vector; dx: Pgsl_vector): longint; cdecl;
    iterate: function(state: pointer; _function: Pgsl_multifit_function; x: Pgsl_vector; f: Pgsl_vector; dx: Pgsl_vector): longint; cdecl;
    free: procedure(state: pointer); cdecl;
  end;
  Pgsl_multifit_fsolver_type = ^Tgsl_multifit_fsolver_type;

  Tgsl_multifit_fsolver = record
    _type: Pgsl_multifit_fsolver_type;
    _function: Pgsl_multifit_function;
    x: Pgsl_vector;
    f: Pgsl_vector;
    dx: Pgsl_vector;
    state: pointer;
  end;
  Pgsl_multifit_fsolver = ^Tgsl_multifit_fsolver;

function gsl_multifit_fsolver_alloc(T: Pgsl_multifit_fsolver_type; n: Tsize_t; p: Tsize_t): Pgsl_multifit_fsolver; cdecl; external libgsl;
procedure gsl_multifit_fsolver_free(s: Pgsl_multifit_fsolver); cdecl; external libgsl;
function gsl_multifit_fsolver_set(s: Pgsl_multifit_fsolver; f: Pgsl_multifit_function; x: Pgsl_vector): longint; cdecl; external libgsl;
function gsl_multifit_fsolver_iterate(s: Pgsl_multifit_fsolver): longint; cdecl; external libgsl;
function gsl_multifit_fsolver_driver(s: Pgsl_multifit_fsolver; maxiter: Tsize_t; epsabs: Tdouble; epsrel: Tdouble): longint; cdecl; external libgsl;
function gsl_multifit_fsolver_name(s: Pgsl_multifit_fsolver): pchar; cdecl; external libgsl;
function gsl_multifit_fsolver_position(s: Pgsl_multifit_fsolver): Pgsl_vector; cdecl; external libgsl;

type
  Tgsl_multifit_function_fdf_struct = record
    f: function(x: Pgsl_vector; params: pointer; f: Pgsl_vector): longint; cdecl;
    df: function(x: Pgsl_vector; params: pointer; df: Pgsl_matrix): longint; cdecl;
    fdf: function(x: Pgsl_vector; params: pointer; f: Pgsl_vector; df: Pgsl_matrix): longint; cdecl;
    n: Tsize_t;
    p: Tsize_t;
    params: pointer;
    nevalf: Tsize_t;
    nevaldf: Tsize_t;
  end;
  Pgsl_multifit_function_fdf_struct = ^Tgsl_multifit_function_fdf_struct;

  Tgsl_multifit_function_fdf = Tgsl_multifit_function_fdf_struct;
  Pgsl_multifit_function_fdf = ^Tgsl_multifit_function_fdf;

  Tgsl_multifit_fdfsolver_type = record
    name: pchar;
    size: Tsize_t;
    alloc: function(state: pointer; n: Tsize_t; p: Tsize_t): longint; cdecl;
    set_: function(state: pointer; wts: Pgsl_vector; fdf: Pgsl_multifit_function_fdf; x: Pgsl_vector; f: Pgsl_vector; dx: Pgsl_vector): longint; cdecl;
    iterate: function(state: pointer; wts: Pgsl_vector; fdf: Pgsl_multifit_function_fdf; x: Pgsl_vector; f: Pgsl_vector; dx: Pgsl_vector): longint; cdecl;
    gradient: function(state: pointer; g: Pgsl_vector): longint; cdecl;
    jac: function(state: pointer; J: Pgsl_matrix): longint; cdecl;
    free: procedure(state: pointer); cdecl;
  end;
  Pgsl_multifit_fdfsolver_type = ^Tgsl_multifit_fdfsolver_type;

  Tgsl_multifit_fdfsolver = record
    _type: Pgsl_multifit_fdfsolver_type;
    fdf: Pgsl_multifit_function_fdf;
    x: Pgsl_vector;
    f: Pgsl_vector;
    dx: Pgsl_vector;
    g: Pgsl_vector;
    sqrt_wts: Pgsl_vector;
    niter: Tsize_t;
    state: pointer;
  end;
  Pgsl_multifit_fdfsolver = ^Tgsl_multifit_fdfsolver;

function gsl_multifit_fdfsolver_alloc(T: Pgsl_multifit_fdfsolver_type; n: Tsize_t; p: Tsize_t): Pgsl_multifit_fdfsolver; cdecl; external libgsl;
function gsl_multifit_fdfsolver_set(s: Pgsl_multifit_fdfsolver; fdf: Pgsl_multifit_function_fdf; x: Pgsl_vector): longint; cdecl; external libgsl;
function gsl_multifit_fdfsolver_wset(s: Pgsl_multifit_fdfsolver; f: Pgsl_multifit_function_fdf; x: Pgsl_vector; wts: Pgsl_vector): longint; cdecl; external libgsl;
function gsl_multifit_fdfsolver_iterate(s: Pgsl_multifit_fdfsolver): longint; cdecl; external libgsl;
function gsl_multifit_fdfsolver_driver(s: Pgsl_multifit_fdfsolver; maxiter: Tsize_t; xtol: Tdouble; gtol: Tdouble; ftol: Tdouble;
  info: Plongint): longint; cdecl; external libgsl;
function gsl_multifit_fdfsolver_jac(s: Pgsl_multifit_fdfsolver; J: Pgsl_matrix): longint; cdecl; external libgsl;
procedure gsl_multifit_fdfsolver_free(s: Pgsl_multifit_fdfsolver); cdecl; external libgsl;
function gsl_multifit_fdfsolver_name(s: Pgsl_multifit_fdfsolver): pchar; cdecl; external libgsl;
function gsl_multifit_fdfsolver_position(s: Pgsl_multifit_fdfsolver): Pgsl_vector; cdecl; external libgsl;
function gsl_multifit_fdfsolver_residual(s: Pgsl_multifit_fdfsolver): Pgsl_vector; cdecl; external libgsl;
function gsl_multifit_fdfsolver_niter(s: Pgsl_multifit_fdfsolver): Tsize_t; cdecl; external libgsl;
function gsl_multifit_eval_wf(fdf: Pgsl_multifit_function_fdf; x: Pgsl_vector; wts: Pgsl_vector; y: Pgsl_vector): longint; cdecl; external libgsl;
function gsl_multifit_eval_wdf(fdf: Pgsl_multifit_function_fdf; x: Pgsl_vector; wts: Pgsl_vector; dy: Pgsl_matrix): longint; cdecl; external libgsl;
function gsl_multifit_fdfsolver_test(s: Pgsl_multifit_fdfsolver; xtol: Tdouble; gtol: Tdouble; ftol: Tdouble; info: Plongint): longint; cdecl; external libgsl;
function gsl_multifit_test_delta(dx: Pgsl_vector; x: Pgsl_vector; epsabs: Tdouble; epsrel: Tdouble): longint; cdecl; external libgsl;
function gsl_multifit_test_gradient(g: Pgsl_vector; epsabs: Tdouble): longint; cdecl; external libgsl;
function gsl_multifit_fdfsolver_dif_df(x: Pgsl_vector; wts: Pgsl_vector; fdf: Pgsl_multifit_function_fdf; f: Pgsl_vector; J: Pgsl_matrix): longint; cdecl; external libgsl;
function gsl_multifit_fdfsolver_dif_fdf(x: Pgsl_vector; fdf: Pgsl_multifit_function_fdf; f: Pgsl_vector; J: Pgsl_matrix): longint; cdecl; external libgsl;

type
  Tgsl_multifit_fdfridge = record
    n: Tsize_t;
    p: Tsize_t;
    lambda: Tdouble;
    L_diag: Pgsl_vector;
    L: Pgsl_matrix;
    f: Pgsl_vector;
    wts: Pgsl_vector;
    s: Pgsl_multifit_fdfsolver;
    fdf: Pgsl_multifit_function_fdf;
    fdftik: Tgsl_multifit_function_fdf;
  end;
  Pgsl_multifit_fdfridge = ^Tgsl_multifit_fdfridge;

function gsl_multifit_fdfridge_alloc(T: Pgsl_multifit_fdfsolver_type; n: Tsize_t; p: Tsize_t): Pgsl_multifit_fdfridge; cdecl; external libgsl;
procedure gsl_multifit_fdfridge_free(work: Pgsl_multifit_fdfridge); cdecl; external libgsl;
function gsl_multifit_fdfridge_name(w: Pgsl_multifit_fdfridge): pchar; cdecl; external libgsl;
function gsl_multifit_fdfridge_position(w: Pgsl_multifit_fdfridge): Pgsl_vector; cdecl; external libgsl;
function gsl_multifit_fdfridge_residual(w: Pgsl_multifit_fdfridge): Pgsl_vector; cdecl; external libgsl;
function gsl_multifit_fdfridge_niter(w: Pgsl_multifit_fdfridge): Tsize_t; cdecl; external libgsl;
function gsl_multifit_fdfridge_set(w: Pgsl_multifit_fdfridge; f: Pgsl_multifit_function_fdf; x: Pgsl_vector; lambda: Tdouble): longint; cdecl; external libgsl;
function gsl_multifit_fdfridge_wset(w: Pgsl_multifit_fdfridge; f: Pgsl_multifit_function_fdf; x: Pgsl_vector; lambda: Tdouble; wts: Pgsl_vector): longint; cdecl; external libgsl;
function gsl_multifit_fdfridge_set2(w: Pgsl_multifit_fdfridge; f: Pgsl_multifit_function_fdf; x: Pgsl_vector; lambda: Pgsl_vector): longint; cdecl; external libgsl;
function gsl_multifit_fdfridge_wset2(w: Pgsl_multifit_fdfridge; f: Pgsl_multifit_function_fdf; x: Pgsl_vector; lambda: Pgsl_vector; wts: Pgsl_vector): longint; cdecl; external libgsl;
function gsl_multifit_fdfridge_set3(w: Pgsl_multifit_fdfridge; f: Pgsl_multifit_function_fdf; x: Pgsl_vector; L: Pgsl_matrix): longint; cdecl; external libgsl;
function gsl_multifit_fdfridge_wset3(w: Pgsl_multifit_fdfridge; f: Pgsl_multifit_function_fdf; x: Pgsl_vector; L: Pgsl_matrix; wts: Pgsl_vector): longint; cdecl; external libgsl;
function gsl_multifit_fdfridge_iterate(w: Pgsl_multifit_fdfridge): longint; cdecl; external libgsl;
function gsl_multifit_fdfridge_driver(w: Pgsl_multifit_fdfridge; maxiter: Tsize_t; xtol: Tdouble; gtol: Tdouble; ftol: Tdouble;
  info: Plongint): longint; cdecl; external libgsl;

var
  gsl_multifit_fdfsolver_lmsder: Pgsl_multifit_fdfsolver_type; cvar;external libgsl;
  gsl_multifit_fdfsolver_lmder: Pgsl_multifit_fdfsolver_type; cvar;external libgsl;
  gsl_multifit_fdfsolver_lmniel: Pgsl_multifit_fdfsolver_type; cvar;external libgsl;

  // === Konventiert am: 21-8-25 19:43:32 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
