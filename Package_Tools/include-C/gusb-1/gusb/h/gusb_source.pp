
unit gusb_source;
interface

{
  Automatically converted by H2Pas 1.0.0 from gusb_source.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gusb_source.h
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
PGUsbSource  = ^GUsbSource;
PGUsbSourceError  = ^GUsbSourceError;
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
{$include <glib.h>}

{ was #define dname def_expr }
function G_USB_SOURCE_ERROR : longint; { return type might be wrong }

type
{*
 * GUsbSourceError:
 *
 * The error code.
 * }

  PGUsbSourceError = ^TGUsbSourceError;
  TGUsbSourceError =  Longint;
  Const
    G_USB_SOURCE_ERROR_INTERNAL = 0;
;
{xxxxxG_DEPRECATED_FOR(g_usb_context_error_quark) }

function g_usb_source_error_quark:TGQuark;cdecl;external;
{xxxxxG_DEPRECATED }
procedure g_usb_source_set_callback(self:PGUsbSource; func:TGSourceFunc; data:Tgpointer; notify:TGDestroyNotify);cdecl;external;

implementation

{ was #define dname def_expr }
function G_USB_SOURCE_ERROR : longint; { return type might be wrong }
  begin
    G_USB_SOURCE_ERROR:=g_usb_source_error_quark;
  end;


end.
