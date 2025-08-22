{$IFDEF read_interface}



function gsl_permute_vector_uchar(p: Pgsl_permutation; v: Pgsl_vector_uchar): longint; cdecl; external libgsl;
function gsl_permute_vector_uchar_inverse(p: Pgsl_permutation; v: Pgsl_vector_uchar): longint; cdecl; external libgsl;

// === Konventiert am: 21-8-25 16:02:35 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
