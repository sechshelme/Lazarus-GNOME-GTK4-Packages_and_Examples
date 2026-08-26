
unit gusb_endpoint;
interface

{
  Automatically converted by H2Pas 1.0.0 from gusb_endpoint.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gusb_endpoint.h
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
PGUsbEndpoint  = ^GUsbEndpoint;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ -*- Mode: C; tab-width: 8; indent-tabs-mode: t; c-basic-offset: 8 -*-
 *
 * Copyright (C) 2020 Emmanuel Pacaud <emmanuel@gnome.org>
 *
 * SPDX-License-Identifier: LGPL-2.1+
  }
(** unsupported pragma#pragma once*)
{$include <gusb/gusb-device.h>}

{ was #define dname def_expr }
function G_USB_TYPE_ENDPOINT : longint; { return type might be wrong }

{G_DECLARE_FINAL_TYPE(GUsbEndpoint, g_usb_endpoint, G_USB, ENDPOINT, GObject) }
function g_usb_endpoint_get_kind(self:PGUsbEndpoint):Tguint8;cdecl;external;
function g_usb_endpoint_get_maximum_packet_size(self:PGUsbEndpoint):Tguint16;cdecl;external;
function g_usb_endpoint_get_polling_interval(self:PGUsbEndpoint):Tguint8;cdecl;external;
function g_usb_endpoint_get_refresh(self:PGUsbEndpoint):Tguint8;cdecl;external;
function g_usb_endpoint_get_synch_address(self:PGUsbEndpoint):Tguint8;cdecl;external;
function g_usb_endpoint_get_address(self:PGUsbEndpoint):Tguint8;cdecl;external;
function g_usb_endpoint_get_number(self:PGUsbEndpoint):Tguint8;cdecl;external;
function g_usb_endpoint_get_direction(self:PGUsbEndpoint):TGUsbDeviceDirection;cdecl;external;
function g_usb_endpoint_get_extra(self:PGUsbEndpoint):PGBytes;cdecl;external;

implementation

{ was #define dname def_expr }
function G_USB_TYPE_ENDPOINT : longint; { return type might be wrong }
  begin
    G_USB_TYPE_ENDPOINT:=g_usb_endpoint_get_type;
  end;


end.
