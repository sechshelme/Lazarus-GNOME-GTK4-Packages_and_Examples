unit gsl_permute_vector_int;

interface

uses
  fp_gsl, gsl_permutation, gsl_vector_int;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}



function gsl_permute_vector_int(p: Pgsl_permutation; v: Pgsl_vector_int): longint; cdecl; external libgsl;
function gsl_permute_vector_int_inverse(p: Pgsl_permutation; v: Pgsl_vector_int): longint; cdecl; external libgsl;

// === Konventiert am: 21-8-25 16:02:24 ===


implementation



end.
