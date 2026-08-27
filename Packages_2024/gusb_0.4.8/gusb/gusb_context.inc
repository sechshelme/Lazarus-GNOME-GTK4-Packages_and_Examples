{$IFDEF read_interface}


type
  TGUsbContext = record
    parent_instance: TGObject;
  end;
  PGUsbContext = ^TGUsbContext;

  PGUsbContextClass = ^TGUsbContextClass;
  TGUsbContextClass = record
    parent_class: TGObjectClass;
    device_added: procedure(self: PGUsbContext; device: PGUsbDevice); cdecl;
    device_removed: procedure(self: PGUsbContext; device: PGUsbDevice); cdecl;
    device_changed: procedure(self: PGUsbContext; device: PGUsbDevice); cdecl;
    _gusb_reserved: array[0..60] of Tgchar;
  end;

type
  PGUsbContextError = ^TGUsbContextError;
  TGUsbContextError = longint;
const
  G_USB_CONTEXT_ERROR_INTERNAL = 0;

type
  PGUsbContextFlags = ^TGUsbContextFlags;
  TGUsbContextFlags = longint;
const
  G_USB_CONTEXT_FLAGS_NONE = 0;
  G_USB_CONTEXT_FLAGS_AUTO_OPEN_DEVICES = 1 shl 0;
  G_USB_CONTEXT_FLAGS_SAVE_EVENTS = 1 shl 1;
  G_USB_CONTEXT_FLAGS_SAVE_REMOVED_DEVICES = 1 shl 2;
  G_USB_CONTEXT_FLAGS_DEBUG = 1 shl 3;
  G_USB_CONTEXT_FLAGS_LAST = (1 shl 3) + 1;

function g_usb_context_get_type: TGType; cdecl; external libgusb;
function g_usb_context_error_quark: TGQuark; cdecl; external libgusb;
function g_usb_context_new(error: PPGError): PGUsbContext; cdecl; external libgusb;
procedure g_usb_context_set_flags(self: PGUsbContext; flags: TGUsbContextFlags); cdecl; external libgusb;
function g_usb_context_get_flags(self: PGUsbContext): TGUsbContextFlags; cdecl; external libgusb;
function g_usb_context_get_source(self: PGUsbContext; main_ctx: PGMainContext): PGUsbSource; cdecl; external libgusb; deprecated;
function g_usb_context_get_main_context(self: PGUsbContext): PGMainContext; cdecl; external libgusb;
procedure g_usb_context_set_main_context(self: PGUsbContext; main_ctx: PGMainContext); cdecl; external libgusb;
function g_usb_context_get_hotplug_poll_interval(self: PGUsbContext): Tguint; cdecl; external libgusb;
procedure g_usb_context_set_hotplug_poll_interval(self: PGUsbContext; hotplug_poll_interval: Tguint); cdecl; external libgusb;
procedure g_usb_context_enumerate(self: PGUsbContext); cdecl; external libgusb;
function g_usb_context_load(self: PGUsbContext; json_object: PJsonObject; error: PPGError): Tgboolean; cdecl; external libgusb;
function g_usb_context_load_with_tag(self: PGUsbContext; json_object: PJsonObject; tag: Pgchar; error: PPGError): Tgboolean; cdecl; external libgusb;
function g_usb_context_save(self: PGUsbContext; json_builder: PJsonBuilder; error: PPGError): Tgboolean; cdecl; external libgusb;
function g_usb_context_save_with_tag(self: PGUsbContext; json_builder: PJsonBuilder; tag: Pgchar; error: PPGError): Tgboolean; cdecl; external libgusb;
procedure g_usb_context_set_debug(self: PGUsbContext; flags: TGLogLevelFlags); cdecl; external libgusb;
function g_usb_context_get_devices(self: PGUsbContext): PGPtrArray; cdecl; external libgusb;
function g_usb_context_find_by_bus_address(self: PGUsbContext; bus: Tguint8; address: Tguint8; error: PPGError): PGUsbDevice; cdecl; external libgusb;
function g_usb_context_find_by_vid_pid(self: PGUsbContext; vid: Tguint16; pid: Tguint16; error: PPGError): PGUsbDevice; cdecl; external libgusb;
function g_usb_context_find_by_platform_id(self: PGUsbContext; platform_id: Pgchar; error: PPGError): PGUsbDevice; cdecl; external libgusb;
function g_usb_context_wait_for_replug(self: PGUsbContext; device: PGUsbDevice; timeout_ms: Tguint; error: PPGError): PGUsbDevice; cdecl; external libgusb;

function G_USB_CONTEXT_ERROR: TGQuark;

// === Konventiert am: 26-8-26 19:42:52 ===

function G_USB_TYPE_CONTEXT: TGType;
function G_USB_CONTEXT(obj: Pointer): PGUsbContext;
function G_USB_IS_CONTEXT(obj: Pointer): Tgboolean;
function G_USB_CONTEXT_CLASS(klass: Pointer): PGUsbContextClass;
function G_USB_IS_CONTEXT_CLASS(klass: Pointer): Tgboolean;
function G_USB_CONTEXT_GET_CLASS(obj: Pointer): PGUsbContextClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function G_USB_TYPE_CONTEXT: TGType;
begin
  Result := g_usb_context_get_type;
end;

function G_USB_CONTEXT(obj: Pointer): PGUsbContext;
begin
  Result := PGUsbContext(g_type_check_instance_cast(obj, G_USB_TYPE_CONTEXT));
end;

function G_USB_IS_CONTEXT(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, G_USB_TYPE_CONTEXT);
end;

function G_USB_CONTEXT_CLASS(klass: Pointer): PGUsbContextClass;
begin
  Result := PGUsbContextClass(g_type_check_class_cast(klass, G_USB_TYPE_CONTEXT));
end;

function G_USB_IS_CONTEXT_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, G_USB_TYPE_CONTEXT);
end;

function G_USB_CONTEXT_GET_CLASS(obj: Pointer): PGUsbContextClass;
begin
  Result := PGUsbContextClass(PGTypeInstance(obj)^.g_class);
end;


function G_USB_CONTEXT_ERROR: TGQuark;
begin
  G_USB_CONTEXT_ERROR := g_usb_context_error_quark;
end;


{$ENDIF read_implementation}
