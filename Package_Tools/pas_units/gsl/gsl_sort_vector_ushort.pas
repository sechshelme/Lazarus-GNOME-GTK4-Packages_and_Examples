unit gsl_sort_vector_ushort;

interface

uses
  fp_gsl, gsl_permutation, gsl_vector_ushort;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}



procedure gsl_sort_vector_ushort(v: Pgsl_vector_ushort); cdecl; external libgsl;
procedure gsl_sort_vector2_ushort(v1: Pgsl_vector_ushort; v2: Pgsl_vector_ushort); cdecl; external libgsl;
function gsl_sort_vector_ushort_index(p: Pgsl_permutation; v: Pgsl_vector_ushort): longint; cdecl; external libgsl;
function gsl_sort_vector_ushort_smallest(dest: Pword; k: Tsize_t; v: Pgsl_vector_ushort): longint; cdecl; external libgsl;
function gsl_sort_vector_ushort_largest(dest: Pword; k: Tsize_t; v: Pgsl_vector_ushort): longint; cdecl; external libgsl;
function gsl_sort_vector_ushort_smallest_index(p: Psize_t; k: Tsize_t; v: Pgsl_vector_ushort): longint; cdecl; external libgsl;
function gsl_sort_vector_ushort_largest_index(p: Psize_t; k: Tsize_t; v: Pgsl_vector_ushort): longint; cdecl; external libgsl;

// === Konventiert am: 21-8-25 14:49:16 ===


implementation



end.
