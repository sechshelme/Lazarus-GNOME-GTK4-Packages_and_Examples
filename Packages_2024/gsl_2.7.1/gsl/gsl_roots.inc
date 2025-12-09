{$IFDEF read_interface}


type
  Tgsl_root_fsolver_type = record
    name: pchar;
    size: Tsize_t;
    set_: function(state: pointer; f: Pgsl_function; root: Pdouble; x_lower: double; x_upper: double): longint; cdecl;
    iterate: function(state: pointer; f: Pgsl_function; root: Pdouble; x_lower: Pdouble; x_upper: Pdouble): longint; cdecl;
  end;
  Pgsl_root_fsolver_type = ^Tgsl_root_fsolver_type;

  Tgsl_root_fsolver = record
    _type: Pgsl_root_fsolver_type;
    _function: Pgsl_function;
    root: double;
    x_lower: double;
    x_upper: double;
    state: pointer;
  end;
  Pgsl_root_fsolver = ^Tgsl_root_fsolver;

  Tgsl_root_fdfsolver_type = record
    name: pchar;
    size: Tsize_t;
    set_: function(state: pointer; f: Pgsl_function_fdf; root: Pdouble): longint; cdecl;
    iterate: function(state: pointer; f: Pgsl_function_fdf; root: Pdouble): longint; cdecl;
  end;
  Pgsl_root_fdfsolver_type = ^Tgsl_root_fdfsolver_type;

  Tgsl_root_fdfsolver = record
    _type: Pgsl_root_fdfsolver_type;
    fdf: Pgsl_function_fdf;
    root: double;
    state: pointer;
  end;
  Pgsl_root_fdfsolver = ^Tgsl_root_fdfsolver;

function gsl_root_fsolver_alloc(T: Pgsl_root_fsolver_type): Pgsl_root_fsolver; cdecl; external libgsl;
procedure gsl_root_fsolver_free(s: Pgsl_root_fsolver); cdecl; external libgsl;
function gsl_root_fsolver_set(s: Pgsl_root_fsolver; f: Pgsl_function; x_lower: double; x_upper: double): longint; cdecl; external libgsl;
function gsl_root_fsolver_iterate(s: Pgsl_root_fsolver): longint; cdecl; external libgsl;
function gsl_root_fsolver_name(s: Pgsl_root_fsolver): pchar; cdecl; external libgsl;
function gsl_root_fsolver_root(s: Pgsl_root_fsolver): double; cdecl; external libgsl;
function gsl_root_fsolver_x_lower(s: Pgsl_root_fsolver): double; cdecl; external libgsl;
function gsl_root_fsolver_x_upper(s: Pgsl_root_fsolver): double; cdecl; external libgsl;
function gsl_root_fdfsolver_alloc(T: Pgsl_root_fdfsolver_type): Pgsl_root_fdfsolver; cdecl; external libgsl;
function gsl_root_fdfsolver_set(s: Pgsl_root_fdfsolver; fdf: Pgsl_function_fdf; root: double): longint; cdecl; external libgsl;
function gsl_root_fdfsolver_iterate(s: Pgsl_root_fdfsolver): longint; cdecl; external libgsl;
procedure gsl_root_fdfsolver_free(s: Pgsl_root_fdfsolver); cdecl; external libgsl;
function gsl_root_fdfsolver_name(s: Pgsl_root_fdfsolver): pchar; cdecl; external libgsl;
function gsl_root_fdfsolver_root(s: Pgsl_root_fdfsolver): double; cdecl; external libgsl;
function gsl_root_test_interval(x_lower: double; x_upper: double; epsabs: double; epsrel: double): longint; cdecl; external libgsl;
function gsl_root_test_residual(f: double; epsabs: double): longint; cdecl; external libgsl;
function gsl_root_test_delta(x1: double; x0: double; epsabs: double; epsrel: double): longint; cdecl; external libgsl;

var
  gsl_root_fsolver_bisection: Pgsl_root_fsolver_type; cvar;external libgsl;
  gsl_root_fsolver_brent: Pgsl_root_fsolver_type; cvar;external libgsl;
  gsl_root_fsolver_falsepos: Pgsl_root_fsolver_type; cvar;external libgsl;
  gsl_root_fdfsolver_newton: Pgsl_root_fdfsolver_type; cvar;external libgsl;
  gsl_root_fdfsolver_secant: Pgsl_root_fdfsolver_type; cvar;external libgsl;
  gsl_root_fdfsolver_steffenson: Pgsl_root_fdfsolver_type; cvar;external libgsl;

  // === Konventiert am: 22-8-25 13:19:45 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
