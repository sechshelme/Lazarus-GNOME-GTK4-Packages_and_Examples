unit plConfig;

interface

uses
  fp_plplot;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


const
  PLPLOT_VERSION_MAJOR = 5;
  PLPLOT_VERSION_MINOR = 15;
  PLPLOT_VERSION_PATCH = 0;
  PLPLOT_VERSION = '5.15.0';

const
  PL_HAVE_STDINT_H = 1;
  PL_HAVE_UNISTD_H = 1;

  // === Konventiert am: 31-3-26 20:05:09 ===


implementation



end.
