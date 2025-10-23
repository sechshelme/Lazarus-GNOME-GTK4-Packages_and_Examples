{$IFDEF read_interface}


type
  Tgsl_multimin_function_struct = record
    f: function(x: Pgsl_vector; params: pointer): Tdouble; cdecl;
    n: Tsize_t;
    params: pointer;
  end;
  Pgsl_multimin_function_struct = ^Tgsl_multimin_function_struct;

  Tgsl_multimin_function = Tgsl_multimin_function_struct;
  Pgsl_multimin_function = ^Tgsl_multimin_function;

type
  Tgsl_multimin_function_fdf_struct = record
    f: function(x: Pgsl_vector; params: pointer): Tdouble; cdecl;
    df: procedure(x: Pgsl_vector; params: pointer; df: Pgsl_vector); cdecl;
    fdf: procedure(x: Pgsl_vector; params: pointer; f: Pdouble; df: Pgsl_vector); cdecl;
    n: Tsize_t;
    params: pointer;
  end;
  Pgsl_multimin_function_fdf_struct = ^Tgsl_multimin_function_fdf_struct;

  Tgsl_multimin_function_fdf = Tgsl_multimin_function_fdf_struct;
  Pgsl_multimin_function_fdf = ^Tgsl_multimin_function_fdf;


function gsl_multimin_diff(f: Pgsl_multimin_function; x: Pgsl_vector; g: Pgsl_vector): longint; cdecl; external libgsl;

type
  Tgsl_multimin_fminimizer_type = record
    name: pchar;
    size: Tsize_t;
    alloc: function(state: pointer; n: Tsize_t): longint; cdecl;
    set_: function(state: pointer; f: Pgsl_multimin_function; x: Pgsl_vector; size: Pdouble; step_size: Pgsl_vector): longint; cdecl;
    iterate: function(state: pointer; f: Pgsl_multimin_function; x: Pgsl_vector; size: Pdouble; fval: Pdouble): longint; cdecl;
    free: procedure(state: pointer); cdecl;
  end;
  Pgsl_multimin_fminimizer_type = ^Tgsl_multimin_fminimizer_type;

  Tgsl_multimin_fminimizer = record
    _type: Pgsl_multimin_fminimizer_type;
    f: Pgsl_multimin_function;
    fval: Tdouble;
    x: Pgsl_vector;
    size: Tdouble;
    state: pointer;
  end;
  Pgsl_multimin_fminimizer = ^Tgsl_multimin_fminimizer;

function gsl_multimin_fminimizer_alloc(T: Pgsl_multimin_fminimizer_type; n: Tsize_t): Pgsl_multimin_fminimizer; cdecl; external libgsl;
function gsl_multimin_fminimizer_set(s: Pgsl_multimin_fminimizer; f: Pgsl_multimin_function; x: Pgsl_vector; step_size: Pgsl_vector): longint; cdecl; external libgsl;
procedure gsl_multimin_fminimizer_free(s: Pgsl_multimin_fminimizer); cdecl; external libgsl;
function gsl_multimin_fminimizer_name(s: Pgsl_multimin_fminimizer): pchar; cdecl; external libgsl;
function gsl_multimin_fminimizer_iterate(s: Pgsl_multimin_fminimizer): longint; cdecl; external libgsl;
function gsl_multimin_fminimizer_x(s: Pgsl_multimin_fminimizer): Pgsl_vector; cdecl; external libgsl;
function gsl_multimin_fminimizer_minimum(s: Pgsl_multimin_fminimizer): Tdouble; cdecl; external libgsl;
function gsl_multimin_fminimizer_size(s: Pgsl_multimin_fminimizer): Tdouble; cdecl; external libgsl;

function gsl_multimin_test_gradient(g: Pgsl_vector; epsabs: Tdouble): longint; cdecl; external libgsl;
function gsl_multimin_test_size(size: Tdouble; epsabs: Tdouble): longint; cdecl; external libgsl;

type
  Tgsl_multimin_fdfminimizer_type = record
    name: pchar;
    size: Tsize_t;
    alloc: function(state: pointer; n: Tsize_t): longint; cdecl;
    set_: function(state: pointer; fdf: Pgsl_multimin_function_fdf; x: Pgsl_vector; f: Pdouble; gradient: Pgsl_vector;
      step_size: Tdouble; tol: Tdouble): longint; cdecl;
    iterate: function(state: pointer; fdf: Pgsl_multimin_function_fdf; x: Pgsl_vector; f: Pdouble; gradient: Pgsl_vector;
      dx: Pgsl_vector): longint; cdecl;
    restart: function(state: pointer): longint; cdecl;
    free: procedure(state: pointer); cdecl;
  end;
  Pgsl_multimin_fdfminimizer_type = ^Tgsl_multimin_fdfminimizer_type;

  Tgsl_multimin_fdfminimizer = record
    _type: Pgsl_multimin_fdfminimizer_type;
    fdf: Pgsl_multimin_function_fdf;
    f: Tdouble;
    x: Pgsl_vector;
    gradient: Pgsl_vector;
    dx: Pgsl_vector;
    state: pointer;
  end;
  Pgsl_multimin_fdfminimizer = ^Tgsl_multimin_fdfminimizer;

function gsl_multimin_fdfminimizer_alloc(T: Pgsl_multimin_fdfminimizer_type; n: Tsize_t): Pgsl_multimin_fdfminimizer; cdecl; external libgsl;
function gsl_multimin_fdfminimizer_set(s: Pgsl_multimin_fdfminimizer; fdf: Pgsl_multimin_function_fdf; x: Pgsl_vector; step_size: Tdouble; tol: Tdouble): longint; cdecl; external libgsl;
procedure gsl_multimin_fdfminimizer_free(s: Pgsl_multimin_fdfminimizer); cdecl; external libgsl;
function gsl_multimin_fdfminimizer_name(s: Pgsl_multimin_fdfminimizer): pchar; cdecl; external libgsl;
function gsl_multimin_fdfminimizer_iterate(s: Pgsl_multimin_fdfminimizer): longint; cdecl; external libgsl;
function gsl_multimin_fdfminimizer_restart(s: Pgsl_multimin_fdfminimizer): longint; cdecl; external libgsl;
function gsl_multimin_fdfminimizer_x(s: Pgsl_multimin_fdfminimizer): Pgsl_vector; cdecl; external libgsl;
function gsl_multimin_fdfminimizer_dx(s: Pgsl_multimin_fdfminimizer): Pgsl_vector; cdecl; external libgsl;
function gsl_multimin_fdfminimizer_gradient(s: Pgsl_multimin_fdfminimizer): Pgsl_vector; cdecl; external libgsl;
function gsl_multimin_fdfminimizer_minimum(s: Pgsl_multimin_fdfminimizer): Tdouble; cdecl; external libgsl;

var
  gsl_multimin_fdfminimizer_steepest_descent: Pgsl_multimin_fdfminimizer_type; cvar;external libgsl;
  gsl_multimin_fdfminimizer_conjugate_pr: Pgsl_multimin_fdfminimizer_type; cvar;external libgsl;
  gsl_multimin_fdfminimizer_conjugate_fr: Pgsl_multimin_fdfminimizer_type; cvar;external libgsl;
  gsl_multimin_fdfminimizer_vector_bfgs: Pgsl_multimin_fdfminimizer_type; cvar;external libgsl;
  gsl_multimin_fdfminimizer_vector_bfgs2: Pgsl_multimin_fdfminimizer_type; cvar;external libgsl;
  gsl_multimin_fminimizer_nmsimplex: Pgsl_multimin_fminimizer_type; cvar;external libgsl;
  gsl_multimin_fminimizer_nmsimplex2: Pgsl_multimin_fminimizer_type; cvar;external libgsl;
  gsl_multimin_fminimizer_nmsimplex2rand: Pgsl_multimin_fminimizer_type; cvar;external libgsl;

  // === Konventiert am: 21-8-25 19:43:42 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}




{$ENDIF read_implementation}
