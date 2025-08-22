unit gsl_sf_elementary;

interface

uses
  fp_gsl, gsl_sf_result;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


function gsl_sf_multiply_e(x: Tdouble; y: Tdouble; result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_multiply(x: Tdouble; y: Tdouble): Tdouble; cdecl; external libgsl;
function gsl_sf_multiply_err_e(x: Tdouble; dx: Tdouble; y: Tdouble; dy: Tdouble; result: Pgsl_sf_result): longint; cdecl; external libgsl;

// === Konventiert am: 22-8-25 14:04:24 ===


implementation



end.
