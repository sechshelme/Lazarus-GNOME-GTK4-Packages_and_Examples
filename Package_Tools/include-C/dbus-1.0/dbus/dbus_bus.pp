
unit dbus_bus;
interface

{
  Automatically converted by H2Pas 1.0.0 from dbus_bus.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    dbus_bus.h
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
Pchar  = ^char;
Pdbus_uint32_t  = ^dbus_uint32_t;
PDBusConnection  = ^DBusConnection;
PDBusError  = ^DBusError;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ -*- mode: C; c-file-style: "gnu"; indent-tabs-mode: nil; -*-  }
{ dbus-bus.h  Convenience functions for communicating with the bus.
 *
 * Copyright (C) 2003  CodeFactory AB
 *
 * Licensed under the Academic Free License version 2.1
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
{$ifndef DBUS_BUS_H}
{$define DBUS_BUS_H}
{$include <dbus/dbus-connection.h>}
{*
 * @addtogroup DBusBus
 * @
  }

function dbus_bus_get(_type:TDBusBusType; error:PDBusError):PDBusConnection;cdecl;external;
function dbus_bus_get_private(_type:TDBusBusType; error:PDBusError):PDBusConnection;cdecl;external;
function dbus_bus_register(connection:PDBusConnection; error:PDBusError):Tdbus_bool_t;cdecl;external;
(* Const before type ignored *)
function dbus_bus_set_unique_name(connection:PDBusConnection; unique_name:Pchar):Tdbus_bool_t;cdecl;external;
(* Const before type ignored *)
function dbus_bus_get_unique_name(connection:PDBusConnection):Pchar;cdecl;external;
(* Const before type ignored *)
function dbus_bus_get_unix_user(connection:PDBusConnection; name:Pchar; error:PDBusError):dword;cdecl;external;
function dbus_bus_get_id(connection:PDBusConnection; error:PDBusError):Pchar;cdecl;external;
(* Const before type ignored *)
function dbus_bus_request_name(connection:PDBusConnection; name:Pchar; flags:dword; error:PDBusError):longint;cdecl;external;
(* Const before type ignored *)
function dbus_bus_release_name(connection:PDBusConnection; name:Pchar; error:PDBusError):longint;cdecl;external;
(* Const before type ignored *)
function dbus_bus_name_has_owner(connection:PDBusConnection; name:Pchar; error:PDBusError):Tdbus_bool_t;cdecl;external;
(* Const before type ignored *)
function dbus_bus_start_service_by_name(connection:PDBusConnection; name:Pchar; flags:Tdbus_uint32_t; reply:Pdbus_uint32_t; error:PDBusError):Tdbus_bool_t;cdecl;external;
(* Const before type ignored *)
procedure dbus_bus_add_match(connection:PDBusConnection; rule:Pchar; error:PDBusError);cdecl;external;
(* Const before type ignored *)
procedure dbus_bus_remove_match(connection:PDBusConnection; rule:Pchar; error:PDBusError);cdecl;external;
{* @  }
{$endif}
{ DBUS_BUS_H  }

implementation


end.
