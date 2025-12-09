{$IFDEF read_interface}


function gsl_sf_lngamma_e(x: double; result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_lngamma(x: double): double; cdecl; external libgsl;
function gsl_sf_lngamma_sgn_e(x: double; result_lg: Pgsl_sf_result; sgn: Pdouble): longint; cdecl; external libgsl;
function gsl_sf_gamma_e(x: double; result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_gamma(x: double): double; cdecl; external libgsl;
function gsl_sf_gammastar_e(x: double; result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_gammastar(x: double): double; cdecl; external libgsl;
function gsl_sf_gammainv_e(x: double; result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_gammainv(x: double): double; cdecl; external libgsl;
function gsl_sf_lngamma_complex_e(zr: double; zi: double; lnr: Pgsl_sf_result; arg: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_taylorcoeff_e(n: longint; x: double; result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_taylorcoeff(n: longint; x: double): double; cdecl; external libgsl;
function gsl_sf_fact_e(n: dword; result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_fact(n: dword): double; cdecl; external libgsl;
function gsl_sf_doublefact_e(n: dword; result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_doublefact(n: dword): double; cdecl; external libgsl;
function gsl_sf_lnfact_e(n: dword; result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_lnfact(n: dword): double; cdecl; external libgsl;
function gsl_sf_lndoublefact_e(n: dword; result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_lndoublefact(n: dword): double; cdecl; external libgsl;
function gsl_sf_lnchoose_e(n: dword; m: dword; result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_lnchoose(n: dword; m: dword): double; cdecl; external libgsl;
function gsl_sf_choose_e(n: dword; m: dword; result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_choose(n: dword; m: dword): double; cdecl; external libgsl;
function gsl_sf_lnpoch_e(a: double; x: double; result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_lnpoch(a: double; x: double): double; cdecl; external libgsl;
function gsl_sf_lnpoch_sgn_e(a: double; x: double; result: Pgsl_sf_result; sgn: Pdouble): longint; cdecl; external libgsl;
function gsl_sf_poch_e(a: double; x: double; result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_poch(a: double; x: double): double; cdecl; external libgsl;
function gsl_sf_pochrel_e(a: double; x: double; result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_pochrel(a: double; x: double): double; cdecl; external libgsl;
function gsl_sf_gamma_inc_Q_e(a: double; x: double; result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_gamma_inc_Q(a: double; x: double): double; cdecl; external libgsl;
function gsl_sf_gamma_inc_P_e(a: double; x: double; result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_gamma_inc_P(a: double; x: double): double; cdecl; external libgsl;
function gsl_sf_gamma_inc_e(a: double; x: double; result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_gamma_inc(a: double; x: double): double; cdecl; external libgsl;
function gsl_sf_lnbeta_e(a: double; b: double; result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_lnbeta(a: double; b: double): double; cdecl; external libgsl;
function gsl_sf_lnbeta_sgn_e(x: double; y: double; result: Pgsl_sf_result; sgn: Pdouble): longint; cdecl; external libgsl;
function gsl_sf_beta_e(a: double; b: double; result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_beta(a: double; b: double): double; cdecl; external libgsl;
function gsl_sf_beta_inc_e(a: double; b: double; x: double; result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_beta_inc(a: double; b: double; x: double): double; cdecl; external libgsl;

const
  GSL_SF_GAMMA_XMAX = 171.0;
  GSL_SF_FACT_NMAX = 170;
  GSL_SF_DOUBLEFACT_NMAX = 297;

  // === Konventiert am: 22-8-25 14:04:41 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
