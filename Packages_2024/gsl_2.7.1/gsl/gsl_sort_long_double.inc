{$IFDEF read_interface}



procedure gsl_sort_long_double(data: Plong_double; stride: Tsize_t; n: Tsize_t); cdecl; external libgsl;
procedure gsl_sort2_long_double(data1: Plong_double; stride1: Tsize_t; data2: Plong_double; stride2: Tsize_t; n: Tsize_t); cdecl; external libgsl;
procedure gsl_sort_long_double_index(p: Psize_t; data: Plong_double; stride: Tsize_t; n: Tsize_t); cdecl; external libgsl;
function gsl_sort_long_double_smallest(dest: Plong_double; k: Tsize_t; src: Plong_double; stride: Tsize_t; n: Tsize_t): longint; cdecl; external libgsl;
function gsl_sort_long_double_smallest_index(p: Psize_t; k: Tsize_t; src: Plong_double; stride: Tsize_t; n: Tsize_t): longint; cdecl; external libgsl;
function gsl_sort_long_double_largest(dest: Plong_double; k: Tsize_t; src: Plong_double; stride: Tsize_t; n: Tsize_t): longint; cdecl; external libgsl;
function gsl_sort_long_double_largest_index(p: Psize_t; k: Tsize_t; src: Plong_double; stride: Tsize_t; n: Tsize_t): longint; cdecl; external libgsl;

// === Konventiert am: 21-8-25 14:44:31 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
