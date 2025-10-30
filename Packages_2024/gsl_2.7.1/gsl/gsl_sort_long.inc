{$IFDEF read_interface}



procedure gsl_sort_long(data: Pclong; stride: Tsize_t; n: Tsize_t); cdecl; external libgsl;
procedure gsl_sort2_long(data1: Pclong; stride1: Tsize_t; data2: Pclong; stride2: Tsize_t; n: Tsize_t); cdecl; external libgsl;
procedure gsl_sort_long_index(p: Psize_t; data: Pclong; stride: Tsize_t; n: Tsize_t); cdecl; external libgsl;
function gsl_sort_long_smallest(dest: Pclong; k: Tsize_t; src: Pclong; stride: Tsize_t; n: Tsize_t): longint; cdecl; external libgsl;
function gsl_sort_long_smallest_index(p: Psize_t; k: Tsize_t; src: Pclong; stride: Tsize_t; n: Tsize_t): longint; cdecl; external libgsl;
function gsl_sort_long_largest(dest: Pclong; k: Tsize_t; src: Pclong; stride: Tsize_t; n: Tsize_t): longint; cdecl; external libgsl;
function gsl_sort_long_largest_index(p: Psize_t; k: Tsize_t; src: Pclong; stride: Tsize_t; n: Tsize_t): longint; cdecl; external libgsl;

// === Konventiert am: 21-8-25 14:44:29 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
