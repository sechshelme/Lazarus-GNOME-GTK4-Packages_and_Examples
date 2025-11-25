{$IFDEF read_interface}


type
  Tgsl_multiroot_function_struct = record
    f: function(x: Pgsl_vector; params: pointer; f: Pgsl_vector): longint; cdecl;
    n: Tsize_t;
    params: pointer;
  end;
  Pgsl_multiroot_function_struct = ^Tgsl_multiroot_function_struct;

  Tgsl_multiroot_function = Tgsl_multiroot_function_struct;
  Pgsl_multiroot_function = ^Tgsl_multiroot_function;

function gsl_multiroot_fdjacobian(F: Pgsl_multiroot_function; x: Pgsl_vector; fv: Pgsl_vector; epsrel: Tdouble; jacobian: Pgsl_matrix): longint; cdecl; external libgsl;

type
  Tgsl_multiroot_fsolver_type = record
    name: pchar;
    size: Tsize_t;
    alloc: function(state: pointer; n: Tsize_t): longint; cdecl;
    set_: function(state: pointer; _function: Pgsl_multiroot_function; x: Pgsl_vector; f: Pgsl_vector; dx: Pgsl_vector): longint; cdecl;
    iterate: function(state: pointer; _function: Pgsl_multiroot_function; x: Pgsl_vector; f: Pgsl_vector; dx: Pgsl_vector): longint; cdecl;
    free: procedure(state: pointer); cdecl;
  end;
  Pgsl_multiroot_fsolver_type = ^Tgsl_multiroot_fsolver_type;

  Tgsl_multiroot_fsolver = record
    _type: Pgsl_multiroot_fsolver_type;
    _function: Pgsl_multiroot_function;
    x: Pgsl_vector;
    f: Pgsl_vector;
    dx: Pgsl_vector;
    state: pointer;
  end;
  Pgsl_multiroot_fsolver = ^Tgsl_multiroot_fsolver;

function gsl_multiroot_fsolver_alloc(T: Pgsl_multiroot_fsolver_type; n: Tsize_t): Pgsl_multiroot_fsolver; cdecl; external libgsl;
procedure gsl_multiroot_fsolver_free(s: Pgsl_multiroot_fsolver); cdecl; external libgsl;
function gsl_multiroot_fsolver_set(s: Pgsl_multiroot_fsolver; f: Pgsl_multiroot_function; x: Pgsl_vector): longint; cdecl; external libgsl;
function gsl_multiroot_fsolver_iterate(s: Pgsl_multiroot_fsolver): longint; cdecl; external libgsl;
function gsl_multiroot_fsolver_name(s: Pgsl_multiroot_fsolver): pchar; cdecl; external libgsl;
function gsl_multiroot_fsolver_root(s: Pgsl_multiroot_fsolver): Pgsl_vector; cdecl; external libgsl;
function gsl_multiroot_fsolver_dx(s: Pgsl_multiroot_fsolver): Pgsl_vector; cdecl; external libgsl;
function gsl_multiroot_fsolver_f(s: Pgsl_multiroot_fsolver): Pgsl_vector; cdecl; external libgsl;

type
  Tgsl_multiroot_function_fdf_struct = record
    f: function(x: Pgsl_vector; params: pointer; f: Pgsl_vector): longint; cdecl;
    df: function(x: Pgsl_vector; params: pointer; df: Pgsl_matrix): longint; cdecl;
    fdf: function(x: Pgsl_vector; params: pointer; f: Pgsl_vector; df: Pgsl_matrix): longint; cdecl;
    n: Tsize_t;
    params: pointer;
  end;
  Pgsl_multiroot_function_fdf_struct = ^Tgsl_multiroot_function_fdf_struct;

  Tgsl_multiroot_function_fdf = Tgsl_multiroot_function_fdf_struct;
  Pgsl_multiroot_function_fdf = ^Tgsl_multiroot_function_fdf;

type
  Tgsl_multiroot_fdfsolver_type = record
    name: pchar;
    size: Tsize_t;
    alloc: function(state: pointer; n: Tsize_t): longint; cdecl;
    set_: function(state: pointer; fdf: Pgsl_multiroot_function_fdf; x: Pgsl_vector; f: Pgsl_vector; J: Pgsl_matrix; dx: Pgsl_vector): longint; cdecl;
    iterate: function(state: pointer; fdf: Pgsl_multiroot_function_fdf; x: Pgsl_vector; f: Pgsl_vector; J: Pgsl_matrix; dx: Pgsl_vector): longint; cdecl;
    free: procedure(state: pointer); cdecl;
  end;
  Pgsl_multiroot_fdfsolver_type = ^Tgsl_multiroot_fdfsolver_type;

  Tgsl_multiroot_fdfsolver = record
    _type: Pgsl_multiroot_fdfsolver_type;
    fdf: Pgsl_multiroot_function_fdf;
    x: Pgsl_vector;
    f: Pgsl_vector;
    J: Pgsl_matrix;
    dx: Pgsl_vector;
    state: pointer;
  end;
  Pgsl_multiroot_fdfsolver = ^Tgsl_multiroot_fdfsolver;

function gsl_multiroot_fdfsolver_alloc(T: Pgsl_multiroot_fdfsolver_type; n: Tsize_t): Pgsl_multiroot_fdfsolver; cdecl; external libgsl;
function gsl_multiroot_fdfsolver_set(s: Pgsl_multiroot_fdfsolver; fdf: Pgsl_multiroot_function_fdf; x: Pgsl_vector): longint; cdecl; external libgsl;
function gsl_multiroot_fdfsolver_iterate(s: Pgsl_multiroot_fdfsolver): longint; cdecl; external libgsl;
procedure gsl_multiroot_fdfsolver_free(s: Pgsl_multiroot_fdfsolver); cdecl; external libgsl;
function gsl_multiroot_fdfsolver_name(s: Pgsl_multiroot_fdfsolver): pchar; cdecl; external libgsl;
function gsl_multiroot_fdfsolver_root(s: Pgsl_multiroot_fdfsolver): Pgsl_vector; cdecl; external libgsl;
function gsl_multiroot_fdfsolver_dx(s: Pgsl_multiroot_fdfsolver): Pgsl_vector; cdecl; external libgsl;
function gsl_multiroot_fdfsolver_f(s: Pgsl_multiroot_fdfsolver): Pgsl_vector; cdecl; external libgsl;
function gsl_multiroot_test_delta(dx: Pgsl_vector; x: Pgsl_vector; epsabs: Tdouble; epsrel: Tdouble): longint; cdecl; external libgsl;
function gsl_multiroot_test_residual(f: Pgsl_vector; epsabs: Tdouble): longint; cdecl; external libgsl;

var
  gsl_multiroot_fsolver_dnewton: Pgsl_multiroot_fsolver_type; cvar;external libgsl;
  gsl_multiroot_fsolver_broyden: Pgsl_multiroot_fsolver_type; cvar;external libgsl;
  gsl_multiroot_fsolver_hybrid: Pgsl_multiroot_fsolver_type; cvar;external libgsl;
  gsl_multiroot_fsolver_hybrids: Pgsl_multiroot_fsolver_type; cvar;external libgsl;
  gsl_multiroot_fdfsolver_newton: Pgsl_multiroot_fdfsolver_type; cvar;external libgsl;
  gsl_multiroot_fdfsolver_gnewton: Pgsl_multiroot_fdfsolver_type; cvar;external libgsl;
  gsl_multiroot_fdfsolver_hybridj: Pgsl_multiroot_fdfsolver_type; cvar;external libgsl;
  gsl_multiroot_fdfsolver_hybridsj: Pgsl_multiroot_fdfsolver_type; cvar;external libgsl;

  // === Konventiert am: 21-8-25 19:43:44 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


{$ENDIF read_implementation}
