{$IFDEF read_interface}


type
  Tgsl_odeiv_system = record
    func: function(t: double; y: Pdouble; dydt: Pdouble; params: pointer): longint; cdecl;
    jacobian: function(t: double; y: Pdouble; dfdy: Pdouble; dfdt: Pdouble; params: pointer): longint; cdecl;
    dimension: Tsize_t;
    params: pointer;
  end;
  Pgsl_odeiv_system = ^Tgsl_odeiv_system;

  Tgsl_odeiv_step_type = record
    name: pchar;
    can_use_dydt_in: longint;
    gives_exact_dydt_out: longint;
    alloc: function(dim: Tsize_t): pointer; cdecl;
    apply: function(state: pointer; dim: Tsize_t; t: double; h: double; y: Pdouble; yerr: Pdouble; dydt_in: Pdouble; dydt_out: Pdouble; dydt: Pgsl_odeiv_system): longint; cdecl;
    reset: function(state: pointer; dim: Tsize_t): longint; cdecl;
    order: function(state: pointer): dword; cdecl;
    free: procedure(state: pointer); cdecl;
  end;
  Pgsl_odeiv_step_type = ^Tgsl_odeiv_step_type;

  Tgsl_odeiv_step = record
    _type: Pgsl_odeiv_step_type;
    dimension: Tsize_t;
    state: pointer;
  end;
  Pgsl_odeiv_step = ^Tgsl_odeiv_step;

var
  gsl_odeiv_step_rk2: Pgsl_odeiv_step_type; cvar;external libgsl;
  gsl_odeiv_step_rk4: Pgsl_odeiv_step_type; cvar;external libgsl;
  gsl_odeiv_step_rkf45: Pgsl_odeiv_step_type; cvar;external libgsl;
  gsl_odeiv_step_rkck: Pgsl_odeiv_step_type; cvar;external libgsl;
  gsl_odeiv_step_rk8pd: Pgsl_odeiv_step_type; cvar;external libgsl;
  gsl_odeiv_step_rk2imp: Pgsl_odeiv_step_type; cvar;external libgsl;
  gsl_odeiv_step_rk2simp: Pgsl_odeiv_step_type; cvar;external libgsl;
  gsl_odeiv_step_rk4imp: Pgsl_odeiv_step_type; cvar;external libgsl;
  gsl_odeiv_step_bsimp: Pgsl_odeiv_step_type; cvar;external libgsl;
  gsl_odeiv_step_gear1: Pgsl_odeiv_step_type; cvar;external libgsl;
  gsl_odeiv_step_gear2: Pgsl_odeiv_step_type; cvar;external libgsl;

function gsl_odeiv_step_alloc(T: Pgsl_odeiv_step_type; dim: Tsize_t): Pgsl_odeiv_step; cdecl; external libgsl;
function gsl_odeiv_step_reset(s: Pgsl_odeiv_step): longint; cdecl; external libgsl;
procedure gsl_odeiv_step_free(s: Pgsl_odeiv_step); cdecl; external libgsl;
function gsl_odeiv_step_name(s: Pgsl_odeiv_step): pchar; cdecl; external libgsl;
function gsl_odeiv_step_order(s: Pgsl_odeiv_step): dword; cdecl; external libgsl;
function gsl_odeiv_step_apply(s: Pgsl_odeiv_step; t: double; h: double; y: Pdouble; yerr: Pdouble;
  dydt_in: Pdouble; dydt_out: Pdouble; dydt: Pgsl_odeiv_system): longint; cdecl; external libgsl;

type
  Tgsl_odeiv_control_type = record
    name: pchar;
    alloc: function: pointer; cdecl;
    init: function(state: pointer; eps_abs: double; eps_rel: double; a_y: double; a_dydt: double): longint; cdecl;
    hadjust: function(state: pointer; dim: Tsize_t; ord: dword; y: Pdouble; yerr: Pdouble; yp: Pdouble; h: Pdouble): longint; cdecl;
    free: procedure(state: pointer); cdecl;
  end;
  Pgsl_odeiv_control_type = ^Tgsl_odeiv_control_type;

  Tgsl_odeiv_control = record
    _type: Pgsl_odeiv_control_type;
    state: pointer;
  end;
  Pgsl_odeiv_control = ^Tgsl_odeiv_control;

const
  GSL_ODEIV_HADJ_INC = 1;
  GSL_ODEIV_HADJ_NIL = 0;
  GSL_ODEIV_HADJ_DEC = -(1);

function gsl_odeiv_control_alloc(T: Pgsl_odeiv_control_type): Pgsl_odeiv_control; cdecl; external libgsl;
function gsl_odeiv_control_init(c: Pgsl_odeiv_control; eps_abs: double; eps_rel: double; a_y: double; a_dydt: double): longint; cdecl; external libgsl;
procedure gsl_odeiv_control_free(c: Pgsl_odeiv_control); cdecl; external libgsl;
function gsl_odeiv_control_hadjust(c: Pgsl_odeiv_control; s: Pgsl_odeiv_step; y: Pdouble; yerr: Pdouble; dydt: Pdouble;
  h: Pdouble): longint; cdecl; external libgsl;
function gsl_odeiv_control_name(c: Pgsl_odeiv_control): pchar; cdecl; external libgsl;
function gsl_odeiv_control_standard_new(eps_abs: double; eps_rel: double; a_y: double; a_dydt: double): Pgsl_odeiv_control; cdecl; external libgsl;
function gsl_odeiv_control_y_new(eps_abs: double; eps_rel: double): Pgsl_odeiv_control; cdecl; external libgsl;
function gsl_odeiv_control_yp_new(eps_abs: double; eps_rel: double): Pgsl_odeiv_control; cdecl; external libgsl;
function gsl_odeiv_control_scaled_new(eps_abs: double; eps_rel: double; a_y: double; a_dydt: double; scale_abs: Pdouble;
  dim: Tsize_t): Pgsl_odeiv_control; cdecl; external libgsl;

type
  Tgsl_odeiv_evolve = record
    dimension: Tsize_t;
    y0: Pdouble;
    yerr: Pdouble;
    dydt_in: Pdouble;
    dydt_out: Pdouble;
    last_step: double;
    count: Tculong;
    failed_steps: Tculong;
  end;
  Pgsl_odeiv_evolve = ^Tgsl_odeiv_evolve;

function gsl_odeiv_evolve_alloc(dim: Tsize_t): Pgsl_odeiv_evolve; cdecl; external libgsl;
function gsl_odeiv_evolve_apply(e: Pgsl_odeiv_evolve; con: Pgsl_odeiv_control; step: Pgsl_odeiv_step; dydt: Pgsl_odeiv_system; t: Pdouble;
  t1: double; h: Pdouble; y: Pdouble): longint; cdecl; external libgsl;
function gsl_odeiv_evolve_reset(e: Pgsl_odeiv_evolve): longint; cdecl; external libgsl;
procedure gsl_odeiv_evolve_free(e: Pgsl_odeiv_evolve); cdecl; external libgsl;

// === Konventiert am: 22-8-25 13:19:24 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
