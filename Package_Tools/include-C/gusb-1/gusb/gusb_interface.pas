unit gusb_interface;

interface

uses
  fp_glib2, fp_gusb;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PGUsbInterface = type Pointer;

  TGUsbInterfaceClass = record
    parent_class: TGObjectClass;
  end;
  PGUsbInterfaceClass = ^TGUsbInterfaceClass;

function g_usb_interface_get_type: TGType; cdecl; external libgusb;
function g_usb_interface_get_length(self: PGUsbInterface): Tguint8; cdecl; external libgusb;
function g_usb_interface_get_kind(self: PGUsbInterface): Tguint8; cdecl; external libgusb;
function g_usb_interface_get_number(self: PGUsbInterface): Tguint8; cdecl; external libgusb;
function g_usb_interface_get_alternate(self: PGUsbInterface): Tguint8; cdecl; external libgusb;
function g_usb_interface_get_class(self: PGUsbInterface): Tguint8; cdecl; external libgusb;
function g_usb_interface_get_subclass(self: PGUsbInterface): Tguint8; cdecl; external libgusb;
function g_usb_interface_get_protocol(self: PGUsbInterface): Tguint8; cdecl; external libgusb;
function g_usb_interface_get_index(self: PGUsbInterface): Tguint8; cdecl; external libgusb;
function g_usb_interface_get_extra(self: PGUsbInterface): PGBytes; cdecl; external libgusb;
function g_usb_interface_get_endpoints(self: PGUsbInterface): PGPtrArray; cdecl; external libgusb;

// === Konventiert am: 26-8-26 19:42:29 ===

function G_USB_TYPE_INTERFACE: TGType;
function G_USB_INTERFACE(obj: Pointer): PGUsbInterface;
function G_USB_IS_INTERFACE(obj: Pointer): Tgboolean;

implementation

function G_USB_TYPE_INTERFACE: TGType;
begin
  Result := g_usb_interface_get_type;
end;

function G_USB_INTERFACE(obj: Pointer): PGUsbInterface;
begin
  Result := PGUsbInterface(g_type_check_instance_cast(obj, G_USB_TYPE_INTERFACE));
end;

function G_USB_IS_INTERFACE(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, G_USB_TYPE_INTERFACE);
end;

end.
