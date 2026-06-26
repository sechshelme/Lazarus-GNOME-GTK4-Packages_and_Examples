
unit gsocketlistener;
interface

{
  Automatically converted by H2Pas 1.0.0 from gsocketlistener.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gsocketlistener.h
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
PGObject  = ^GObject;
PGSocket  = ^GSocket;
PGSocketAddress  = ^GSocketAddress;
PGSocketConnection  = ^GSocketConnection;
PGSocketListener  = ^GSocketListener;
PGSocketListenerClass  = ^GSocketListenerClass;
PGSocketListenerPrivate  = ^GSocketListenerPrivate;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GIO - GLib Input, Output and Streaming Library
 *
 * Copyright © 2008 Christian Kellner, Samuel Cormier-Iijima
 * Copyright © 2009 Codethink Limited
 * Copyright © 2009 Red Hat, Inc
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
{$ifndef __G_SOCKET_LISTENER_H__}
{$define __G_SOCKET_LISTENER_H__}
{$if !defined (__GIO_GIO_H_INSIDE__) && !defined (GIO_COMPILATION)}
{$error "Only <gio/gio.h> can be included directly."}
{$endif}
{$include <gio/giotypes.h>}

{ was #define dname def_expr }
function G_TYPE_SOCKET_LISTENER : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_SOCKET_LISTENER(inst : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_SOCKET_LISTENER_CLASS(_class : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_SOCKET_LISTENER(inst : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_SOCKET_LISTENER_CLASS(_class : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_SOCKET_LISTENER_GET_CLASS(inst : longint) : longint;

type
{*
 * GSocketListenerClass:
 * @changed: virtual method called when the set of socket listened to changes
 *
 * Class structure for #GSocketListener.
 * }
{ Padding for future expansion  }
  PGSocketListenerClass = ^TGSocketListenerClass;
  TGSocketListenerClass = record
      parent_class : TGObjectClass;
      changed : procedure (listener:PGSocketListener);cdecl;
      event : procedure (listener:PGSocketListener; event:TGSocketListenerEvent; socket:PGSocket);cdecl;
      _g_reserved2 : procedure ;cdecl;
      _g_reserved3 : procedure ;cdecl;
      _g_reserved4 : procedure ;cdecl;
      _g_reserved5 : procedure ;cdecl;
      _g_reserved6 : procedure ;cdecl;
    end;

  PGSocketListener = ^TGSocketListener;
  TGSocketListener = record
      parent_instance : TGObject;
      priv : PGSocketListenerPrivate;
    end;


function g_socket_listener_get_type:TGType;cdecl;external;
function g_socket_listener_new:PGSocketListener;cdecl;external;
procedure g_socket_listener_set_backlog(listener:PGSocketListener; listen_backlog:longint);cdecl;external;
function g_socket_listener_add_socket(listener:PGSocketListener; socket:PGSocket; source_object:PGObject; error:PPGError):Tgboolean;cdecl;external;
function g_socket_listener_add_address(listener:PGSocketListener; address:PGSocketAddress; _type:TGSocketType; protocol:TGSocketProtocol; source_object:PGObject; 
           effective_address:PPGSocketAddress; error:PPGError):Tgboolean;cdecl;external;
function g_socket_listener_add_inet_port(listener:PGSocketListener; port:Tguint16; source_object:PGObject; error:PPGError):Tgboolean;cdecl;external;
function g_socket_listener_add_any_inet_port(listener:PGSocketListener; source_object:PGObject; error:PPGError):Tguint16;cdecl;external;
function g_socket_listener_accept_socket(listener:PGSocketListener; source_object:PPGObject; cancellable:PGCancellable; error:PPGError):PGSocket;cdecl;external;
procedure g_socket_listener_accept_socket_async(listener:PGSocketListener; cancellable:PGCancellable; callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external;
function g_socket_listener_accept_socket_finish(listener:PGSocketListener; result:PGAsyncResult; source_object:PPGObject; error:PPGError):PGSocket;cdecl;external;
function g_socket_listener_accept(listener:PGSocketListener; source_object:PPGObject; cancellable:PGCancellable; error:PPGError):PGSocketConnection;cdecl;external;
procedure g_socket_listener_accept_async(listener:PGSocketListener; cancellable:PGCancellable; callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external;
function g_socket_listener_accept_finish(listener:PGSocketListener; result:PGAsyncResult; source_object:PPGObject; error:PPGError):PGSocketConnection;cdecl;external;
procedure g_socket_listener_close(listener:PGSocketListener);cdecl;external;
{$endif}
{ __G_SOCKET_LISTENER_H__  }

implementation

{ was #define dname def_expr }
function G_TYPE_SOCKET_LISTENER : longint; { return type might be wrong }
  begin
    G_TYPE_SOCKET_LISTENER:=g_socket_listener_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_SOCKET_LISTENER(inst : longint) : longint;
begin
  G_SOCKET_LISTENER:=G_TYPE_CHECK_INSTANCE_CAST(inst,G_TYPE_SOCKET_LISTENER,GSocketListener);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_SOCKET_LISTENER_CLASS(_class : longint) : longint;
begin
  G_SOCKET_LISTENER_CLASS:=G_TYPE_CHECK_CLASS_CAST(_class,G_TYPE_SOCKET_LISTENER,GSocketListenerClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_SOCKET_LISTENER(inst : longint) : longint;
begin
  G_IS_SOCKET_LISTENER:=G_TYPE_CHECK_INSTANCE_TYPE(inst,G_TYPE_SOCKET_LISTENER);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_SOCKET_LISTENER_CLASS(_class : longint) : longint;
begin
  G_IS_SOCKET_LISTENER_CLASS:=G_TYPE_CHECK_CLASS_TYPE(_class,G_TYPE_SOCKET_LISTENER);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_SOCKET_LISTENER_GET_CLASS(inst : longint) : longint;
begin
  G_SOCKET_LISTENER_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(inst,G_TYPE_SOCKET_LISTENER,GSocketListenerClass);
end;


end.
