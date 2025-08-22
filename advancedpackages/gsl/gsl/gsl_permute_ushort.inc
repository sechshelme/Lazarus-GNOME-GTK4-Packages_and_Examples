{$IFDEF read_interface}



function gsl_permute_ushort(p: Psize_t; data: Pword; stride: Tsize_t; n: Tsize_t): longint; cdecl; external libgsl;
function gsl_permute_ushort_inverse(p: Psize_t; data: Pword; stride: Tsize_t; n: Tsize_t): longint; cdecl; external libgsl;

// === Konventiert am: 21-8-25 15:56:41 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
