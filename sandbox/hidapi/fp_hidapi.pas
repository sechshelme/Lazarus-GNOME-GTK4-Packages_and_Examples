unit fp_hidapi;

interface

uses
  ctypes;

const
  {$IFDEF Linux}
  libhidapi_hidraw = 'libhidapi-hidraw';
  libhidapi_libusb = 'libhidapi-libusb';
  {$ENDIF}

  {$IFDEF Windows}
  libhidapi_hidraw = 'libhidapi.dll';
  libhidapi_libusb = libhidapi_hidraw;
  {$ENDIF}

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

type
  Tsize_t = SizeUInt;
  Tintptr_t = PtrUInt;

  {$IFDEF Linux}
  Pwchar_t = PUInt32;
  {$ENDIF}

  {$IFDEF Windows}
  Pwchar_t = PWideChar;
  {$ENDIF}


  // ===========

const
  HID_API_VERSION_MAJOR = 0;
  HID_API_VERSION_MINOR = 14;
  HID_API_VERSION_PATCH = 0;

function HID_API_MAKE_VERSION(mj, mn, p: longint): longint;
function HID_API_VERSION: longint;

const
  HID_API_MAX_REPORT_DESCRIPTOR_SIZE = 4096;

type
  Thid_api_version = record
    major: longint;
    minor: longint;
    patch: longint;
  end;
  Phid_api_version = ^Thid_api_version;

  Phid_device = type Pointer;

type
  Phid_bus_type = ^Thid_bus_type;
  Thid_bus_type = longint;

const
  HID_API_BUS_UNKNOWN = $00;
  HID_API_BUS_USB = $01;
  HID_API_BUS_BLUETOOTH = $02;
  HID_API_BUS_I2C = $03;
  HID_API_BUS_SPI = $04;

type
  Phid_device_info = ^Thid_device_info;

  Thid_device_info = record
    path: pchar;
    vendor_id: word;
    product_id: word;
    serial_number: Pwchar_t;
    release_number: word;
    manufacturer_string: Pwchar_t;
    product_string: Pwchar_t;
    usage_page: word;
    usage: word;
    interface_number: longint;
    next: Phid_device_info;
    bus_type: Thid_bus_type;
  end;

function hid_init: longint; cdecl; external libhidapi_hidraw;
function hid_exit: longint; cdecl; external libhidapi_hidraw;
function hid_enumerate(vendor_id: word; product_id: word): Phid_device_info; cdecl; external libhidapi_hidraw;
procedure hid_free_enumeration(devs: Phid_device_info); cdecl; external libhidapi_hidraw;
function hid_open(vendor_id: word; product_id: word; serial_number: Pwchar_t): Phid_device; cdecl; external libhidapi_hidraw;
function hid_open_path(path: pchar): Phid_device; cdecl; external libhidapi_hidraw;
function hid_write(dev: Phid_device; data: pbyte; length: Tsize_t): longint; cdecl; external libhidapi_hidraw;
function hid_read_timeout(dev: Phid_device; data: pbyte; length: Tsize_t; milliseconds: longint): longint; cdecl; external libhidapi_hidraw;
function hid_read(dev: Phid_device; data: pbyte; length: Tsize_t): longint; cdecl; external libhidapi_hidraw;
function hid_set_nonblocking(dev: Phid_device; nonblock: longint): longint; cdecl; external libhidapi_hidraw;
function hid_send_feature_report(dev: Phid_device; data: pbyte; length: Tsize_t): longint; cdecl; external libhidapi_hidraw;
function hid_get_feature_report(dev: Phid_device; data: pbyte; length: Tsize_t): longint; cdecl; external libhidapi_hidraw;
function hid_get_input_report(dev: Phid_device; data: pbyte; length: Tsize_t): longint; cdecl; external libhidapi_hidraw;
procedure hid_close(dev: Phid_device); cdecl; external libhidapi_hidraw;
function hid_get_manufacturer_string(dev: Phid_device; _string: Pwchar_t; maxlen: Tsize_t): longint; cdecl; external libhidapi_hidraw;
function hid_get_product_string(dev: Phid_device; _string: Pwchar_t; maxlen: Tsize_t): longint; cdecl; external libhidapi_hidraw;
function hid_get_serial_number_string(dev: Phid_device; _string: Pwchar_t; maxlen: Tsize_t): longint; cdecl; external libhidapi_hidraw;
function hid_get_device_info(dev: Phid_device): Phid_device_info; cdecl; external libhidapi_hidraw;
function hid_get_indexed_string(dev: Phid_device; string_index: longint; _string: Pwchar_t; maxlen: Tsize_t): longint; cdecl; external libhidapi_hidraw;
function hid_get_report_descriptor(dev: Phid_device; buf: pbyte; buf_size: Tsize_t): longint; cdecl; external libhidapi_hidraw;
function hid_error(dev: Phid_device): Pwchar_t; cdecl; external libhidapi_hidraw;
function hid_version: Phid_api_version; cdecl; external libhidapi_hidraw;
function hid_version_str: pchar; cdecl; external libhidapi_hidraw;

// === Konventiert am: 22-8-25 17:27:11 ===


implementation


function HID_API_MAKE_VERSION(mj, mn, p: longint): longint;
begin
  HID_API_MAKE_VERSION := ((mj shl 24) or (mn shl 8)) or p;
end;

function HID_API_VERSION: longint;
begin
  HID_API_VERSION := HID_API_MAKE_VERSION(HID_API_VERSION_MAJOR, HID_API_VERSION_MINOR, HID_API_VERSION_PATCH);
end;

end.
