unit gusb_version;

interface

uses
  fp_gusb;

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

function g_usb_version_string:Pgchar;cdecl;external libgusb;

// === Konventiert am: 26-8-26 19:42:06 ===


implementation



end.
