{$IFDEF read_interface}



function gsl_permute_vector_uint(p: Pgsl_permutation; v: Pgsl_vector_uint): longint; cdecl; external libgsl;
function gsl_permute_vector_uint_inverse(p: Pgsl_permutation; v: Pgsl_vector_uint): longint; cdecl; external libgsl;

// === Konventiert am: 21-8-25 16:02:38 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
