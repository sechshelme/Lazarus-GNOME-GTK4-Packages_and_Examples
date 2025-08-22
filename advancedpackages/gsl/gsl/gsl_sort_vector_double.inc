{$IFDEF read_interface}



procedure gsl_sort_vector(v: Pgsl_vector); cdecl; external libgsl;
procedure gsl_sort_vector2(v1: Pgsl_vector; v2: Pgsl_vector); cdecl; external libgsl;
function gsl_sort_vector_index(p: Pgsl_permutation; v: Pgsl_vector): longint; cdecl; external libgsl;
function gsl_sort_vector_smallest(dest: Pdouble; k: Tsize_t; v: Pgsl_vector): longint; cdecl; external libgsl;
function gsl_sort_vector_largest(dest: Pdouble; k: Tsize_t; v: Pgsl_vector): longint; cdecl; external libgsl;
function gsl_sort_vector_smallest_index(p: Psize_t; k: Tsize_t; v: Pgsl_vector): longint; cdecl; external libgsl;
function gsl_sort_vector_largest_index(p: Psize_t; k: Tsize_t; v: Pgsl_vector): longint; cdecl; external libgsl;

// === Konventiert am: 21-8-25 14:48:51 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
