
unit dbus_syntax;
interface

{
  Automatically converted by H2Pas 1.0.0 from dbus_syntax.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    dbus_syntax.h
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
PDBusError  = ^DBusError;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ -*- mode: C; c-file-style: "gnu"; indent-tabs-mode: nil; -*-  }
{ dbus-syntax.h - utility functions for strings with special syntax
 *
 * Author: Simon McVittie <simon.mcvittie@collabora.co.uk>
 * Copyright © 2011 Nokia Corporation
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
{$ifndef DBUS_SYNTAX_H}
{$define DBUS_SYNTAX_H}
{$include <dbus/dbus-macros.h>}
{$include <dbus/dbus-types.h>}
{$include <dbus/dbus-errors.h>}
(* Const before type ignored *)

function dbus_validate_path(path:Pchar; error:PDBusError):Tdbus_bool_t;cdecl;external;
(* Const before type ignored *)
function dbus_validate_interface(name:Pchar; error:PDBusError):Tdbus_bool_t;cdecl;external;
(* Const before type ignored *)
function dbus_validate_member(name:Pchar; error:PDBusError):Tdbus_bool_t;cdecl;external;
(* Const before type ignored *)
function dbus_validate_error_name(name:Pchar; error:PDBusError):Tdbus_bool_t;cdecl;external;
(* Const before type ignored *)
function dbus_validate_bus_name(name:Pchar; error:PDBusError):Tdbus_bool_t;cdecl;external;
(* Const before type ignored *)
function dbus_validate_utf8(alleged_utf8:Pchar; error:PDBusError):Tdbus_bool_t;cdecl;external;
{$endif}
{ multiple-inclusion guard  }

implementation


end.
