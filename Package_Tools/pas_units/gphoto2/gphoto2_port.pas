unit gphoto2_port;

interface

uses
  fp_glib2, fp_gphoto2, gphoto2_port_info_list;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PGPPortSerialParity = ^TGPPortSerialParity;
  TGPPortSerialParity = longint;

const
  GP_PORT_SERIAL_PARITY_OFF = 0;
  GP_PORT_SERIAL_PARITY_EVEN = 1;
  GP_PORT_SERIAL_PARITY_ODD = 2;

const
  GP_PORT_MAX_BUF_LEN = 4096;

type
  TGPPortSettingsSerial = record
    port: array[0..127] of char;
    speed: longint;
    bits: longint;
    parity: TGPPortSerialParity;
    stopbits: longint;
  end;
  PGPPortSettingsSerial = ^TGPPortSettingsSerial;

  TGPPortSettingsUSB = record
    inep: longint;
    outep: longint;
    intep: longint;
    config: longint;
    iface: longint;
    altsetting: longint;
    maxpacketsize: longint;
    port: array[0..63] of char;
  end;
  PGPPortSettingsUSB = ^TGPPortSettingsUSB;

  TGPPortSettingsUsbDiskDirect = record
    path: array[0..127] of char;
  end;
  PGPPortSettingsUsbDiskDirect = ^TGPPortSettingsUsbDiskDirect;

  TGPPortSettingsUsbScsi = record
    path: array[0..127] of char;
  end;
  PGPPortSettingsUsbScsi = ^TGPPortSettingsUsbScsi;

  TGPPortSettings = record
    case longint of
      0: (serial: TGPPortSettingsSerial);
      1: (usb: TGPPortSettingsUSB);
      2: (usbdiskdirect: TGPPortSettingsUsbDiskDirect);
      3: (usbscsi: TGPPortSettingsUsbScsi);
  end;
  PGPPortSettings = ^TGPPortSettings;

const
  GP_PORT_USB_ENDPOINT_IN = 0;
  GP_PORT_USB_ENDPOINT_OUT = 1;
  GP_PORT_USB_ENDPOINT_INT = 2;

type
  PGPPortPrivateLibrary= type Pointer;
  PGPPortPrivateCore   = type Pointer;

  TGPPort = record
    _type: TGPPortType;
    settings: TGPPortSettings;
    settings_pending: TGPPortSettings;
    timeout: longint;
    pl: PGPPortPrivateLibrary;
    pc: PGPPortPrivateCore;
  end;
  PGPPort = ^TGPPort;
  PPGPPort = ^PGPPort;

function gp_port_new(port: PPGPPort): longint; cdecl; external libgphoto2;
function gp_port_free(port: PGPPort): longint; cdecl; external libgphoto2;
function gp_port_set_info(port: PGPPort; info: PGPPortInfo): longint; cdecl; external libgphoto2;
function gp_port_get_info(port: PGPPort; info: PPGPPortInfo): longint; cdecl; external libgphoto2;
function gp_port_open(port: PGPPort): longint; cdecl; external libgphoto2;
function gp_port_close(port: PGPPort): longint; cdecl; external libgphoto2;
function gp_port_reset(port: PGPPort): longint; cdecl; external libgphoto2;
function gp_port_write(port: PGPPort; data: pchar; size: longint): longint; cdecl; external libgphoto2;
function gp_port_read(port: PGPPort; data: pchar; size: longint): longint; cdecl; external libgphoto2;
function gp_port_check_int(port: PGPPort; data: pchar; size: longint): longint; cdecl; external libgphoto2;
function gp_port_check_int_fast(port: PGPPort; data: pchar; size: longint): longint; cdecl; external libgphoto2;
function gp_port_get_timeout(port: PGPPort; timeout: Plongint): longint; cdecl; external libgphoto2;
function gp_port_set_timeout(port: PGPPort; timeout: longint): longint; cdecl; external libgphoto2;
function gp_port_set_settings(port: PGPPort; settings: TGPPortSettings): longint; cdecl; external libgphoto2;
function gp_port_get_settings(port: PGPPort; settings: PGPPortSettings): longint; cdecl; external libgphoto2;

type
  PGPPin = ^TGPPin;
  TGPPin = longint;

const
  GP_PIN_RTS = 0;
  GP_PIN_DTR = 1;
  GP_PIN_CTS = 2;
  GP_PIN_DSR = 3;
  GP_PIN_CD = 4;
  GP_PIN_RING = 5;

type
  PGPLevel = ^TGPLevel;
  TGPLevel = longint;

const
  GP_LEVEL_LOW = 0;
  GP_LEVEL_HIGH = 1;

function gp_port_get_pin(port: PGPPort; pin: TGPPin; level: PGPLevel): longint; cdecl; external libgphoto2;
function gp_port_set_pin(port: PGPPort; pin: TGPPin; level: TGPLevel): longint; cdecl; external libgphoto2;
function gp_port_send_break(port: PGPPort; duration: longint): longint; cdecl; external libgphoto2;
function gp_port_flush(port: PGPPort; direction: longint): longint; cdecl; external libgphoto2;
function gp_port_usb_find_device(port: PGPPort; idvendor: longint; idproduct: longint): longint; cdecl; external libgphoto2;
function gp_port_usb_find_device_by_class(port: PGPPort; mainclass: longint; subclass: longint; protocol: longint): longint; cdecl; external libgphoto2;
function gp_port_usb_clear_halt(port: PGPPort; ep: longint): longint; cdecl; external libgphoto2;
function gp_port_usb_msg_write(port: PGPPort; request: longint; value: longint; index: longint; bytes: pchar;
  size: longint): longint; cdecl; external libgphoto2;
function gp_port_usb_msg_read(port: PGPPort; request: longint; value: longint; index: longint; bytes: pchar;
  size: longint): longint; cdecl; external libgphoto2;
function gp_port_usb_msg_interface_write(port: PGPPort; request: longint; value: longint; index: longint; bytes: pchar;
  size: longint): longint; cdecl; external libgphoto2;
function gp_port_usb_msg_interface_read(port: PGPPort; request: longint; value: longint; index: longint; bytes: pchar;
  size: longint): longint; cdecl; external libgphoto2;
function gp_port_usb_msg_class_write(port: PGPPort; request: longint; value: longint; index: longint; bytes: pchar;
  size: longint): longint; cdecl; external libgphoto2;
function gp_port_usb_msg_class_read(port: PGPPort; request: longint; value: longint; index: longint; bytes: pchar;
  size: longint): longint; cdecl; external libgphoto2;
function gp_port_seek(port: PGPPort; offset: longint; whence: longint): longint; cdecl; external libgphoto2;
function gp_port_send_scsi_cmd(port: PGPPort; to_dev: longint; cmd: pchar; cmd_size: longint; sense: pchar;
  sense_size: longint; data: pchar; data_size: longint): longint; cdecl; external libgphoto2;
function gp_port_set_error(port: PGPPort; format: pchar): longint; cdecl; varargs; external libgphoto2;
function gp_port_get_error(port: PGPPort): pchar; cdecl; external libgphoto2;

type
  Pgp_port = ^Tgp_port;
  Tgp_port = TGPPort;

  Pgp_port_settings = ^Tgp_port_settings;
  Tgp_port_settings = TGPPortSettings;

const
  PIN_CTS = GP_PIN_CTS;

  // === Konventiert am: 17-11-25 15:47:00 ===


implementation



end.
