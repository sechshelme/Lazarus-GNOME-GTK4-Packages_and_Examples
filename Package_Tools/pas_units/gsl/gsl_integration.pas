unit gsl_integration;

interface

uses
  fp_gsl, gsl_math;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  Tgsl_integration_workspace = record
    limit: Tsize_t;
    size: Tsize_t;
    nrmax: Tsize_t;
    i: Tsize_t;
    maximum_level: Tsize_t;
    alist: Pdouble;
    blist: Pdouble;
    rlist: Pdouble;
    elist: Pdouble;
    order: Psize_t;
    level: Psize_t;
  end;
  Pgsl_integration_workspace = ^Tgsl_integration_workspace;

function gsl_integration_workspace_alloc(n: Tsize_t): Pgsl_integration_workspace; cdecl; external libgsl;
procedure gsl_integration_workspace_free(w: Pgsl_integration_workspace); cdecl; external libgsl;

type
  Tgsl_integration_qaws_table = record
    alpha: Tdouble;
    beta: Tdouble;
    mu: longint;
    nu: longint;
    ri: array[0..24] of Tdouble;
    rj: array[0..24] of Tdouble;
    rg: array[0..24] of Tdouble;
    rh: array[0..24] of Tdouble;
  end;
  Pgsl_integration_qaws_table = ^Tgsl_integration_qaws_table;

function gsl_integration_qaws_table_alloc(alpha: Tdouble; beta: Tdouble; mu: longint; nu: longint): Pgsl_integration_qaws_table; cdecl; external libgsl;
function gsl_integration_qaws_table_set(t: Pgsl_integration_qaws_table; alpha: Tdouble; beta: Tdouble; mu: longint; nu: longint): longint; cdecl; external libgsl;
procedure gsl_integration_qaws_table_free(t: Pgsl_integration_qaws_table); cdecl; external libgsl;

type
  Tgsl_integration_qawo_enum = longint;

const
  GSL_INTEG_COSINE = 0;
  GSL_INTEG_SINE = 1;

type
  Tgsl_integration_qawo_table = record
    n: Tsize_t;
    omega: Tdouble;
    L: Tdouble;
    par: Tdouble;
    sine: Tgsl_integration_qawo_enum;
    chebmo: Pdouble;
  end;
  Pgsl_integration_qawo_table = ^Tgsl_integration_qawo_table;

function gsl_integration_qawo_table_alloc(omega: Tdouble; L: Tdouble; sine: Tgsl_integration_qawo_enum; n: Tsize_t): Pgsl_integration_qawo_table; cdecl; external libgsl;
function gsl_integration_qawo_table_set(t: Pgsl_integration_qawo_table; omega: Tdouble; L: Tdouble; sine: Tgsl_integration_qawo_enum): longint; cdecl; external libgsl;
function gsl_integration_qawo_table_set_length(t: Pgsl_integration_qawo_table; L: Tdouble): longint; cdecl; external libgsl;
procedure gsl_integration_qawo_table_free(t: Pgsl_integration_qawo_table); cdecl; external libgsl;

type
  Tgsl_integration_rule = procedure(f: Pgsl_function; a: Tdouble; b: Tdouble; result: Pdouble; abserr: Pdouble;
    defabs: Pdouble; resabs: Pdouble); cdecl;

procedure gsl_integration_qk15(f: Pgsl_function; a: Tdouble; b: Tdouble; result: Pdouble; abserr: Pdouble;
  resabs: Pdouble; resasc: Pdouble); cdecl; external libgsl;
procedure gsl_integration_qk21(f: Pgsl_function; a: Tdouble; b: Tdouble; result: Pdouble; abserr: Pdouble;
  resabs: Pdouble; resasc: Pdouble); cdecl; external libgsl;
procedure gsl_integration_qk31(f: Pgsl_function; a: Tdouble; b: Tdouble; result: Pdouble; abserr: Pdouble;
  resabs: Pdouble; resasc: Pdouble); cdecl; external libgsl;
procedure gsl_integration_qk41(f: Pgsl_function; a: Tdouble; b: Tdouble; result: Pdouble; abserr: Pdouble;
  resabs: Pdouble; resasc: Pdouble); cdecl; external libgsl;
procedure gsl_integration_qk51(f: Pgsl_function; a: Tdouble; b: Tdouble; result: Pdouble; abserr: Pdouble;
  resabs: Pdouble; resasc: Pdouble); cdecl; external libgsl;
procedure gsl_integration_qk61(f: Pgsl_function; a: Tdouble; b: Tdouble; result: Pdouble; abserr: Pdouble;
  resabs: Pdouble; resasc: Pdouble); cdecl; external libgsl;
procedure gsl_integration_qcheb(f: Pgsl_function; a: Tdouble; b: Tdouble; cheb12: Pdouble; cheb24: Pdouble); cdecl; external libgsl;

const
  GSL_INTEG_GAUSS15 = 1;
  GSL_INTEG_GAUSS21 = 2;
  GSL_INTEG_GAUSS31 = 3;
  GSL_INTEG_GAUSS41 = 4;
  GSL_INTEG_GAUSS51 = 5;
  GSL_INTEG_GAUSS61 = 6;

procedure gsl_integration_qk(n: longint; xgk: Pdouble; wg: Pdouble; wgk: Pdouble; fv1: Pdouble;
  fv2: Pdouble; f: Pgsl_function; a: Tdouble; b: Tdouble; result: Pdouble;
  abserr: Pdouble; resabs: Pdouble; resasc: Pdouble); cdecl; external libgsl;
function gsl_integration_qng(f: Pgsl_function; a: Tdouble; b: Tdouble; epsabs: Tdouble; epsrel: Tdouble;
  result: Pdouble; abserr: Pdouble; neval: Psize_t): longint; cdecl; external libgsl;
function gsl_integration_qag(f: Pgsl_function; a: Tdouble; b: Tdouble; epsabs: Tdouble; epsrel: Tdouble;
  limit: Tsize_t; key: longint; workspace: Pgsl_integration_workspace; result: Pdouble; abserr: Pdouble): longint; cdecl; external libgsl;
function gsl_integration_qagi(f: Pgsl_function; epsabs: Tdouble; epsrel: Tdouble; limit: Tsize_t; workspace: Pgsl_integration_workspace;
  result: Pdouble; abserr: Pdouble): longint; cdecl; external libgsl;
function gsl_integration_qagiu(f: Pgsl_function; a: Tdouble; epsabs: Tdouble; epsrel: Tdouble; limit: Tsize_t;
  workspace: Pgsl_integration_workspace; result: Pdouble; abserr: Pdouble): longint; cdecl; external libgsl;
function gsl_integration_qagil(f: Pgsl_function; b: Tdouble; epsabs: Tdouble; epsrel: Tdouble; limit: Tsize_t;
  workspace: Pgsl_integration_workspace; result: Pdouble; abserr: Pdouble): longint; cdecl; external libgsl;
function gsl_integration_qags(f: Pgsl_function; a: Tdouble; b: Tdouble; epsabs: Tdouble; epsrel: Tdouble;
  limit: Tsize_t; workspace: Pgsl_integration_workspace; result: Pdouble; abserr: Pdouble): longint; cdecl; external libgsl;
function gsl_integration_qagp(f: Pgsl_function; pts: Pdouble; npts: Tsize_t; epsabs: Tdouble; epsrel: Tdouble;
  limit: Tsize_t; workspace: Pgsl_integration_workspace; result: Pdouble; abserr: Pdouble): longint; cdecl; external libgsl;
function gsl_integration_qawc(f: Pgsl_function; a: Tdouble; b: Tdouble; c: Tdouble; epsabs: Tdouble;
  epsrel: Tdouble; limit: Tsize_t; workspace: Pgsl_integration_workspace; result: Pdouble; abserr: Pdouble): longint; cdecl; external libgsl;
function gsl_integration_qaws(f: Pgsl_function; a: Tdouble; b: Tdouble; t: Pgsl_integration_qaws_table; epsabs: Tdouble;
  epsrel: Tdouble; limit: Tsize_t; workspace: Pgsl_integration_workspace; result: Pdouble; abserr: Pdouble): longint; cdecl; external libgsl;
function gsl_integration_qawo(f: Pgsl_function; a: Tdouble; epsabs: Tdouble; epsrel: Tdouble; limit: Tsize_t;
  workspace: Pgsl_integration_workspace; wf: Pgsl_integration_qawo_table; result: Pdouble; abserr: Pdouble): longint; cdecl; external libgsl;
function gsl_integration_qawf(f: Pgsl_function; a: Tdouble; epsabs: Tdouble; limit: Tsize_t; workspace: Pgsl_integration_workspace;
  cycle_workspace: Pgsl_integration_workspace; wf: Pgsl_integration_qawo_table; result: Pdouble; abserr: Pdouble): longint; cdecl; external libgsl;

type
  Tgsl_integration_glfixed_table = record
    n: Tsize_t;
    x: Pdouble;
    w: Pdouble;
    precomputed: longint;
  end;
  Pgsl_integration_glfixed_table = ^Tgsl_integration_glfixed_table;

function gsl_integration_glfixed_table_alloc(n: Tsize_t): Pgsl_integration_glfixed_table; cdecl; external libgsl;
procedure gsl_integration_glfixed_table_free(t: Pgsl_integration_glfixed_table); cdecl; external libgsl;
function gsl_integration_glfixed(f: Pgsl_function; a: Tdouble; b: Tdouble; t: Pgsl_integration_glfixed_table): Tdouble; cdecl; external libgsl;
function gsl_integration_glfixed_point(a: Tdouble; b: Tdouble; i: Tsize_t; xi: Pdouble; wi: Pdouble;
  t: Pgsl_integration_glfixed_table): longint; cdecl; external libgsl;

type
  Tgsl_integration_cquad_ival = record
    a: Tdouble;
    b: Tdouble;
    c: array[0..63] of Tdouble;
    fx: array[0..32] of Tdouble;
    igral: Tdouble;
    err: Tdouble;
    depth: longint;
    rdepth: longint;
    ndiv: longint;
  end;
  Pgsl_integration_cquad_ival = ^Tgsl_integration_cquad_ival;

  Tgsl_integration_cquad_workspace = record
    size: Tsize_t;
    ivals: Pgsl_integration_cquad_ival;
    heap: Psize_t;
  end;
  Pgsl_integration_cquad_workspace = ^Tgsl_integration_cquad_workspace;

function gsl_integration_cquad_workspace_alloc(n: Tsize_t): Pgsl_integration_cquad_workspace; cdecl; external libgsl;
procedure gsl_integration_cquad_workspace_free(w: Pgsl_integration_cquad_workspace); cdecl; external libgsl;
function gsl_integration_cquad(f: Pgsl_function; a: Tdouble; b: Tdouble; epsabs: Tdouble; epsrel: Tdouble;
  ws: Pgsl_integration_cquad_workspace; result: Pdouble; abserr: Pdouble; nevals: Psize_t): longint; cdecl; external libgsl;

type
  Tgsl_integration_romberg_workspace = record
    n: Tsize_t;
    work1: Pdouble;
    work2: Pdouble;
  end;
  Pgsl_integration_romberg_workspace = ^Tgsl_integration_romberg_workspace;

function gsl_integration_romberg_alloc(n: Tsize_t): Pgsl_integration_romberg_workspace; cdecl; external libgsl;
procedure gsl_integration_romberg_free(w: Pgsl_integration_romberg_workspace); cdecl; external libgsl;
function gsl_integration_romberg(f: Pgsl_function; a: Tdouble; b: Tdouble; epsabs: Tdouble; epsrel: Tdouble;
  result: Pdouble; neval: Psize_t; w: Pgsl_integration_romberg_workspace): longint; cdecl; external libgsl;

type
  Tgsl_integration_fixed_params = record
    alpha: Tdouble;
    beta: Tdouble;
    a: Tdouble;
    b: Tdouble;
    zemu: Tdouble;
    shft: Tdouble;
    slp: Tdouble;
    al: Tdouble;
    be: Tdouble;
  end;
  Pgsl_integration_fixed_params = ^Tgsl_integration_fixed_params;

  Tgsl_integration_fixed_type = record
    check: function(n: Tsize_t; params: Pgsl_integration_fixed_params): longint; cdecl;
    init: function(n: Tsize_t; diag: Pdouble; subdiag: Pdouble; params: Pgsl_integration_fixed_params): longint; cdecl;
  end;
  Pgsl_integration_fixed_type = ^Tgsl_integration_fixed_type;

  Tgsl_integration_fixed_workspace = record
    n: Tsize_t;
    weights: Pdouble;
    x: Pdouble;
    diag: Pdouble;
    subdiag: Pdouble;
    _type: Pgsl_integration_fixed_type;
  end;
  Pgsl_integration_fixed_workspace = ^Tgsl_integration_fixed_workspace;

var
  gsl_integration_fixed_legendre: Pgsl_integration_fixed_type; cvar;external libgsl;
  gsl_integration_fixed_chebyshev: Pgsl_integration_fixed_type; cvar;external libgsl;
  gsl_integration_fixed_gegenbauer: Pgsl_integration_fixed_type; cvar;external libgsl;
  gsl_integration_fixed_jacobi: Pgsl_integration_fixed_type; cvar;external libgsl;
  gsl_integration_fixed_laguerre: Pgsl_integration_fixed_type; cvar;external libgsl;
  gsl_integration_fixed_hermite: Pgsl_integration_fixed_type; cvar;external libgsl;
  gsl_integration_fixed_exponential: Pgsl_integration_fixed_type; cvar;external libgsl;
  gsl_integration_fixed_rational: Pgsl_integration_fixed_type; cvar;external libgsl;
  gsl_integration_fixed_chebyshev2: Pgsl_integration_fixed_type; cvar;external libgsl;

function gsl_integration_fixed_alloc(_type: Pgsl_integration_fixed_type; n: Tsize_t; a: Tdouble; b: Tdouble; alpha: Tdouble;
  beta: Tdouble): Pgsl_integration_fixed_workspace; cdecl; external libgsl;
procedure gsl_integration_fixed_free(w: Pgsl_integration_fixed_workspace); cdecl; external libgsl;
function gsl_integration_fixed_n(w: Pgsl_integration_fixed_workspace): Tsize_t; cdecl; external libgsl;
function gsl_integration_fixed_nodes(w: Pgsl_integration_fixed_workspace): Pdouble; cdecl; external libgsl;
function gsl_integration_fixed_weights(w: Pgsl_integration_fixed_workspace): Pdouble; cdecl; external libgsl;
function gsl_integration_fixed(func: Pgsl_function; result: Pdouble; w: Pgsl_integration_fixed_workspace): longint; cdecl; external libgsl;

// === Konventiert am: 21-8-25 19:10:00 ===


implementation



end.
