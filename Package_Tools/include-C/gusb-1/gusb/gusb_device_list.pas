unit gusb_device_list;

interface

uses
  fp_glib2, fp_gusb, gusb_device, gusb_context;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  TGUsbDeviceList = record
    parent_instance: TGObject;
  end;
  PGUsbDeviceList = ^TGUsbDeviceList;

  PGUsbDeviceListClass = ^TGUsbDeviceListClass;
  TGUsbDeviceListClass = record
    parent_class: TGObjectClass;
    device_added: procedure(self: PGUsbDeviceList; device: PGUsbDevice); cdecl;
    device_removed: procedure(self: PGUsbDeviceList; device: PGUsbDevice); cdecl;
    _gusb_reserved: array[0..63] of Tgchar;
  end;

function g_usb_device_list_get_type: TGType; cdecl; external libgusb;
function g_usb_device_list_new(context: PGUsbContext): PGUsbDeviceList; cdecl; external libgusb; deprecated;
procedure g_usb_device_list_coldplug(self: PGUsbDeviceList); cdecl; external libgusb; deprecated;
function g_usb_device_list_get_devices(self: PGUsbDeviceList): PGPtrArray; cdecl; external libgusb; deprecated;
function g_usb_device_list_find_by_bus_address(self: PGUsbDeviceList; bus: Tguint8; address: Tguint8; error: PPGError): PGUsbDevice; cdecl; external libgusb; deprecated;
function g_usb_device_list_find_by_vid_pid(self: PGUsbDeviceList; vid: Tguint16; pid: Tguint16; error: PPGError): PGUsbDevice; cdecl; external libgusb; deprecated;

// === Konventiert am: 26-8-26 19:42:37 ===

function G_USB_TYPE_DEVICE_LIST: TGType;
function G_USB_DEVICE_LIST(obj: Pointer): PGUsbDeviceList;
function G_USB_IS_DEVICE_LIST(obj: Pointer): Tgboolean;
function G_USB_DEVICE_LIST_CLASS(klass: Pointer): PGUsbDeviceListClass;
function G_USB_IS_DEVICE_LIST_CLASS(klass: Pointer): Tgboolean;
function G_USB_DEVICE_LIST_GET_CLASS(obj: Pointer): PGUsbDeviceListClass;

implementation

function G_USB_TYPE_DEVICE_LIST: TGType;
begin
  Result := g_usb_device_list_get_type;
end;

function G_USB_DEVICE_LIST(obj: Pointer): PGUsbDeviceList;
begin
  Result := PGUsbDeviceList(g_type_check_instance_cast(obj, G_USB_TYPE_DEVICE_LIST));
end;

function G_USB_IS_DEVICE_LIST(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, G_USB_TYPE_DEVICE_LIST);
end;

function G_USB_DEVICE_LIST_CLASS(klass: Pointer): PGUsbDeviceListClass;
begin
  Result := PGUsbDeviceListClass(g_type_check_class_cast(klass, G_USB_TYPE_DEVICE_LIST));
end;

function G_USB_IS_DEVICE_LIST_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, G_USB_TYPE_DEVICE_LIST);
end;

function G_USB_DEVICE_LIST_GET_CLASS(obj: Pointer): PGUsbDeviceListClass;
begin
  Result := PGUsbDeviceListClass(PGTypeInstance(obj)^.g_class);
end;

end.
