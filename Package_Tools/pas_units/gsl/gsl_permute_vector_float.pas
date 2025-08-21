unit gsl_permute_vector_float;

interface

uses
  fp_gsl, gsl_permutation, gsl_vector_float;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}



function gsl_permute_vector_float(p: Pgsl_permutation; v: Pgsl_vector_float): longint; cdecl; external libgsl;
function gsl_permute_vector_float_inverse(p: Pgsl_permutation; v: Pgsl_vector_float): longint; cdecl; external libgsl;

// === Konventiert am: 21-8-25 16:02:22 ===


implementation



end.
