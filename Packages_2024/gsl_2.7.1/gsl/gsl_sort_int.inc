{$IFDEF read_interface}



procedure gsl_sort_int(data: Plongint; stride: Tsize_t; n: Tsize_t); cdecl; external libgsl;
procedure gsl_sort2_int(data1: Plongint; stride1: Tsize_t; data2: Plongint; stride2: Tsize_t; n: Tsize_t); cdecl; external libgsl;
procedure gsl_sort_int_index(p: Psize_t; data: Plongint; stride: Tsize_t; n: Tsize_t); cdecl; external libgsl;
function gsl_sort_int_smallest(dest: Plongint; k: Tsize_t; src: Plongint; stride: Tsize_t; n: Tsize_t): longint; cdecl; external libgsl;
function gsl_sort_int_smallest_index(p: Psize_t; k: Tsize_t; src: Plongint; stride: Tsize_t; n: Tsize_t): longint; cdecl; external libgsl;
function gsl_sort_int_largest(dest: Plongint; k: Tsize_t; src: Plongint; stride: Tsize_t; n: Tsize_t): longint; cdecl; external libgsl;
function gsl_sort_int_largest_index(p: Psize_t; k: Tsize_t; src: Plongint; stride: Tsize_t; n: Tsize_t): longint; cdecl; external libgsl;

// === Konventiert am: 21-8-25 14:44:26 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
