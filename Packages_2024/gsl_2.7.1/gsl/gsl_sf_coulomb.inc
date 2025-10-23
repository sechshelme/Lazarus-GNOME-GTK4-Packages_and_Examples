{$IFDEF read_interface}


function gsl_sf_hydrogenicR_1_e(Z: Tdouble; r: Tdouble; result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_hydrogenicR_1(Z: Tdouble; r: Tdouble): Tdouble; cdecl; external libgsl;
function gsl_sf_hydrogenicR_e(n: longint; l: longint; Z: Tdouble; r: Tdouble; result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_hydrogenicR(n: longint; l: longint; Z: Tdouble; r: Tdouble): Tdouble; cdecl; external libgsl;
function gsl_sf_coulomb_wave_FG_e(eta: Tdouble; x: Tdouble; lam_F: Tdouble; k_lam_G: longint; F: Pgsl_sf_result;
  Fp: Pgsl_sf_result; G: Pgsl_sf_result; Gp: Pgsl_sf_result; exp_F: Pdouble; exp_G: Pdouble): longint; cdecl; external libgsl;
function gsl_sf_coulomb_wave_F_array(lam_min: Tdouble; kmax: longint; eta: Tdouble; x: Tdouble; fc_array: Pdouble;
  F_exponent: Pdouble): longint; cdecl; external libgsl;
function gsl_sf_coulomb_wave_FG_array(lam_min: Tdouble; kmax: longint; eta: Tdouble; x: Tdouble; fc_array: Pdouble;
  gc_array: Pdouble; F_exponent: Pdouble; G_exponent: Pdouble): longint; cdecl; external libgsl;
function gsl_sf_coulomb_wave_FGp_array(lam_min: Tdouble; kmax: longint; eta: Tdouble; x: Tdouble; fc_array: Pdouble;
  fcp_array: Pdouble; gc_array: Pdouble; gcp_array: Pdouble; F_exponent: Pdouble; G_exponent: Pdouble): longint; cdecl; external libgsl;
function gsl_sf_coulomb_wave_sphF_array(lam_min: Tdouble; kmax: longint; eta: Tdouble; x: Tdouble; fc_array: Pdouble;
  F_exponent: Pdouble): longint; cdecl; external libgsl;
function gsl_sf_coulomb_CL_e(L: Tdouble; eta: Tdouble; result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_coulomb_CL_array(Lmin: Tdouble; kmax: longint; eta: Tdouble; cl: Pdouble): longint; cdecl; external libgsl;

// === Konventiert am: 22-8-25 14:04:13 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
