unit gsl_sort_vector_int;

interface

uses
  fp_gsl, gsl_permutation, gsl_vector_int;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}



procedure gsl_sort_vector_int(v: Pgsl_vector_int); cdecl; external libgsl;
procedure gsl_sort_vector2_int(v1: Pgsl_vector_int; v2: Pgsl_vector_int); cdecl; external libgsl;
function gsl_sort_vector_int_index(p: Pgsl_permutation; v: Pgsl_vector_int): longint; cdecl; external libgsl;
function gsl_sort_vector_int_smallest(dest: Plongint; k: Tsize_t; v: Pgsl_vector_int): longint; cdecl; external libgsl;
function gsl_sort_vector_int_largest(dest: Plongint; k: Tsize_t; v: Pgsl_vector_int): longint; cdecl; external libgsl;
function gsl_sort_vector_int_smallest_index(p: Psize_t; k: Tsize_t; v: Pgsl_vector_int): longint; cdecl; external libgsl;
function gsl_sort_vector_int_largest_index(p: Psize_t; k: Tsize_t; v: Pgsl_vector_int): longint; cdecl; external libgsl;

// === Konventiert am: 21-8-25 14:48:57 ===


implementation



end.
