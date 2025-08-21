unit gsl_monte_vegas;

interface

uses
  fp_gsl, gsl_monte, gsl_rng;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


const
  GSL_VEGAS_MODE_IMPORTANCE = 1;
  GSL_VEGAS_MODE_IMPORTANCE_ONLY = 0;
  GSL_VEGAS_MODE_STRATIFIED = -(1);

type
  Tgsl_monte_vegas_state = record
    dim: Tsize_t;
    bins_max: Tsize_t;
    bins: dword;
    boxes: dword;
    xi: Pdouble;
    xin: Pdouble;
    delx: Pdouble;
    weight: Pdouble;
    vol: Tdouble;
    x: Pdouble;
    bin: Plongint;
    box: Plongint;
    d: Pdouble;
    alpha: Tdouble;
    mode: longint;
    verbose: longint;
    iterations: dword;
    stage: longint;
    jac: Tdouble;
    wtd_int_sum: Tdouble;
    sum_wgts: Tdouble;
    chi_sum: Tdouble;
    chisq: Tdouble;
    result: Tdouble;
    sigma: Tdouble;
    it_start: dword;
    it_num: dword;
    samples: dword;
    calls_per_box: dword;
    ostream: PFILE;
  end;
  Pgsl_monte_vegas_state = ^Tgsl_monte_vegas_state;

function gsl_monte_vegas_integrate(f: Pgsl_monte_function; xl: Pdouble; xu: Pdouble; dim: Tsize_t; calls: Tsize_t;
  r: Pgsl_rng; state: Pgsl_monte_vegas_state; result: Pdouble; abserr: Pdouble): longint; cdecl; external libgsl;
function gsl_monte_vegas_alloc(dim: Tsize_t): Pgsl_monte_vegas_state; cdecl; external libgsl;
function gsl_monte_vegas_init(state: Pgsl_monte_vegas_state): longint; cdecl; external libgsl;
procedure gsl_monte_vegas_free(state: Pgsl_monte_vegas_state); cdecl; external libgsl;
function gsl_monte_vegas_chisq(state: Pgsl_monte_vegas_state): Tdouble; cdecl; external libgsl;
procedure gsl_monte_vegas_runval(state: Pgsl_monte_vegas_state; result: Pdouble; sigma: Pdouble); cdecl; external libgsl;

type
  Tgsl_monte_vegas_params = record
    alpha: Tdouble;
    iterations: Tsize_t;
    stage: longint;
    mode: longint;
    verbose: longint;
    ostream: PFILE;
  end;
  Pgsl_monte_vegas_params = ^Tgsl_monte_vegas_params;

procedure gsl_monte_vegas_params_get(state: Pgsl_monte_vegas_state; params: Pgsl_monte_vegas_params); cdecl; external libgsl;
procedure gsl_monte_vegas_params_set(state: Pgsl_monte_vegas_state; params: Pgsl_monte_vegas_params); cdecl; external libgsl;

// === Konventiert am: 21-8-25 19:43:28 ===


implementation



end.
