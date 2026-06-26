
unit gsocketconnection;
interface

{
  Automatically converted by H2Pas 1.0.0 from gsocketconnection.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gsocketconnection.h
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
PGAsyncResult  = ^GAsyncResult;
PGCancellable  = ^GCancellable;
PGError  = ^GError;
PGSocket  = ^GSocket;
PGSocketAddress  = ^GSocketAddress;
PGSocketConnection  = ^GSocketConnection;
PGSocketConnectionClass  = ^GSocketConnectionClass;
PGSocketConnectionPrivate  = ^GSocketConnectionPrivate;
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

{ was #define dname def_expr }
function G_TYPE_SOCKET_CONNECTION : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_SOCKET_CONNECTION(inst : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_SOCKET_CONNECTION_CLASS(_class : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_SOCKET_CONNECTION(inst : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_SOCKET_CONNECTION_CLASS(_class : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_SOCKET_CONNECTION_GET_CLASS(inst : longint) : longint;

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


function g_socket_connection_get_type:TGType;cdecl;external;
function g_socket_connection_is_connected(connection:PGSocketConnection):Tgboolean;cdecl;external;
function g_socket_connection_connect(connection:PGSocketConnection; address:PGSocketAddress; cancellable:PGCancellable; error:PPGError):Tgboolean;cdecl;external;
procedure g_socket_connection_connect_async(connection:PGSocketConnection; address:PGSocketAddress; cancellable:PGCancellable; callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external;
function g_socket_connection_connect_finish(connection:PGSocketConnection; result:PGAsyncResult; error:PPGError):Tgboolean;cdecl;external;
function g_socket_connection_get_socket(connection:PGSocketConnection):PGSocket;cdecl;external;
function g_socket_connection_get_local_address(connection:PGSocketConnection; error:PPGError):PGSocketAddress;cdecl;external;
function g_socket_connection_get_remote_address(connection:PGSocketConnection; error:PPGError):PGSocketAddress;cdecl;external;
procedure g_socket_connection_factory_register_type(g_type:TGType; family:TGSocketFamily; _type:TGSocketType; protocol:Tgint);cdecl;external;
function g_socket_connection_factory_lookup_type(family:TGSocketFamily; _type:TGSocketType; protocol_id:Tgint):TGType;cdecl;external;
function g_socket_connection_factory_create_connection(socket:PGSocket):PGSocketConnection;cdecl;external;
{$endif}
{ __G_SOCKET_CONNECTION_H__  }

implementation

{ was #define dname def_expr }
function G_TYPE_SOCKET_CONNECTION : longint; { return type might be wrong }
  begin
    G_TYPE_SOCKET_CONNECTION:=g_socket_connection_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_SOCKET_CONNECTION(inst : longint) : longint;
begin
  G_SOCKET_CONNECTION:=G_TYPE_CHECK_INSTANCE_CAST(inst,G_TYPE_SOCKET_CONNECTION,GSocketConnection);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_SOCKET_CONNECTION_CLASS(_class : longint) : longint;
begin
  G_SOCKET_CONNECTION_CLASS:=G_TYPE_CHECK_CLASS_CAST(_class,G_TYPE_SOCKET_CONNECTION,GSocketConnectionClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_SOCKET_CONNECTION(inst : longint) : longint;
begin
  G_IS_SOCKET_CONNECTION:=G_TYPE_CHECK_INSTANCE_TYPE(inst,G_TYPE_SOCKET_CONNECTION);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_SOCKET_CONNECTION_CLASS(_class : longint) : longint;
begin
  G_IS_SOCKET_CONNECTION_CLASS:=G_TYPE_CHECK_CLASS_TYPE(_class,G_TYPE_SOCKET_CONNECTION);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_SOCKET_CONNECTION_GET_CLASS(inst : longint) : longint;
begin
  G_SOCKET_CONNECTION_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(inst,G_TYPE_SOCKET_CONNECTION,GSocketConnectionClass);
end;


end.
