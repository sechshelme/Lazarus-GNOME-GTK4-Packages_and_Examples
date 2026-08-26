
unit gusb_version;
interface

{
  Automatically converted by H2Pas 1.0.0 from gusb_version.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gusb_version.h
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
Pgchar  = ^gchar;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ -*- Mode: C; tab-width: 8; indent-tabs-mode: t; c-basic-offset: 8 -*-
 *
 * Copyright (C) 2010 Richard Hughes <richard@hughsie.com>
 *
 * SPDX-License-Identifier: LGPL-2.1+
  }
{*
 * SECTION:gusb-version
 * @short_description: Obtains the version for the installed libgusb
 *
 * These compile time macros allow the user to enable parts of client code
 * depending on the version of libgusb installed.
  }
{$if !defined (__GUSB_INSIDE__) && !defined (GUSB_COMPILATION)}
{$error "Only <gusb.h> can be included directly."}
{$endif}
(** unsupported pragma#pragma once*)
{$include <glib.h>}
{*
 * G_USB_MAJOR_VERSION:
 *
 * The compile-time major version
  }

const
  G_USB_MAJOR_VERSION = 0;  
{*
 * G_USB_MINOR_VERSION:
 *
 * The compile-time minor version
  }
  G_USB_MINOR_VERSION = 4;  
{*
 * G_USB_MICRO_VERSION:
 *
 * The compile-time micro version
  }
  G_USB_MICRO_VERSION = 8;  
{*
#define G_USB_CHECK_VERSION(major,minor,micro)    \
    (G_USB_MAJOR_VERSION > (major) || \
     (G_USB_MAJOR_VERSION == (major) && G_USB_MINOR_VERSION > (minor)) || \
     (G_USB_MAJOR_VERSION == (major) && G_USB_MINOR_VERSION == (minor) && \
      G_USB_MICRO_VERSION >= (micro)))
  }
(* Const before type ignored *)

function g_usb_version_string:Pgchar;cdecl;external;

implementation


end.
