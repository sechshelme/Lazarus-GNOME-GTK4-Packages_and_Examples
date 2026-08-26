unit gusb_device_event;

interface

uses
  fp_gusb;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ -*- Mode: C; tab-width: 8; indent-tabs-mode: t; c-basic-offset: 8 -*-
 *
 * Copyright (C) 2022 Richard Hughes <richard@hughsie.com>
 *
 * SPDX-License-Identifier: LGPL-2.1+
  }
(** unsupported pragma#pragma once*)
{$include <gio/gio.h>}

{G_DECLARE_FINAL_TYPE(GUsbDeviceEvent, g_usb_device_event, G_USB, DEVICE_EVENT, GObject) }
function g_usb_device_event_get_id(self:PGUsbDeviceEvent):Pgchar;cdecl;external libgusb;
function g_usb_device_event_get_bytes(self:PGUsbDeviceEvent):PGBytes;cdecl;external libgusb;
function g_usb_device_event_get_status(self:PGUsbDeviceEvent):Tgint;cdecl;external libgusb;
function g_usb_device_event_get_rc(self:PGUsbDeviceEvent):Tgint;cdecl;external libgusb;
procedure g_usb_device_event_set_bytes(self:PGUsbDeviceEvent; bytes:PGBytes);cdecl;external libgusb;

// === Konventiert am: 26-8-26 19:42:40 ===

function G_USB_TYPE_DEVICE_EVENT: TGType;
function G_USB_DEVICE_EVENT(obj: Pointer): PGUsbDeviceEvent;
function G_USB_IS_DEVICE_EVENT(obj: Pointer): Tgboolean;

implementation

function G_USB_TYPE_DEVICE_EVENT: TGType;
begin
  Result := g_usb_device_event_get_type;
end;

function G_USB_DEVICE_EVENT(obj: Pointer): PGUsbDeviceEvent;
begin
  Result := PGUsbDeviceEvent(g_type_check_instance_cast(obj, G_USB_TYPE_DEVICE_EVENT));
end;

function G_USB_IS_DEVICE_EVENT(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, G_USB_TYPE_DEVICE_EVENT);
end;

type 
  PGUsbDeviceEvent = type Pointer;

  TGUsbDeviceEventClass = record
    parent_class: TGObjectClass;
  end;
  PGUsbDeviceEventClass = ^TGUsbDeviceEventClass;

function g_usb_device_event_get_type: TGType; cdecl; external libgxxxxxxx;



end.
