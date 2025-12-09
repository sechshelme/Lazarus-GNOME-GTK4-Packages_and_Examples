{$IFDEF read_interface}


function gsl_sf_ellint_Kcomp_e(k: double; mode: Tgsl_mode_t; result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_ellint_Kcomp(k: double; mode: Tgsl_mode_t): double; cdecl; external libgsl;
function gsl_sf_ellint_Ecomp_e(k: double; mode: Tgsl_mode_t; result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_ellint_Ecomp(k: double; mode: Tgsl_mode_t): double; cdecl; external libgsl;
function gsl_sf_ellint_Pcomp_e(k: double; n: double; mode: Tgsl_mode_t; result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_ellint_Pcomp(k: double; n: double; mode: Tgsl_mode_t): double; cdecl; external libgsl;
function gsl_sf_ellint_Dcomp_e(k: double; mode: Tgsl_mode_t; result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_ellint_Dcomp(k: double; mode: Tgsl_mode_t): double; cdecl; external libgsl;
function gsl_sf_ellint_F_e(phi: double; k: double; mode: Tgsl_mode_t; result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_ellint_F(phi: double; k: double; mode: Tgsl_mode_t): double; cdecl; external libgsl;
function gsl_sf_ellint_E_e(phi: double; k: double; mode: Tgsl_mode_t; result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_ellint_E(phi: double; k: double; mode: Tgsl_mode_t): double; cdecl; external libgsl;
function gsl_sf_ellint_P_e(phi: double; k: double; n: double; mode: Tgsl_mode_t; result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_ellint_P(phi: double; k: double; n: double; mode: Tgsl_mode_t): double; cdecl; external libgsl;
function gsl_sf_ellint_D_e(phi: double; k: double; mode: Tgsl_mode_t; result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_ellint_D(phi: double; k: double; mode: Tgsl_mode_t): double; cdecl; external libgsl;
function gsl_sf_ellint_RC_e(x: double; y: double; mode: Tgsl_mode_t; result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_ellint_RC(x: double; y: double; mode: Tgsl_mode_t): double; cdecl; external libgsl;
function gsl_sf_ellint_RD_e(x: double; y: double; z: double; mode: Tgsl_mode_t; result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_ellint_RD(x: double; y: double; z: double; mode: Tgsl_mode_t): double; cdecl; external libgsl;
function gsl_sf_ellint_RF_e(x: double; y: double; z: double; mode: Tgsl_mode_t; result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_ellint_RF(x: double; y: double; z: double; mode: Tgsl_mode_t): double; cdecl; external libgsl;
function gsl_sf_ellint_RJ_e(x: double; y: double; z: double; p: double; mode: Tgsl_mode_t;
  result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_ellint_RJ(x: double; y: double; z: double; p: double; mode: Tgsl_mode_t): double; cdecl; external libgsl;

// === Konventiert am: 22-8-25 14:04:26 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
