unit gsl_sort_vector_uint;

interface

uses
  fp_gsl, gsl_permutation, gsl_vector_uint;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}



procedure gsl_sort_vector_uint(v: Pgsl_vector_uint); cdecl; external libgsl;
procedure gsl_sort_vector2_uint(v1: Pgsl_vector_uint; v2: Pgsl_vector_uint); cdecl; external libgsl;
function gsl_sort_vector_uint_index(p: Pgsl_permutation; v: Pgsl_vector_uint): longint; cdecl; external libgsl;
function gsl_sort_vector_uint_smallest(dest: Pdword; k: Tsize_t; v: Pgsl_vector_uint): longint; cdecl; external libgsl;
function gsl_sort_vector_uint_largest(dest: Pdword; k: Tsize_t; v: Pgsl_vector_uint): longint; cdecl; external libgsl;
function gsl_sort_vector_uint_smallest_index(p: Psize_t; k: Tsize_t; v: Pgsl_vector_uint): longint; cdecl; external libgsl;
function gsl_sort_vector_uint_largest_index(p: Psize_t; k: Tsize_t; v: Pgsl_vector_uint): longint; cdecl; external libgsl;

// === Konventiert am: 21-8-25 14:49:10 ===


implementation



end.
