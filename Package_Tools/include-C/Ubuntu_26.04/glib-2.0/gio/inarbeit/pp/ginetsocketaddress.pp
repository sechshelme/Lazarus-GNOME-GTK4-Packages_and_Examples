
unit ginetsocketaddress;
interface

{
  Automatically converted by H2Pas 1.0.0 from ginetsocketaddress.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    ginetsocketaddress.h
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
PGInetAddress  = ^GInetAddress;
PGInetSocketAddress  = ^GInetSocketAddress;
PGInetSocketAddressClass  = ^GInetSocketAddressClass;
PGInetSocketAddressPrivate  = ^GInetSocketAddressPrivate;
PGSocketAddress  = ^GSocketAddress;
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
{$ifndef __G_INET_SOCKET_ADDRESS_H__}
{$define __G_INET_SOCKET_ADDRESS_H__}
{$if !defined (__GIO_GIO_H_INSIDE__) && !defined (GIO_COMPILATION)}
{$error "Only <gio/gio.h> can be included directly."}
{$endif}
{$include <gio/gsocketaddress.h>}

{ was #define dname def_expr }
function G_TYPE_INET_SOCKET_ADDRESS : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_INET_SOCKET_ADDRESS(o : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_INET_SOCKET_ADDRESS_CLASS(k : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_INET_SOCKET_ADDRESS(o : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_INET_SOCKET_ADDRESS_CLASS(k : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_INET_SOCKET_ADDRESS_GET_CLASS(o : longint) : longint;

type
{< private > }
  PGInetSocketAddress = ^TGInetSocketAddress;
  TGInetSocketAddress = record
      parent_instance : TGSocketAddress;
      priv : PGInetSocketAddressPrivate;
    end;

  PGInetSocketAddressClass = ^TGInetSocketAddressClass;
  TGInetSocketAddressClass = record
      parent_class : TGSocketAddressClass;
    end;


function g_inet_socket_address_get_type:TGType;cdecl;external;
function g_inet_socket_address_new(address:PGInetAddress; port:Tguint16):PGSocketAddress;cdecl;external;
(* Const before type ignored *)
function g_inet_socket_address_new_from_string(address:Pchar; port:Tguint):PGSocketAddress;cdecl;external;
function g_inet_socket_address_get_address(address:PGInetSocketAddress):PGInetAddress;cdecl;external;
function g_inet_socket_address_get_port(address:PGInetSocketAddress):Tguint16;cdecl;external;
function g_inet_socket_address_get_flowinfo(address:PGInetSocketAddress):Tguint32;cdecl;external;
function g_inet_socket_address_get_scope_id(address:PGInetSocketAddress):Tguint32;cdecl;external;
{$endif}
{ __G_INET_SOCKET_ADDRESS_H__  }

implementation

{ was #define dname def_expr }
function G_TYPE_INET_SOCKET_ADDRESS : longint; { return type might be wrong }
  begin
    G_TYPE_INET_SOCKET_ADDRESS:=g_inet_socket_address_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_INET_SOCKET_ADDRESS(o : longint) : longint;
begin
  G_INET_SOCKET_ADDRESS:=G_TYPE_CHECK_INSTANCE_CAST(o,G_TYPE_INET_SOCKET_ADDRESS,GInetSocketAddress);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_INET_SOCKET_ADDRESS_CLASS(k : longint) : longint;
begin
  G_INET_SOCKET_ADDRESS_CLASS:=G_TYPE_CHECK_CLASS_CAST(k,G_TYPE_INET_SOCKET_ADDRESS,GInetSocketAddressClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_INET_SOCKET_ADDRESS(o : longint) : longint;
begin
  G_IS_INET_SOCKET_ADDRESS:=G_TYPE_CHECK_INSTANCE_TYPE(o,G_TYPE_INET_SOCKET_ADDRESS);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_INET_SOCKET_ADDRESS_CLASS(k : longint) : longint;
begin
  G_IS_INET_SOCKET_ADDRESS_CLASS:=G_TYPE_CHECK_CLASS_TYPE(k,G_TYPE_INET_SOCKET_ADDRESS);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_INET_SOCKET_ADDRESS_GET_CLASS(o : longint) : longint;
begin
  G_INET_SOCKET_ADDRESS_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(o,G_TYPE_INET_SOCKET_ADDRESS,GInetSocketAddressClass);
end;


end.
