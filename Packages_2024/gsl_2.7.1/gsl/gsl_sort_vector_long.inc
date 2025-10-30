{$IFDEF read_interface}



procedure gsl_sort_vector_long(v: Pgsl_vector_long); cdecl; external libgsl;
procedure gsl_sort_vector2_long(v1: Pgsl_vector_long; v2: Pgsl_vector_long); cdecl; external libgsl;
function gsl_sort_vector_long_index(p: Pgsl_permutation; v: Pgsl_vector_long): longint; cdecl; external libgsl;
function gsl_sort_vector_long_smallest(dest: Pclong; k: Tsize_t; v: Pgsl_vector_long): longint; cdecl; external libgsl;
function gsl_sort_vector_long_largest(dest: Pclong; k: Tsize_t; v: Pgsl_vector_long): longint; cdecl; external libgsl;
function gsl_sort_vector_long_smallest_index(p: Psize_t; k: Tsize_t; v: Pgsl_vector_long): longint; cdecl; external libgsl;
function gsl_sort_vector_long_largest_index(p: Psize_t; k: Tsize_t; v: Pgsl_vector_long): longint; cdecl; external libgsl;

// === Konventiert am: 21-8-25 14:49:00 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
