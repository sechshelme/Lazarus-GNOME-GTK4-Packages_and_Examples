{$IFDEF read_interface}


function gsl_sf_zeta_int_e(n: longint; result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_zeta_int(n: longint): double; cdecl; external libgsl;
function gsl_sf_zeta_e(s: double; result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_zeta(s: double): double; cdecl; external libgsl;
function gsl_sf_zetam1_e(s: double; result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_zetam1(s: double): double; cdecl; external libgsl;
function gsl_sf_zetam1_int_e(s: longint; result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_zetam1_int(s: longint): double; cdecl; external libgsl;
function gsl_sf_hzeta_e(s: double; q: double; result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_hzeta(s: double; q: double): double; cdecl; external libgsl;
function gsl_sf_eta_int_e(n: longint; result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_eta_int(n: longint): double; cdecl; external libgsl;
function gsl_sf_eta_e(s: double; result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_eta(s: double): double; cdecl; external libgsl;

// === Konventiert am: 22-8-25 13:59:27 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
