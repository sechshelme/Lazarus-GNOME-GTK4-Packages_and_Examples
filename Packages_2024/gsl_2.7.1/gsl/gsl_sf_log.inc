{$IFDEF read_interface}



function gsl_sf_log_e(x: double; result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_log(x: double): double; cdecl; external libgsl;
function gsl_sf_log_abs_e(x: double; result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_log_abs(x: double): double; cdecl; external libgsl;
function gsl_sf_complex_log_e(zr: double; zi: double; lnr: Pgsl_sf_result; theta: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_log_1plusx_e(x: double; result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_log_1plusx(x: double): double; cdecl; external libgsl;
function gsl_sf_log_1plusx_mx_e(x: double; result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_log_1plusx_mx(x: double): double; cdecl; external libgsl;

// === Konventiert am: 22-8-25 13:58:41 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
