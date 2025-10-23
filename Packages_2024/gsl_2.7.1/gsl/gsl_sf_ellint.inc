{$IFDEF read_interface}


function gsl_sf_ellint_Kcomp_e(k: Tdouble; mode: Tgsl_mode_t; result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_ellint_Kcomp(k: Tdouble; mode: Tgsl_mode_t): Tdouble; cdecl; external libgsl;
function gsl_sf_ellint_Ecomp_e(k: Tdouble; mode: Tgsl_mode_t; result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_ellint_Ecomp(k: Tdouble; mode: Tgsl_mode_t): Tdouble; cdecl; external libgsl;
function gsl_sf_ellint_Pcomp_e(k: Tdouble; n: Tdouble; mode: Tgsl_mode_t; result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_ellint_Pcomp(k: Tdouble; n: Tdouble; mode: Tgsl_mode_t): Tdouble; cdecl; external libgsl;
function gsl_sf_ellint_Dcomp_e(k: Tdouble; mode: Tgsl_mode_t; result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_ellint_Dcomp(k: Tdouble; mode: Tgsl_mode_t): Tdouble; cdecl; external libgsl;
function gsl_sf_ellint_F_e(phi: Tdouble; k: Tdouble; mode: Tgsl_mode_t; result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_ellint_F(phi: Tdouble; k: Tdouble; mode: Tgsl_mode_t): Tdouble; cdecl; external libgsl;
function gsl_sf_ellint_E_e(phi: Tdouble; k: Tdouble; mode: Tgsl_mode_t; result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_ellint_E(phi: Tdouble; k: Tdouble; mode: Tgsl_mode_t): Tdouble; cdecl; external libgsl;
function gsl_sf_ellint_P_e(phi: Tdouble; k: Tdouble; n: Tdouble; mode: Tgsl_mode_t; result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_ellint_P(phi: Tdouble; k: Tdouble; n: Tdouble; mode: Tgsl_mode_t): Tdouble; cdecl; external libgsl;
function gsl_sf_ellint_D_e(phi: Tdouble; k: Tdouble; mode: Tgsl_mode_t; result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_ellint_D(phi: Tdouble; k: Tdouble; mode: Tgsl_mode_t): Tdouble; cdecl; external libgsl;
function gsl_sf_ellint_RC_e(x: Tdouble; y: Tdouble; mode: Tgsl_mode_t; result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_ellint_RC(x: Tdouble; y: Tdouble; mode: Tgsl_mode_t): Tdouble; cdecl; external libgsl;
function gsl_sf_ellint_RD_e(x: Tdouble; y: Tdouble; z: Tdouble; mode: Tgsl_mode_t; result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_ellint_RD(x: Tdouble; y: Tdouble; z: Tdouble; mode: Tgsl_mode_t): Tdouble; cdecl; external libgsl;
function gsl_sf_ellint_RF_e(x: Tdouble; y: Tdouble; z: Tdouble; mode: Tgsl_mode_t; result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_ellint_RF(x: Tdouble; y: Tdouble; z: Tdouble; mode: Tgsl_mode_t): Tdouble; cdecl; external libgsl;
function gsl_sf_ellint_RJ_e(x: Tdouble; y: Tdouble; z: Tdouble; p: Tdouble; mode: Tgsl_mode_t;
  result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_ellint_RJ(x: Tdouble; y: Tdouble; z: Tdouble; p: Tdouble; mode: Tgsl_mode_t): Tdouble; cdecl; external libgsl;

// === Konventiert am: 22-8-25 14:04:26 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
