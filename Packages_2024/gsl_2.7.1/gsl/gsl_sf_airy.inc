{$IFDEF read_interface}


function gsl_sf_airy_Ai_e(x: double; mode: Tgsl_mode_t; result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_airy_Ai(x: double; mode: Tgsl_mode_t): double; cdecl; external libgsl;
function gsl_sf_airy_Bi_e(x: double; mode: Tgsl_mode_t; result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_airy_Bi(x: double; mode: Tgsl_mode_t): double; cdecl; external libgsl;
function gsl_sf_airy_Ai_scaled_e(x: double; mode: Tgsl_mode_t; result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_airy_Ai_scaled(x: double; mode: Tgsl_mode_t): double; cdecl; external libgsl;
function gsl_sf_airy_Bi_scaled_e(x: double; mode: Tgsl_mode_t; result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_airy_Bi_scaled(x: double; mode: Tgsl_mode_t): double; cdecl; external libgsl;
function gsl_sf_airy_Ai_deriv_e(x: double; mode: Tgsl_mode_t; result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_airy_Ai_deriv(x: double; mode: Tgsl_mode_t): double; cdecl; external libgsl;
function gsl_sf_airy_Bi_deriv_e(x: double; mode: Tgsl_mode_t; result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_airy_Bi_deriv(x: double; mode: Tgsl_mode_t): double; cdecl; external libgsl;
function gsl_sf_airy_Ai_deriv_scaled_e(x: double; mode: Tgsl_mode_t; result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_airy_Ai_deriv_scaled(x: double; mode: Tgsl_mode_t): double; cdecl; external libgsl;
function gsl_sf_airy_Bi_deriv_scaled_e(x: double; mode: Tgsl_mode_t; result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_airy_Bi_deriv_scaled(x: double; mode: Tgsl_mode_t): double; cdecl; external libgsl;
function gsl_sf_airy_zero_Ai_e(s: dword; result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_airy_zero_Ai(s: dword): double; cdecl; external libgsl;
function gsl_sf_airy_zero_Bi_e(s: dword; result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_airy_zero_Bi(s: dword): double; cdecl; external libgsl;
function gsl_sf_airy_zero_Ai_deriv_e(s: dword; result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_airy_zero_Ai_deriv(s: dword): double; cdecl; external libgsl;
function gsl_sf_airy_zero_Bi_deriv_e(s: dword; result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_airy_zero_Bi_deriv(s: dword): double; cdecl; external libgsl;

// === Konventiert am: 22-8-25 14:04:05 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
