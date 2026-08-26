
unit gusb_util;
interface

{
  Automatically converted by H2Pas 1.0.0 from gusb_util.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gusb_util.h
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
 * Copyright (C) 2011 Hans de Goede <hdegoede@redhat.com>
 *
 * SPDX-License-Identifier: LGPL-2.1+
  }
(** unsupported pragma#pragma once*)
{$include <glib.h>}
(* Const before type ignored *)

function g_usb_strerror(error_code:Tgint):Pgchar;cdecl;external;

implementation


end.
