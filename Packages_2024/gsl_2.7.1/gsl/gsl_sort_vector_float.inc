{$IFDEF read_interface}



procedure gsl_sort_vector_float(v: Pgsl_vector_float); cdecl; external libgsl;
procedure gsl_sort_vector2_float(v1: Pgsl_vector_float; v2: Pgsl_vector_float); cdecl; external libgsl;
function gsl_sort_vector_float_index(p: Pgsl_permutation; v: Pgsl_vector_float): longint; cdecl; external libgsl;
function gsl_sort_vector_float_smallest(dest: Psingle; k: Tsize_t; v: Pgsl_vector_float): longint; cdecl; external libgsl;
function gsl_sort_vector_float_largest(dest: Psingle; k: Tsize_t; v: Pgsl_vector_float): longint; cdecl; external libgsl;
function gsl_sort_vector_float_smallest_index(p: Psize_t; k: Tsize_t; v: Pgsl_vector_float): longint; cdecl; external libgsl;
function gsl_sort_vector_float_largest_index(p: Psize_t; k: Tsize_t; v: Pgsl_vector_float): longint; cdecl; external libgsl;

// === Konventiert am: 21-8-25 14:48:55 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
