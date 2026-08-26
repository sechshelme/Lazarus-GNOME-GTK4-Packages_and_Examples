
unit gusb_device_event;
interface

{
  Automatically converted by H2Pas 1.0.0 from gusb_device_event.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gusb_device_event.h
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
PGBytes  = ^GBytes;
Pgchar  = ^gchar;
PGUsbDeviceEvent  = ^GUsbDeviceEvent;
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

{ was #define dname def_expr }
function G_USB_TYPE_DEVICE_EVENT : longint; { return type might be wrong }

{G_DECLARE_FINAL_TYPE(GUsbDeviceEvent, g_usb_device_event, G_USB, DEVICE_EVENT, GObject) }
(* Const before type ignored *)
function g_usb_device_event_get_id(self:PGUsbDeviceEvent):Pgchar;cdecl;external;
function g_usb_device_event_get_bytes(self:PGUsbDeviceEvent):PGBytes;cdecl;external;
function g_usb_device_event_get_status(self:PGUsbDeviceEvent):Tgint;cdecl;external;
function g_usb_device_event_get_rc(self:PGUsbDeviceEvent):Tgint;cdecl;external;
procedure g_usb_device_event_set_bytes(self:PGUsbDeviceEvent; bytes:PGBytes);cdecl;external;

implementation

{ was #define dname def_expr }
function G_USB_TYPE_DEVICE_EVENT : longint; { return type might be wrong }
  begin
    G_USB_TYPE_DEVICE_EVENT:=g_usb_device_event_get_type;
  end;


end.
