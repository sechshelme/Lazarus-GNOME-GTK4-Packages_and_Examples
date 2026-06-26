
unit gunixsocketaddress;
interface

{
  Automatically converted by H2Pas 1.0.0 from gunixsocketaddress.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gunixsocketaddress.h
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
Pgchar  = ^gchar;
PGSocketAddress  = ^GSocketAddress;
PGUnixSocketAddress  = ^GUnixSocketAddress;
PGUnixSocketAddressClass  = ^GUnixSocketAddressClass;
PGUnixSocketAddressPrivate  = ^GUnixSocketAddressPrivate;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GIO - GLib Input, Output and Streaming Library
 *
 * Copyright (C) 2008 Christian Kellner, Samuel Cormier-Iijima
 *
 * SPDX-License-Identifier: LGPL-2.1-or-later
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
 * You should have received a copy of the GNU Lesser General
 * Public License along with this library; if not, see <http://www.gnu.org/licenses/>.
 *
 * Authors: Christian Kellner <gicmo@gnome.org>
 *          Samuel Cormier-Iijima <sciyoshi@gmail.com>
  }
{$ifndef __G_UNIX_SOCKET_ADDRESS_H__}
{$define __G_UNIX_SOCKET_ADDRESS_H__}
{$include <gio/gio.h>}

{ was #define dname def_expr }
function G_TYPE_UNIX_SOCKET_ADDRESS : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_UNIX_SOCKET_ADDRESS(o : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_UNIX_SOCKET_ADDRESS_CLASS(k : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_UNIX_SOCKET_ADDRESS(o : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_UNIX_SOCKET_ADDRESS_CLASS(k : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_UNIX_SOCKET_ADDRESS_GET_CLASS(o : longint) : longint;

type
{< private > }
  PGUnixSocketAddress = ^TGUnixSocketAddress;
  TGUnixSocketAddress = record
      parent_instance : TGSocketAddress;
      priv : PGUnixSocketAddressPrivate;
    end;

  PGUnixSocketAddressClass = ^TGUnixSocketAddressClass;
  TGUnixSocketAddressClass = record
      parent_class : TGSocketAddressClass;
    end;


function g_unix_socket_address_get_type:TGType;cdecl;external;
(* Const before type ignored *)
function g_unix_socket_address_new(path:Pgchar):PGSocketAddress;cdecl;external;
{xxxxxGLIB_DEPRECATED_FOR(g_unix_socket_address_new_with_type) }
(* Const before type ignored *)
function g_unix_socket_address_new_abstract(path:Pgchar; path_len:Tgint):PGSocketAddress;cdecl;external;
(* Const before type ignored *)
function g_unix_socket_address_new_with_type(path:Pgchar; path_len:Tgint; _type:TGUnixSocketAddressType):PGSocketAddress;cdecl;external;
(* Const before type ignored *)
function g_unix_socket_address_get_path(address:PGUnixSocketAddress):Pchar;cdecl;external;
function g_unix_socket_address_get_path_len(address:PGUnixSocketAddress):Tgsize;cdecl;external;
function g_unix_socket_address_get_address_type(address:PGUnixSocketAddress):TGUnixSocketAddressType;cdecl;external;
{xxxxxxGIO_DEPRECATED }
function g_unix_socket_address_get_is_abstract(address:PGUnixSocketAddress):Tgboolean;cdecl;external;
function g_unix_socket_address_abstract_names_supported:Tgboolean;cdecl;external;
{$endif}
{ __G_UNIX_SOCKET_ADDRESS_H__  }

implementation

{ was #define dname def_expr }
function G_TYPE_UNIX_SOCKET_ADDRESS : longint; { return type might be wrong }
  begin
    G_TYPE_UNIX_SOCKET_ADDRESS:=g_unix_socket_address_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_UNIX_SOCKET_ADDRESS(o : longint) : longint;
begin
  G_UNIX_SOCKET_ADDRESS:=G_TYPE_CHECK_INSTANCE_CAST(o,G_TYPE_UNIX_SOCKET_ADDRESS,GUnixSocketAddress);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_UNIX_SOCKET_ADDRESS_CLASS(k : longint) : longint;
begin
  G_UNIX_SOCKET_ADDRESS_CLASS:=G_TYPE_CHECK_CLASS_CAST(k,G_TYPE_UNIX_SOCKET_ADDRESS,GUnixSocketAddressClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_UNIX_SOCKET_ADDRESS(o : longint) : longint;
begin
  G_IS_UNIX_SOCKET_ADDRESS:=G_TYPE_CHECK_INSTANCE_TYPE(o,G_TYPE_UNIX_SOCKET_ADDRESS);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_UNIX_SOCKET_ADDRESS_CLASS(k : longint) : longint;
begin
  G_IS_UNIX_SOCKET_ADDRESS_CLASS:=G_TYPE_CHECK_CLASS_TYPE(k,G_TYPE_UNIX_SOCKET_ADDRESS);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_UNIX_SOCKET_ADDRESS_GET_CLASS(o : longint) : longint;
begin
  G_UNIX_SOCKET_ADDRESS_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(o,G_TYPE_UNIX_SOCKET_ADDRESS,GUnixSocketAddressClass);
end;


end.
