unit gsl_sort_vector_char;

interface

uses
  fp_gsl, gsl_permutation, gsl_vector_char;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}



procedure gsl_sort_vector_char(v: Pgsl_vector_char); cdecl; external libgsl;
procedure gsl_sort_vector2_char(v1: Pgsl_vector_char; v2: Pgsl_vector_char); cdecl; external libgsl;
function gsl_sort_vector_char_index(p: Pgsl_permutation; v: Pgsl_vector_char): longint; cdecl; external libgsl;
function gsl_sort_vector_char_smallest(dest: pchar; k: Tsize_t; v: Pgsl_vector_char): longint; cdecl; external libgsl;
function gsl_sort_vector_char_largest(dest: pchar; k: Tsize_t; v: Pgsl_vector_char): longint; cdecl; external libgsl;
function gsl_sort_vector_char_smallest_index(p: Psize_t; k: Tsize_t; v: Pgsl_vector_char): longint; cdecl; external libgsl;
function gsl_sort_vector_char_largest_index(p: Psize_t; k: Tsize_t; v: Pgsl_vector_char): longint; cdecl; external libgsl;

// === Konventiert am: 21-8-25 14:48:48 ===


implementation



end.
