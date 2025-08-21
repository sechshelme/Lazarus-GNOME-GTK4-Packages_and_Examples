unit gsl_sort_char;

interface

uses
  fp_gsl, gsl_permutation;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}



procedure gsl_sort_char(data: pchar; stride: Tsize_t; n: Tsize_t); cdecl; external libgsl;
procedure gsl_sort2_char(data1: pchar; stride1: Tsize_t; data2: pchar; stride2: Tsize_t; n: Tsize_t); cdecl; external libgsl;
procedure gsl_sort_char_index(p: Psize_t; data: pchar; stride: Tsize_t; n: Tsize_t); cdecl; external libgsl;
function gsl_sort_char_smallest(dest: pchar; k: Tsize_t; src: pchar; stride: Tsize_t; n: Tsize_t): longint; cdecl; external libgsl;
function gsl_sort_char_smallest_index(p: Psize_t; k: Tsize_t; src: pchar; stride: Tsize_t; n: Tsize_t): longint; cdecl; external libgsl;
function gsl_sort_char_largest(dest: pchar; k: Tsize_t; src: pchar; stride: Tsize_t; n: Tsize_t): longint; cdecl; external libgsl;
function gsl_sort_char_largest_index(p: Psize_t; k: Tsize_t; src: pchar; stride: Tsize_t; n: Tsize_t): longint; cdecl; external libgsl;

// === Konventiert am: 21-8-25 14:44:18 ===


implementation



end.
