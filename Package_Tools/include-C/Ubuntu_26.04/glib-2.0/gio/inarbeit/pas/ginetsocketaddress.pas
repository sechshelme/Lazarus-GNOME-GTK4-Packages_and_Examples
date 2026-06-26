unit ginetsocketaddress;

interface

uses
  fp_glib2;

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


function g_inet_socket_address_get_type:TGType;cdecl;external libgio2;
function g_inet_socket_address_new(address:PGInetAddress; port:Tguint16):PGSocketAddress;cdecl;external libgio2;
function g_inet_socket_address_new_from_string(address:Pchar; port:Tguint):PGSocketAddress;cdecl;external libgio2;
function g_inet_socket_address_get_address(address:PGInetSocketAddress):PGInetAddress;cdecl;external libgio2;
function g_inet_socket_address_get_port(address:PGInetSocketAddress):Tguint16;cdecl;external libgio2;
function g_inet_socket_address_get_flowinfo(address:PGInetSocketAddress):Tguint32;cdecl;external libgio2;
function g_inet_socket_address_get_scope_id(address:PGInetSocketAddress):Tguint32;cdecl;external libgio2;
{$endif}
{ __G_INET_SOCKET_ADDRESS_H__  }

// === Konventiert am: 26-6-26 19:26:02 ===

function G_TYPE_INET_SOCKET_ADDRESS : TGType;
function G_INET_SOCKET_ADDRESS(obj : Pointer) : PGInetSocketAddress;
function G_INET_SOCKET_ADDRESS_CLASS(klass : Pointer) : PGInetSocketAddressClass;
function G_IS_INET_SOCKET_ADDRESS(obj : Pointer) : Tgboolean;
function G_IS_INET_SOCKET_ADDRESS_CLASS(klass : Pointer) : Tgboolean;
function G_INET_SOCKET_ADDRESS_GET_CLASS(obj : Pointer) : PGInetSocketAddressClass;

implementation

function G_TYPE_INET_SOCKET_ADDRESS : TGType;
  begin
    G_TYPE_INET_SOCKET_ADDRESS:=g_inet_socket_address_get_type;
  end;

function G_INET_SOCKET_ADDRESS(obj : Pointer) : PGInetSocketAddress;
begin
  Result := PGInetSocketAddress(g_type_check_instance_cast(obj, G_TYPE_INET_SOCKET_ADDRESS));
end;

function G_INET_SOCKET_ADDRESS_CLASS(klass : Pointer) : PGInetSocketAddressClass;
begin
  Result := PGInetSocketAddressClass(g_type_check_class_cast(klass, G_TYPE_INET_SOCKET_ADDRESS));
end;

function G_IS_INET_SOCKET_ADDRESS(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  G_TYPE_INET_SOCKET_ADDRESS);
end;

function G_IS_INET_SOCKET_ADDRESS_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  G_TYPE_INET_SOCKET_ADDRESS);
end;

function G_INET_SOCKET_ADDRESS_GET_CLASS(obj : Pointer) : PGInetSocketAddressClass;
begin
  Result := PGInetSocketAddressClass(PGTypeInstance(obj)^.g_class);
end;



end.
