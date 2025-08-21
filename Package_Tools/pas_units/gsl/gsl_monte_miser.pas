unit gsl_monte_miser;

interface

uses
  fp_gsl, gsl_monte, gsl_rng;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  Tgsl_monte_miser_state = record
    min_calls: Tsize_t;
    min_calls_per_bisection: Tsize_t;
    dither: Tdouble;
    estimate_frac: Tdouble;
    alpha: Tdouble;
    dim: Tsize_t;
    estimate_style: longint;
    depth: longint;
    verbose: longint;
    x: Pdouble;
    xmid: Pdouble;
    sigma_l: Pdouble;
    sigma_r: Pdouble;
    fmax_l: Pdouble;
    fmax_r: Pdouble;
    fmin_l: Pdouble;
    fmin_r: Pdouble;
    fsum_l: Pdouble;
    fsum_r: Pdouble;
    fsum2_l: Pdouble;
    fsum2_r: Pdouble;
    hits_l: Psize_t;
    hits_r: Psize_t;
  end;
  Pgsl_monte_miser_state = ^Tgsl_monte_miser_state;

function gsl_monte_miser_integrate(f: Pgsl_monte_function; xl: Pdouble; xh: Pdouble; dim: Tsize_t; calls: Tsize_t;
  r: Pgsl_rng; state: Pgsl_monte_miser_state; result: Pdouble; abserr: Pdouble): longint; cdecl; external libgsl;
function gsl_monte_miser_alloc(dim: Tsize_t): Pgsl_monte_miser_state; cdecl; external libgsl;
function gsl_monte_miser_init(state: Pgsl_monte_miser_state): longint; cdecl; external libgsl;
procedure gsl_monte_miser_free(state: Pgsl_monte_miser_state); cdecl; external libgsl;

type
  Tgsl_monte_miser_params = record
    estimate_frac: Tdouble;
    min_calls: Tsize_t;
    min_calls_per_bisection: Tsize_t;
    alpha: Tdouble;
    dither: Tdouble;
  end;
  Pgsl_monte_miser_params = ^Tgsl_monte_miser_params;

procedure gsl_monte_miser_params_get(state: Pgsl_monte_miser_state; params: Pgsl_monte_miser_params); cdecl; external libgsl;
procedure gsl_monte_miser_params_set(state: Pgsl_monte_miser_state; params: Pgsl_monte_miser_params); cdecl; external libgsl;

// === Konventiert am: 21-8-25 19:43:19 ===


implementation



end.
