unit gusb_version;

interface

uses
  fp_glib2, fp_gusb;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


const
  G_USB_MAJOR_VERSION = 0;
  G_USB_MINOR_VERSION = 4;
  G_USB_MICRO_VERSION = 8;

function g_usb_version_string: Pgchar; cdecl; external libgusb;

function G_USB_CHECK_VERSION(major, minor, micro: integer): boolean;

// === Konventiert am: 26-8-26 19:42:06 ===


implementation

function G_USB_CHECK_VERSION(major, minor, micro: integer): boolean; inline;

begin
  Result := (G_USB_MAJOR_VERSION > major) or
    ((G_USB_MAJOR_VERSION = major) and (G_USB_MINOR_VERSION > minor)) or
    ((G_USB_MAJOR_VERSION = major) and (G_USB_MINOR_VERSION = minor) and (G_USB_MICRO_VERSION >= micro));
end;

end.
