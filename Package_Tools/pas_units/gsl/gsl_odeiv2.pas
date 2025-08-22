unit gsl_odeiv2;

interface

uses
  fp_gsl;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  Pgsl_odeiv2_system = ^Tgsl_odeiv2_system;
  Pgsl_odeiv2_step = ^Tgsl_odeiv2_step;
  Pgsl_odeiv2_control = ^Tgsl_odeiv2_control;
  Pgsl_odeiv2_evolve = ^Tgsl_odeiv2_evolve;

  Tgsl_odeiv2_driver_struct = record
    sys: Pgsl_odeiv2_system;
    s: Pgsl_odeiv2_step;
    c: Pgsl_odeiv2_control;
    e: Pgsl_odeiv2_evolve;
    h: Tdouble;
    hmin: Tdouble;
    hmax: Tdouble;
    n: dword;
    nmax: dword;
  end;
  Tgsl_odeiv2_driver = Tgsl_odeiv2_driver_struct;
  Pgsl_odeiv2_driver = ^Tgsl_odeiv2_driver;

  Tgsl_odeiv2_system = record
    _function: function(t: Tdouble; y: Pdouble; dydt: Pdouble; params: pointer): longint; cdecl;
    jacobian: function(t: Tdouble; y: Pdouble; dfdy: Pdouble; dfdt: Pdouble; params: pointer): longint; cdecl;
    dimension: Tsize_t;
    params: pointer;
  end;

  Tgsl_odeiv2_step_type = record
    name: pchar;
    can_use_dydt_in: longint;
    gives_exact_dydt_out: longint;
    alloc: function(dim: Tsize_t): pointer; cdecl;
    apply: function(state: pointer; dim: Tsize_t; t: Tdouble; h: Tdouble; y: Pdouble;
      yerr: Pdouble; dydt_in: Pdouble; dydt_out: Pdouble; dydt: Pgsl_odeiv2_system): longint; cdecl;
    set_driver: function(state: pointer; d: Pgsl_odeiv2_driver): longint; cdecl;
    reset: function(state: pointer; dim: Tsize_t): longint; cdecl;
    order: function(state: pointer): dword; cdecl;
    free: procedure(state: pointer); cdecl;
  end;
  Pgsl_odeiv2_step_type = ^Tgsl_odeiv2_step_type;

  Tgsl_odeiv2_step_struct = record
    _type: Pgsl_odeiv2_step_type;
    dimension: Tsize_t;
    state: pointer;
  end;
  Tgsl_odeiv2_step = Tgsl_odeiv2_step_struct;

  Tgsl_odeiv2_control_type = record
    name: pchar;
    alloc: function: pointer; cdecl;
    init: function(state: pointer; eps_abs: Tdouble; eps_rel: Tdouble; a_y: Tdouble; a_dydt: Tdouble): longint; cdecl;
    hadjust: function(state: pointer; dim: Tsize_t; ord: dword; y: Pdouble; yerr: Pdouble;
      yp: Pdouble; h: Pdouble): longint; cdecl;
    errlevel: function(state: pointer; y: Tdouble; dydt: Tdouble; h: Tdouble; ind: Tsize_t;
      errlev: Pdouble): longint; cdecl;
    set_driver: function(state: pointer; d: Pgsl_odeiv2_driver): longint; cdecl;
    free: procedure(state: pointer); cdecl;
  end;
  Pgsl_odeiv2_control_type = ^Tgsl_odeiv2_control_type;

  Tgsl_odeiv2_control_struct = record
    _type: Pgsl_odeiv2_control_type;
    state: pointer;
  end;
  Tgsl_odeiv2_control = Tgsl_odeiv2_control_struct;

  Tgsl_odeiv2_evolve_struct = record
    dimension: Tsize_t;
    y0: Pdouble;
    yerr: Pdouble;
    dydt_in: Pdouble;
    dydt_out: Pdouble;
    last_step: Tdouble;
    count: dword;
    failed_steps: dword;
    driver: Pgsl_odeiv2_driver;
  end;
  Tgsl_odeiv2_evolve = Tgsl_odeiv2_evolve_struct;

var
  gsl_odeiv2_step_rk2: Pgsl_odeiv2_step_type; cvar;external libgsl;
  gsl_odeiv2_step_rk4: Pgsl_odeiv2_step_type; cvar;external libgsl;
  gsl_odeiv2_step_rkf45: Pgsl_odeiv2_step_type; cvar;external libgsl;
  gsl_odeiv2_step_rkck: Pgsl_odeiv2_step_type; cvar;external libgsl;
  gsl_odeiv2_step_rk8pd: Pgsl_odeiv2_step_type; cvar;external libgsl;
  gsl_odeiv2_step_rk2imp: Pgsl_odeiv2_step_type; cvar;external libgsl;
  gsl_odeiv2_step_rk4imp: Pgsl_odeiv2_step_type; cvar;external libgsl;
  gsl_odeiv2_step_bsimp: Pgsl_odeiv2_step_type; cvar;external libgsl;
  gsl_odeiv2_step_rk1imp: Pgsl_odeiv2_step_type; cvar;external libgsl;
  gsl_odeiv2_step_msadams: Pgsl_odeiv2_step_type; cvar;external libgsl;
  gsl_odeiv2_step_msbdf: Pgsl_odeiv2_step_type; cvar;external libgsl;

function gsl_odeiv2_step_alloc(T: Pgsl_odeiv2_step_type; dim: Tsize_t): Pgsl_odeiv2_step; cdecl; external libgsl;
function gsl_odeiv2_step_reset(s: Pgsl_odeiv2_step): longint; cdecl; external libgsl;
procedure gsl_odeiv2_step_free(s: Pgsl_odeiv2_step); cdecl; external libgsl;
function gsl_odeiv2_step_name(s: Pgsl_odeiv2_step): pchar; cdecl; external libgsl;
function gsl_odeiv2_step_order(s: Pgsl_odeiv2_step): dword; cdecl; external libgsl;
function gsl_odeiv2_step_apply(s: Pgsl_odeiv2_step; t: Tdouble; h: Tdouble; y: Pdouble; yerr: Pdouble;
  dydt_in: Pdouble; dydt_out: Pdouble; dydt: Pgsl_odeiv2_system): longint; cdecl; external libgsl;
function gsl_odeiv2_step_set_driver(s: Pgsl_odeiv2_step; d: Pgsl_odeiv2_driver): longint; cdecl; external libgsl;

const
  GSL_ODEIV_HADJ_INC = 1;
  GSL_ODEIV_HADJ_NIL = 0;
  GSL_ODEIV_HADJ_DEC = -(1);

function gsl_odeiv2_control_alloc(T: Pgsl_odeiv2_control_type): Pgsl_odeiv2_control; cdecl; external libgsl;
function gsl_odeiv2_control_init(c: Pgsl_odeiv2_control; eps_abs: Tdouble; eps_rel: Tdouble; a_y: Tdouble; a_dydt: Tdouble): longint; cdecl; external libgsl;
procedure gsl_odeiv2_control_free(c: Pgsl_odeiv2_control); cdecl; external libgsl;
function gsl_odeiv2_control_hadjust(c: Pgsl_odeiv2_control; s: Pgsl_odeiv2_step; y: Pdouble; yerr: Pdouble; dydt: Pdouble;
  h: Pdouble): longint; cdecl; external libgsl;
function gsl_odeiv2_control_name(c: Pgsl_odeiv2_control): pchar; cdecl; external libgsl;
function gsl_odeiv2_control_errlevel(c: Pgsl_odeiv2_control; y: Tdouble; dydt: Tdouble; h: Tdouble; ind: Tsize_t;
  errlev: Pdouble): longint; cdecl; external libgsl;
function gsl_odeiv2_control_set_driver(c: Pgsl_odeiv2_control; d: Pgsl_odeiv2_driver): longint; cdecl; external libgsl;
function gsl_odeiv2_control_standard_new(eps_abs: Tdouble; eps_rel: Tdouble; a_y: Tdouble; a_dydt: Tdouble): Pgsl_odeiv2_control; cdecl; external libgsl;
function gsl_odeiv2_control_y_new(eps_abs: Tdouble; eps_rel: Tdouble): Pgsl_odeiv2_control; cdecl; external libgsl;
function gsl_odeiv2_control_yp_new(eps_abs: Tdouble; eps_rel: Tdouble): Pgsl_odeiv2_control; cdecl; external libgsl;
function gsl_odeiv2_control_scaled_new(eps_abs: Tdouble; eps_rel: Tdouble; a_y: Tdouble; a_dydt: Tdouble; scale_abs: Pdouble;
  dim: Tsize_t): Pgsl_odeiv2_control; cdecl; external libgsl;

function gsl_odeiv2_evolve_alloc(dim: Tsize_t): Pgsl_odeiv2_evolve; cdecl; external libgsl;
function gsl_odeiv2_evolve_apply(e: Pgsl_odeiv2_evolve; con: Pgsl_odeiv2_control; step: Pgsl_odeiv2_step; dydt: Pgsl_odeiv2_system; t: Pdouble;
  t1: Tdouble; h: Pdouble; y: Pdouble): longint; cdecl; external libgsl;
function gsl_odeiv2_evolve_apply_fixed_step(e: Pgsl_odeiv2_evolve; con: Pgsl_odeiv2_control; step: Pgsl_odeiv2_step; dydt: Pgsl_odeiv2_system; t: Pdouble;
  h0: Tdouble; y: Pdouble): longint; cdecl; external libgsl;
function gsl_odeiv2_evolve_reset(e: Pgsl_odeiv2_evolve): longint; cdecl; external libgsl;
procedure gsl_odeiv2_evolve_free(e: Pgsl_odeiv2_evolve); cdecl; external libgsl;
function gsl_odeiv2_evolve_set_driver(e: Pgsl_odeiv2_evolve; d: Pgsl_odeiv2_driver): longint; cdecl; external libgsl;

function gsl_odeiv2_driver_alloc_y_new(sys: Pgsl_odeiv2_system; T: Pgsl_odeiv2_step_type; hstart: Tdouble; epsabs: Tdouble; epsrel: Tdouble): Pgsl_odeiv2_driver; cdecl; external libgsl;
function gsl_odeiv2_driver_alloc_yp_new(sys: Pgsl_odeiv2_system; T: Pgsl_odeiv2_step_type; hstart: Tdouble; epsabs: Tdouble; epsrel: Tdouble): Pgsl_odeiv2_driver; cdecl; external libgsl;
function gsl_odeiv2_driver_alloc_scaled_new(sys: Pgsl_odeiv2_system; T: Pgsl_odeiv2_step_type; hstart: Tdouble; epsabs: Tdouble; epsrel: Tdouble;
  a_y: Tdouble; a_dydt: Tdouble; scale_abs: Pdouble): Pgsl_odeiv2_driver; cdecl; external libgsl;
function gsl_odeiv2_driver_alloc_standard_new(sys: Pgsl_odeiv2_system; T: Pgsl_odeiv2_step_type; hstart: Tdouble; epsabs: Tdouble; epsrel: Tdouble;
  a_y: Tdouble; a_dydt: Tdouble): Pgsl_odeiv2_driver; cdecl; external libgsl;
function gsl_odeiv2_driver_set_hmin(d: Pgsl_odeiv2_driver; hmin: Tdouble): longint; cdecl; external libgsl;
function gsl_odeiv2_driver_set_hmax(d: Pgsl_odeiv2_driver; hmax: Tdouble): longint; cdecl; external libgsl;
function gsl_odeiv2_driver_set_nmax(d: Pgsl_odeiv2_driver; nmax: dword): longint; cdecl; external libgsl;
function gsl_odeiv2_driver_apply(d: Pgsl_odeiv2_driver; t: Pdouble; t1: Tdouble; y: Pdouble): longint; cdecl; external libgsl;
function gsl_odeiv2_driver_apply_fixed_step(d: Pgsl_odeiv2_driver; t: Pdouble; h: Tdouble; n: dword; y: Pdouble): longint; cdecl; external libgsl;
function gsl_odeiv2_driver_reset(d: Pgsl_odeiv2_driver): longint; cdecl; external libgsl;
function gsl_odeiv2_driver_reset_hstart(d: Pgsl_odeiv2_driver; hstart: Tdouble): longint; cdecl; external libgsl;
procedure gsl_odeiv2_driver_free(state: Pgsl_odeiv2_driver); cdecl; external libgsl;

// === Konventiert am: 22-8-25 13:19:28 ===


implementation



end.
