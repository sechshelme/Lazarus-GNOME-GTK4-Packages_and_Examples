unit gsl_sf_gamma;

interface

uses
  fp_gsl, gsl_sf_result;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


function gsl_sf_lngamma_e(x: Tdouble; result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_lngamma(x: Tdouble): Tdouble; cdecl; external libgsl;
function gsl_sf_lngamma_sgn_e(x: Tdouble; result_lg: Pgsl_sf_result; sgn: Pdouble): longint; cdecl; external libgsl;
function gsl_sf_gamma_e(x: Tdouble; result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_gamma(x: Tdouble): Tdouble; cdecl; external libgsl;
function gsl_sf_gammastar_e(x: Tdouble; result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_gammastar(x: Tdouble): Tdouble; cdecl; external libgsl;
function gsl_sf_gammainv_e(x: Tdouble; result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_gammainv(x: Tdouble): Tdouble; cdecl; external libgsl;
function gsl_sf_lngamma_complex_e(zr: Tdouble; zi: Tdouble; lnr: Pgsl_sf_result; arg: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_taylorcoeff_e(n: longint; x: Tdouble; result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_taylorcoeff(n: longint; x: Tdouble): Tdouble; cdecl; external libgsl;
function gsl_sf_fact_e(n: dword; result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_fact(n: dword): Tdouble; cdecl; external libgsl;
function gsl_sf_doublefact_e(n: dword; result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_doublefact(n: dword): Tdouble; cdecl; external libgsl;
function gsl_sf_lnfact_e(n: dword; result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_lnfact(n: dword): Tdouble; cdecl; external libgsl;
function gsl_sf_lndoublefact_e(n: dword; result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_lndoublefact(n: dword): Tdouble; cdecl; external libgsl;
function gsl_sf_lnchoose_e(n: dword; m: dword; result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_lnchoose(n: dword; m: dword): Tdouble; cdecl; external libgsl;
function gsl_sf_choose_e(n: dword; m: dword; result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_choose(n: dword; m: dword): Tdouble; cdecl; external libgsl;
function gsl_sf_lnpoch_e(a: Tdouble; x: Tdouble; result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_lnpoch(a: Tdouble; x: Tdouble): Tdouble; cdecl; external libgsl;
function gsl_sf_lnpoch_sgn_e(a: Tdouble; x: Tdouble; result: Pgsl_sf_result; sgn: Pdouble): longint; cdecl; external libgsl;
function gsl_sf_poch_e(a: Tdouble; x: Tdouble; result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_poch(a: Tdouble; x: Tdouble): Tdouble; cdecl; external libgsl;
function gsl_sf_pochrel_e(a: Tdouble; x: Tdouble; result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_pochrel(a: Tdouble; x: Tdouble): Tdouble; cdecl; external libgsl;
function gsl_sf_gamma_inc_Q_e(a: Tdouble; x: Tdouble; result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_gamma_inc_Q(a: Tdouble; x: Tdouble): Tdouble; cdecl; external libgsl;
function gsl_sf_gamma_inc_P_e(a: Tdouble; x: Tdouble; result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_gamma_inc_P(a: Tdouble; x: Tdouble): Tdouble; cdecl; external libgsl;
function gsl_sf_gamma_inc_e(a: Tdouble; x: Tdouble; result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_gamma_inc(a: Tdouble; x: Tdouble): Tdouble; cdecl; external libgsl;
function gsl_sf_lnbeta_e(a: Tdouble; b: Tdouble; result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_lnbeta(a: Tdouble; b: Tdouble): Tdouble; cdecl; external libgsl;
function gsl_sf_lnbeta_sgn_e(x: Tdouble; y: Tdouble; result: Pgsl_sf_result; sgn: Pdouble): longint; cdecl; external libgsl;
function gsl_sf_beta_e(a: Tdouble; b: Tdouble; result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_beta(a: Tdouble; b: Tdouble): Tdouble; cdecl; external libgsl;
function gsl_sf_beta_inc_e(a: Tdouble; b: Tdouble; x: Tdouble; result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_beta_inc(a: Tdouble; b: Tdouble; x: Tdouble): Tdouble; cdecl; external libgsl;

const
  GSL_SF_GAMMA_XMAX = 171.0;
  GSL_SF_FACT_NMAX = 170;
  GSL_SF_DOUBLEFACT_NMAX = 297;

  // === Konventiert am: 22-8-25 14:04:41 ===


implementation



end.
