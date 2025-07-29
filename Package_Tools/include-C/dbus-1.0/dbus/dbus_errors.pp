
unit dbus_errors;
interface

{
  Automatically converted by H2Pas 1.0.0 from dbus_errors.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    dbus_errors.h
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
{ dbus-errors.h Error reporting
 *
 * Copyright (C) 2002  Red Hat Inc.
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
{$ifndef DBUS_ERROR_H}
{$define DBUS_ERROR_H}
{$include <dbus/dbus-macros.h>}
{$include <dbus/dbus-types.h>}
{$include <dbus/dbus-protocol.h>}
{*
 * @addtogroup DBusErrors
 * @
  }
{* Mostly-opaque type representing an error that occurred  }
type
{*
 * Object representing an exception.
  }
(* Const before type ignored *)
{*< public error name field  }
(* Const before type ignored *)
{*< public error message field  }
{*< placeholder  }
{*< placeholder  }
{*< placeholder  }
{*< placeholder  }
{*< placeholder  }
{*< placeholder  }
  PDBusError = ^TDBusError;
  TDBusError = record
      name : Pchar;
      message : Pchar;
      flag0 : word;
      padding1 : pointer;
    end;


const
  bm_TDBusError_dummy1 = $1;
  bp_TDBusError_dummy1 = 0;
  bm_TDBusError_dummy2 = $2;
  bp_TDBusError_dummy2 = 1;
  bm_TDBusError_dummy3 = $4;
  bp_TDBusError_dummy3 = 2;
  bm_TDBusError_dummy4 = $8;
  bp_TDBusError_dummy4 = 3;
  bm_TDBusError_dummy5 = $10;
  bp_TDBusError_dummy5 = 4;

function dummy1(var a : TDBusError) : dword;
procedure set_dummy1(var a : TDBusError; __dummy1 : dword);
function dummy2(var a : TDBusError) : dword;
procedure set_dummy2(var a : TDBusError; __dummy2 : dword);
function dummy3(var a : TDBusError) : dword;
procedure set_dummy3(var a : TDBusError; __dummy3 : dword);
function dummy4(var a : TDBusError) : dword;
procedure set_dummy4(var a : TDBusError; __dummy4 : dword);
function dummy5(var a : TDBusError) : dword;
procedure set_dummy5(var a : TDBusError; __dummy5 : dword);
{ xxxxxxxxxxxxxxxxxxxxxxxxxx #define DBUS_ERROR_INIT  NULL, NULL, TRUE, 0, 0, 0, 0, NULL  }

procedure dbus_error_init(error:PDBusError);cdecl;external;
procedure dbus_error_free(error:PDBusError);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure dbus_set_error(error:PDBusError; name:Pchar; message:Pchar; args:array of const);cdecl;external;
procedure dbus_set_error(error:PDBusError; name:Pchar; message:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure dbus_set_error_const(error:PDBusError; name:Pchar; message:Pchar);cdecl;external;
procedure dbus_move_error(src:PDBusError; dest:PDBusError);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function dbus_error_has_name(error:PDBusError; name:Pchar):Tdbus_bool_t;cdecl;external;
(* Const before type ignored *)
function dbus_error_is_set(error:PDBusError):Tdbus_bool_t;cdecl;external;
{* @  }
{$endif}
{ DBUS_ERROR_H  }

implementation

function dummy1(var a : TDBusError) : dword;
begin
  dummy1:=(a.flag0 and bm_TDBusError_dummy1) shr bp_TDBusError_dummy1;
end;

procedure set_dummy1(var a : TDBusError; __dummy1 : dword);
begin
  a.flag0:=a.flag0 or ((__dummy1 shl bp_TDBusError_dummy1) and bm_TDBusError_dummy1);
end;

function dummy2(var a : TDBusError) : dword;
begin
  dummy2:=(a.flag0 and bm_TDBusError_dummy2) shr bp_TDBusError_dummy2;
end;

procedure set_dummy2(var a : TDBusError; __dummy2 : dword);
begin
  a.flag0:=a.flag0 or ((__dummy2 shl bp_TDBusError_dummy2) and bm_TDBusError_dummy2);
end;

function dummy3(var a : TDBusError) : dword;
begin
  dummy3:=(a.flag0 and bm_TDBusError_dummy3) shr bp_TDBusError_dummy3;
end;

procedure set_dummy3(var a : TDBusError; __dummy3 : dword);
begin
  a.flag0:=a.flag0 or ((__dummy3 shl bp_TDBusError_dummy3) and bm_TDBusError_dummy3);
end;

function dummy4(var a : TDBusError) : dword;
begin
  dummy4:=(a.flag0 and bm_TDBusError_dummy4) shr bp_TDBusError_dummy4;
end;

procedure set_dummy4(var a : TDBusError; __dummy4 : dword);
begin
  a.flag0:=a.flag0 or ((__dummy4 shl bp_TDBusError_dummy4) and bm_TDBusError_dummy4);
end;

function dummy5(var a : TDBusError) : dword;
begin
  dummy5:=(a.flag0 and bm_TDBusError_dummy5) shr bp_TDBusError_dummy5;
end;

procedure set_dummy5(var a : TDBusError; __dummy5 : dword);
begin
  a.flag0:=a.flag0 or ((__dummy5 shl bp_TDBusError_dummy5) and bm_TDBusError_dummy5);
end;


end.
