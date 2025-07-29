
unit dbus_signature;
interface

{
  Automatically converted by H2Pas 1.0.0 from dbus_signature.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    dbus_signature.h
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
PDBusSignatureIter  = ^DBusSignatureIter;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ -*- mode: C; c-file-style: "gnu"; indent-tabs-mode: nil; -*-  }
{ dbus-signatures.h utility functions for D-Bus types
 *
 * Copyright (C) 2005 Red Hat Inc.
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
{$ifndef DBUS_SIGNATURES_H}
{$define DBUS_SIGNATURES_H}
{$include <dbus/dbus-macros.h>}
{$include <dbus/dbus-types.h>}
{$include <dbus/dbus-errors.h>}
{*
 * @addtogroup DBusSignature
 * @
  }
{*
 * DBusSignatureIter struct; contains no public fields 
  }
{*< Don't use this  }
{*< Don't use this  }
{*< Don't use this  }
{*< Don't use this  }
{*< Don't use this  }
type
  PDBusSignatureIter = ^TDBusSignatureIter;
  TDBusSignatureIter = record
      dummy1 : pointer;
      dummy2 : pointer;
      dummy8 : Tdbus_uint32_t;
      dummy12 : longint;
      dummy17 : longint;
    end;
(* Const before type ignored *)

procedure dbus_signature_iter_init(iter:PDBusSignatureIter; signature:Pchar);cdecl;external;
(* Const before type ignored *)
function dbus_signature_iter_get_current_type(iter:PDBusSignatureIter):longint;cdecl;external;
(* Const before type ignored *)
function dbus_signature_iter_get_signature(iter:PDBusSignatureIter):Pchar;cdecl;external;
(* Const before type ignored *)
function dbus_signature_iter_get_element_type(iter:PDBusSignatureIter):longint;cdecl;external;
function dbus_signature_iter_next(iter:PDBusSignatureIter):Tdbus_bool_t;cdecl;external;
(* Const before type ignored *)
procedure dbus_signature_iter_recurse(iter:PDBusSignatureIter; subiter:PDBusSignatureIter);cdecl;external;
(* Const before type ignored *)
function dbus_signature_validate(signature:Pchar; error:PDBusError):Tdbus_bool_t;cdecl;external;
(* Const before type ignored *)
function dbus_signature_validate_single(signature:Pchar; error:PDBusError):Tdbus_bool_t;cdecl;external;
function dbus_type_is_valid(typecode:longint):Tdbus_bool_t;cdecl;external;
function dbus_type_is_basic(typecode:longint):Tdbus_bool_t;cdecl;external;
function dbus_type_is_container(typecode:longint):Tdbus_bool_t;cdecl;external;
function dbus_type_is_fixed(typecode:longint):Tdbus_bool_t;cdecl;external;
{* @  }
{$endif}
{ DBUS_SIGNATURE_H  }

implementation


end.
