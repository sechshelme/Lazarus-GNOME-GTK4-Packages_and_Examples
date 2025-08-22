unit fp_hidapi_libusb;

interface

uses
  fp_hidapi;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}



function hid_libusb_wrap_sys_device(sys_dev: Tintptr_t; interface_num: longint): Phid_device; cdecl; external libhidapi_libusb;

// === Konventiert am: 22-8-25 17:27:17 ===


implementation



end.
