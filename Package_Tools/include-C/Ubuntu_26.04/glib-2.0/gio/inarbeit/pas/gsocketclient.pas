unit gsocketclient;

interface

uses
  fp_glib2;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GIO - GLib Input, Output and Streaming Library
 *
 * Copyright © 2008, 2009 Codethink Limited
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
 * Authors: Ryan Lortie <desrt@desrt.ca>
 *          Alexander Larsson <alexl@redhat.com>
  }
{$ifndef __G_SOCKET_CLIENT_H__}
{$define __G_SOCKET_CLIENT_H__}
{$if !defined (__GIO_GIO_H_INSIDE__) && !defined (GIO_COMPILATION)}
{$error "Only <gio/gio.h> can be included directly."}
{$endif}
{$include <gio/giotypes.h>}

type
{ Padding for future expansion  }
  PGSocketClientClass = ^TGSocketClientClass;
  TGSocketClientClass = record
      parent_class : TGObjectClass;
      event : procedure (client:PGSocketClient; event:TGSocketClientEvent; connectable:PGSocketConnectable; connection:PGIOStream);cdecl;
      _g_reserved1 : procedure ;cdecl;
      _g_reserved2 : procedure ;cdecl;
      _g_reserved3 : procedure ;cdecl;
      _g_reserved4 : procedure ;cdecl;
    end;

  PGSocketClient = ^TGSocketClient;
  TGSocketClient = record
      parent_instance : TGObject;
      priv : PGSocketClientPrivate;
    end;


function g_socket_client_get_type:TGType;cdecl;external libgio2;
function g_socket_client_new:PGSocketClient;cdecl;external libgio2;
function g_socket_client_get_family(client:PGSocketClient):TGSocketFamily;cdecl;external libgio2;
procedure g_socket_client_set_family(client:PGSocketClient; family:TGSocketFamily);cdecl;external libgio2;
function g_socket_client_get_socket_type(client:PGSocketClient):TGSocketType;cdecl;external libgio2;
procedure g_socket_client_set_socket_type(client:PGSocketClient; _type:TGSocketType);cdecl;external libgio2;
function g_socket_client_get_protocol(client:PGSocketClient):TGSocketProtocol;cdecl;external libgio2;
procedure g_socket_client_set_protocol(client:PGSocketClient; protocol:TGSocketProtocol);cdecl;external libgio2;
function g_socket_client_get_local_address(client:PGSocketClient):PGSocketAddress;cdecl;external libgio2;
procedure g_socket_client_set_local_address(client:PGSocketClient; address:PGSocketAddress);cdecl;external libgio2;
function g_socket_client_get_timeout(client:PGSocketClient):Tguint;cdecl;external libgio2;
procedure g_socket_client_set_timeout(client:PGSocketClient; timeout:Tguint);cdecl;external libgio2;
function g_socket_client_get_enable_proxy(client:PGSocketClient):Tgboolean;cdecl;external libgio2;
procedure g_socket_client_set_enable_proxy(client:PGSocketClient; enable:Tgboolean);cdecl;external libgio2;
function g_socket_client_get_tls(client:PGSocketClient):Tgboolean;cdecl;external libgio2;
procedure g_socket_client_set_tls(client:PGSocketClient; tls:Tgboolean);cdecl;external libgio2;
{xxxxxGLIB_DEPRECATED_IN_2_72 }
function g_socket_client_get_tls_validation_flags(client:PGSocketClient):TGTlsCertificateFlags;cdecl;external libgio2;
{xxxxxGLIB_DEPRECATED_IN_2_72 }
procedure g_socket_client_set_tls_validation_flags(client:PGSocketClient; flags:TGTlsCertificateFlags);cdecl;external libgio2;
function g_socket_client_get_proxy_resolver(client:PGSocketClient):PGProxyResolver;cdecl;external libgio2;
procedure g_socket_client_set_proxy_resolver(client:PGSocketClient; proxy_resolver:PGProxyResolver);cdecl;external libgio2;
function g_socket_client_connect(client:PGSocketClient; connectable:PGSocketConnectable; cancellable:PGCancellable; error:PPGError):PGSocketConnection;cdecl;external libgio2;
function g_socket_client_connect_to_host(client:PGSocketClient; host_and_port:Pgchar; default_port:Tguint16; cancellable:PGCancellable; error:PPGError):PGSocketConnection;cdecl;external libgio2;
function g_socket_client_connect_to_service(client:PGSocketClient; domain:Pgchar; service:Pgchar; cancellable:PGCancellable; error:PPGError):PGSocketConnection;cdecl;external libgio2;
function g_socket_client_connect_to_uri(client:PGSocketClient; uri:Pgchar; default_port:Tguint16; cancellable:PGCancellable; error:PPGError):PGSocketConnection;cdecl;external libgio2;
procedure g_socket_client_connect_async(client:PGSocketClient; connectable:PGSocketConnectable; cancellable:PGCancellable; callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external libgio2;
function g_socket_client_connect_finish(client:PGSocketClient; result:PGAsyncResult; error:PPGError):PGSocketConnection;cdecl;external libgio2;
procedure g_socket_client_connect_to_host_async(client:PGSocketClient; host_and_port:Pgchar; default_port:Tguint16; cancellable:PGCancellable; callback:TGAsyncReadyCallback; 
            user_data:Tgpointer);cdecl;external libgio2;
function g_socket_client_connect_to_host_finish(client:PGSocketClient; result:PGAsyncResult; error:PPGError):PGSocketConnection;cdecl;external libgio2;
procedure g_socket_client_connect_to_service_async(client:PGSocketClient; domain:Pgchar; service:Pgchar; cancellable:PGCancellable; callback:TGAsyncReadyCallback; 
            user_data:Tgpointer);cdecl;external libgio2;
function g_socket_client_connect_to_service_finish(client:PGSocketClient; result:PGAsyncResult; error:PPGError):PGSocketConnection;cdecl;external libgio2;
procedure g_socket_client_connect_to_uri_async(client:PGSocketClient; uri:Pgchar; default_port:Tguint16; cancellable:PGCancellable; callback:TGAsyncReadyCallback; 
            user_data:Tgpointer);cdecl;external libgio2;
function g_socket_client_connect_to_uri_finish(client:PGSocketClient; result:PGAsyncResult; error:PPGError):PGSocketConnection;cdecl;external libgio2;
procedure g_socket_client_add_application_proxy(client:PGSocketClient; protocol:Pgchar);cdecl;external libgio2;
{$endif}
{ __G_SOCKET_CLIENT_H___  }

// === Konventiert am: 26-6-26 19:55:39 ===

function G_TYPE_SOCKET_CLIENT : TGType;
function G_SOCKET_CLIENT(obj : Pointer) : PGSocketClient;
function G_SOCKET_CLIENT_CLASS(klass : Pointer) : PGSocketClientClass;
function G_IS_SOCKET_CLIENT(obj : Pointer) : Tgboolean;
function G_IS_SOCKET_CLIENT_CLASS(klass : Pointer) : Tgboolean;
function G_SOCKET_CLIENT_GET_CLASS(obj : Pointer) : PGSocketClientClass;

implementation

function G_TYPE_SOCKET_CLIENT : TGType;
  begin
    G_TYPE_SOCKET_CLIENT:=g_socket_client_get_type;
  end;

function G_SOCKET_CLIENT(obj : Pointer) : PGSocketClient;
begin
  Result := PGSocketClient(g_type_check_instance_cast(obj, G_TYPE_SOCKET_CLIENT));
end;

function G_SOCKET_CLIENT_CLASS(klass : Pointer) : PGSocketClientClass;
begin
  Result := PGSocketClientClass(g_type_check_class_cast(klass, G_TYPE_SOCKET_CLIENT));
end;

function G_IS_SOCKET_CLIENT(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  G_TYPE_SOCKET_CLIENT);
end;

function G_IS_SOCKET_CLIENT_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  G_TYPE_SOCKET_CLIENT);
end;

function G_SOCKET_CLIENT_GET_CLASS(obj : Pointer) : PGSocketClientClass;
begin
  Result := PGSocketClientClass(PGTypeInstance(obj)^.g_class);
end;



end.
