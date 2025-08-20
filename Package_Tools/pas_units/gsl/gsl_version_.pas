unit gsl_version_;

interface

uses
  fp_gsl;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


const
  GSL_VERSION__ = '2.7.1';
  GSL_MAJOR_VERSION = 2;
  GSL_MINOR_VERSION = 7;

var
  gsl_version: pchar; cvar;external libgsl;

  // === Konventiert am: 20-8-25 15:32:28 ===


implementation



end.
