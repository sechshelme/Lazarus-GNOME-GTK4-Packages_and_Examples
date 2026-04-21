
unit fwupd_version;
interface

{
  Automatically converted by H2Pas 1.0.0 from fwupd_version.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    fwupd_version.h
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


{
 * Copyright (C) 2015 Richard Hughes <richard@hughsie.com>
 *
 * SPDX-License-Identifier: LGPL-2.1+
  }
(** unsupported pragma#pragma once*)
{$include <glib.h>}
{$if !defined(__FWUPD_H_INSIDE__) && !defined(FWUPD_COMPILATION)}
{$error "Only <fwupd.h> can be included directly."}
{$endif}
{ clang-format off  }
{*
 * FWUPD_MAJOR_VERSION:
 *
 * The compile-time major version
  }

const
  FWUPD_MAJOR_VERSION = 1;  
{*
 * FWUPD_MINOR_VERSION:
 *
 * The compile-time minor version
  }
  FWUPD_MINOR_VERSION = 9;  
{*
 * FWUPD_MICRO_VERSION:
 *
 * The compile-time micro version
  }
  FWUPD_MICRO_VERSION = 34;  
{ clang-format on  }
{*
#define FWUPD_CHECK_VERSION(major, minor, micro)                                                   \
	(FWUPD_MAJOR_VERSION > major ||                                                            \
	 (FWUPD_MAJOR_VERSION == major && FWUPD_MINOR_VERSION > minor) ||                          \
	 (FWUPD_MAJOR_VERSION == major && FWUPD_MINOR_VERSION == minor &&                          \
	  FWUPD_MICRO_VERSION >= micro))
  }
(* Const before type ignored *)

function fwupd_version_string:Pgchar;cdecl;external;

implementation


end.
