
unit gusb_bos_descriptor;
interface

{
  Automatically converted by H2Pas 1.0.0 from gusb_bos_descriptor.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gusb_bos_descriptor
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
PGUsbBosDescriptor  = ^GUsbBosDescriptor;
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
{$include <glib-object.h>}

{ was #define dname def_expr }
function G_USB_TYPE_BOS_DESCRIPTOR : longint; { return type might be wrong }

{G_DECLARE_FINAL_TYPE(GUsbBosDescriptor, g_usb_bos_descriptor, G_USB, BOS_DESCRIPTOR, GObject) }
function g_usb_bos_descriptor_get_capability(self:PGUsbBosDescriptor):Tguint8;cdecl;external;
function g_usb_bos_descriptor_get_extra(self:PGUsbBosDescriptor):PGBytes;cdecl;external;

implementation

{ was #define dname def_expr }
function G_USB_TYPE_BOS_DESCRIPTOR : longint; { return type might be wrong }
  begin
    G_USB_TYPE_BOS_DESCRIPTOR:=g_usb_bos_descriptor_get_type;
  end;


end.
