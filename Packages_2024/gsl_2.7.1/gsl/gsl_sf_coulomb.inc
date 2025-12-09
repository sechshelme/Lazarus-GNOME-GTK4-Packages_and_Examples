{$IFDEF read_interface}


function gsl_sf_hydrogenicR_1_e(Z: double; r: double; result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_hydrogenicR_1(Z: double; r: double): double; cdecl; external libgsl;
function gsl_sf_hydrogenicR_e(n: longint; l: longint; Z: double; r: double; result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_hydrogenicR(n: longint; l: longint; Z: double; r: double): double; cdecl; external libgsl;
function gsl_sf_coulomb_wave_FG_e(eta: double; x: double; lam_F: double; k_lam_G: longint; F: Pgsl_sf_result;
  Fp: Pgsl_sf_result; G: Pgsl_sf_result; Gp: Pgsl_sf_result; exp_F: Pdouble; exp_G: Pdouble): longint; cdecl; external libgsl;
function gsl_sf_coulomb_wave_F_array(lam_min: double; kmax: longint; eta: double; x: double; fc_array: Pdouble;
  F_exponent: Pdouble): longint; cdecl; external libgsl;
function gsl_sf_coulomb_wave_FG_array(lam_min: double; kmax: longint; eta: double; x: double; fc_array: Pdouble;
  gc_array: Pdouble; F_exponent: Pdouble; G_exponent: Pdouble): longint; cdecl; external libgsl;
function gsl_sf_coulomb_wave_FGp_array(lam_min: double; kmax: longint; eta: double; x: double; fc_array: Pdouble;
  fcp_array: Pdouble; gc_array: Pdouble; gcp_array: Pdouble; F_exponent: Pdouble; G_exponent: Pdouble): longint; cdecl; external libgsl;
function gsl_sf_coulomb_wave_sphF_array(lam_min: double; kmax: longint; eta: double; x: double; fc_array: Pdouble;
  F_exponent: Pdouble): longint; cdecl; external libgsl;
function gsl_sf_coulomb_CL_e(L: double; eta: double; result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_coulomb_CL_array(Lmin: double; kmax: longint; eta: double; cl: Pdouble): longint; cdecl; external libgsl;

// === Konventiert am: 22-8-25 14:04:13 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
