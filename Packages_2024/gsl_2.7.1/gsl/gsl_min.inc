{$IFDEF read_interface}


type
  Tgsl_min_fminimizer_type = record
    name: pchar;
    size: Tsize_t;
    set_: function(state: pointer; f: Pgsl_function; x_minimum: double; f_minimum: double; x_lower: double; f_lower: double; x_upper: double; f_upper: double): longint; cdecl;
    iterate: function(state: pointer; f: Pgsl_function; x_minimum: Pdouble; f_minimum: Pdouble; x_lower: Pdouble; f_lower: Pdouble; x_upper: Pdouble; f_upper: Pdouble): longint; cdecl;
  end;
  Pgsl_min_fminimizer_type = ^Tgsl_min_fminimizer_type;

  Tgsl_min_fminimizer = record
    _type: Pgsl_min_fminimizer_type;
    _function: Pgsl_function;
    x_minimum: double;
    x_lower: double;
    x_upper: double;
    f_minimum: double;
    f_lower: double;
    f_upper: double;
    state: pointer;
  end;
  Pgsl_min_fminimizer = ^Tgsl_min_fminimizer;

function gsl_min_fminimizer_alloc(T: Pgsl_min_fminimizer_type): Pgsl_min_fminimizer; cdecl; external libgsl;
procedure gsl_min_fminimizer_free(s: Pgsl_min_fminimizer); cdecl; external libgsl;
function gsl_min_fminimizer_set(s: Pgsl_min_fminimizer; f: Pgsl_function; x_minimum: double; x_lower: double; x_upper: double): longint; cdecl; external libgsl;
function gsl_min_fminimizer_set_with_values(s: Pgsl_min_fminimizer; f: Pgsl_function; x_minimum: double; f_minimum: double; x_lower: double;
  f_lower: double; x_upper: double; f_upper: double): longint; cdecl; external libgsl;
function gsl_min_fminimizer_iterate(s: Pgsl_min_fminimizer): longint; cdecl; external libgsl;
function gsl_min_fminimizer_name(s: Pgsl_min_fminimizer): pchar; cdecl; external libgsl;
function gsl_min_fminimizer_x_minimum(s: Pgsl_min_fminimizer): double; cdecl; external libgsl;
function gsl_min_fminimizer_x_lower(s: Pgsl_min_fminimizer): double; cdecl; external libgsl;
function gsl_min_fminimizer_x_upper(s: Pgsl_min_fminimizer): double; cdecl; external libgsl;
function gsl_min_fminimizer_f_minimum(s: Pgsl_min_fminimizer): double; cdecl; external libgsl;
function gsl_min_fminimizer_f_lower(s: Pgsl_min_fminimizer): double; cdecl; external libgsl;
function gsl_min_fminimizer_f_upper(s: Pgsl_min_fminimizer): double; cdecl; external libgsl;
function gsl_min_fminimizer_minimum(s: Pgsl_min_fminimizer): double; cdecl; external libgsl;
function gsl_min_test_interval(x_lower: double; x_upper: double; epsabs: double; epsrel: double): longint; cdecl; external libgsl;

var
  gsl_min_fminimizer_goldensection: Pgsl_min_fminimizer_type; cvar;external libgsl;
  gsl_min_fminimizer_brent: Pgsl_min_fminimizer_type; cvar;external libgsl;
  gsl_min_fminimizer_quad_golden: Pgsl_min_fminimizer_type; cvar;external libgsl;

type
  Tgsl_min_bracketing_function = function(f: Pgsl_function; x_minimum: Pdouble; f_minimum: Pdouble; x_lower: Pdouble; f_lower: Pdouble; x_upper: Pdouble; f_upper: Pdouble; eval_max: Tsize_t): longint; cdecl;

function gsl_min_find_bracket(f: Pgsl_function; x_minimum: Pdouble; f_minimum: Pdouble; x_lower: Pdouble; f_lower: Pdouble;
  x_upper: Pdouble; f_upper: Pdouble; eval_max: Tsize_t): longint; cdecl; external libgsl;

// === Konventiert am: 21-8-25 19:10:16 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
