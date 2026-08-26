
unit gusb_interface;
interface

{
  Automatically converted by H2Pas 1.0.0 from gusb_interface.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gusb_interface.h
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
PGPtrArray  = ^GPtrArray;
PGUsbInterface  = ^GUsbInterface;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ -*- Mode: C; tab-width: 8; indent-tabs-mode: t; c-basic-offset: 8 -*-
 *
 * Copyright (C) 2015 Richard Hughes <richard@hughsie.com>
 * Copyright (C) 2020 Emmanuel Pacaud <emmanuel@gnome.org>
 *
 * SPDX-License-Identifier: LGPL-2.1+
  }
(** unsupported pragma#pragma once*)
{$include <glib-object.h>}

{ was #define dname def_expr }
function G_USB_TYPE_INTERFACE : longint; { return type might be wrong }

{G_DECLARE_FINAL_TYPE(GUsbInterface, g_usb_interface, G_USB, INTERFACE, GObject) }
function g_usb_interface_get_length(self:PGUsbInterface):Tguint8;cdecl;external;
function g_usb_interface_get_kind(self:PGUsbInterface):Tguint8;cdecl;external;
function g_usb_interface_get_number(self:PGUsbInterface):Tguint8;cdecl;external;
function g_usb_interface_get_alternate(self:PGUsbInterface):Tguint8;cdecl;external;
function g_usb_interface_get_class(self:PGUsbInterface):Tguint8;cdecl;external;
function g_usb_interface_get_subclass(self:PGUsbInterface):Tguint8;cdecl;external;
function g_usb_interface_get_protocol(self:PGUsbInterface):Tguint8;cdecl;external;
function g_usb_interface_get_index(self:PGUsbInterface):Tguint8;cdecl;external;
function g_usb_interface_get_extra(self:PGUsbInterface):PGBytes;cdecl;external;
function g_usb_interface_get_endpoints(self:PGUsbInterface):PGPtrArray;cdecl;external;

implementation

{ was #define dname def_expr }
function G_USB_TYPE_INTERFACE : longint; { return type might be wrong }
  begin
    G_USB_TYPE_INTERFACE:=g_usb_interface_get_type;
  end;


end.
