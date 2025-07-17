unit _sd_common;

interface

uses
  ctypes;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  Tsd_destroy_t = procedure(userdata: pointer); cdecl;
  Psd_destroy_t = ^Tsd_destroy_t;

  // === Konventiert am: 16-7-25 19:03:48 ===


implementation



end.
