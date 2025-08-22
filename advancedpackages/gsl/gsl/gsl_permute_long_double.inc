{$IFDEF read_interface}



function gsl_permute_long_double(p: Psize_t; data: Plong_double; stride: Tsize_t; n: Tsize_t): longint; cdecl; external libgsl;
function gsl_permute_long_double_inverse(p: Psize_t; data: Plong_double; stride: Tsize_t; n: Tsize_t): longint; cdecl; external libgsl;

// === Konventiert am: 21-8-25 15:56:23 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
