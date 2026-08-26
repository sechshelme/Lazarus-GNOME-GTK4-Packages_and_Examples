
unit gusb_device;
interface

{
  Automatically converted by H2Pas 1.0.0 from gusb_device.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gusb_device
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
PGAsyncResult  = ^GAsyncResult;
PGBytes  = ^GBytes;
PGCancellable  = ^GCancellable;
Pgchar  = ^gchar;
PGDateTime  = ^GDateTime;
PGError  = ^GError;
PGPtrArray  = ^GPtrArray;
Pgsize  = ^gsize;
Pguint8  = ^guint8;
PGUsbBosDescriptor  = ^GUsbBosDescriptor;
PGUsbDevice  = ^GUsbDevice;
PGUsbDeviceClaimInterfaceFlags  = ^GUsbDeviceClaimInterfaceFlags;
PGUsbDeviceClass  = ^GUsbDeviceClass;
PGUsbDeviceClassCode  = ^GUsbDeviceClassCode;
PGUsbDeviceDirection  = ^GUsbDeviceDirection;
PGUsbDeviceError  = ^GUsbDeviceError;
PGUsbDeviceLangid  = ^GUsbDeviceLangid;
PGUsbDeviceRecipient  = ^GUsbDeviceRecipient;
PGUsbDeviceRequestType  = ^GUsbDeviceRequestType;
PGUsbInterface  = ^GUsbInterface;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ -*- Mode: C; tab-width: 8; indent-tabs-mode: t; c-basic-offset: 8 -*-
 *
 * Copyright (C) 2010 Richard Hughes <richard@hughsie.com>
 * Copyright (C) 2011 Hans de Goede <hdegoede@redhat.com>
 *
 * SPDX-License-Identifier: LGPL-2.1+
  }
(** unsupported pragma#pragma once*)
{$include <gio/gio.h>}
{$include <gusb/gusb-bos-descriptor.h>}
{$include <gusb/gusb-interface.h>}
{$include <gusb/gusb-util.h>}
{$include <json-glib/json-glib.h>}

{ was #define dname def_expr }
function G_USB_TYPE_DEVICE : longint; { return type might be wrong }

{ was #define dname def_expr }
function G_USB_DEVICE_ERROR : longint; { return type might be wrong }

{G_DECLARE_DERIVABLE_TYPE(GUsbDevice, g_usb_device, G_USB, DEVICE, GObject) }
{*
 * GUsbDeviceDirection:
 *
 * The message direction.
 * }
{ IN  }
{ OUT  }
type
  PGUsbDeviceDirection = ^TGUsbDeviceDirection;
  TGUsbDeviceDirection =  Longint;
  Const
    G_USB_DEVICE_DIRECTION_DEVICE_TO_HOST = 0;
    G_USB_DEVICE_DIRECTION_HOST_TO_DEVICE = 1;
;
{*
 * GUsbDeviceRequestType:
 *
 * The message request type.
 * }
type
  PGUsbDeviceRequestType = ^TGUsbDeviceRequestType;
  TGUsbDeviceRequestType =  Longint;
  Const
    G_USB_DEVICE_REQUEST_TYPE_STANDARD = 0;
    G_USB_DEVICE_REQUEST_TYPE_CLASS = 1;
    G_USB_DEVICE_REQUEST_TYPE_VENDOR = 2;
    G_USB_DEVICE_REQUEST_TYPE_RESERVED = 3;
;
{*
 * GUsbDeviceRecipient:
 *
 * The message recipient.
 * }
type
  PGUsbDeviceRecipient = ^TGUsbDeviceRecipient;
  TGUsbDeviceRecipient =  Longint;
  Const
    G_USB_DEVICE_RECIPIENT_DEVICE = 0;
    G_USB_DEVICE_RECIPIENT_INTERFACE = 1;
    G_USB_DEVICE_RECIPIENT_ENDPOINT = 2;
    G_USB_DEVICE_RECIPIENT_OTHER = 3;
;
{*
 * GUsbDeviceError:
 * @G_USB_DEVICE_ERROR_INTERNAL:		Internal error
 * @G_USB_DEVICE_ERROR_IO:			IO error
 * @G_USB_DEVICE_ERROR_TIMED_OUT:		Operation timed out
 * @G_USB_DEVICE_ERROR_NOT_SUPPORTED:		Operation not supported
 * @G_USB_DEVICE_ERROR_NO_DEVICE:		No device found
 * @G_USB_DEVICE_ERROR_NOT_OPEN:		Device is not open
 * @G_USB_DEVICE_ERROR_ALREADY_OPEN:		Device is already open
 * @G_USB_DEVICE_ERROR_CANCELLED:		Operation was cancelled
 * @G_USB_DEVICE_ERROR_FAILED:			Operation failed
 * @G_USB_DEVICE_ERROR_PERMISSION_DENIED:	Permission denied
 * @G_USB_DEVICE_ERROR_BUSY:			Device was busy
 *
 * The error code.
 * }
{< private > }
type
  PGUsbDeviceError = ^TGUsbDeviceError;
  TGUsbDeviceError =  Longint;
  Const
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
;
{*
 * GUsbDeviceClaimInterfaceFlags:
 *
 * Flags for the g_usb_device_claim_interface and
 * g_usb_device_release_interface methods flags parameters.
 * }
type
  PGUsbDeviceClaimInterfaceFlags = ^TGUsbDeviceClaimInterfaceFlags;
  TGUsbDeviceClaimInterfaceFlags =  Longint;
  Const
    G_USB_DEVICE_CLAIM_INTERFACE_NONE = 0;
    G_USB_DEVICE_CLAIM_INTERFACE_BIND_KERNEL_DRIVER = 1 shl 0;
;
{*
 * GUsbDeviceClassCode:
 *
 * The USB device class.
 * }
type
  PGUsbDeviceClassCode = ^TGUsbDeviceClassCode;
  TGUsbDeviceClassCode =  Longint;
  Const
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
;
{*
 * GUsbDeviceLangid:
 *
 * The USB language ID.
 * }
type
  PGUsbDeviceLangid = ^TGUsbDeviceLangid;
  TGUsbDeviceLangid =  Longint;
  Const
    G_USB_DEVICE_LANGID_INVALID = $0000;
    G_USB_DEVICE_LANGID_ENGLISH_UNITED_STATES = $0409;
;
{< private > }
{
	 * If adding fields to this struct, remove corresponding
	 * amount of padding to avoid changing overall struct size
	  }
type
  PGUsbDeviceClass = ^TGUsbDeviceClass;
  TGUsbDeviceClass = record
      parent_class : TGObjectClass;
      _gusb_reserved : array[0..63] of Tgchar;
    end;


function g_usb_device_error_quark:TGQuark;cdecl;external;
(* Const before type ignored *)
function g_usb_device_get_platform_id(self:PGUsbDevice):Pgchar;cdecl;external;
function g_usb_device_is_emulated(self:PGUsbDevice):Tgboolean;cdecl;external;
function g_usb_device_get_created(self:PGUsbDevice):PGDateTime;cdecl;external;
function g_usb_device_get_parent(self:PGUsbDevice):PGUsbDevice;cdecl;external;
function g_usb_device_get_children(self:PGUsbDevice):PGPtrArray;cdecl;external;
function g_usb_device_get_bus(self:PGUsbDevice):Tguint8;cdecl;external;
function g_usb_device_get_address(self:PGUsbDevice):Tguint8;cdecl;external;
function g_usb_device_get_port_number(self:PGUsbDevice):Tguint8;cdecl;external;
function g_usb_device_get_vid(self:PGUsbDevice):Tguint16;cdecl;external;
function g_usb_device_get_pid(self:PGUsbDevice):Tguint16;cdecl;external;
function g_usb_device_get_release(self:PGUsbDevice):Tguint16;cdecl;external;
function g_usb_device_get_spec(self:PGUsbDevice):Tguint16;cdecl;external;
(* Const before type ignored *)
function g_usb_device_get_vid_as_str(self:PGUsbDevice):Pgchar;cdecl;external;
(* Const before type ignored *)
function g_usb_device_get_pid_as_str(self:PGUsbDevice):Pgchar;cdecl;external;
function g_usb_device_get_device_class(self:PGUsbDevice):Tguint8;cdecl;external;
function g_usb_device_get_device_subclass(self:PGUsbDevice):Tguint8;cdecl;external;
function g_usb_device_get_device_protocol(self:PGUsbDevice):Tguint8;cdecl;external;
(* Const before type ignored *)
procedure g_usb_device_add_tag(self:PGUsbDevice; tag:Pgchar);cdecl;external;
(* Const before type ignored *)
procedure g_usb_device_remove_tag(self:PGUsbDevice; tag:Pgchar);cdecl;external;
(* Const before type ignored *)
function g_usb_device_has_tag(self:PGUsbDevice; tag:Pgchar):Tgboolean;cdecl;external;
function g_usb_device_get_tags(self:PGUsbDevice):PGPtrArray;cdecl;external;
function g_usb_device_get_configuration_index(self:PGUsbDevice):Tguint8;cdecl;external;
function g_usb_device_get_manufacturer_index(self:PGUsbDevice):Tguint8;cdecl;external;
function g_usb_device_get_product_index(self:PGUsbDevice):Tguint8;cdecl;external;
function g_usb_device_get_serial_number_index(self:PGUsbDevice):Tguint8;cdecl;external;
function g_usb_device_get_custom_index(self:PGUsbDevice; class_id:Tguint8; subclass_id:Tguint8; protocol_id:Tguint8; error:PPGError):Tguint8;cdecl;external;
function g_usb_device_get_interface(self:PGUsbDevice; class_id:Tguint8; subclass_id:Tguint8; protocol_id:Tguint8; error:PPGError):PGUsbInterface;cdecl;external;
function g_usb_device_get_interfaces(self:PGUsbDevice; error:PPGError):PGPtrArray;cdecl;external;
function g_usb_device_get_events(self:PGUsbDevice):PGPtrArray;cdecl;external;
procedure g_usb_device_clear_events(self:PGUsbDevice);cdecl;external;
function g_usb_device_get_hid_descriptors(self:PGUsbDevice; error:PPGError):PGPtrArray;cdecl;external;
function g_usb_device_get_hid_descriptor_default(self:PGUsbDevice; error:PPGError):PGBytes;cdecl;external;
function g_usb_device_get_bos_descriptors(self:PGUsbDevice; error:PPGError):PGPtrArray;cdecl;external;
function g_usb_device_get_bos_descriptor(self:PGUsbDevice; capability:Tguint8; error:PPGError):PGUsbBosDescriptor;cdecl;external;
function g_usb_device_open(self:PGUsbDevice; error:PPGError):Tgboolean;cdecl;external;
function g_usb_device_close(self:PGUsbDevice; error:PPGError):Tgboolean;cdecl;external;
function g_usb_device_reset(self:PGUsbDevice; error:PPGError):Tgboolean;cdecl;external;
procedure g_usb_device_invalidate(self:PGUsbDevice);cdecl;external;
function g_usb_device_get_configuration(self:PGUsbDevice; error:PPGError):Tgint;cdecl;external;
function g_usb_device_set_configuration(self:PGUsbDevice; configuration:Tgint; error:PPGError):Tgboolean;cdecl;external;
function g_usb_device_claim_interface(self:PGUsbDevice; interface:Tgint; flags:TGUsbDeviceClaimInterfaceFlags; error:PPGError):Tgboolean;cdecl;external;
function g_usb_device_release_interface(self:PGUsbDevice; interface:Tgint; flags:TGUsbDeviceClaimInterfaceFlags; error:PPGError):Tgboolean;cdecl;external;
function g_usb_device_set_interface_alt(self:PGUsbDevice; interface:Tgint; alt:Tguint8; error:PPGError):Tgboolean;cdecl;external;
function g_usb_device_get_string_descriptor(self:PGUsbDevice; desc_index:Tguint8; error:PPGError):Pgchar;cdecl;external;
function g_usb_device_get_string_descriptor_bytes(self:PGUsbDevice; desc_index:Tguint8; langid:Tguint16; error:PPGError):PGBytes;cdecl;external;
function g_usb_device_get_string_descriptor_bytes_full(self:PGUsbDevice; desc_index:Tguint8; langid:Tguint16; length:Tgsize; error:PPGError):PGBytes;cdecl;external;
{ sync -- TODO: use GCancellable and GUsbSource  }
function g_usb_device_control_transfer(self:PGUsbDevice; direction:TGUsbDeviceDirection; request_type:TGUsbDeviceRequestType; recipient:TGUsbDeviceRecipient; request:Tguint8; 
           value:Tguint16; idx:Tguint16; data:Pguint8; length:Tgsize; actual_length:Pgsize; 
           timeout:Tguint; cancellable:PGCancellable; error:PPGError):Tgboolean;cdecl;external;
function g_usb_device_bulk_transfer(self:PGUsbDevice; endpoint:Tguint8; data:Pguint8; length:Tgsize; actual_length:Pgsize; 
           timeout:Tguint; cancellable:PGCancellable; error:PPGError):Tgboolean;cdecl;external;
function g_usb_device_interrupt_transfer(self:PGUsbDevice; endpoint:Tguint8; data:Pguint8; length:Tgsize; actual_length:Pgsize; 
           timeout:Tguint; cancellable:PGCancellable; error:PPGError):Tgboolean;cdecl;external;
{ async  }
procedure g_usb_device_control_transfer_async(self:PGUsbDevice; direction:TGUsbDeviceDirection; request_type:TGUsbDeviceRequestType; recipient:TGUsbDeviceRecipient; request:Tguint8; 
            value:Tguint16; idx:Tguint16; data:Pguint8; length:Tgsize; timeout:Tguint; 
            cancellable:PGCancellable; callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external;
function g_usb_device_control_transfer_finish(self:PGUsbDevice; res:PGAsyncResult; error:PPGError):Tgssize;cdecl;external;
procedure g_usb_device_bulk_transfer_async(self:PGUsbDevice; endpoint:Tguint8; data:Pguint8; length:Tgsize; timeout:Tguint; 
            cancellable:PGCancellable; callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external;
function g_usb_device_bulk_transfer_finish(self:PGUsbDevice; res:PGAsyncResult; error:PPGError):Tgssize;cdecl;external;
procedure g_usb_device_interrupt_transfer_async(self:PGUsbDevice; endpoint:Tguint8; data:Pguint8; length:Tgsize; timeout:Tguint; 
            cancellable:PGCancellable; callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external;
function g_usb_device_interrupt_transfer_finish(self:PGUsbDevice; res:PGAsyncResult; error:PPGError):Tgssize;cdecl;external;

implementation

{ was #define dname def_expr }
function G_USB_TYPE_DEVICE : longint; { return type might be wrong }
  begin
    G_USB_TYPE_DEVICE:=g_usb_device_get_type;
  end;

{ was #define dname def_expr }
function G_USB_DEVICE_ERROR : longint; { return type might be wrong }
  begin
    G_USB_DEVICE_ERROR:=g_usb_device_error_quark;
  end;


end.
