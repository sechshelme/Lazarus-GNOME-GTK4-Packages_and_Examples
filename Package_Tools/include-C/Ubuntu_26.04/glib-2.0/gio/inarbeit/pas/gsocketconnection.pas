unit gsocketconnection;

interface

uses
  fp_glib2;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GIO - GLib Input, Output and Streaming Library
 * Copyright © 2008 Christian Kellner, Samuel Cormier-Iijima
 * Copyright © 2009 Codethink Limited
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
 *          Ryan Lortie <desrt@desrt.ca>
 *          Alexander Larsson <alexl@redhat.com>
  }
{$ifndef __G_SOCKET_CONNECTION_H__}
{$define __G_SOCKET_CONNECTION_H__}
{$if !defined (__GIO_GIO_H_INSIDE__) && !defined (GIO_COMPILATION)}
{$error "Only <gio/gio.h> can be included directly."}
{$endif}
{$include <glib-object.h>}
{$include <gio/gsocket.h>}
{$include <gio/giostream.h>}

type
{ Padding for future expansion  }
  PGSocketConnectionClass = ^TGSocketConnectionClass;
  TGSocketConnectionClass = record
      parent_class : TGIOStreamClass;
      _g_reserved1 : procedure ;cdecl;
      _g_reserved2 : procedure ;cdecl;
      _g_reserved3 : procedure ;cdecl;
      _g_reserved4 : procedure ;cdecl;
      _g_reserved5 : procedure ;cdecl;
      _g_reserved6 : procedure ;cdecl;
    end;

  PGSocketConnection = ^TGSocketConnection;
  TGSocketConnection = record
      parent_instance : TGIOStream;
      priv : PGSocketConnectionPrivate;
    end;


function g_socket_connection_get_type:TGType;cdecl;external libgio2;
function g_socket_connection_is_connected(connection:PGSocketConnection):Tgboolean;cdecl;external libgio2;
function g_socket_connection_connect(connection:PGSocketConnection; address:PGSocketAddress; cancellable:PGCancellable; error:PPGError):Tgboolean;cdecl;external libgio2;
procedure g_socket_connection_connect_async(connection:PGSocketConnection; address:PGSocketAddress; cancellable:PGCancellable; callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external libgio2;
function g_socket_connection_connect_finish(connection:PGSocketConnection; result:PGAsyncResult; error:PPGError):Tgboolean;cdecl;external libgio2;
function g_socket_connection_get_socket(connection:PGSocketConnection):PGSocket;cdecl;external libgio2;
function g_socket_connection_get_local_address(connection:PGSocketConnection; error:PPGError):PGSocketAddress;cdecl;external libgio2;
function g_socket_connection_get_remote_address(connection:PGSocketConnection; error:PPGError):PGSocketAddress;cdecl;external libgio2;
procedure g_socket_connection_factory_register_type(g_type:TGType; family:TGSocketFamily; _type:TGSocketType; protocol:Tgint);cdecl;external libgio2;
function g_socket_connection_factory_lookup_type(family:TGSocketFamily; _type:TGSocketType; protocol_id:Tgint):TGType;cdecl;external libgio2;
function g_socket_connection_factory_create_connection(socket:PGSocket):PGSocketConnection;cdecl;external libgio2;
{$endif}
{ __G_SOCKET_CONNECTION_H__  }

// === Konventiert am: 26-6-26 19:55:24 ===

function G_TYPE_SOCKET_CONNECTION : TGType;
function G_SOCKET_CONNECTION(obj : Pointer) : PGSocketConnection;
function G_SOCKET_CONNECTION_CLASS(klass : Pointer) : PGSocketConnectionClass;
function G_IS_SOCKET_CONNECTION(obj : Pointer) : Tgboolean;
function G_IS_SOCKET_CONNECTION_CLASS(klass : Pointer) : Tgboolean;
function G_SOCKET_CONNECTION_GET_CLASS(obj : Pointer) : PGSocketConnectionClass;

implementation

function G_TYPE_SOCKET_CONNECTION : TGType;
  begin
    G_TYPE_SOCKET_CONNECTION:=g_socket_connection_get_type;
  end;

function G_SOCKET_CONNECTION(obj : Pointer) : PGSocketConnection;
begin
  Result := PGSocketConnection(g_type_check_instance_cast(obj, G_TYPE_SOCKET_CONNECTION));
end;

function G_SOCKET_CONNECTION_CLASS(klass : Pointer) : PGSocketConnectionClass;
begin
  Result := PGSocketConnectionClass(g_type_check_class_cast(klass, G_TYPE_SOCKET_CONNECTION));
end;

function G_IS_SOCKET_CONNECTION(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  G_TYPE_SOCKET_CONNECTION);
end;

function G_IS_SOCKET_CONNECTION_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  G_TYPE_SOCKET_CONNECTION);
end;

function G_SOCKET_CONNECTION_GET_CLASS(obj : Pointer) : PGSocketConnectionClass;
begin
  Result := PGSocketConnectionClass(PGTypeInstance(obj)^.g_class);
end;



end.
