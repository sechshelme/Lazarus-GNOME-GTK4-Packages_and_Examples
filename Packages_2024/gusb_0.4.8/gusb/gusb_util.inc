{$IFDEF read_interface}


function g_usb_strerror(error_code: Tgint): Pgchar; cdecl; external libgusb;

// === Konventiert am: 26-8-26 19:42:11 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
