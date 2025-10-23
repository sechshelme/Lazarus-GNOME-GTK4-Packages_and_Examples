{$IFDEF read_interface}



function gsl_permute_vector_ulong(p: Pgsl_permutation; v: Pgsl_vector_ulong): longint; cdecl; external libgsl;
function gsl_permute_vector_ulong_inverse(p: Pgsl_permutation; v: Pgsl_vector_ulong): longint; cdecl; external libgsl;

// === Konventiert am: 21-8-25 16:02:41 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
