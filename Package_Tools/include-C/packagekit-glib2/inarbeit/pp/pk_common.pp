
unit pk_common;
interface

{
  Automatically converted by H2Pas 1.0.0 from pk_common.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    pk_common.h
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
PGDate  = ^GDate;
PGDateTime  = ^GDateTime;
PGPtrArray  = ^GPtrArray;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ -*- Mode: C; tab-width: 8; indent-tabs-mode: t; c-basic-offset: 8 -*-
 *
 * Copyright (C) 2007-2008 Richard Hughes <richard@hughsie.com>
 *
 * Licensed under the GNU Lesser General Public License Version 2.1
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301 USA
  }
{$if !defined (__PACKAGEKIT_H_INSIDE__) && !defined (PK_COMPILATION)}
{$error "Only <packagekit.h> can be included directly."}
{$endif}
{$ifndef __PK_COMMON_H}
{$define __PK_COMMON_H}
{$include <glib.h>}
{$include "pk-enum.h"}
{*
 * PK_DBUS_SERVICE:
 *
 * The DBUS name for the PackageKit system service.
  }

const
  PK_DBUS_SERVICE = 'org.freedesktop.PackageKit';  
{*
 * PK_DBUS_PATH:
 *
 * The DBUS path to the PackageKit service.
  }
  PK_DBUS_PATH = '/org/freedesktop/PackageKit';  
{*
 * PK_DBUS_INTERFACE:
 *
 * The DBUS interface used by the PackageKit service.
  }
  PK_DBUS_INTERFACE = 'org.freedesktop.PackageKit';  
{*
 * PK_DBUS_INTERFACE_TRANSACTION:
 *
 * The DBUS interface for PackageKit transactions.
  }
  PK_DBUS_INTERFACE_TRANSACTION = 'org.freedesktop.PackageKit.Transaction';  
{*
 * PK_DBUS_INTERFACE_OFFLINE:
 *
 * The DBUS interface for PackageKit offline update functionality
  }
  PK_DBUS_INTERFACE_OFFLINE = 'org.freedesktop.PackageKit.Offline';  
{*
 * PK_PACKAGE_LIST_FILENAME:
 *
 * The default location of the package list
 *
 * NOTE: This constant is unused and will be removed next time the library
 * soname changes!
  }
  PK_SYSTEM_PACKAGE_LIST_FILENAME = '/var/lib/PackageKit/system.package-list';  
{*
 * PK_PACKAGE_CACHE_FILENAME:
 *
 * The default location of the package cache database
 *
 * NOTE: This constant is unused and will be removed next time the library
 * soname changes!
  }
  PK_SYSTEM_PACKAGE_CACHE_FILENAME = '/var/lib/PackageKit/package-cache.db';  

function pk_ptr_array_to_strv(array:PGPtrArray):^Pgchar;cdecl;external;
function pk_iso8601_present:Pgchar;cdecl;external;
(* Const before type ignored *)
function pk_iso8601_from_date(date:PGDate):Pgchar;cdecl;external;
(* Const before type ignored *)
function pk_iso8601_to_date(iso_date:Pgchar):PGDate;cdecl;external;
(* Const before type ignored *)
function pk_iso8601_to_datetime(iso_date:Pgchar):PGDateTime;cdecl;external;
function pk_get_distro_id:Pgchar;cdecl;external;
{$endif}
{ __PK_COMMON_H  }

implementation


end.
