{$IFDEF read_interface}



procedure gsl_sort_vector_ulong(v: Pgsl_vector_ulong); cdecl; external libgsl;
procedure gsl_sort_vector2_ulong(v1: Pgsl_vector_ulong; v2: Pgsl_vector_ulong); cdecl; external libgsl;
function gsl_sort_vector_ulong_index(p: Pgsl_permutation; v: Pgsl_vector_ulong): longint; cdecl; external libgsl;
function gsl_sort_vector_ulong_smallest(dest: Pdword; k: Tsize_t; v: Pgsl_vector_ulong): longint; cdecl; external libgsl;
function gsl_sort_vector_ulong_largest(dest: Pdword; k: Tsize_t; v: Pgsl_vector_ulong): longint; cdecl; external libgsl;
function gsl_sort_vector_ulong_smallest_index(p: Psize_t; k: Tsize_t; v: Pgsl_vector_ulong): longint; cdecl; external libgsl;
function gsl_sort_vector_ulong_largest_index(p: Psize_t; k: Tsize_t; v: Pgsl_vector_ulong): longint; cdecl; external libgsl;

// === Konventiert am: 21-8-25 14:49:13 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
