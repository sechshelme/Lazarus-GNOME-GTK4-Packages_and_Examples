{$IFDEF read_interface}



procedure gsl_sort(data: Pdouble; stride: Tsize_t; n: Tsize_t); cdecl; external libgsl;
procedure gsl_sort2(data1: Pdouble; stride1: Tsize_t; data2: Pdouble; stride2: Tsize_t; n: Tsize_t); cdecl; external libgsl;
procedure gsl_sort_index(p: Psize_t; data: Pdouble; stride: Tsize_t; n: Tsize_t); cdecl; external libgsl;
function gsl_sort_smallest(dest: Pdouble; k: Tsize_t; src: Pdouble; stride: Tsize_t; n: Tsize_t): longint; cdecl; external libgsl;
function gsl_sort_smallest_index(p: Psize_t; k: Tsize_t; src: Pdouble; stride: Tsize_t; n: Tsize_t): longint; cdecl; external libgsl;
function gsl_sort_largest(dest: Pdouble; k: Tsize_t; src: Pdouble; stride: Tsize_t; n: Tsize_t): longint; cdecl; external libgsl;
function gsl_sort_largest_index(p: Psize_t; k: Tsize_t; src: Pdouble; stride: Tsize_t; n: Tsize_t): longint; cdecl; external libgsl;

// === Konventiert am: 21-8-25 14:44:21 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
