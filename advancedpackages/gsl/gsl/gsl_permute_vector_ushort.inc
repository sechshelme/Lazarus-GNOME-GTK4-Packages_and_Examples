{$IFDEF read_interface}



function gsl_permute_vector_ushort(p: Pgsl_permutation; v: Pgsl_vector_ushort): longint; cdecl; external libgsl;
function gsl_permute_vector_ushort_inverse(p: Pgsl_permutation; v: Pgsl_vector_ushort): longint; cdecl; external libgsl;

// === Konventiert am: 21-8-25 16:02:44 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
