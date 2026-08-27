unit gusb_util;

interface

uses
  fp_glib2, fp_gusb;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


function g_usb_strerror(error_code: Tgint): Pgchar; cdecl; external libgusb;

// === Konventiert am: 26-8-26 19:42:11 ===


implementation



end.
