unit gsl_sf_elljac;

interface

uses
  fp_gsl;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}



function gsl_sf_elljac_e(u: Tdouble; m: Tdouble; sn: Pdouble; cn: Pdouble; dn: Pdouble): longint; cdecl; external libgsl;

// === Konventiert am: 22-8-25 14:04:29 ===


implementation



end.
