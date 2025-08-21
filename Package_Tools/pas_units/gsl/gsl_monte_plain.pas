unit gsl_monte_plain;

interface

uses
  fp_gsl, gsl_monte, gsl_rng;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  Tgsl_monte_plain_state = record
    dim: Tsize_t;
    x: Pdouble;
  end;
  Pgsl_monte_plain_state = ^Tgsl_monte_plain_state;

function gsl_monte_plain_integrate(f: Pgsl_monte_function; xl: Pdouble; xu: Pdouble; dim: Tsize_t; calls: Tsize_t;
  r: Pgsl_rng; state: Pgsl_monte_plain_state; result: Pdouble; abserr: Pdouble): longint; cdecl; external libgsl;
function gsl_monte_plain_alloc(dim: Tsize_t): Pgsl_monte_plain_state; cdecl; external libgsl;
function gsl_monte_plain_init(state: Pgsl_monte_plain_state): longint; cdecl; external libgsl;
procedure gsl_monte_plain_free(state: Pgsl_monte_plain_state); cdecl; external libgsl;

// === Konventiert am: 21-8-25 19:43:25 ===


implementation



end.
