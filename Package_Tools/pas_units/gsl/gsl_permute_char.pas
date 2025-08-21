unit gsl_permute_char;

interface

uses
  fp_gsl, gsl_permutation;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}



function gsl_permute_char(p: Psize_t; data: pint8; stride: Tsize_t; n: Tsize_t): longint; cdecl; external libgsl;
function gsl_permute_char_inverse(p: Psize_t; data: pint8; stride: Tsize_t; n: Tsize_t): longint; cdecl; external libgsl;

// === Konventiert am: 21-8-25 15:56:01 ===


implementation



end.
