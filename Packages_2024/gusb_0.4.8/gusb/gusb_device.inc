{$IFDEF read_interface}


type
  PGUsbDeviceDirection = ^TGUsbDeviceDirection;
  TGUsbDeviceDirection = longint;
const
  G_USB_DEVICE_DIRECTION_DEVICE_TO_HOST = 0;
  G_USB_DEVICE_DIRECTION_HOST_TO_DEVICE = 1;

type
  PGUsbDeviceRequestType = ^TGUsbDeviceRequestType;
  TGUsbDeviceRequestType = longint;
const
  G_USB_DEVICE_REQUEST_TYPE_STANDARD = 0;
  G_USB_DEVICE_REQUEST_TYPE_CLASS = 1;
  G_USB_DEVICE_REQUEST_TYPE_VENDOR = 2;
  G_USB_DEVICE_REQUEST_TYPE_RESERVED = 3;

type
  PGUsbDeviceRecipient = ^TGUsbDeviceRecipient;
  TGUsbDeviceRecipient = longint;
const
  G_USB_DEVICE_RECIPIENT_DEVICE = 0;
  G_USB_DEVICE_RECIPIENT_INTERFACE = 1;
  G_USB_DEVICE_RECIPIENT_ENDPOINT = 2;
  G_USB_DEVICE_RECIPIENT_OTHER = 3;

type
  PGUsbDeviceError = ^TGUsbDeviceError;
  TGUsbDeviceError = longint;
const
  G_USB_DEVICE_ERROR_INTERNAL = 0;
  G_USB_DEVICE_ERROR_IO = 1;
  G_USB_DEVICE_ERROR_TIMED_OUT = 2;
  G_USB_DEVICE_ERROR_NOT_SUPPORTED = 3;
  G_USB_DEVICE_ERROR_NO_DEVICE = 4;
  G_USB_DEVICE_ERROR_NOT_OPEN = 5;
  G_USB_DEVICE_ERROR_ALREADY_OPEN = 6;
  G_USB_DEVICE_ERROR_CANCELLED = 7;
  G_USB_DEVICE_ERROR_FAILED = 8;
  G_USB_DEVICE_ERROR_PERMISSION_DENIED = 9;
  G_USB_DEVICE_ERROR_BUSY = 10;
  G_USB_DEVICE_ERROR_LAST = 11;

type
  PGUsbDeviceClaimInterfaceFlags = ^TGUsbDeviceClaimInterfaceFlags;
  TGUsbDeviceClaimInterfaceFlags = longint;
const
  G_USB_DEVICE_CLAIM_INTERFACE_NONE = 0;
  G_USB_DEVICE_CLAIM_INTERFACE_BIND_KERNEL_DRIVER = 1 shl 0;

type
  PGUsbDeviceClassCode = ^TGUsbDeviceClassCode;
  TGUsbDeviceClassCode = longint;
const
  G_USB_DEVICE_CLASS_INTERFACE_DESC = $00;
  G_USB_DEVICE_CLASS_AUDIO = $01;
  G_USB_DEVICE_CLASS_COMMUNICATIONS = $02;
  G_USB_DEVICE_CLASS_HID = $03;
  G_USB_DEVICE_CLASS_PHYSICAL = $05;
  G_USB_DEVICE_CLASS_IMAGE = $06;
  G_USB_DEVICE_CLASS_PRINTER = $07;
  G_USB_DEVICE_CLASS_MASS_STORAGE = $08;
  G_USB_DEVICE_CLASS_HUB = $09;
  G_USB_DEVICE_CLASS_CDC_DATA = $0a;
  G_USB_DEVICE_CLASS_SMART_CARD = $0b;
  G_USB_DEVICE_CLASS_CONTENT_SECURITY = $0d;
  G_USB_DEVICE_CLASS_VIDEO = $0e;
  G_USB_DEVICE_CLASS_PERSONAL_HEALTHCARE = $0f;
  G_USB_DEVICE_CLASS_AUDIO_VIDEO = $10;
  G_USB_DEVICE_CLASS_BILLBOARD = $11;
  G_USB_DEVICE_CLASS_DIAGNOSTIC = $dc;
  G_USB_DEVICE_CLASS_WIRELESS_CONTROLLER = $e0;
  G_USB_DEVICE_CLASS_MISCELLANEOUS = $ef;
  G_USB_DEVICE_CLASS_APPLICATION_SPECIFIC = $fe;
  G_USB_DEVICE_CLASS_VENDOR_SPECIFIC = $ff;

type
  PGUsbDeviceLangid = ^TGUsbDeviceLangid;
  TGUsbDeviceLangid = longint;
const
  G_USB_DEVICE_LANGID_INVALID = $0000;
  G_USB_DEVICE_LANGID_ENGLISH_UNITED_STATES = $0409;

type
  TGUsbDevice = record
    parent_instance: TGObject;
  end;
  PGUsbDevice = ^TGUsbDevice;

  PGUsbDeviceClass = ^TGUsbDeviceClass;
  TGUsbDeviceClass = record
    parent_class: TGObjectClass;
    _gusb_reserved: array[0..63] of Tgchar;
  end;

function g_usb_device_get_type: TGType; cdecl; external libgusb;
function g_usb_device_error_quark: TGQuark; cdecl; external libgusb;
function g_usb_device_get_platform_id(self: PGUsbDevice): Pgchar; cdecl; external libgusb;
function g_usb_device_is_emulated(self: PGUsbDevice): Tgboolean; cdecl; external libgusb;
function g_usb_device_get_created(self: PGUsbDevice): PGDateTime; cdecl; external libgusb;
function g_usb_device_get_parent(self: PGUsbDevice): PGUsbDevice; cdecl; external libgusb;
function g_usb_device_get_children(self: PGUsbDevice): PGPtrArray; cdecl; external libgusb;
function g_usb_device_get_bus(self: PGUsbDevice): Tguint8; cdecl; external libgusb;
function g_usb_device_get_address(self: PGUsbDevice): Tguint8; cdecl; external libgusb;
function g_usb_device_get_port_number(self: PGUsbDevice): Tguint8; cdecl; external libgusb;
function g_usb_device_get_vid(self: PGUsbDevice): Tguint16; cdecl; external libgusb;
function g_usb_device_get_pid(self: PGUsbDevice): Tguint16; cdecl; external libgusb;
function g_usb_device_get_release(self: PGUsbDevice): Tguint16; cdecl; external libgusb;
function g_usb_device_get_spec(self: PGUsbDevice): Tguint16; cdecl; external libgusb;
function g_usb_device_get_vid_as_str(self: PGUsbDevice): Pgchar; cdecl; external libgusb;
function g_usb_device_get_pid_as_str(self: PGUsbDevice): Pgchar; cdecl; external libgusb;
function g_usb_device_get_device_class(self: PGUsbDevice): Tguint8; cdecl; external libgusb;
function g_usb_device_get_device_subclass(self: PGUsbDevice): Tguint8; cdecl; external libgusb;
function g_usb_device_get_device_protocol(self: PGUsbDevice): Tguint8; cdecl; external libgusb;
procedure g_usb_device_add_tag(self: PGUsbDevice; tag: Pgchar); cdecl; external libgusb;
procedure g_usb_device_remove_tag(self: PGUsbDevice; tag: Pgchar); cdecl; external libgusb;
function g_usb_device_has_tag(self: PGUsbDevice; tag: Pgchar): Tgboolean; cdecl; external libgusb;
function g_usb_device_get_tags(self: PGUsbDevice): PGPtrArray; cdecl; external libgusb;
function g_usb_device_get_configuration_index(self: PGUsbDevice): Tguint8; cdecl; external libgusb;
function g_usb_device_get_manufacturer_index(self: PGUsbDevice): Tguint8; cdecl; external libgusb;
function g_usb_device_get_product_index(self: PGUsbDevice): Tguint8; cdecl; external libgusb;
function g_usb_device_get_serial_number_index(self: PGUsbDevice): Tguint8; cdecl; external libgusb;
function g_usb_device_get_custom_index(self: PGUsbDevice; class_id: Tguint8; subclass_id: Tguint8; protocol_id: Tguint8; error: PPGError): Tguint8; cdecl; external libgusb;
function g_usb_device_get_interface(self: PGUsbDevice; class_id: Tguint8; subclass_id: Tguint8; protocol_id: Tguint8; error: PPGError): PGUsbInterface; cdecl; external libgusb;
function g_usb_device_get_interfaces(self: PGUsbDevice; error: PPGError): PGPtrArray; cdecl; external libgusb;
function g_usb_device_get_events(self: PGUsbDevice): PGPtrArray; cdecl; external libgusb;
procedure g_usb_device_clear_events(self: PGUsbDevice); cdecl; external libgusb;
function g_usb_device_get_hid_descriptors(self: PGUsbDevice; error: PPGError): PGPtrArray; cdecl; external libgusb;
function g_usb_device_get_hid_descriptor_default(self: PGUsbDevice; error: PPGError): PGBytes; cdecl; external libgusb;
function g_usb_device_get_bos_descriptors(self: PGUsbDevice; error: PPGError): PGPtrArray; cdecl; external libgusb;
function g_usb_device_get_bos_descriptor(self: PGUsbDevice; capability: Tguint8; error: PPGError): PGUsbBosDescriptor; cdecl; external libgusb;
function g_usb_device_open(self: PGUsbDevice; error: PPGError): Tgboolean; cdecl; external libgusb;
function g_usb_device_close(self: PGUsbDevice; error: PPGError): Tgboolean; cdecl; external libgusb;
function g_usb_device_reset(self: PGUsbDevice; error: PPGError): Tgboolean; cdecl; external libgusb;
procedure g_usb_device_invalidate(self: PGUsbDevice); cdecl; external libgusb;
function g_usb_device_get_configuration(self: PGUsbDevice; error: PPGError): Tgint; cdecl; external libgusb;
function g_usb_device_set_configuration(self: PGUsbDevice; configuration: Tgint; error: PPGError): Tgboolean; cdecl; external libgusb;
function g_usb_device_claim_interface(self: PGUsbDevice; iface: Tgint; flags: TGUsbDeviceClaimInterfaceFlags; error: PPGError): Tgboolean; cdecl; external libgusb;
function g_usb_device_release_interface(self: PGUsbDevice; iface: Tgint; flags: TGUsbDeviceClaimInterfaceFlags; error: PPGError): Tgboolean; cdecl; external libgusb;
function g_usb_device_set_interface_alt(self: PGUsbDevice; iface: Tgint; alt: Tguint8; error: PPGError): Tgboolean; cdecl; external libgusb;
function g_usb_device_get_string_descriptor(self: PGUsbDevice; desc_index: Tguint8; error: PPGError): Pgchar; cdecl; external libgusb;
function g_usb_device_get_string_descriptor_bytes(self: PGUsbDevice; desc_index: Tguint8; langid: Tguint16; error: PPGError): PGBytes; cdecl; external libgusb;
function g_usb_device_get_string_descriptor_bytes_full(self: PGUsbDevice; desc_index: Tguint8; langid: Tguint16; length: Tgsize; error: PPGError): PGBytes; cdecl; external libgusb;

function g_usb_device_control_transfer(self: PGUsbDevice; direction: TGUsbDeviceDirection; request_type: TGUsbDeviceRequestType; recipient: TGUsbDeviceRecipient; request: Tguint8;
  value: Tguint16; idx: Tguint16; data: Pguint8; length: Tgsize; actual_length: Pgsize;
  timeout: Tguint; cancellable: PGCancellable; error: PPGError): Tgboolean; cdecl; external libgusb;
function g_usb_device_bulk_transfer(self: PGUsbDevice; endpoint: Tguint8; data: Pguint8; length: Tgsize; actual_length: Pgsize;
  timeout: Tguint; cancellable: PGCancellable; error: PPGError): Tgboolean; cdecl; external libgusb;
function g_usb_device_interrupt_transfer(self: PGUsbDevice; endpoint: Tguint8; data: Pguint8; length: Tgsize; actual_length: Pgsize;
  timeout: Tguint; cancellable: PGCancellable; error: PPGError): Tgboolean; cdecl; external libgusb;

procedure g_usb_device_control_transfer_async(self: PGUsbDevice; direction: TGUsbDeviceDirection; request_type: TGUsbDeviceRequestType; recipient: TGUsbDeviceRecipient; request: Tguint8;
  value: Tguint16; idx: Tguint16; data: Pguint8; length: Tgsize; timeout: Tguint;
  cancellable: PGCancellable; callback: TGAsyncReadyCallback; user_data: Tgpointer); cdecl; external libgusb;
function g_usb_device_control_transfer_finish(self: PGUsbDevice; res: PGAsyncResult; error: PPGError): Tgssize; cdecl; external libgusb;
procedure g_usb_device_bulk_transfer_async(self: PGUsbDevice; endpoint: Tguint8; data: Pguint8; length: Tgsize; timeout: Tguint;
  cancellable: PGCancellable; callback: TGAsyncReadyCallback; user_data: Tgpointer); cdecl; external libgusb;
function g_usb_device_bulk_transfer_finish(self: PGUsbDevice; res: PGAsyncResult; error: PPGError): Tgssize; cdecl; external libgusb;
procedure g_usb_device_interrupt_transfer_async(self: PGUsbDevice; endpoint: Tguint8; data: Pguint8; length: Tgsize; timeout: Tguint;
  cancellable: PGCancellable; callback: TGAsyncReadyCallback; user_data: Tgpointer); cdecl; external libgusb;
function g_usb_device_interrupt_transfer_finish(self: PGUsbDevice; res: PGAsyncResult; error: PPGError): Tgssize; cdecl; external libgusb;

function G_USB_DEVICE_ERROR: TGQuark;

// === Konventiert am: 26-8-26 19:42:45 ===

function G_USB_TYPE_DEVICE: TGType;
function G_USB_DEVICE(obj: Pointer): PGUsbDevice;
function G_USB_IS_DEVICE(obj: Pointer): Tgboolean;
function G_USB_DEVICE_CLASS(klass: Pointer): PGUsbDeviceClass;
function G_USB_IS_DEVICE_CLASS(klass: Pointer): Tgboolean;
function G_USB_DEVICE_GET_CLASS(obj: Pointer): PGUsbDeviceClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function G_USB_TYPE_DEVICE: TGType;
begin
  Result := g_usb_device_get_type;
end;

function G_USB_DEVICE(obj: Pointer): PGUsbDevice;
begin
  Result := PGUsbDevice(g_type_check_instance_cast(obj, G_USB_TYPE_DEVICE));
end;

function G_USB_IS_DEVICE(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, G_USB_TYPE_DEVICE);
end;

function G_USB_DEVICE_CLASS(klass: Pointer): PGUsbDeviceClass;
begin
  Result := PGUsbDeviceClass(g_type_check_class_cast(klass, G_USB_TYPE_DEVICE));
end;

function G_USB_IS_DEVICE_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, G_USB_TYPE_DEVICE);
end;

function G_USB_DEVICE_GET_CLASS(obj: Pointer): PGUsbDeviceClass;
begin
  Result := PGUsbDeviceClass(PGTypeInstance(obj)^.g_class);
end;


function G_USB_DEVICE_ERROR: TGQuark;
begin
  G_USB_DEVICE_ERROR := g_usb_device_error_quark;
end;


{$ENDIF read_implementation}
