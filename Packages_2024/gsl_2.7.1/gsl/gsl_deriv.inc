{$IFDEF read_interface}



function gsl_deriv_central(f: Pgsl_function; x: double; h: double; result: Pdouble; abserr: Pdouble): longint; cdecl; external libgsl;
function gsl_deriv_backward(f: Pgsl_function; x: double; h: double; result: Pdouble; abserr: Pdouble): longint; cdecl; external libgsl;
function gsl_deriv_forward(f: Pgsl_function; x: double; h: double; result: Pdouble; abserr: Pdouble): longint; cdecl; external libgsl;

// === Konventiert am: 21-8-25 16:51:59 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
