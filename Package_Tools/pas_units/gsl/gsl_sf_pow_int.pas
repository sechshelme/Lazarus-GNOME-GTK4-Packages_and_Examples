unit gsl_sf_pow_int;

interface

uses
  fp_gsl, gsl_sf_result;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}



function gsl_sf_pow_int_e(x: Tdouble; n: longint; result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_pow_int(x: Tdouble; n: longint): Tdouble; cdecl; external libgsl;

// === Konventiert am: 22-8-25 13:58:46 ===


implementation



end.
