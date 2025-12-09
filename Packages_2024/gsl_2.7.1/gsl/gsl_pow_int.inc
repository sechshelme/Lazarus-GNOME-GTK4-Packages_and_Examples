{$IFDEF read_interface}



function gsl_pow_2(x: double): double; cdecl; external libgsl;
function gsl_pow_3(x: double): double; cdecl; external libgsl;
function gsl_pow_4(x: double): double; cdecl; external libgsl;
function gsl_pow_5(x: double): double; cdecl; external libgsl;
function gsl_pow_6(x: double): double; cdecl; external libgsl;
function gsl_pow_7(x: double): double; cdecl; external libgsl;
function gsl_pow_8(x: double): double; cdecl; external libgsl;
function gsl_pow_9(x: double): double; cdecl; external libgsl;
function gsl_pow_int(x: double; n: longint): double; cdecl; external libgsl;
function gsl_pow_uint(x: double; n: dword): double; cdecl; external libgsl;

// === Konventiert am: 22-8-25 13:19:33 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
