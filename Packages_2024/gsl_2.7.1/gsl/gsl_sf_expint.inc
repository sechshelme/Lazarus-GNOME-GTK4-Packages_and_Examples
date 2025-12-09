{$IFDEF read_interface}


function gsl_sf_expint_E1_e(x: double; result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_expint_E1(x: double): double; cdecl; external libgsl;
function gsl_sf_expint_E2_e(x: double; result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_expint_E2(x: double): double; cdecl; external libgsl;
function gsl_sf_expint_En_e(n: longint; x: double; result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_expint_En(n: longint; x: double): double; cdecl; external libgsl;
function gsl_sf_expint_E1_scaled_e(x: double; result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_expint_E1_scaled(x: double): double; cdecl; external libgsl;
function gsl_sf_expint_E2_scaled_e(x: double; result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_expint_E2_scaled(x: double): double; cdecl; external libgsl;
function gsl_sf_expint_En_scaled_e(n: longint; x: double; result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_expint_En_scaled(n: longint; x: double): double; cdecl; external libgsl;
function gsl_sf_expint_Ei_e(x: double; result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_expint_Ei(x: double): double; cdecl; external libgsl;
function gsl_sf_expint_Ei_scaled_e(x: double; result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_expint_Ei_scaled(x: double): double; cdecl; external libgsl;
function gsl_sf_Shi_e(x: double; result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_Shi(x: double): double; cdecl; external libgsl;
function gsl_sf_Chi_e(x: double; result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_Chi(x: double): double; cdecl; external libgsl;
function gsl_sf_expint_3_e(x: double; result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_expint_3(x: double): double; cdecl; external libgsl;
function gsl_sf_Si_e(x: double; result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_Si(x: double): double; cdecl; external libgsl;
function gsl_sf_Ci_e(x: double; result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_Ci(x: double): double; cdecl; external libgsl;
function gsl_sf_atanint_e(x: double; result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_atanint(x: double): double; cdecl; external libgsl;

// === Konventiert am: 22-8-25 14:04:35 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
