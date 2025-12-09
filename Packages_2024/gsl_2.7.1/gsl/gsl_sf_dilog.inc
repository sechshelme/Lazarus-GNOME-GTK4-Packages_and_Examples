{$IFDEF read_interface}


function gsl_sf_dilog_e(x: double; result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_dilog(x: double): double; cdecl; external libgsl;
function gsl_sf_complex_dilog_xy_e(x: double; y: double; result_re: Pgsl_sf_result; result_im: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_complex_dilog_e(r: double; theta: double; result_re: Pgsl_sf_result; result_im: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_complex_spence_xy_e(x: double; y: double; real_sp: Pgsl_sf_result; imag_sp: Pgsl_sf_result): longint; cdecl; external libgsl;

// === Konventiert am: 22-8-25 14:04:22 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
