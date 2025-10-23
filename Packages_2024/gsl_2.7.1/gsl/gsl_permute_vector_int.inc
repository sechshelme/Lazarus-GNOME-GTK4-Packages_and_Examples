{$IFDEF read_interface}



function gsl_permute_vector_int(p: Pgsl_permutation; v: Pgsl_vector_int): longint; cdecl; external libgsl;
function gsl_permute_vector_int_inverse(p: Pgsl_permutation; v: Pgsl_vector_int): longint; cdecl; external libgsl;

// === Konventiert am: 21-8-25 16:02:24 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
