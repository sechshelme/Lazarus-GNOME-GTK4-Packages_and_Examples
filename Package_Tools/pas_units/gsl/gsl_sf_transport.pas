unit gsl_sf_transport;

interface

uses
  fp_gsl, gsl_sf_result;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


function gsl_sf_transport_2_e(x: Tdouble; result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_transport_2(x: Tdouble): Tdouble; cdecl; external libgsl;
function gsl_sf_transport_3_e(x: Tdouble; result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_transport_3(x: Tdouble): Tdouble; cdecl; external libgsl;
function gsl_sf_transport_4_e(x: Tdouble; result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_transport_4(x: Tdouble): Tdouble; cdecl; external libgsl;
function gsl_sf_transport_5_e(x: Tdouble; result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_transport_5(x: Tdouble): Tdouble; cdecl; external libgsl;

// === Konventiert am: 22-8-25 13:59:18 ===


implementation



end.
