unit gusb_endpoint;

interface

uses
  fp_glib2, fp_gusb, gusb_device;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PGUsbEndpoint = type Pointer;

  TGUsbEndpointClass = record
    parent_class: TGObjectClass;
  end;
  PGUsbEndpointClass = ^TGUsbEndpointClass;

function g_usb_endpoint_get_type: TGType; cdecl; external libgusb;
function g_usb_endpoint_get_kind(self: PGUsbEndpoint): Tguint8; cdecl; external libgusb;
function g_usb_endpoint_get_maximum_packet_size(self: PGUsbEndpoint): Tguint16; cdecl; external libgusb;
function g_usb_endpoint_get_polling_interval(self: PGUsbEndpoint): Tguint8; cdecl; external libgusb;
function g_usb_endpoint_get_refresh(self: PGUsbEndpoint): Tguint8; cdecl; external libgusb;
function g_usb_endpoint_get_synch_address(self: PGUsbEndpoint): Tguint8; cdecl; external libgusb;
function g_usb_endpoint_get_address(self: PGUsbEndpoint): Tguint8; cdecl; external libgusb;
function g_usb_endpoint_get_number(self: PGUsbEndpoint): Tguint8; cdecl; external libgusb;
function g_usb_endpoint_get_direction(self: PGUsbEndpoint): TGUsbDeviceDirection; cdecl; external libgusb;
function g_usb_endpoint_get_extra(self: PGUsbEndpoint): PGBytes; cdecl; external libgusb;

// === Konventiert am: 26-8-26 19:42:33 ===

function G_USB_TYPE_ENDPOINT: TGType;
function G_USB_ENDPOINT(obj: Pointer): PGUsbEndpoint;
function G_USB_IS_ENDPOINT(obj: Pointer): Tgboolean;

implementation

function G_USB_TYPE_ENDPOINT: TGType;
begin
  Result := g_usb_endpoint_get_type;
end;

function G_USB_ENDPOINT(obj: Pointer): PGUsbEndpoint;
begin
  Result := PGUsbEndpoint(g_type_check_instance_cast(obj, G_USB_TYPE_ENDPOINT));
end;

function G_USB_IS_ENDPOINT(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, G_USB_TYPE_ENDPOINT);
end;

end.
