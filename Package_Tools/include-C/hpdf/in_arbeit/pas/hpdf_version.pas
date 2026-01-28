unit hpdf_version;

interface

uses
  fp_hpdf;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}



const
  HPDF_MAJOR_VERSION = 2;
  HPDF_MINOR_VERSION = 4;
  HPDF_BUGFIX_VERSION = 5;
  HPDF_EXTRA_VERSION = '';
  HPDF_VERSION_ID = ((HPDF_MAJOR_VERSION * 10000) + (HPDF_MINOR_VERSION * 100)) + HPDF_BUGFIX_VERSION;

  // === Konventiert am: 28-1-26 14:09:54 ===


implementation



end.
