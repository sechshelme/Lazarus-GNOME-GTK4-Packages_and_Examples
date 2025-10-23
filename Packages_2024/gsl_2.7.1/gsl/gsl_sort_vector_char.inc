{$IFDEF read_interface}



procedure gsl_sort_vector_char(v: Pgsl_vector_char); cdecl; external libgsl;
procedure gsl_sort_vector2_char(v1: Pgsl_vector_char; v2: Pgsl_vector_char); cdecl; external libgsl;
function gsl_sort_vector_char_index(p: Pgsl_permutation; v: Pgsl_vector_char): longint; cdecl; external libgsl;
function gsl_sort_vector_char_smallest(dest: pint8; k: Tsize_t; v: Pgsl_vector_char): longint; cdecl; external libgsl;
function gsl_sort_vector_char_largest(dest: pint8; k: Tsize_t; v: Pgsl_vector_char): longint; cdecl; external libgsl;
function gsl_sort_vector_char_smallest_index(p: Psize_t; k: Tsize_t; v: Pgsl_vector_char): longint; cdecl; external libgsl;
function gsl_sort_vector_char_largest_index(p: Psize_t; k: Tsize_t; v: Pgsl_vector_char): longint; cdecl; external libgsl;

// === Konventiert am: 21-8-25 14:48:48 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
