{$IFDEF read_interface}



function gsl_pow_2(x: Tdouble): Tdouble; cdecl; external libgsl;
function gsl_pow_3(x: Tdouble): Tdouble; cdecl; external libgsl;
function gsl_pow_4(x: Tdouble): Tdouble; cdecl; external libgsl;
function gsl_pow_5(x: Tdouble): Tdouble; cdecl; external libgsl;
function gsl_pow_6(x: Tdouble): Tdouble; cdecl; external libgsl;
function gsl_pow_7(x: Tdouble): Tdouble; cdecl; external libgsl;
function gsl_pow_8(x: Tdouble): Tdouble; cdecl; external libgsl;
function gsl_pow_9(x: Tdouble): Tdouble; cdecl; external libgsl;
function gsl_pow_int(x: Tdouble; n: longint): Tdouble; cdecl; external libgsl;
function gsl_pow_uint(x: Tdouble; n: dword): Tdouble; cdecl; external libgsl;

// === Konventiert am: 22-8-25 13:19:33 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
