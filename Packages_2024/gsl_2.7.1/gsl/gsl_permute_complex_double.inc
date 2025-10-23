{$IFDEF read_interface}



function gsl_permute_complex(p: Psize_t; data: Pdouble; stride: Tsize_t; n: Tsize_t): longint; cdecl; external libgsl;
function gsl_permute_complex_inverse(p: Psize_t; data: Pdouble; stride: Tsize_t; n: Tsize_t): longint; cdecl; external libgsl;

// === Konventiert am: 21-8-25 15:56:04 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
