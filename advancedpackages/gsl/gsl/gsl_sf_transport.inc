{$IFDEF read_interface}


function gsl_sf_transport_2_e(x: Tdouble; result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_transport_2(x: Tdouble): Tdouble; cdecl; external libgsl;
function gsl_sf_transport_3_e(x: Tdouble; result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_transport_3(x: Tdouble): Tdouble; cdecl; external libgsl;
function gsl_sf_transport_4_e(x: Tdouble; result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_transport_4(x: Tdouble): Tdouble; cdecl; external libgsl;
function gsl_sf_transport_5_e(x: Tdouble; result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_transport_5(x: Tdouble): Tdouble; cdecl; external libgsl;

// === Konventiert am: 22-8-25 13:59:18 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
