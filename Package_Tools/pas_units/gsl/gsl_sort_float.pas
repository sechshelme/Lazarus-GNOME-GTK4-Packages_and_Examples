unit gsl_sort_float;

interface

uses
  fp_gsl, gsl_permutation;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}



procedure gsl_sort_float(data: Psingle; stride: Tsize_t; n: Tsize_t); cdecl; external libgsl;
procedure gsl_sort2_float(data1: Psingle; stride1: Tsize_t; data2: Psingle; stride2: Tsize_t; n: Tsize_t); cdecl; external libgsl;
procedure gsl_sort_float_index(p: Psize_t; data: Psingle; stride: Tsize_t; n: Tsize_t); cdecl; external libgsl;
function gsl_sort_float_smallest(dest: Psingle; k: Tsize_t; src: Psingle; stride: Tsize_t; n: Tsize_t): longint; cdecl; external libgsl;
function gsl_sort_float_smallest_index(p: Psize_t; k: Tsize_t; src: Psingle; stride: Tsize_t; n: Tsize_t): longint; cdecl; external libgsl;
function gsl_sort_float_largest(dest: Psingle; k: Tsize_t; src: Psingle; stride: Tsize_t; n: Tsize_t): longint; cdecl; external libgsl;
function gsl_sort_float_largest_index(p: Psize_t; k: Tsize_t; src: Psingle; stride: Tsize_t; n: Tsize_t): longint; cdecl; external libgsl;

// === Konventiert am: 21-8-25 14:44:24 ===


implementation



end.
