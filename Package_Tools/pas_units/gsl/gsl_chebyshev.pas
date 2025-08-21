unit gsl_chebyshev;

interface

uses
  fp_gsl, gsl_math, gsl_mode;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  Tgsl_cheb_series_struct = record
    c: Pdouble;
    order: Tsize_t;
    a: Tdouble;
    b: Tdouble;
    order_sp: Tsize_t;
    f: Pdouble;
  end;
  Pgsl_cheb_series_struct = ^Tgsl_cheb_series_struct;

  Tgsl_cheb_series = Tgsl_cheb_series_struct;
  Pgsl_cheb_series = ^Tgsl_cheb_series;

function gsl_cheb_alloc(order: Tsize_t): Pgsl_cheb_series; cdecl; external libgsl;
procedure gsl_cheb_free(cs: Pgsl_cheb_series); cdecl; external libgsl;
function gsl_cheb_init(cs: Pgsl_cheb_series; func: Pgsl_function; a: Tdouble; b: Tdouble): longint; cdecl; external libgsl;
function gsl_cheb_order(cs: Pgsl_cheb_series): Tsize_t; cdecl; external libgsl;
function gsl_cheb_size(cs: Pgsl_cheb_series): Tsize_t; cdecl; external libgsl;
function gsl_cheb_coeffs(cs: Pgsl_cheb_series): Pdouble; cdecl; external libgsl;
function gsl_cheb_eval(cs: Pgsl_cheb_series; x: Tdouble): Tdouble; cdecl; external libgsl;
function gsl_cheb_eval_err(cs: Pgsl_cheb_series; x: Tdouble; result: Pdouble; abserr: Pdouble): longint; cdecl; external libgsl;
function gsl_cheb_eval_n(cs: Pgsl_cheb_series; order: Tsize_t; x: Tdouble): Tdouble; cdecl; external libgsl;
function gsl_cheb_eval_n_err(cs: Pgsl_cheb_series; order: Tsize_t; x: Tdouble; result: Pdouble; abserr: Pdouble): longint; cdecl; external libgsl;
function gsl_cheb_eval_mode(cs: Pgsl_cheb_series; x: Tdouble; mode: Tgsl_mode_t): Tdouble; cdecl; external libgsl;
function gsl_cheb_eval_mode_e(cs: Pgsl_cheb_series; x: Tdouble; mode: Tgsl_mode_t; result: Pdouble; abserr: Pdouble): longint; cdecl; external libgsl;
function gsl_cheb_calc_deriv(deriv: Pgsl_cheb_series; cs: Pgsl_cheb_series): longint; cdecl; external libgsl;
function gsl_cheb_calc_integ(integ: Pgsl_cheb_series; cs: Pgsl_cheb_series): longint; cdecl; external libgsl;


// === Konventiert am: 21-8-25 16:51:51 ===


implementation



end.
