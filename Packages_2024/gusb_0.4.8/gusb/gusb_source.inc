{$IFDEF read_interface}


type
  PGUsbSourceError = ^TGUsbSourceError;
  TGUsbSourceError = longint;
const
  G_USB_SOURCE_ERROR_INTERNAL = 0;

type
  PGUsbSource = type Pointer;

function g_usb_source_error_quark: TGQuark; cdecl; external libgusb; deprecated;
procedure g_usb_source_set_callback(self: PGUsbSource; func: TGSourceFunc; data: Tgpointer; notify: TGDestroyNotify); cdecl; external libgusb; deprecated;

function G_USB_SOURCE_ERROR: TGQuark;

// === Konventiert am: 26-8-26 19:42:16 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}

function G_USB_SOURCE_ERROR: TGQuark;
begin
  G_USB_SOURCE_ERROR := g_usb_source_error_quark;
end;


{$ENDIF read_implementation}
