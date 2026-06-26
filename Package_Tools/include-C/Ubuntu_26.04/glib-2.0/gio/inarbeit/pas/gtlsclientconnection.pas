unit gtlsclientconnection;

interface

uses
  fp_glib2;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GIO - GLib Input, Output and Streaming Library
 *
 * Copyright (C) 2010 Red Hat, Inc.
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
  }
{$ifndef __G_TLS_CLIENT_CONNECTION_H__}
{$define __G_TLS_CLIENT_CONNECTION_H__}
{$if !defined (__GIO_GIO_H_INSIDE__) && !defined (GIO_COMPILATION)}
{$error "Only <gio/gio.h> can be included directly."}
{$endif}
{$include <gio/gtlsconnection.h>}

type
{*
 * GTlsClientConnectionInterface:
 * @g_iface: The parent interface.
 * @copy_session_state: Copies session state from one #GTlsClientConnection to another.
 *
 * vtable for a #GTlsClientConnection implementation.
 *
 * Since: 2.26
  }
  PGTlsClientConnectionInterface = ^TGTlsClientConnectionInterface;
  TGTlsClientConnectionInterface = record
      g_iface : TGTypeInterface;
      copy_session_state : procedure (conn:PGTlsClientConnection; source:PGTlsClientConnection);cdecl;
    end;


function g_tls_client_connection_get_type:TGType;cdecl;external libgio2;
function g_tls_client_connection_new(base_io_stream:PGIOStream; server_identity:PGSocketConnectable; error:PPGError):PGIOStream;cdecl;external libgio2;
{xxxxxGLIB_DEPRECATED_IN_2_72 }
function g_tls_client_connection_get_validation_flags(conn:PGTlsClientConnection):TGTlsCertificateFlags;cdecl;external libgio2;
{xxxxxGLIB_DEPRECATED_IN_2_72 }
procedure g_tls_client_connection_set_validation_flags(conn:PGTlsClientConnection; flags:TGTlsCertificateFlags);cdecl;external libgio2;
function g_tls_client_connection_get_server_identity(conn:PGTlsClientConnection):PGSocketConnectable;cdecl;external libgio2;
procedure g_tls_client_connection_set_server_identity(conn:PGTlsClientConnection; identity:PGSocketConnectable);cdecl;external libgio2;
{xxxxxGLIB_DEPRECATED_IN_2_56 }
function g_tls_client_connection_get_use_ssl3(conn:PGTlsClientConnection):Tgboolean;cdecl;external libgio2;
{xxxxxGLIB_DEPRECATED_IN_2_56 }
procedure g_tls_client_connection_set_use_ssl3(conn:PGTlsClientConnection; use_ssl3:Tgboolean);cdecl;external libgio2;
function g_tls_client_connection_get_accepted_cas(conn:PGTlsClientConnection):PGList;cdecl;external libgio2;
procedure g_tls_client_connection_copy_session_state(conn:PGTlsClientConnection; source:PGTlsClientConnection);cdecl;external libgio2;
{$endif}
{ __G_TLS_CLIENT_CONNECTION_H__  }

// === Konventiert am: 26-6-26 20:04:23 ===

function G_TYPE_TLS_CLIENT_CONNECTION : TGType;
function G_TLS_CLIENT_CONNECTION(obj : Pointer) : PGTlsClientConnection;
function G_IS_TLS_CLIENT_CONNECTION(obj : Pointer) : Tgboolean;
function G_TLS_CLIENT_CONNECTION_GET_INTERFACE(obj : Pointer) : PGTlsClientConnectionInterface;

implementation

function G_TYPE_TLS_CLIENT_CONNECTION : TGType;
  begin
    G_TYPE_TLS_CLIENT_CONNECTION:=g_tls_client_connection_get_type;
  end;

function G_TLS_CLIENT_CONNECTION(obj : Pointer) : PGTlsClientConnection;
begin
  Result := PGTlsClientConnection(g_type_check_instance_cast(obj, G_TYPE_TLS_CLIENT_CONNECTION));
end;

function G_IS_TLS_CLIENT_CONNECTION(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  G_TYPE_TLS_CLIENT_CONNECTION);
end;

function G_TLS_CLIENT_CONNECTION_GET_INTERFACE(obj : Pointer) : PGTlsClientConnectionInterface;
begin
  Result := g_type_interface_peek(obj, G_TYPE_TLS_CLIENT_CONNECTION);
end;



end.
