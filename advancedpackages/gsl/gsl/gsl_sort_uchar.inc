{$IFDEF read_interface}



procedure gsl_sort_uchar(data: pbyte; stride: Tsize_t; n: Tsize_t); cdecl; external libgsl;
procedure gsl_sort2_uchar(data1: pbyte; stride1: Tsize_t; data2: pbyte; stride2: Tsize_t; n: Tsize_t); cdecl; external libgsl;
procedure gsl_sort_uchar_index(p: Psize_t; data: pbyte; stride: Tsize_t; n: Tsize_t); cdecl; external libgsl;
function gsl_sort_uchar_smallest(dest: pbyte; k: Tsize_t; src: pbyte; stride: Tsize_t; n: Tsize_t): longint; cdecl; external libgsl;
function gsl_sort_uchar_smallest_index(p: Psize_t; k: Tsize_t; src: pbyte; stride: Tsize_t; n: Tsize_t): longint; cdecl; external libgsl;
function gsl_sort_uchar_largest(dest: pbyte; k: Tsize_t; src: pbyte; stride: Tsize_t; n: Tsize_t): longint; cdecl; external libgsl;
function gsl_sort_uchar_largest_index(p: Psize_t; k: Tsize_t; src: pbyte; stride: Tsize_t; n: Tsize_t): longint; cdecl; external libgsl;

// === Konventiert am: 21-8-25 14:44:37 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
