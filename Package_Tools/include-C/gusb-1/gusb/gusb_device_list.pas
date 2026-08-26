unit gusb_device_list;

interface

uses
  fp_gusb;

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

function g_usb_device_list_new(context:PGUsbContext):PGUsbDeviceList;cdecl;external libgusb;
{xxxxxG_DEPRECATED }
procedure g_usb_device_list_coldplug(self:PGUsbDeviceList);cdecl;external libgusb;
{xxxxxG_DEPRECATED_FOR(g_usb_context_get_devices) }
function g_usb_device_list_get_devices(self:PGUsbDeviceList):PGPtrArray;cdecl;external libgusb;
{xxxxxG_DEPRECATED_FOR(g_usb_context_find_by_bus_address) }
function g_usb_device_list_find_by_bus_address(self:PGUsbDeviceList; bus:Tguint8; address:Tguint8; error:PPGError):PGUsbDevice;cdecl;external libgusb;
{xxxxxG_DEPRECATED_FOR(g_usb_context_find_by_vid_pid) }
function g_usb_device_list_find_by_vid_pid(self:PGUsbDeviceList; vid:Tguint16; pid:Tguint16; error:PPGError):PGUsbDevice;cdecl;external libgusb;

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

type 
  TGUsbDeviceList = record
    parent_instance: TGObject;
  end;
  PGUsbDeviceList = ^TGUsbDeviceList;

  PGUsbDeviceListClass = type Pointer;

function g_usb_device_list_get_type: TGType; cdecl; external libgxxxxxxx;



end.
