unit pam_filter;

interface

uses
  ctypes;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}



const
  APPIN_FILENO = 3;
  APPOUT_FILENO = 4;
  APPERR_FILENO = 5;
  APPTOP_FILE = 6;

  // === Konventiert am: 13-7-25 15:31:46 ===


implementation



end.
