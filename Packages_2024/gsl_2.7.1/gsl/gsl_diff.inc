{$IFDEF read_interface}



function gsl_diff_central(f: Pgsl_function; x: double; result: Pdouble; abserr: Pdouble): longint; cdecl; external libgsl; deprecated;
function gsl_diff_backward(f: Pgsl_function; x: double; result: Pdouble; abserr: Pdouble): longint; cdecl; external libgsl; deprecated;
function gsl_diff_forward(f: Pgsl_function; x: double; result: Pdouble; abserr: Pdouble): longint; cdecl; external libgsl; deprecated;

// === Konventiert am: 21-8-25 16:52:10 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
