{$IFDEF read_interface}



procedure gsl_sort_vector_long_double(v: Pgsl_vector_long_double); cdecl; external libgsl;
procedure gsl_sort_vector2_long_double(v1: Pgsl_vector_long_double; v2: Pgsl_vector_long_double); cdecl; external libgsl;
function gsl_sort_vector_long_double_index(p: Pgsl_permutation; v: Pgsl_vector_long_double): longint; cdecl; external libgsl;
function gsl_sort_vector_long_double_smallest(dest: Plong_double; k: Tsize_t; v: Pgsl_vector_long_double): longint; cdecl; external libgsl;
function gsl_sort_vector_long_double_largest(dest: Plong_double; k: Tsize_t; v: Pgsl_vector_long_double): longint; cdecl; external libgsl;
function gsl_sort_vector_long_double_smallest_index(p: Psize_t; k: Tsize_t; v: Pgsl_vector_long_double): longint; cdecl; external libgsl;
function gsl_sort_vector_long_double_largest_index(p: Psize_t; k: Tsize_t; v: Pgsl_vector_long_double): longint; cdecl; external libgsl;

// === Konventiert am: 21-8-25 14:49:02 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
