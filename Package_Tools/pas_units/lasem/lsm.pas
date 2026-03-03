unit lsm;

interface

uses
  fp_lasem;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


procedure lsm_shutdown; cdecl; external liblasem;

// === Konventiert am: 3-3-26 15:10:19 ===


implementation



end.
