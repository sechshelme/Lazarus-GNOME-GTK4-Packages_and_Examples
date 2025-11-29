unit fp_libusb;

interface

uses
  ctypes;

const
  {$IFDEF Linux}
  libusb = 'usb-1.0';
  {$ENDIF}

  {$IFDEF Windows}
  libusb = 'libusb-1.0.dll';
  {$ENDIF}


type
  Tuint8_t = uint8;
  Puint8_t = ^Tuint8_t;
  PPuint8_t = ^Puint8_t;
  Tuint16_t = uint16;
  Puint16_t = ^Tuint16_t;
  PPuint16_t = ^Puint16_t;
  Tuint32_t = uint32;
  Puint32_t = ^Tuint32_t;
  PPuint32_t = ^Puint32_t;
  Tuint64_t = uint64;
  Puint64_t = ^Tuint64_t;
  PPuint64_t = ^Puint64_t;

  Tint8_t = int8;
  Pint8_t = ^Tint8_t;
  PPint8_t = ^Pint8_t;
  Tint16_t = int16;
  Pint16_t = ^Tint16_t;
  PPint16_t = ^Pint16_t;
  Tint32_t = int32;
  Pint32_t = ^Tint32_t;
  PPint32_t = ^Pint32_t;
  Tint64_t = int64;
  Pint64_t = ^Tint64_t;
  PPint64_t = ^Pint64_t;

  Tssize_t = SizeInt;

  Tsize_t = SizeUInt;

  Tintptr_t = PtrUInt;

type
  Ttimeval = record
    tv_sec: int64;
    tv_usec: int64;
  end;
  Ptimeval = ^Ttimeval;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


const
  LIBUSB_FLEXIBLE_ARRAY = 0;

  LIBUSB_API_VERSION = $0100010A;

const
  LIBUSBX_API_VERSION = LIBUSB_API_VERSION;
  //  libusb_le16_to_cpu = libusb_cpu_to_le16;
type
  Tlibusb_class_code = longint;

const
  LIBUSB_CLASS_PER_INTERFACE = $00;
  LIBUSB_CLASS_AUDIO = $01;
  LIBUSB_CLASS_COMM = $02;
  LIBUSB_CLASS_HID = $03;
  LIBUSB_CLASS_PHYSICAL = $05;
  LIBUSB_CLASS_IMAGE = $06;
  LIBUSB_CLASS_PTP = $06;
  LIBUSB_CLASS_PRINTER = $07;
  LIBUSB_CLASS_MASS_STORAGE = $08;
  LIBUSB_CLASS_HUB = $09;
  LIBUSB_CLASS_DATA = $0a;
  LIBUSB_CLASS_SMART_CARD = $0b;
  LIBUSB_CLASS_CONTENT_SECURITY = $0d;
  LIBUSB_CLASS_VIDEO = $0e;
  LIBUSB_CLASS_PERSONAL_HEALTHCARE = $0f;
  LIBUSB_CLASS_DIAGNOSTIC_DEVICE = $dc;
  LIBUSB_CLASS_WIRELESS = $e0;
  LIBUSB_CLASS_MISCELLANEOUS = $ef;
  LIBUSB_CLASS_APPLICATION = $fe;
  LIBUSB_CLASS_VENDOR_SPEC = $ff;

type
  Tlibusb_descriptor_type = longint;

const
  LIBUSB_DT_DEVICE = $01;
  LIBUSB_DT_CONFIG = $02;
  LIBUSB_DT_STRING = $03;
  LIBUSB_DT_INTERFACE = $04;
  LIBUSB_DT_ENDPOINT = $05;
  LIBUSB_DT_INTERFACE_ASSOCIATION = $0b;
  LIBUSB_DT_BOS = $0f;
  LIBUSB_DT_DEVICE_CAPABILITY = $10;
  LIBUSB_DT_HID = $21;
  LIBUSB_DT_REPORT = $22;
  LIBUSB_DT_PHYSICAL = $23;
  LIBUSB_DT_HUB = $29;
  LIBUSB_DT_SUPERSPEED_HUB = $2a;
  LIBUSB_DT_SS_ENDPOINT_COMPANION = $30;

const
  LIBUSB_DT_DEVICE_SIZE = 18;
  LIBUSB_DT_CONFIG_SIZE = 9;
  LIBUSB_DT_INTERFACE_SIZE = 9;
  LIBUSB_DT_ENDPOINT_SIZE = 7;
  LIBUSB_DT_ENDPOINT_AUDIO_SIZE = 9;
  LIBUSB_DT_HUB_NONVAR_SIZE = 7;
  LIBUSB_DT_SS_ENDPOINT_COMPANION_SIZE = 6;
  LIBUSB_DT_BOS_SIZE = 5;
  LIBUSB_DT_DEVICE_CAPABILITY_SIZE = 3;
  LIBUSB_BT_USB_2_0_EXTENSION_SIZE = 7;
  LIBUSB_BT_SS_USB_DEVICE_CAPABILITY_SIZE = 10;
  LIBUSB_BT_CONTAINER_ID_SIZE = 20;
  LIBUSB_BT_PLATFORM_DESCRIPTOR_MIN_SIZE = 20;
  LIBUSB_DT_BOS_MAX_SIZE = LIBUSB_DT_BOS_SIZE + LIBUSB_BT_USB_2_0_EXTENSION_SIZE + LIBUSB_BT_SS_USB_DEVICE_CAPABILITY_SIZE + LIBUSB_BT_CONTAINER_ID_SIZE;
  LIBUSB_ENDPOINT_ADDRESS_MASK = $0f;
  LIBUSB_ENDPOINT_DIR_MASK = $80;

type
  Tlibusb_endpoint_direction = longint;

const
  LIBUSB_ENDPOINT_OUT = $00;
  LIBUSB_ENDPOINT_IN = $80;

  LIBUSB_TRANSFER_TYPE_MASK = $03;

type
  Tlibusb_endpoint_transfer_type = longint;

const
  LIBUSB_ENDPOINT_TRANSFER_TYPE_CONTROL = $0;
  LIBUSB_ENDPOINT_TRANSFER_TYPE_ISOCHRONOUS = $1;
  LIBUSB_ENDPOINT_TRANSFER_TYPE_BULK = $2;
  LIBUSB_ENDPOINT_TRANSFER_TYPE_INTERRUPT = $3;

type
  Tlibusb_standard_request = longint;

const
  LIBUSB_REQUEST_GET_STATUS = $00;
  LIBUSB_REQUEST_CLEAR_FEATURE = $01;
  LIBUSB_REQUEST_SET_FEATURE = $03;
  LIBUSB_REQUEST_SET_ADDRESS = $05;
  LIBUSB_REQUEST_GET_DESCRIPTOR = $06;
  LIBUSB_REQUEST_SET_DESCRIPTOR = $07;
  LIBUSB_REQUEST_GET_CONFIGURATION = $08;
  LIBUSB_REQUEST_SET_CONFIGURATION = $09;
  LIBUSB_REQUEST_GET_INTERFACE = $0a;
  LIBUSB_REQUEST_SET_INTERFACE = $0b;
  LIBUSB_REQUEST_SYNCH_FRAME = $0c;
  LIBUSB_REQUEST_SET_SEL = $30;
  LIBUSB_SET_ISOCH_DELAY = $31;

type
  Tlibusb_request_type = longint;

const
  LIBUSB_REQUEST_TYPE_STANDARD = $00 shl 5;
  LIBUSB_REQUEST_TYPE_CLASS = $01 shl 5;
  LIBUSB_REQUEST_TYPE_VENDOR = $02 shl 5;
  LIBUSB_REQUEST_TYPE_RESERVED = $03 shl 5;

type
  Tlibusb_request_recipient = longint;

const
  LIBUSB_RECIPIENT_DEVICE = $00;
  LIBUSB_RECIPIENT_INTERFACE = $01;
  LIBUSB_RECIPIENT_ENDPOINT = $02;
  LIBUSB_RECIPIENT_OTHER = $03;

const
  LIBUSB_ISO_SYNC_TYPE_MASK = $0c;

type
  Tlibusb_iso_sync_type = longint;

const
  LIBUSB_ISO_SYNC_TYPE_NONE = $0;
  LIBUSB_ISO_SYNC_TYPE_ASYNC = $1;
  LIBUSB_ISO_SYNC_TYPE_ADAPTIVE = $2;
  LIBUSB_ISO_SYNC_TYPE_SYNC = $3;

const
  LIBUSB_ISO_USAGE_TYPE_MASK = $30;

type
  Tlibusb_iso_usage_type = longint;

const
  LIBUSB_ISO_USAGE_TYPE_DATA = $0;
  LIBUSB_ISO_USAGE_TYPE_FEEDBACK = $1;
  LIBUSB_ISO_USAGE_TYPE_IMPLICIT = $2;

type
  Tlibusb_supported_speed = longint;

const
  LIBUSB_LOW_SPEED_OPERATION = 1 shl 0;
  LIBUSB_FULL_SPEED_OPERATION = 1 shl 1;
  LIBUSB_HIGH_SPEED_OPERATION = 1 shl 2;
  LIBUSB_SUPER_SPEED_OPERATION = 1 shl 3;

type
  Tlibusb_usb_2_0_extension_attributes = longint;

const
  LIBUSB_BM_LPM_SUPPORT = 1 shl 1;

type
  Tlibusb_ss_usb_device_capability_attributes = longint;

const
  LIBUSB_BM_LTM_SUPPORT = 1 shl 1;

type
  Tlibusb_bos_type = longint;

const
  LIBUSB_BT_WIRELESS_USB_DEVICE_CAPABILITY = $01;
  LIBUSB_BT_USB_2_0_EXTENSION = $02;
  LIBUSB_BT_SS_USB_DEVICE_CAPABILITY = $03;
  LIBUSB_BT_CONTAINER_ID = $04;
  LIBUSB_BT_PLATFORM_DESCRIPTOR = $05;

type
  Tlibusb_device_descriptor = record
    bLength: Tuint8_t;
    bDescriptorType: Tuint8_t;
    bcdUSB: Tuint16_t;
    bDeviceClass: Tuint8_t;
    bDeviceSubClass: Tuint8_t;
    bDeviceProtocol: Tuint8_t;
    bMaxPacketSize0: Tuint8_t;
    idVendor: Tuint16_t;
    idProduct: Tuint16_t;
    bcdDevice: Tuint16_t;
    iManufacturer: Tuint8_t;
    iProduct: Tuint8_t;
    iSerialNumber: Tuint8_t;
    bNumConfigurations: Tuint8_t;
  end;
  Plibusb_device_descriptor = ^Tlibusb_device_descriptor;

  Tlibusb_endpoint_descriptor = record
    bLength: Tuint8_t;
    bDescriptorType: Tuint8_t;
    bEndpointAddress: Tuint8_t;
    bmAttributes: Tuint8_t;
    wMaxPacketSize: Tuint16_t;
    bInterval: Tuint8_t;
    bRefresh: Tuint8_t;
    bSynchAddress: Tuint8_t;
    extra: pbyte;
    extra_length: longint;
  end;
  Plibusb_endpoint_descriptor = ^Tlibusb_endpoint_descriptor;

  Tlibusb_interface_association_descriptor = record
    bLength: Tuint8_t;
    bDescriptorType: Tuint8_t;
    bFirstInterface: Tuint8_t;
    bInterfaceCount: Tuint8_t;
    bFunctionClass: Tuint8_t;
    bFunctionSubClass: Tuint8_t;
    bFunctionProtocol: Tuint8_t;
    iFunction: Tuint8_t;
  end;
  Plibusb_interface_association_descriptor = ^Tlibusb_interface_association_descriptor;

  Tlibusb_interface_association_descriptor_array = record
    iad: Plibusb_interface_association_descriptor;
    length: longint;
  end;
  Plibusb_interface_association_descriptor_array = ^Tlibusb_interface_association_descriptor_array;
  PPlibusb_interface_association_descriptor_array = ^Plibusb_interface_association_descriptor_array;

  Tlibusb_interface_descriptor = record
    bLength: Tuint8_t;
    bDescriptorType: Tuint8_t;
    bInterfaceNumber: Tuint8_t;
    bAlternateSetting: Tuint8_t;
    bNumEndpoints: Tuint8_t;
    bInterfaceClass: Tuint8_t;
    bInterfaceSubClass: Tuint8_t;
    bInterfaceProtocol: Tuint8_t;
    iInterface: Tuint8_t;
    endpoint: Plibusb_endpoint_descriptor;
    extra: pbyte;
    extra_length: longint;
  end;
  Plibusb_interface_descriptor = ^Tlibusb_interface_descriptor;

  Tlibusb_interface = record
    altsetting: Plibusb_interface_descriptor;
    num_altsetting: longint;
  end;
  Plibusb_interface = ^Tlibusb_interface;

  Tlibusb_config_descriptor = record
    bLength: Tuint8_t;
    bDescriptorType: Tuint8_t;
    wTotalLength: Tuint16_t;
    bNumInterfaces: Tuint8_t;
    bConfigurationValue: Tuint8_t;
    iConfiguration: Tuint8_t;
    bmAttributes: Tuint8_t;
    MaxPower: Tuint8_t;
    iface: Plibusb_interface;
    extra: pbyte;
    extra_length: longint;
  end;
  Plibusb_config_descriptor = ^Tlibusb_config_descriptor;
  PPlibusb_config_descriptor = ^Plibusb_config_descriptor;

  Tlibusb_ss_endpoint_companion_descriptor = record
    bLength: Tuint8_t;
    bDescriptorType: Tuint8_t;
    bMaxBurst: Tuint8_t;
    bmAttributes: Tuint8_t;
    wBytesPerInterval: Tuint16_t;
  end;
  Plibusb_ss_endpoint_companion_descriptor = ^Tlibusb_ss_endpoint_companion_descriptor;
  PPlibusb_ss_endpoint_companion_descriptor = ^Plibusb_ss_endpoint_companion_descriptor;

  Tlibusb_bos_dev_capability_descriptor = record
    bLength: Tuint8_t;
    bDescriptorType: Tuint8_t;
    bDevCapabilityType: Tuint8_t;
    dev_capability_data: Puint8_t;
  end;
  Plibusb_bos_dev_capability_descriptor = ^Tlibusb_bos_dev_capability_descriptor;
  PPlibusb_bos_dev_capability_descriptor = ^Plibusb_bos_dev_capability_descriptor;

  Tlibusb_bos_descriptor = record
    bLength: Tuint8_t;
    bDescriptorType: Tuint8_t;
    wTotalLength: Tuint16_t;
    bNumDeviceCaps: Tuint8_t;
    dev_capability: PPlibusb_bos_dev_capability_descriptor;
  end;
  Plibusb_bos_descriptor = ^Tlibusb_bos_descriptor;
  PPlibusb_bos_descriptor = ^Plibusb_bos_descriptor;

  Tlibusb_usb_2_0_extension_descriptor = record
    bLength: Tuint8_t;
    bDescriptorType: Tuint8_t;
    bDevCapabilityType: Tuint8_t;
    bmAttributes: Tuint32_t;
  end;
  Plibusb_usb_2_0_extension_descriptor = ^Tlibusb_usb_2_0_extension_descriptor;
  PPlibusb_usb_2_0_extension_descriptor = ^Plibusb_usb_2_0_extension_descriptor;

  Tlibusb_ss_usb_device_capability_descriptor = record
    bLength: Tuint8_t;
    bDescriptorType: Tuint8_t;
    bDevCapabilityType: Tuint8_t;
    bmAttributes: Tuint8_t;
    wSpeedSupported: Tuint16_t;
    bFunctionalitySupport: Tuint8_t;
    bU1DevExitLat: Tuint8_t;
    bU2DevExitLat: Tuint16_t;
  end;
  Plibusb_ss_usb_device_capability_descriptor = ^Tlibusb_ss_usb_device_capability_descriptor;
  PPlibusb_ss_usb_device_capability_descriptor = ^Plibusb_ss_usb_device_capability_descriptor;

  Tlibusb_container_id_descriptor = record
    bLength: Tuint8_t;
    bDescriptorType: Tuint8_t;
    bDevCapabilityType: Tuint8_t;
    bReserved: Tuint8_t;
    ContainerID: array[0..15] of Tuint8_t;
  end;
  Plibusb_container_id_descriptor = ^Tlibusb_container_id_descriptor;
  PPlibusb_container_id_descriptor = ^Plibusb_container_id_descriptor;

  Tlibusb_platform_descriptor = record
    bLength: Tuint8_t;
    bDescriptorType: Tuint8_t;
    bDevCapabilityType: Tuint8_t;
    bReserved: Tuint8_t;
    PlatformCapabilityUUID: array[0..15] of Tuint8_t;
    CapabilityData: Puint8_t;
  end;
  Plibusb_platform_descriptor = ^Tlibusb_platform_descriptor;
  PPlibusb_platform_descriptor = ^Plibusb_platform_descriptor;

type
  Tlibusb_control_setup = record
    bmRequestType: Tuint8_t;
    bRequest: Tuint8_t;
    wValue: Tuint16_t;
    wIndex: Tuint16_t;
    wLength: Tuint16_t;
  end;
  Plibusb_control_setup = ^Tlibusb_control_setup;

const
  LIBUSB_CONTROL_SETUP_SIZE = sizeof(Tlibusb_control_setup);

type
  Plibusb_context = type Pointer;
  PPlibusb_context = ^Plibusb_context;
  Plibusb_device = type Pointer;
  PPlibusb_device = ^Plibusb_device;
  PPPlibusb_device = ^PPlibusb_device;
  Plibusb_device_handle = type Pointer;
  PPlibusb_device_handle = ^Plibusb_device_handle;

  Tlibusb_version = record
    major: Tuint16_t;
    minor: Tuint16_t;
    micro: Tuint16_t;
    nano: Tuint16_t;
    rc: pchar;
    describe: pchar;
  end;
  Plibusb_version = ^Tlibusb_version;

type
  Tlibusb_speed = longint;

const
  LIBUSB_SPEED_UNKNOWN = 0;
  LIBUSB_SPEED_LOW = 1;
  LIBUSB_SPEED_FULL = 2;
  LIBUSB_SPEED_HIGH = 3;
  LIBUSB_SPEED_SUPER = 4;
  LIBUSB_SPEED_SUPER_PLUS = 5;

type
  Tlibusb_error = longint;

const
  LIBUSB_SUCCESS = 0;
  LIBUSB_ERROR_IO = -(1);
  LIBUSB_ERROR_INVALID_PARAM = -(2);
  LIBUSB_ERROR_ACCESS = -(3);
  LIBUSB_ERROR_NO_DEVICE = -(4);
  LIBUSB_ERROR_NOT_FOUND = -(5);
  LIBUSB_ERROR_BUSY = -(6);
  LIBUSB_ERROR_TIMEOUT = -(7);
  LIBUSB_ERROR_OVERFLOW = -(8);
  LIBUSB_ERROR_PIPE = -(9);
  LIBUSB_ERROR_INTERRUPTED = -(10);
  LIBUSB_ERROR_NO_MEM = -(11);
  LIBUSB_ERROR_NOT_SUPPORTED = -(12);
  LIBUSB_ERROR_OTHER = -(99);

  LIBUSB_ERROR_COUNT = 14;

type
  Tlibusb_transfer_type = longint;

const
  LIBUSB_TRANSFER_TYPE_CONTROL = 0;
  LIBUSB_TRANSFER_TYPE_ISOCHRONOUS = 1;
  LIBUSB_TRANSFER_TYPE_BULK = 2;
  LIBUSB_TRANSFER_TYPE_INTERRUPT = 3;
  LIBUSB_TRANSFER_TYPE_BULK_STREAM = 4;

type
  Tlibusb_transfer_status = longint;

const
  LIBUSB_TRANSFER_COMPLETED = 0;
  LIBUSB_TRANSFER_ERROR = 1;
  LIBUSB_TRANSFER_TIMED_OUT = 2;
  LIBUSB_TRANSFER_CANCELLED = 3;
  LIBUSB_TRANSFER_STALL = 4;
  LIBUSB_TRANSFER_NO_DEVICE = 5;
  LIBUSB_TRANSFER_OVERFLOW = 6;

type
  Tlibusb_transfer_flags = longint;

const
  LIBUSB_TRANSFER_SHORT_NOT_OK = 1 shl 0;
  LIBUSB_TRANSFER_FREE_BUFFER = 1 shl 1;
  LIBUSB_TRANSFER_FREE_TRANSFER = 1 shl 2;
  LIBUSB_TRANSFER_ADD_ZERO_PACKET = 1 shl 3;

type
  Tlibusb_iso_packet_descriptor = record
    length: dword;
    actual_length: dword;
    status: Tlibusb_transfer_status;
  end;
  Plibusb_iso_packet_descriptor = ^Tlibusb_iso_packet_descriptor;

  Plibusb_transfer = ^Tlibusb_transfer;
  Tlibusb_transfer_cb_fn = procedure(transfer: Plibusb_transfer); cdecl;

  Tlibusb_transfer = record
    dev_handle: Plibusb_device_handle;
    flags: Tuint8_t;
    endpoint: byte;
    _type: byte;
    timeout: dword;
    status: Tlibusb_transfer_status;
    length: longint;
    actual_length: longint;
    callback: Tlibusb_transfer_cb_fn;
    user_data: pointer;
    buffer: pbyte;
    num_iso_packets: longint;
    iso_packet_desc: Plibusb_iso_packet_descriptor;
  end;

type
  Tlibusb_capability = longint;

const
  LIBUSB_CAP_HAS_CAPABILITY = $0000;
  LIBUSB_CAP_HAS_HOTPLUG = $0001;
  LIBUSB_CAP_HAS_HID_ACCESS = $0100;
  LIBUSB_CAP_SUPPORTS_DETACH_KERNEL_DRIVER = $0101;

type
  Tlibusb_log_level = longint;

const
  LIBUSB_LOG_LEVEL_NONE = 0;
  LIBUSB_LOG_LEVEL_ERROR = 1;
  LIBUSB_LOG_LEVEL_WARNING = 2;
  LIBUSB_LOG_LEVEL_INFO = 3;
  LIBUSB_LOG_LEVEL_DEBUG = 4;

type
  Tlibusb_log_cb_mode = longint;

const
  LIBUSB_LOG_CB_GLOBAL = 1 shl 0;
  LIBUSB_LOG_CB_CONTEXT = 1 shl 1;

type
  Tlibusb_option = longint;

const
  LIBUSB_OPTION_LOG_LEVEL = 0;
  LIBUSB_OPTION_USE_USBDK = 1;
  LIBUSB_OPTION_NO_DEVICE_DISCOVERY = 2;
  LIBUSB_OPTION_LOG_CB = 3;
  LIBUSB_OPTION_MAX = 4;

  LIBUSB_OPTION_WEAK_AUTHORITY = LIBUSB_OPTION_NO_DEVICE_DISCOVERY;

type
  Tlibusb_log_cb = procedure(ctx: Plibusb_context; level: Tlibusb_log_level; str: pchar); cdecl;

  Tlibusb_init_option = record
    option: Tlibusb_option;
    value: record
      case longint of
        0: (ival: longint);
        1: (log_cbval: Tlibusb_log_cb);
      end;
  end;
  Plibusb_init_option = ^Tlibusb_init_option;

function libusb_init(ctx: PPlibusb_context): longint; cdecl; external libusb;
function libusb_init_context(ctx: PPlibusb_context; options: Plibusb_init_option; num_options: longint): longint; cdecl; external libusb;
procedure libusb_exit(ctx: Plibusb_context); cdecl; external libusb;
procedure libusb_set_debug(ctx: Plibusb_context; level: longint); cdecl; external libusb;
procedure libusb_set_log_cb(ctx: Plibusb_context; cb: Tlibusb_log_cb; mode: longint); cdecl; external libusb;
function libusb_get_version: Plibusb_version; cdecl; external libusb;
function libusb_has_capability(capability: Tuint32_t): longint; cdecl; external libusb;
function libusb_error_name(errcode: longint): pchar; cdecl; external libusb;
function libusb_setlocale(locale: pchar): longint; cdecl; external libusb;
function libusb_strerror(errcode: longint): pchar; cdecl; external libusb;
function libusb_get_device_list(ctx: Plibusb_context; list: PPPlibusb_device): Tssize_t; cdecl; external libusb;
procedure libusb_free_device_list(list: PPlibusb_device; unref_devices: longint); cdecl; external libusb;
function libusb_ref_device(dev: Plibusb_device): Plibusb_device; cdecl; external libusb;
procedure libusb_unref_device(dev: Plibusb_device); cdecl; external libusb;
function libusb_get_configuration(dev: Plibusb_device_handle; config: Plongint): longint; cdecl; external libusb;
function libusb_get_device_descriptor(dev: Plibusb_device; desc: Plibusb_device_descriptor): longint; cdecl; external libusb;
function libusb_get_active_config_descriptor(dev: Plibusb_device; config: PPlibusb_config_descriptor): longint; cdecl; external libusb;
function libusb_get_config_descriptor(dev: Plibusb_device; config_index: Tuint8_t; config: PPlibusb_config_descriptor): longint; cdecl; external libusb;
function libusb_get_config_descriptor_by_value(dev: Plibusb_device; bConfigurationValue: Tuint8_t; config: PPlibusb_config_descriptor): longint; cdecl; external libusb;
procedure libusb_free_config_descriptor(config: Plibusb_config_descriptor); cdecl; external libusb;
function libusb_get_ss_endpoint_companion_descriptor(ctx: Plibusb_context; endpoint: Plibusb_endpoint_descriptor; ep_comp: PPlibusb_ss_endpoint_companion_descriptor): longint; cdecl; external libusb;
procedure libusb_free_ss_endpoint_companion_descriptor(ep_comp: Plibusb_ss_endpoint_companion_descriptor); cdecl; external libusb;
function libusb_get_bos_descriptor(dev_handle: Plibusb_device_handle; bos: PPlibusb_bos_descriptor): longint; cdecl; external libusb;
procedure libusb_free_bos_descriptor(bos: Plibusb_bos_descriptor); cdecl; external libusb;
function libusb_get_usb_2_0_extension_descriptor(ctx: Plibusb_context; dev_cap: Plibusb_bos_dev_capability_descriptor; usb_2_0_extension: PPlibusb_usb_2_0_extension_descriptor): longint; cdecl; external libusb;
procedure libusb_free_usb_2_0_extension_descriptor(usb_2_0_extension: Plibusb_usb_2_0_extension_descriptor); cdecl; external libusb;
function libusb_get_ss_usb_device_capability_descriptor(ctx: Plibusb_context; dev_cap: Plibusb_bos_dev_capability_descriptor; ss_usb_device_cap: PPlibusb_ss_usb_device_capability_descriptor): longint; cdecl; external libusb;
procedure libusb_free_ss_usb_device_capability_descriptor(ss_usb_device_cap: Plibusb_ss_usb_device_capability_descriptor); cdecl; external libusb;
function libusb_get_container_id_descriptor(ctx: Plibusb_context; dev_cap: Plibusb_bos_dev_capability_descriptor; container_id: PPlibusb_container_id_descriptor): longint; cdecl; external libusb;
procedure libusb_free_container_id_descriptor(container_id: Plibusb_container_id_descriptor); cdecl; external libusb;
function libusb_get_platform_descriptor(ctx: Plibusb_context; dev_cap: Plibusb_bos_dev_capability_descriptor; platform_descriptor: PPlibusb_platform_descriptor): longint; cdecl; external libusb;
procedure libusb_free_platform_descriptor(platform_descriptor: Plibusb_platform_descriptor); cdecl; external libusb;
function libusb_get_bus_number(dev: Plibusb_device): Tuint8_t; cdecl; external libusb;
function libusb_get_port_number(dev: Plibusb_device): Tuint8_t; cdecl; external libusb;
function libusb_get_port_numbers(dev: Plibusb_device; port_numbers: Puint8_t; port_numbers_len: longint): longint; cdecl; external libusb; deprecated 'libusb_get_port_numbers';
function libusb_get_port_path(ctx: Plibusb_context; dev: Plibusb_device; path: Puint8_t; path_length: Tuint8_t): longint; cdecl; external libusb;
function libusb_get_parent(dev: Plibusb_device): Plibusb_device; cdecl; external libusb;
function libusb_get_device_address(dev: Plibusb_device): Tuint8_t; cdecl; external libusb;
function libusb_get_device_speed(dev: Plibusb_device): longint; cdecl; external libusb;
function libusb_get_max_packet_size(dev: Plibusb_device; endpoint: byte): longint; cdecl; external libusb;
function libusb_get_max_iso_packet_size(dev: Plibusb_device; endpoint: byte): longint; cdecl; external libusb;
function libusb_get_max_alt_packet_size(dev: Plibusb_device; interface_number: longint; alternate_setting: longint; endpoint: byte): longint; cdecl; external libusb;
function libusb_get_interface_association_descriptors(dev: Plibusb_device; config_index: Tuint8_t; iad_array: PPlibusb_interface_association_descriptor_array): longint; cdecl; external libusb;
function libusb_get_active_interface_association_descriptors(dev: Plibusb_device; iad_array: PPlibusb_interface_association_descriptor_array): longint; cdecl; external libusb;
procedure libusb_free_interface_association_descriptors(iad_array: Plibusb_interface_association_descriptor_array); cdecl; external libusb;
function libusb_wrap_sys_device(ctx: Plibusb_context; sys_dev: Tintptr_t; dev_handle: PPlibusb_device_handle): longint; cdecl; external libusb;
function libusb_open(dev: Plibusb_device; dev_handle: PPlibusb_device_handle): longint; cdecl; external libusb;
procedure libusb_close(dev_handle: Plibusb_device_handle); cdecl; external libusb;
function libusb_get_device(dev_handle: Plibusb_device_handle): Plibusb_device; cdecl; external libusb;
function libusb_set_configuration(dev_handle: Plibusb_device_handle; configuration: longint): longint; cdecl; external libusb;
function libusb_claim_interface(dev_handle: Plibusb_device_handle; interface_number: longint): longint; cdecl; external libusb;
function libusb_release_interface(dev_handle: Plibusb_device_handle; interface_number: longint): longint; cdecl; external libusb;
function libusb_open_device_with_vid_pid(ctx: Plibusb_context; vendor_id: Tuint16_t; product_id: Tuint16_t): Plibusb_device_handle; cdecl; external libusb;
function libusb_set_interface_alt_setting(dev_handle: Plibusb_device_handle; interface_number: longint; alternate_setting: longint): longint; cdecl; external libusb;
function libusb_clear_halt(dev_handle: Plibusb_device_handle; endpoint: byte): longint; cdecl; external libusb;
function libusb_reset_device(dev_handle: Plibusb_device_handle): longint; cdecl; external libusb;
function libusb_alloc_streams(dev_handle: Plibusb_device_handle; num_streams: Tuint32_t; endpoints: pbyte; num_endpoints: longint): longint; cdecl; external libusb;
function libusb_free_streams(dev_handle: Plibusb_device_handle; endpoints: pbyte; num_endpoints: longint): longint; cdecl; external libusb;
function libusb_dev_mem_alloc(dev_handle: Plibusb_device_handle; length: Tsize_t): pbyte; cdecl; external libusb;
function libusb_dev_mem_free(dev_handle: Plibusb_device_handle; buffer: pbyte; length: Tsize_t): longint; cdecl; external libusb;
function libusb_kernel_driver_active(dev_handle: Plibusb_device_handle; interface_number: longint): longint; cdecl; external libusb;
function libusb_detach_kernel_driver(dev_handle: Plibusb_device_handle; interface_number: longint): longint; cdecl; external libusb;
function libusb_attach_kernel_driver(dev_handle: Plibusb_device_handle; interface_number: longint): longint; cdecl; external libusb;
function libusb_set_auto_detach_kernel_driver(dev_handle: Plibusb_device_handle; enable: longint): longint; cdecl; external libusb;
function libusb_alloc_transfer(iso_packets: longint): Plibusb_transfer; cdecl; external libusb;
function libusb_submit_transfer(transfer: Plibusb_transfer): longint; cdecl; external libusb;
function libusb_cancel_transfer(transfer: Plibusb_transfer): longint; cdecl; external libusb;
procedure libusb_free_transfer(transfer: Plibusb_transfer); cdecl; external libusb;
procedure libusb_transfer_set_stream_id(transfer: Plibusb_transfer; stream_id: Tuint32_t); cdecl; external libusb;
function libusb_transfer_get_stream_id(transfer: Plibusb_transfer): Tuint32_t; cdecl; external libusb;
function libusb_control_transfer(dev_handle: Plibusb_device_handle; request_type: Tuint8_t; bRequest: Tuint8_t; wValue: Tuint16_t; wIndex: Tuint16_t;
  data: pbyte; wLength: Tuint16_t; timeout: dword): longint; cdecl; external libusb;
function libusb_bulk_transfer(dev_handle: Plibusb_device_handle; endpoint: byte; data: pbyte; length: longint; actual_length: Plongint;
  timeout: dword): longint; cdecl; external libusb;
function libusb_interrupt_transfer(dev_handle: Plibusb_device_handle; endpoint: byte; data: pbyte; length: longint; actual_length: Plongint;
  timeout: dword): longint; cdecl; external libusb;
function libusb_get_string_descriptor_ascii(dev_handle: Plibusb_device_handle; desc_index: Tuint8_t; data: pbyte; length: longint): longint; cdecl; external libusb;
function libusb_try_lock_events(ctx: Plibusb_context): longint; cdecl; external libusb;
procedure libusb_lock_events(ctx: Plibusb_context); cdecl; external libusb;
procedure libusb_unlock_events(ctx: Plibusb_context); cdecl; external libusb;
function libusb_event_handling_ok(ctx: Plibusb_context): longint; cdecl; external libusb;
function libusb_event_handler_active(ctx: Plibusb_context): longint; cdecl; external libusb;
procedure libusb_interrupt_event_handler(ctx: Plibusb_context); cdecl; external libusb;
procedure libusb_lock_event_waiters(ctx: Plibusb_context); cdecl; external libusb;
procedure libusb_unlock_event_waiters(ctx: Plibusb_context); cdecl; external libusb;
function libusb_wait_for_event(ctx: Plibusb_context; tv: Ptimeval): longint; cdecl; external libusb;
function libusb_handle_events_timeout(ctx: Plibusb_context; tv: Ptimeval): longint; cdecl; external libusb;
function libusb_handle_events_timeout_completed(ctx: Plibusb_context; tv: Ptimeval; completed: Plongint): longint; cdecl; external libusb;
function libusb_handle_events(ctx: Plibusb_context): longint; cdecl; external libusb;
function libusb_handle_events_completed(ctx: Plibusb_context; completed: Plongint): longint; cdecl; external libusb;
function libusb_handle_events_locked(ctx: Plibusb_context; tv: Ptimeval): longint; cdecl; external libusb;
function libusb_pollfds_handle_timeouts(ctx: Plibusb_context): longint; cdecl; external libusb;
function libusb_get_next_timeout(ctx: Plibusb_context; tv: Ptimeval): longint; cdecl; external libusb;

type
  Tlibusb_pollfd = record
    fd: longint;
    events: smallint;
  end;
  Plibusb_pollfd = ^Tlibusb_pollfd;
  PPlibusb_pollfd = ^Plibusb_pollfd;

  Tlibusb_pollfd_added_cb = procedure(fd: longint; events: smallint; user_data: pointer); cdecl;
  Tlibusb_pollfd_removed_cb = procedure(fd: longint; user_data: pointer); cdecl;

function libusb_get_pollfds(ctx: Plibusb_context): PPlibusb_pollfd; cdecl; external libusb;
procedure libusb_free_pollfds(pollfds: PPlibusb_pollfd); cdecl; external libusb;
procedure libusb_set_pollfd_notifiers(ctx: Plibusb_context; added_cb: Tlibusb_pollfd_added_cb; removed_cb: Tlibusb_pollfd_removed_cb; user_data: pointer); cdecl; external libusb;

type
  Plibusb_hotplug_callback_handle = ^Tlibusb_hotplug_callback_handle;
  Tlibusb_hotplug_callback_handle = longint;

type
  Plibusb_hotplug_event = ^Tlibusb_hotplug_event;
  Tlibusb_hotplug_event = longint;

const
  LIBUSB_HOTPLUG_EVENT_DEVICE_ARRIVED = 1 shl 0;
  LIBUSB_HOTPLUG_EVENT_DEVICE_LEFT = 1 shl 1;

type
  Plibusb_hotplug_flag = ^Tlibusb_hotplug_flag;
  Tlibusb_hotplug_flag = longint;

const
  LIBUSB_HOTPLUG_ENUMERATE = 1 shl 0;

const
  LIBUSB_HOTPLUG_NO_FLAGS = 0;
  LIBUSB_HOTPLUG_MATCH_ANY = -1;

type
  Tlibusb_hotplug_callback_fn = function(ctx: Plibusb_context; device: Plibusb_device; event: Tlibusb_hotplug_event; user_data: pointer): longint; cdecl;

function libusb_hotplug_register_callback(ctx: Plibusb_context; events: longint; flags: longint; vendor_id: longint; product_id: longint;
  dev_class: longint; cb_fn: Tlibusb_hotplug_callback_fn; user_data: pointer; callback_handle: Plibusb_hotplug_callback_handle): longint; cdecl; external libusb;
procedure libusb_hotplug_deregister_callback(ctx: Plibusb_context; callback_handle: Tlibusb_hotplug_callback_handle); cdecl; external libusb;
function libusb_hotplug_get_user_data(ctx: Plibusb_context; callback_handle: Tlibusb_hotplug_callback_handle): pointer; cdecl; external libusb;
function libusb_set_option(ctx: Plibusb_context; option: Tlibusb_option; args: array of const): longint; cdecl; external libusb;
function libusb_set_option(ctx: Plibusb_context; option: Tlibusb_option): longint; cdecl; external libusb;

// === Konventiert am: 11-11-25 14:00:25 ===

function libusb_cpu_to_le16(x: word): word;
function libusb_le16_to_cpu(x: word): word;
function libusb_control_transfer_get_setup(transfer: Plibusb_transfer): Plibusb_control_setup;
procedure libusb_fill_control_setup(buffer: pbyte; bmRequestType: byte; bRequest: byte; wValue: word; wIndex: word; wLength: word);
procedure libusb_fill_control_transfer(transfer: Plibusb_transfer; dev_handle: Plibusb_device_handle; buffer: pbyte; callback: Tlibusb_transfer_cb_fn; user_data: Pointer; timeout: cardinal);
procedure libusb_fill_interrupt_transfer(transfer: Plibusb_transfer; dev_handle: Plibusb_device_handle; endpoint: byte; buffer: pbyte; length: integer; callback: Tlibusb_transfer_cb_fn; user_data: Pointer; timeout: cardinal);
procedure libusb_fill_iso_transfer(transfer: Plibusb_transfer; dev_handle: Plibusb_device_handle; endpoint: byte; buffer: pbyte; length: integer; num_iso_packets: integer; callback: Tlibusb_transfer_cb_fn; user_data: Pointer; timeout: cardinal);
procedure libusb_set_iso_packet_lengths(transfer: Plibusb_transfer; length: cardinal);
function libusb_get_iso_packet_buffer_simple(transfer: Plibusb_transfer; packet: cardinal): pbyte;
function libusb_get_descriptor(dev_handle: Plibusb_device_handle; desc_type: byte; desc_index: byte; data: pbyte; length: integer): integer;
function libusb_get_string_descriptor(dev_handle: Plibusb_device_handle; desc_index: byte; langid: word; data: pbyte; length: integer): integer;

implementation

function libusb_cpu_to_le16(x: word): word;
begin
  Result := (x shr 8) or (x shl 8);
end;

function libusb_le16_to_cpu(x: word): word;
begin
  Result := libusb_cpu_to_le16(x);
end;

function libusb_control_transfer_get_setup(transfer: Plibusb_transfer): Plibusb_control_setup;
begin
  Result := Plibusb_control_setup(transfer^.buffer);
end;

procedure libusb_fill_control_setup(buffer: pbyte; bmRequestType: byte; bRequest: byte; wValue: word; wIndex: word; wLength: word);
var
  Setup: Plibusb_control_setup;
begin
  Setup := Plibusb_control_setup(buffer);
  Setup^.bmRequestType := bmRequestType;
  Setup^.bRequest := bRequest;
  Setup^.wValue := libusb_cpu_to_le16(wValue);
  Setup^.wIndex := libusb_cpu_to_le16(wIndex);
  Setup^.wLength := libusb_cpu_to_le16(wLength);
end;

procedure libusb_fill_control_transfer(transfer: Plibusb_transfer; dev_handle: Plibusb_device_handle; buffer: pbyte; callback: Tlibusb_transfer_cb_fn; user_data: Pointer; timeout: cardinal);
var
  Setup: Plibusb_control_setup;
begin
  Setup := Plibusb_control_setup(buffer);

  transfer^.dev_handle := dev_handle;
  transfer^.endpoint := 0;
  transfer^._type := LIBUSB_TRANSFER_TYPE_CONTROL;
  transfer^.timeout := timeout;
  transfer^.buffer := buffer;

  if Setup <> nil then begin
    transfer^.length := LIBUSB_CONTROL_SETUP_SIZE + libusb_le16_to_cpu(Setup^.wLength);
  end;

  transfer^.user_data := user_data;
  transfer^.callback := callback;
end;

procedure libusb_fill_interrupt_transfer(transfer: Plibusb_transfer; dev_handle: Plibusb_device_handle; endpoint: byte; buffer: pbyte; length: integer; callback: Tlibusb_transfer_cb_fn; user_data: Pointer; timeout: cardinal);
begin
  transfer^.dev_handle := dev_handle;
  transfer^.endpoint := endpoint;
  transfer^._type := LIBUSB_TRANSFER_TYPE_INTERRUPT;
  transfer^.timeout := timeout;
  transfer^.buffer := buffer;
  transfer^.length := length;
  transfer^.user_data := user_data;
  transfer^.callback := callback;
end;

procedure libusb_fill_iso_transfer(transfer: Plibusb_transfer; dev_handle: Plibusb_device_handle; endpoint: byte; buffer: pbyte; length: integer; num_iso_packets: integer; callback: Tlibusb_transfer_cb_fn; user_data: Pointer; timeout: cardinal);
begin
  transfer^.dev_handle := dev_handle;
  transfer^.endpoint := endpoint;
  transfer^._type := LIBUSB_TRANSFER_TYPE_ISOCHRONOUS;
  transfer^.timeout := timeout;
  transfer^.buffer := buffer;
  transfer^.length := length;
  transfer^.num_iso_packets := num_iso_packets;
  transfer^.user_data := user_data;
  transfer^.callback := callback;
end;

procedure libusb_set_iso_packet_lengths(transfer: Plibusb_transfer; length: cardinal);
var
  i: integer;
begin
  for i := 0 to transfer^.num_iso_packets - 1 do begin
    transfer^.iso_packet_desc[i].length := length;
  end;
end;

function libusb_get_iso_packet_buffer_simple(transfer: Plibusb_transfer; packet: cardinal): pbyte;
var
  _packet, i: integer;
  offset: Tsize_t = 0;
begin
  if packet > MaxInt then begin
    Exit(nil);
  end;

  _packet := integer(packet);

  if _packet >= transfer^.num_iso_packets then begin
    Exit(nil);
  end;

  for i := 0 to _packet - 1 do begin
    offset += transfer^.iso_packet_desc[i].length;
  end;

  Result := transfer^.buffer + offset;
end;

function libusb_get_descriptor(dev_handle: Plibusb_device_handle; desc_type: byte; desc_index: byte; data: pbyte; length: integer): integer;
begin
  Result := libusb_control_transfer(dev_handle, LIBUSB_ENDPOINT_IN, LIBUSB_REQUEST_GET_DESCRIPTOR,
    word((desc_type shl 8) or desc_index), 0, data, word(length), 1000);
end;

function libusb_get_string_descriptor(dev_handle: Plibusb_device_handle; desc_index: byte; langid: word; data: pbyte; length: integer): integer;
begin
  Result := libusb_control_transfer(dev_handle, LIBUSB_ENDPOINT_IN, LIBUSB_REQUEST_GET_DESCRIPTOR,
    word((LIBUSB_DT_STRING shl 8) or desc_index), langid, data, word(length), 1000);
end;



end.
