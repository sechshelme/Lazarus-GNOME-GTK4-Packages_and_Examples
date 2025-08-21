unit gsl_permute_vector_uchar;

interface

uses
  fp_gsl, gsl_permutation, gsl_vector_uchar;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}



function gsl_permute_vector_uchar(p: Pgsl_permutation; v: Pgsl_vector_uchar): longint; cdecl; external libgsl;
function gsl_permute_vector_uchar_inverse(p: Pgsl_permutation; v: Pgsl_vector_uchar): longint; cdecl; external libgsl;

// === Konventiert am: 21-8-25 16:02:35 ===


implementation



end.
