{$IFDEF read_interface}


function gsl_sf_dilog_e(x: Tdouble; result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_dilog(x: Tdouble): Tdouble; cdecl; external libgsl;
function gsl_sf_complex_dilog_xy_e(x: Tdouble; y: Tdouble; result_re: Pgsl_sf_result; result_im: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_complex_dilog_e(r: Tdouble; theta: Tdouble; result_re: Pgsl_sf_result; result_im: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_complex_spence_xy_e(x: Tdouble; y: Tdouble; real_sp: Pgsl_sf_result; imag_sp: Pgsl_sf_result): longint; cdecl; external libgsl;

// === Konventiert am: 22-8-25 14:04:22 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
