{$IFDEF read_interface}



procedure gsl_sort_ulong(data: Pculong; stride: Tsize_t; n: Tsize_t); cdecl; external libgsl;
procedure gsl_sort2_ulong(data1: Pculong; stride1: Tsize_t; data2: Pculong; stride2: Tsize_t; n: Tsize_t); cdecl; external libgsl;
procedure gsl_sort_ulong_index(p: Psize_t; data: Pculong; stride: Tsize_t; n: Tsize_t); cdecl; external libgsl;
function gsl_sort_ulong_smallest(dest: Pculong; k: Tsize_t; src: Pculong; stride: Tsize_t; n: Tsize_t): longint; cdecl; external libgsl;
function gsl_sort_ulong_smallest_index(p: Psize_t; k: Tsize_t; src: Pculong; stride: Tsize_t; n: Tsize_t): longint; cdecl; external libgsl;
function gsl_sort_ulong_largest(dest: Pculong; k: Tsize_t; src: Pculong; stride: Tsize_t; n: Tsize_t): longint; cdecl; external libgsl;
function gsl_sort_ulong_largest_index(p: Psize_t; k: Tsize_t; src: p; stride: Tsize_t; n: Tsize_t): longint; cdecl; external libgsl;

// === Konventiert am: 21-8-25 14:44:43 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
