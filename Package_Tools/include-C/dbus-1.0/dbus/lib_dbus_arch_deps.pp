
unit lib_dbus_arch_deps;
interface

{
  Automatically converted by H2Pas 1.0.0 from lib_dbus_arch_deps.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    lib_dbus_arch_deps.h
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
Pdbus_int16_t  = ^dbus_int16_t;
Pdbus_int32_t  = ^dbus_int32_t;
Pdbus_int64_t  = ^dbus_int64_t;
Pdbus_uint16_t  = ^dbus_uint16_t;
Pdbus_uint32_t  = ^dbus_uint32_t;
Pdbus_uint64_t  = ^dbus_uint64_t;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ -*- mode: C; c-file-style: "gnu" -*-  }
{ dbus-arch-deps.h Header with architecture/compiler specific information, installed to libdir
 *
 * Copyright (C) 2003 Red Hat, Inc.
 *
 * Licensed under the Academic Free License version 2.0
 * 
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 * 
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA
 *
  }
{$if !defined (DBUS_INSIDE_DBUS_H) && !defined (DBUS_COMPILATION)}
{$error "Only <dbus/dbus.h> can be included directly, this file may disappear or change contents."}
{$endif}
{$ifndef DBUS_ARCH_DEPS_H}
{$define DBUS_ARCH_DEPS_H}
{$include <dbus/dbus-macros.h>}
{ D-Bus no longer supports platforms with no 64-bit integer type.  }

const
  DBUS_HAVE_INT64 = 1;  
type
  Pdbus_int64_t = ^Tdbus_int64_t;
  Tdbus_int64_t = longint;

  Pdbus_uint64_t = ^Tdbus_uint64_t;
  Tdbus_uint64_t = dword;

  Pdbus_int32_t = ^Tdbus_int32_t;
  Tdbus_int32_t = longint;

  Pdbus_uint32_t = ^Tdbus_uint32_t;
  Tdbus_uint32_t = dword;

  Pdbus_int16_t = ^Tdbus_int16_t;
  Tdbus_int16_t = smallint;

  Pdbus_uint16_t = ^Tdbus_uint16_t;
  Tdbus_uint16_t = word;
{ This is not really arch-dependent, but it's not worth
 * creating an additional generated header just for this
  }

const
  DBUS_MAJOR_VERSION = 1;  
  DBUS_MINOR_VERSION = 14;  
  DBUS_MICRO_VERSION = 10;  
  DBUS_VERSION_STRING = '1.14.10';  
  DBUS_VERSION = ((1 shl 16) or (14 shl 8)) or 10;  
{$endif}
{ DBUS_ARCH_DEPS_H  }

implementation


end.
