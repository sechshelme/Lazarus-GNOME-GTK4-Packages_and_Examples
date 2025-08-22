unit gsl_sf_clausen;

interface

uses
  fp_gsl, gsl_sf_result;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}



function gsl_sf_clausen_e(x: Tdouble; result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_clausen(x: Tdouble): Tdouble; cdecl; external libgsl;

// === Konventiert am: 22-8-25 14:04:10 ===


implementation



end.
