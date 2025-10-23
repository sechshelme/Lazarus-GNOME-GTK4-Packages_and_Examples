{$IFDEF read_interface}



function gsl_permute_vector_float(p: Pgsl_permutation; v: Pgsl_vector_float): longint; cdecl; external libgsl;
function gsl_permute_vector_float_inverse(p: Pgsl_permutation; v: Pgsl_vector_float): longint; cdecl; external libgsl;

// === Konventiert am: 21-8-25 16:02:22 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
