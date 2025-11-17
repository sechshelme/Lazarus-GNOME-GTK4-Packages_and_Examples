
unit gphoto2_port;
interface

{
  Automatically converted by H2Pas 1.0.0 from gphoto2_port.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gphoto2_port.h
}

{ Pointers to basic pascal types, inserted by h2pas conversion program.}
Type
  PLongint  = ^Longint;
  PSmallInt = ^SmallInt;
  PByte     = ^Byte;
  PWord     = ^Word;
  PDWord    = ^DWord;
  PDouble   = ^Double;

Type
Pchar  = ^char;
Pgp_port  = ^gp_port;
Pgp_port_settings  = ^gp_port_settings;
PGPLevel  = ^GPLevel;
PGPPin  = ^GPPin;
PGPPort  = ^GPPort;
PGPPortInfo  = ^GPPortInfo;
PGPPortPrivateCore  = ^GPPortPrivateCore;
PGPPortPrivateLibrary  = ^GPPortPrivateLibrary;
PGPPortSerialParity  = ^GPPortSerialParity;
PGPPortSettings  = ^GPPortSettings;
PGPPortSettingsSerial  = ^GPPortSettingsSerial;
PGPPortSettingsUSB  = ^GPPortSettingsUSB;
PGPPortSettingsUsbDiskDirect  = ^GPPortSettingsUsbDiskDirect;
PGPPortSettingsUsbScsi  = ^GPPortSettingsUsbScsi;
Plongint  = ^longint;
Pxxxxxxx  = ^xxxxxxx;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{* \file
 *
 * \author Copyright 2001 Lutz Mueller <lutz@users.sf.net>
 *
 * \par License
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2 of the License, or (at your option) any later version.
 *
 * \par
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * \par
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library; if not, write to the
 * Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor,
 * Boston, MA  02110-1301  USA
  }
{$ifndef LIBGPHOTO2_GPHOTO2_PORT_H}
{$define LIBGPHOTO2_GPHOTO2_PORT_H}
{$include <gphoto2/gphoto2-port-info-list.h>}
{ For portability  }
{$include <gphoto2/gphoto2-port-portability.h>}
{ C++ extern C conditionnal removed }
{ __cplusplus  }
{$ifndef TRUE}

const
  TRUE = 0=0;  
{$endif}
{$ifndef FALSE}

const
  FALSE = 1=0;  
{$endif}
{*
 * \brief Serial parity
 *
 * Parity of the serial port.
  }
{*< \brief Parity is off (disabled)  }
{*< \brief Parity is even.  }
{*< \brief Parity is odd.  }
type
  PGPPortSerialParity = ^TGPPortSerialParity;
  TGPPortSerialParity =  Longint;
  Const
    GP_PORT_SERIAL_PARITY_OFF = 0;
    GP_PORT_SERIAL_PARITY_EVEN = 1;
    GP_PORT_SERIAL_PARITY_ODD = 2;
;
{* \brief Maximum length of receive buffer  }
  GP_PORT_MAX_BUF_LEN = 4096;  
{*
 * \brief Port settings for serial ports.
  }
{*< The portname (/dev/ttyX) }
{*< The baudrate of the device.  }
{*< How many bits data.  }
{*< parity data, see GP_PORT_SERIAL_PARITY_
				  defines  }
{*< How many stop bits are used.  }
type
  PGPPortSettingsSerial = ^TGPPortSettingsSerial;
  TGPPortSettingsSerial = record
      port : array[0..127] of char;
      speed : longint;
      bits : longint;
      parity : TGPPortSerialParity;
      stopbits : longint;
    end;
{*
 * \brief Port settings for USB ports.
  }
{*< \brief Bulk IN endpoint used.  }
{*< \brief Bulk OUT endpoint used.  }
{*< \brief Interrupt endpoint used.  }
{*< \brief USB bConfigurationValue used.  }
{*< \brief USB Interface number used.  }
{*< \brief USB Alternative Setting used.  }
{*< \brief Maximum USB packetsize of the IN endpoint. (r/o)  }
{ must be last to avoid binary incompatibility.
	 * luckily we just need to make sure this struct does not
	 * get larger than _GPPortSettingsSerial.  }
{*< \brief USB Portname. Specific to lowlevel USB.  }

  PGPPortSettingsUSB = ^TGPPortSettingsUSB;
  TGPPortSettingsUSB = record
      inep : longint;
      outep : longint;
      intep : longint;
      config : longint;
      interface : longint;
      altsetting : longint;
      maxpacketsize : longint;
      port : array[0..63] of char;
    end;
{*
 * \brief Port settings for USB mass storage direct IO ports.
  }
{*< /brief The ports device node path (/dev/sdX) }

  PGPPortSettingsUsbDiskDirect = ^TGPPortSettingsUsbDiskDirect;
  TGPPortSettingsUsbDiskDirect = record
      path : array[0..127] of char;
    end;
{*
 * \brief Port settings for USB Mass Storage raw SCSI ports.
  }
{*< /brief The ports device node path (/dev/sg#) }

  PGPPortSettingsUsbScsi = ^TGPPortSettingsUsbScsi;
  TGPPortSettingsUsbScsi = record
      path : array[0..127] of char;
    end;
{*
 * \brief Union of port settings.
 *
 * This contains a shared union of possible settings for ports needing
 * them.
  }
{*< \brief Serial specific settings  }
{*< \brief USB specific settings  }
{*< \brief usb disk direct port specific settings  }
{*< \brief usb scsi port specific settings  }

  PGPPortSettings = ^TGPPortSettings;
  TGPPortSettings = record
      case longint of
        0 : ( serial : TGPPortSettingsSerial );
        1 : ( usb : TGPPortSettingsUSB );
        2 : ( usbdiskdirect : TGPPortSettingsUsbDiskDirect );
        3 : ( usbscsi : TGPPortSettingsUsbScsi );
      end;
{*< \brief USB bulk IN ep  }
{*< \brief USB bulk OUT ep  }
{*< \brief USB Interrupt ep  }
  Txxxxxxx =  Longint;
  Const
    GP_PORT_USB_ENDPOINT_IN = 0;
    GP_PORT_USB_ENDPOINT_OUT = 1;
    GP_PORT_USB_ENDPOINT_INT = 2;

type
{*
 * \brief The GPhoto port structure.
 *
 * This structure tracks the physical connection of the device.
 * It can correspond the various methods of lowlevel access, serial
 * usb and others and abstracts them as much as possible.
 *
 * Frontends should consider this structure opaque and only use accessor
 * functions.
 *
 * Camera drivers should only access the type and pl members directly,
 * and use accessor functions for the rest.
  }
{ For your convenience  }
{*< \brief Actual type of this port  }
{*< \brief Current port settings.  }
{*< \brief Settings to be committed.  }
{*< \brief Port timeout in milliseconds.  }
{*< \brief Camera driver private data pointer.  }
{*< \brief Port library private data pointer.  }

  PGPPort = ^TGPPort;
  TGPPort = record
      _type : TGPPortType;
      settings : TGPPortSettings;
      settings_pending : TGPPortSettings;
      timeout : longint;
      pl : PGPPortPrivateLibrary;
      pc : PGPPortPrivateCore;
    end;

function gp_port_new(port:PPGPPort):longint;cdecl;external;
function gp_port_free(port:PGPPort):longint;cdecl;external;
function gp_port_set_info(port:PGPPort; info:TGPPortInfo):longint;cdecl;external;
function gp_port_get_info(port:PGPPort; info:PGPPortInfo):longint;cdecl;external;
function gp_port_open(port:PGPPort):longint;cdecl;external;
function gp_port_close(port:PGPPort):longint;cdecl;external;
function gp_port_reset(port:PGPPort):longint;cdecl;external;
(* Const before type ignored *)
function gp_port_write(port:PGPPort; data:Pchar; size:longint):longint;cdecl;external;
function gp_port_read(port:PGPPort; data:Pchar; size:longint):longint;cdecl;external;
function gp_port_check_int(port:PGPPort; data:Pchar; size:longint):longint;cdecl;external;
function gp_port_check_int_fast(port:PGPPort; data:Pchar; size:longint):longint;cdecl;external;
function gp_port_get_timeout(port:PGPPort; timeout:Plongint):longint;cdecl;external;
function gp_port_set_timeout(port:PGPPort; timeout:longint):longint;cdecl;external;
function gp_port_set_settings(port:PGPPort; settings:TGPPortSettings):longint;cdecl;external;
function gp_port_get_settings(port:PGPPort; settings:PGPPortSettings):longint;cdecl;external;
{*
 * \brief Serial pins.
 *
 * A number of serial pins to trigger and pull. This is necessary
 * for some devices that have more than just the regular 3 or 4 wires.
  }
{*< \brief RTS line  }
{*< \brief DTR line  }
{*< \brief CTS line  }
{*< \brief DSR line  }
{*< \brief Carrier Detect line  }
{*< \brief RING (Modem) line  }
type
  PGPPin = ^TGPPin;
  TGPPin =  Longint;
  Const
    GP_PIN_RTS = 0;
    GP_PIN_DTR = 1;
    GP_PIN_CTS = 2;
    GP_PIN_DSR = 3;
    GP_PIN_CD = 4;
    GP_PIN_RING = 5;
;
{*
 * \brief Level to pull specific lines.
 *
 * The level on which to pull some of the serial lines.
  }
{*< \brief Pull to low (0V)  }
{*< \brief Pull to high (nV)  }
type
  PGPLevel = ^TGPLevel;
  TGPLevel =  Longint;
  Const
    GP_LEVEL_LOW = 0;
    GP_LEVEL_HIGH = 1;
;

function gp_port_get_pin(port:PGPPort; pin:TGPPin; level:PGPLevel):longint;cdecl;external;
function gp_port_set_pin(port:PGPPort; pin:TGPPin; level:TGPLevel):longint;cdecl;external;
function gp_port_send_break(port:PGPPort; duration:longint):longint;cdecl;external;
function gp_port_flush(port:PGPPort; direction:longint):longint;cdecl;external;
function gp_port_usb_find_device(port:PGPPort; idvendor:longint; idproduct:longint):longint;cdecl;external;
function gp_port_usb_find_device_by_class(port:PGPPort; mainclass:longint; subclass:longint; protocol:longint):longint;cdecl;external;
function gp_port_usb_clear_halt(port:PGPPort; ep:longint):longint;cdecl;external;
function gp_port_usb_msg_write(port:PGPPort; request:longint; value:longint; index:longint; bytes:Pchar; 
           size:longint):longint;cdecl;external;
function gp_port_usb_msg_read(port:PGPPort; request:longint; value:longint; index:longint; bytes:Pchar; 
           size:longint):longint;cdecl;external;
function gp_port_usb_msg_interface_write(port:PGPPort; request:longint; value:longint; index:longint; bytes:Pchar; 
           size:longint):longint;cdecl;external;
function gp_port_usb_msg_interface_read(port:PGPPort; request:longint; value:longint; index:longint; bytes:Pchar; 
           size:longint):longint;cdecl;external;
function gp_port_usb_msg_class_write(port:PGPPort; request:longint; value:longint; index:longint; bytes:Pchar; 
           size:longint):longint;cdecl;external;
function gp_port_usb_msg_class_read(port:PGPPort; request:longint; value:longint; index:longint; bytes:Pchar; 
           size:longint):longint;cdecl;external;
function gp_port_seek(port:PGPPort; offset:longint; whence:longint):longint;cdecl;external;
function gp_port_send_scsi_cmd(port:PGPPort; to_dev:longint; cmd:Pchar; cmd_size:longint; sense:Pchar; 
           sense_size:longint; data:Pchar; data_size:longint):longint;cdecl;external;
{ Error reporting  }
(* Const before type ignored *)
function gp_port_set_error(port:PGPPort; format:Pchar; args:array of const):longint;cdecl;external;
function gp_port_set_error(port:PGPPort; format:Pchar):longint;cdecl;external;
(* Const before type ignored *)
function gp_port_get_error(port:PGPPort):Pchar;cdecl;external;
{ DEPRECATED  }
{* \deprecated internal typedef  }
type
  Pgp_port = ^Tgp_port;
  Tgp_port = TGPPort;
{* \deprecated internal typedef  }

  Pgp_port_settings = ^Tgp_port_settings;
  Tgp_port_settings = TGPPortSettings;
{* \deprecated internal define  }

const
  PIN_CTS = GP_PIN_CTS;  
{ C++ end of extern C conditionnal removed }
{ __cplusplus  }
{$endif}
{ !defined(LIBGPHOTO2_GPHOTO2_PORT_H)  }

implementation


end.
