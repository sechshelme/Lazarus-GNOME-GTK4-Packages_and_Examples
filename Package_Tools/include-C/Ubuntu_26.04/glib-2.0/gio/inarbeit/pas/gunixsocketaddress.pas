unit gunixsocketaddress;

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
{$ifndef __G_UNIX_SOCKET_ADDRESS_H__}
{$define __G_UNIX_SOCKET_ADDRESS_H__}
{$include <gio/gio.h>}

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


function g_unix_socket_address_get_type:TGType;cdecl;external libgio2;
function g_unix_socket_address_new(path:Pgchar):PGSocketAddress;cdecl;external libgio2;
{xxxxxGLIB_DEPRECATED_FOR(g_unix_socket_address_new_with_type) }
function g_unix_socket_address_new_abstract(path:Pgchar; path_len:Tgint):PGSocketAddress;cdecl;external libgio2;
function g_unix_socket_address_new_with_type(path:Pgchar; path_len:Tgint; _type:TGUnixSocketAddressType):PGSocketAddress;cdecl;external libgio2;
function g_unix_socket_address_get_path(address:PGUnixSocketAddress):Pchar;cdecl;external libgio2;
function g_unix_socket_address_get_path_len(address:PGUnixSocketAddress):Tgsize;cdecl;external libgio2;
function g_unix_socket_address_get_address_type(address:PGUnixSocketAddress):TGUnixSocketAddressType;cdecl;external libgio2;
{xxxxxxGIO_DEPRECATED }
function g_unix_socket_address_get_is_abstract(address:PGUnixSocketAddress):Tgboolean;cdecl;external libgio2;
function g_unix_socket_address_abstract_names_supported:Tgboolean;cdecl;external libgio2;
{$endif}
{ __G_UNIX_SOCKET_ADDRESS_H__  }

// === Konventiert am: 26-6-26 20:07:16 ===

function G_TYPE_UNIX_SOCKET_ADDRESS : TGType;
function G_UNIX_SOCKET_ADDRESS(obj : Pointer) : PGUnixSocketAddress;
function G_UNIX_SOCKET_ADDRESS_CLASS(klass : Pointer) : PGUnixSocketAddressClass;
function G_IS_UNIX_SOCKET_ADDRESS(obj : Pointer) : Tgboolean;
function G_IS_UNIX_SOCKET_ADDRESS_CLASS(klass : Pointer) : Tgboolean;
function G_UNIX_SOCKET_ADDRESS_GET_CLASS(obj : Pointer) : PGUnixSocketAddressClass;

implementation

function G_TYPE_UNIX_SOCKET_ADDRESS : TGType;
  begin
    G_TYPE_UNIX_SOCKET_ADDRESS:=g_unix_socket_address_get_type;
  end;

function G_UNIX_SOCKET_ADDRESS(obj : Pointer) : PGUnixSocketAddress;
begin
  Result := PGUnixSocketAddress(g_type_check_instance_cast(obj, G_TYPE_UNIX_SOCKET_ADDRESS));
end;

function G_UNIX_SOCKET_ADDRESS_CLASS(klass : Pointer) : PGUnixSocketAddressClass;
begin
  Result := PGUnixSocketAddressClass(g_type_check_class_cast(klass, G_TYPE_UNIX_SOCKET_ADDRESS));
end;

function G_IS_UNIX_SOCKET_ADDRESS(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  G_TYPE_UNIX_SOCKET_ADDRESS);
end;

function G_IS_UNIX_SOCKET_ADDRESS_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  G_TYPE_UNIX_SOCKET_ADDRESS);
end;

function G_UNIX_SOCKET_ADDRESS_GET_CLASS(obj : Pointer) : PGUnixSocketAddressClass;
begin
  Result := PGUnixSocketAddressClass(PGTypeInstance(obj)^.g_class);
end;



end.
