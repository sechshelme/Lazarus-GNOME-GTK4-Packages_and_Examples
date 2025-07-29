
unit dbus_misc;
interface

{
  Automatically converted by H2Pas 1.0.0 from dbus_misc.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    dbus_misc.h
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
Plongint  = ^longint;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ -*- mode: C; c-file-style: "gnu"; indent-tabs-mode: nil; -*-  }
{ dbus-misc.h  A few assorted public functions that don't fit elsewhere
 *
 * Copyright (C) 2006 Red Hat, Inc.
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
{$ifndef DBUS_MISC_H}
{$define DBUS_MISC_H}
{$include <dbus/dbus-types.h>}
{$include <dbus/dbus-errors.h>}
{*
 * @addtogroup DBusMisc
 * @
  }

function dbus_get_local_machine_id:Pchar;cdecl;external;
procedure dbus_get_version(major_version_p:Plongint; minor_version_p:Plongint; micro_version_p:Plongint);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function dbus_setenv(variable:Pchar; value:Pchar):Tdbus_bool_t;cdecl;external;
function dbus_try_get_local_machine_id(error:PDBusError):Pchar;cdecl;external;
{* @  }
{$endif}
{ DBUS_MISC_H  }

implementation


end.
