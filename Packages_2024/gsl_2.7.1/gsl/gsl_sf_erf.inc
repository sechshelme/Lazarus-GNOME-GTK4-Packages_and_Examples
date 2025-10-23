{$IFDEF read_interface}


function gsl_sf_erfc_e(x: Tdouble; result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_erfc(x: Tdouble): Tdouble; cdecl; external libgsl;
function gsl_sf_log_erfc_e(x: Tdouble; result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_log_erfc(x: Tdouble): Tdouble; cdecl; external libgsl;
function gsl_sf_erf_e(x: Tdouble; result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_erf(x: Tdouble): Tdouble; cdecl; external libgsl;
function gsl_sf_erf_Z_e(x: Tdouble; result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_erf_Q_e(x: Tdouble; result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_erf_Z(x: Tdouble): Tdouble; cdecl; external libgsl;
function gsl_sf_erf_Q(x: Tdouble): Tdouble; cdecl; external libgsl;
function gsl_sf_hazard_e(x: Tdouble; result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_hazard(x: Tdouble): Tdouble; cdecl; external libgsl;

// === Konventiert am: 22-8-25 14:04:31 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
