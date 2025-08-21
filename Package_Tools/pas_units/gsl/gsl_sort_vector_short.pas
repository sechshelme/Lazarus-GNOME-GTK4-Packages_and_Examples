unit gsl_sort_vector_short;

interface

uses
  fp_gsl, gsl_permutation, gsl_vector_short;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}



procedure gsl_sort_vector_short(v: Pgsl_vector_short); cdecl; external libgsl;
procedure gsl_sort_vector2_short(v1: Pgsl_vector_short; v2: Pgsl_vector_short); cdecl; external libgsl;
function gsl_sort_vector_short_index(p: Pgsl_permutation; v: Pgsl_vector_short): longint; cdecl; external libgsl;
function gsl_sort_vector_short_smallest(dest: Psmallint; k: Tsize_t; v: Pgsl_vector_short): longint; cdecl; external libgsl;
function gsl_sort_vector_short_largest(dest: Psmallint; k: Tsize_t; v: Pgsl_vector_short): longint; cdecl; external libgsl;
function gsl_sort_vector_short_smallest_index(p: Psize_t; k: Tsize_t; v: Pgsl_vector_short): longint; cdecl; external libgsl;
function gsl_sort_vector_short_largest_index(p: Psize_t; k: Tsize_t; v: Pgsl_vector_short): longint; cdecl; external libgsl;

// === Konventiert am: 21-8-25 14:49:05 ===


implementation



end.
