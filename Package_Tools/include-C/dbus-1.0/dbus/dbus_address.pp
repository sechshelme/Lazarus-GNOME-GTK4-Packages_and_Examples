
unit dbus_address;
interface

{
  Automatically converted by H2Pas 1.0.0 from dbus_address.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    dbus_address.h
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
PDBusAddressEntry  = ^DBusAddressEntry;
PDBusError  = ^DBusError;
Plongint  = ^longint;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ -*- mode: C; c-file-style: "gnu"; indent-tabs-mode: nil; -*-  }
{ dbus-address.h  Server address parser.
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
{$ifndef DBUS_ADDRESS_H}
{$define DBUS_ADDRESS_H}
{$include <dbus/dbus-types.h>}
{$include <dbus/dbus-errors.h>}
{*
 * @addtogroup DBusAddress
 * @
  }
{* Opaque type representing one of the semicolon-separated items in an address  }
type
(* Const before type ignored *)

function dbus_parse_address(address:Pchar; entry_result:PPPDBusAddressEntry; array_len:Plongint; error:PDBusError):Tdbus_bool_t;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function dbus_address_entry_get_value(entry:PDBusAddressEntry; key:Pchar):Pchar;cdecl;external;
(* Const before type ignored *)
function dbus_address_entry_get_method(entry:PDBusAddressEntry):Pchar;cdecl;external;
procedure dbus_address_entries_free(entries:PPDBusAddressEntry);cdecl;external;
(* Const before type ignored *)
function dbus_address_escape_value(value:Pchar):Pchar;cdecl;external;
(* Const before type ignored *)
function dbus_address_unescape_value(value:Pchar; error:PDBusError):Pchar;cdecl;external;
{*
 * Clear a variable or struct member that contains an array of #DBusAddressEntry.
 * If it does not contain #NULL, the entries that were previously
 * there are freed with dbus_address_entries_free().
 *
 * This is similar to dbus_clear_connection(): see that function
 * for more details.
 *
 * @param pointer_to_entries A pointer to a variable or struct member.
 * pointer_to_entries must not be #NULL, but *pointer_to_entries
 * may be #NULL.
  }
{ xxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
static inline void
dbus_clear_address_entries (DBusAddressEntry ***pointer_to_entries)

  _dbus_clear_pointer_impl (DBusAddressEntry *, pointer_to_entries,
                            dbus_address_entries_free);

 }
{* @  }
{$endif}
{ DBUS_ADDRESS_H  }

implementation


end.
