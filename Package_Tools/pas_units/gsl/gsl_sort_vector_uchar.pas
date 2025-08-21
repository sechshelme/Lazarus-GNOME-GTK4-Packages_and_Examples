unit gsl_sort_vector_uchar;

interface

uses
  fp_gsl, gsl_permutation, gsl_vector_uchar;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}



procedure gsl_sort_vector_uchar(v: Pgsl_vector_uchar); cdecl; external libgsl;
procedure gsl_sort_vector2_uchar(v1: Pgsl_vector_uchar; v2: Pgsl_vector_uchar); cdecl; external libgsl;
function gsl_sort_vector_uchar_index(p: Pgsl_permutation; v: Pgsl_vector_uchar): longint; cdecl; external libgsl;
function gsl_sort_vector_uchar_smallest(dest: pbyte; k: Tsize_t; v: Pgsl_vector_uchar): longint; cdecl; external libgsl;
function gsl_sort_vector_uchar_largest(dest: pbyte; k: Tsize_t; v: Pgsl_vector_uchar): longint; cdecl; external libgsl;
function gsl_sort_vector_uchar_smallest_index(p: Psize_t; k: Tsize_t; v: Pgsl_vector_uchar): longint; cdecl; external libgsl;
function gsl_sort_vector_uchar_largest_index(p: Psize_t; k: Tsize_t; v: Pgsl_vector_uchar): longint; cdecl; external libgsl;

// === Konventiert am: 21-8-25 14:49:07 ===


implementation



end.
