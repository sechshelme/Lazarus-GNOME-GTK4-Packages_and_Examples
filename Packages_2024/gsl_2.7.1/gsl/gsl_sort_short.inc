{$IFDEF read_interface}



procedure gsl_sort_short(data: Psmallint; stride: Tsize_t; n: Tsize_t); cdecl; external libgsl;
procedure gsl_sort2_short(data1: Psmallint; stride1: Tsize_t; data2: Psmallint; stride2: Tsize_t; n: Tsize_t); cdecl; external libgsl;
procedure gsl_sort_short_index(p: Psize_t; data: Psmallint; stride: Tsize_t; n: Tsize_t); cdecl; external libgsl;
function gsl_sort_short_smallest(dest: Psmallint; k: Tsize_t; src: Psmallint; stride: Tsize_t; n: Tsize_t): longint; cdecl; external libgsl;
function gsl_sort_short_smallest_index(p: Psize_t; k: Tsize_t; src: Psmallint; stride: Tsize_t; n: Tsize_t): longint; cdecl; external libgsl;
function gsl_sort_short_largest(dest: Psmallint; k: Tsize_t; src: Psmallint; stride: Tsize_t; n: Tsize_t): longint; cdecl; external libgsl;
function gsl_sort_short_largest_index(p: Psize_t; k: Tsize_t; src: Psmallint; stride: Tsize_t; n: Tsize_t): longint; cdecl; external libgsl;

// === Konventiert am: 21-8-25 14:44:34 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
