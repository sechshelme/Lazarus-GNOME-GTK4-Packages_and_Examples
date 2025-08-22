unit gsl_sf_laguerre;

interface

uses
  fp_gsl, gsl_sf_result;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}



function gsl_sf_laguerre_1_e(a: Tdouble; x: Tdouble; result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_laguerre_2_e(a: Tdouble; x: Tdouble; result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_laguerre_3_e(a: Tdouble; x: Tdouble; result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_laguerre_1(a: Tdouble; x: Tdouble): Tdouble; cdecl; external libgsl;
function gsl_sf_laguerre_2(a: Tdouble; x: Tdouble): Tdouble; cdecl; external libgsl;
function gsl_sf_laguerre_3(a: Tdouble; x: Tdouble): Tdouble; cdecl; external libgsl;
function gsl_sf_laguerre_n_e(n: longint; a: Tdouble; x: Tdouble; result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_laguerre_n(n: longint; a: Tdouble; x: Tdouble): Tdouble; cdecl; external libgsl;

// === Konventiert am: 22-8-25 13:58:34 ===


implementation



end.
