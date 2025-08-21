unit gsl_sort_long;

interface

uses
  fp_gsl, gsl_permutation;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}



procedure gsl_sort_long(data: Plongint; stride: Tsize_t; n: Tsize_t); cdecl; external libgsl;
procedure gsl_sort2_long(data1: Plongint; stride1: Tsize_t; data2: Plongint; stride2: Tsize_t; n: Tsize_t); cdecl; external libgsl;
procedure gsl_sort_long_index(p: Psize_t; data: Plongint; stride: Tsize_t; n: Tsize_t); cdecl; external libgsl;
function gsl_sort_long_smallest(dest: Plongint; k: Tsize_t; src: Plongint; stride: Tsize_t; n: Tsize_t): longint; cdecl; external libgsl;
function gsl_sort_long_smallest_index(p: Psize_t; k: Tsize_t; src: Plongint; stride: Tsize_t; n: Tsize_t): longint; cdecl; external libgsl;
function gsl_sort_long_largest(dest: Plongint; k: Tsize_t; src: Plongint; stride: Tsize_t; n: Tsize_t): longint; cdecl; external libgsl;
function gsl_sort_long_largest_index(p: Psize_t; k: Tsize_t; src: Plongint; stride: Tsize_t; n: Tsize_t): longint; cdecl; external libgsl;

// === Konventiert am: 21-8-25 14:44:29 ===


implementation



end.
