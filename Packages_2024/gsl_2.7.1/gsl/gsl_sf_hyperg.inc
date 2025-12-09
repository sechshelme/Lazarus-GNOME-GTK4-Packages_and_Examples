{$IFDEF read_interface}


function gsl_sf_hyperg_0F1_e(c: double; x: double; result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_hyperg_0F1(c: double; x: double): double; cdecl; external libgsl;
function gsl_sf_hyperg_1F1_int_e(m: longint; n: longint; x: double; result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_hyperg_1F1_int(m: longint; n: longint; x: double): double; cdecl; external libgsl;
function gsl_sf_hyperg_1F1_e(a: double; b: double; x: double; result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_hyperg_1F1(a: double; b: double; x: double): double; cdecl; external libgsl;
function gsl_sf_hyperg_U_int_e(m: longint; n: longint; x: double; result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_hyperg_U_int(m: longint; n: longint; x: double): double; cdecl; external libgsl;
function gsl_sf_hyperg_U_int_e10_e(m: longint; n: longint; x: double; result: Pgsl_sf_result_e10): longint; cdecl; external libgsl;
function gsl_sf_hyperg_U_e(a: double; b: double; x: double; result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_hyperg_U(a: double; b: double; x: double): double; cdecl; external libgsl;
function gsl_sf_hyperg_U_e10_e(a: double; b: double; x: double; result: Pgsl_sf_result_e10): longint; cdecl; external libgsl;
function gsl_sf_hyperg_2F1_e(a: double; b: double; c: double; x: double; result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_hyperg_2F1(a: double; b: double; c: double; x: double): double; cdecl; external libgsl;
function gsl_sf_hyperg_2F1_conj_e(aR: double; aI: double; c: double; x: double; result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_hyperg_2F1_conj(aR: double; aI: double; c: double; x: double): double; cdecl; external libgsl;
function gsl_sf_hyperg_2F1_renorm_e(a: double; b: double; c: double; x: double; result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_hyperg_2F1_renorm(a: double; b: double; c: double; x: double): double; cdecl; external libgsl;
function gsl_sf_hyperg_2F1_conj_renorm_e(aR: double; aI: double; c: double; x: double; result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_hyperg_2F1_conj_renorm(aR: double; aI: double; c: double; x: double): double; cdecl; external libgsl;
function gsl_sf_hyperg_2F0_e(a: double; b: double; x: double; result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_hyperg_2F0(a: double; b: double; x: double): double; cdecl; external libgsl;

// === Konventiert am: 22-8-25 13:58:32 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
