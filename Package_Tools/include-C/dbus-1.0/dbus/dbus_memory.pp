
unit dbus_memory;
interface

{
  Automatically converted by H2Pas 1.0.0 from dbus_memory.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    dbus_memory.h
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
Ptype  = ^type;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ -*- mode: C; c-file-style: "gnu"; indent-tabs-mode: nil; -*-  }
{ dbus-memory.h  D-Bus memory handling
 *
 * Copyright (C) 2002  Red Hat Inc.
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
{$ifndef DBUS_MEMORY_H}
{$define DBUS_MEMORY_H}
{$include <dbus/dbus-macros.h>}
{$include <stddef.h>}
{*
 * @addtogroup DBusMemory
 * @
  }

function dbus_malloc(bytes:Tsize_t):pointer;cdecl;external;
function dbus_malloc0(bytes:Tsize_t):pointer;cdecl;external;
function dbus_realloc(memory:pointer; bytes:Tsize_t):pointer;cdecl;external;
procedure dbus_free(memory:pointer);cdecl;external;
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function dbus_new(_type,count : longint) : Ptype;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function dbus_new0(_type,count : longint) : Ptype;

procedure dbus_free_string_array(str_array:PPchar);cdecl;external;
type

  TDBusFreeFunction = procedure (memory:pointer);cdecl;

procedure dbus_shutdown;cdecl;external;
{* @  }
{$endif}
{ DBUS_MEMORY_H  }

implementation

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function dbus_new(_type,count : longint) : Ptype;
begin
  dbus_new:=Ptype(dbus_malloc((sizeof(_type))*count));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function dbus_new0(_type,count : longint) : Ptype;
begin
  dbus_new0:=Ptype(dbus_malloc0((sizeof(_type))*count));
end;


end.
