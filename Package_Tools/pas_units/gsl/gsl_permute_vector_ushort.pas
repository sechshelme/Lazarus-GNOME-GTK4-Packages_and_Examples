unit gsl_permute_vector_ushort;

interface

uses
  fp_gsl, gsl_permutation, gsl_vector_ushort;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}



function gsl_permute_vector_ushort(p: Pgsl_permutation; v: Pgsl_vector_ushort): longint; cdecl; external libgsl;
function gsl_permute_vector_ushort_inverse(p: Pgsl_permutation; v: Pgsl_vector_ushort): longint; cdecl; external libgsl;

// === Konventiert am: 21-8-25 16:02:44 ===


implementation



end.
