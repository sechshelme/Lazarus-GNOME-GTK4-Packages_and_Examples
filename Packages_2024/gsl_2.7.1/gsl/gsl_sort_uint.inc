{$IFDEF read_interface}



procedure gsl_sort_uint(data: Pdword; stride: Tsize_t; n: Tsize_t); cdecl; external libgsl;
procedure gsl_sort2_uint(data1: Pdword; stride1: Tsize_t; data2: Pdword; stride2: Tsize_t; n: Tsize_t); cdecl; external libgsl;
procedure gsl_sort_uint_index(p: Psize_t; data: Pdword; stride: Tsize_t; n: Tsize_t); cdecl; external libgsl;
function gsl_sort_uint_smallest(dest: Pdword; k: Tsize_t; src: Pdword; stride: Tsize_t; n: Tsize_t): longint; cdecl; external libgsl;
function gsl_sort_uint_smallest_index(p: Psize_t; k: Tsize_t; src: Pdword; stride: Tsize_t; n: Tsize_t): longint; cdecl; external libgsl;
function gsl_sort_uint_largest(dest: Pdword; k: Tsize_t; src: Pdword; stride: Tsize_t; n: Tsize_t): longint; cdecl; external libgsl;
function gsl_sort_uint_largest_index(p: Psize_t; k: Tsize_t; src: Pdword; stride: Tsize_t; n: Tsize_t): longint; cdecl; external libgsl;

// === Konventiert am: 21-8-25 14:44:39 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
