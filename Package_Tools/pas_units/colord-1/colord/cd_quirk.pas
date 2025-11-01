unit cd_quirk;

interface

uses
  fp_glib2, fp_colord;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}



function cd_quirk_vendor_name(vendor: Pgchar): Pgchar; cdecl; external libcolord;

// === Konventiert am: 1-11-25 16:06:49 ===


implementation



end.
