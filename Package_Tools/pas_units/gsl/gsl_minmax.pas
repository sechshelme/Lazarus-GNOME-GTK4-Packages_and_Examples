unit gsl_minmax;

interface

uses
  fp_gsl;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}



function gsl_max(a: Tdouble; b: Tdouble): Tdouble; cdecl; external libgsl;
function gsl_min(a: Tdouble; b: Tdouble): Tdouble; cdecl; external libgsl;

// === Konventiert am: 21-8-25 19:10:19 ===


implementation


end.
