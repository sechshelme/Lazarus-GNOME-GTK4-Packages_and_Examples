unit gsl_sort_char;

interface

uses
  fp_gsl, gsl_permutation;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}



procedure gsl_sort_char(data: pint8; stride: Tsize_t; n: Tsize_t); cdecl; external libgsl;
procedure gsl_sort2_char(data1: pint8; stride1: Tsize_t; data2: pint8; stride2: Tsize_t; n: Tsize_t); cdecl; external libgsl;
procedure gsl_sort_char_index(p: Psize_t; data: pint8; stride: Tsize_t; n: Tsize_t); cdecl; external libgsl;
function gsl_sort_char_smallest(dest: pint8; k: Tsize_t; src: pint8; stride: Tsize_t; n: Tsize_t): longint; cdecl; external libgsl;
function gsl_sort_char_smallest_index(p: Psize_t; k: Tsize_t; src: pint8; stride: Tsize_t; n: Tsize_t): longint; cdecl; external libgsl;
function gsl_sort_char_largest(dest: pint8; k: Tsize_t; src: pint8; stride: Tsize_t; n: Tsize_t): longint; cdecl; external libgsl;
function gsl_sort_char_largest_index(p: Psize_t; k: Tsize_t; src: pint8; stride: Tsize_t; n: Tsize_t): longint; cdecl; external libgsl;

// === Konventiert am: 21-8-25 14:44:18 ===


implementation



end.
