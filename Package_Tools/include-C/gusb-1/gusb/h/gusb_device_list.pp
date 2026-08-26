
unit gusb_device_list;
interface

{
  Automatically converted by H2Pas 1.0.0 from gusb_device_list.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gusb_device_list.h
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
PGError  = ^GError;
PGPtrArray  = ^GPtrArray;
PGUsbContext  = ^GUsbContext;
PGUsbDevice  = ^GUsbDevice;
PGUsbDeviceList  = ^GUsbDeviceList;
PGUsbDeviceListClass  = ^GUsbDeviceListClass;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ -*- Mode: C; tab-width: 8; indent-tabs-mode: t; c-basic-offset: 8 -*-
 *
 * Copyright (C) 2011 Hans de Goede <hdegoede@redhat.com>
 * Copyright (C) 2011 Richard Hughes <richard@hughsie.com>
 *
 * SPDX-License-Identifier: LGPL-2.1+
  }
(** unsupported pragma#pragma once*)
{$include <gusb/gusb-context.h>}

{ was #define dname def_expr }
function G_USB_TYPE_DEVICE_LIST : longint; { return type might be wrong }

{G_DECLARE_DERIVABLE_TYPE(GUsbDeviceList, g_usb_device_list, G_USB, DEVICE_LIST, GObject) }
{ Signals  }
{< private > }
{
	 * If adding fields to this struct, remove corresponding
	 * amount of padding to avoid changing overall struct size
	  }
type
  PGUsbDeviceListClass = ^TGUsbDeviceListClass;
  TGUsbDeviceListClass = record
      parent_class : TGObjectClass;
      device_added : procedure (self:PGUsbDeviceList; device:PGUsbDevice);cdecl;
      device_removed : procedure (self:PGUsbDeviceList; device:PGUsbDevice);cdecl;
      _gusb_reserved : array[0..63] of Tgchar;
    end;

{xxxxxG_DEPRECATED_FOR(g_usb_context_new) }

function g_usb_device_list_new(context:PGUsbContext):PGUsbDeviceList;cdecl;external;
{xxxxxG_DEPRECATED }
procedure g_usb_device_list_coldplug(self:PGUsbDeviceList);cdecl;external;
{xxxxxG_DEPRECATED_FOR(g_usb_context_get_devices) }
function g_usb_device_list_get_devices(self:PGUsbDeviceList):PGPtrArray;cdecl;external;
{xxxxxG_DEPRECATED_FOR(g_usb_context_find_by_bus_address) }
function g_usb_device_list_find_by_bus_address(self:PGUsbDeviceList; bus:Tguint8; address:Tguint8; error:PPGError):PGUsbDevice;cdecl;external;
{xxxxxG_DEPRECATED_FOR(g_usb_context_find_by_vid_pid) }
function g_usb_device_list_find_by_vid_pid(self:PGUsbDeviceList; vid:Tguint16; pid:Tguint16; error:PPGError):PGUsbDevice;cdecl;external;

implementation

{ was #define dname def_expr }
function G_USB_TYPE_DEVICE_LIST : longint; { return type might be wrong }
  begin
    G_USB_TYPE_DEVICE_LIST:=g_usb_device_list_get_type;
  end;


end.
