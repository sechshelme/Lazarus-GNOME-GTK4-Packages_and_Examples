unit gdtlsserverconnection;

interface

uses
  fp_glib2;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GIO - GLib Input, Output and Streaming Library
 *
 * Copyright © 2010 Red Hat, Inc.
 * Copyright © 2015 Collabora, Ltd.
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
{$ifndef __G_DTLS_SERVER_CONNECTION_H__}
{$define __G_DTLS_SERVER_CONNECTION_H__}
{$if !defined (__GIO_GIO_H_INSIDE__) && !defined (GIO_COMPILATION)}
{$error "Only <gio/gio.h> can be included directly."}
{$endif}
{$include <gio/gdtlsconnection.h>}

type
{*
 * GDtlsServerConnectionInterface:
 * @g_iface: The parent interface.
 *
 * vtable for a #GDtlsServerConnection implementation.
 *
 * Since: 2.48
  }
  PGDtlsServerConnectionInterface = ^TGDtlsServerConnectionInterface;
  TGDtlsServerConnectionInterface = record
      g_iface : TGTypeInterface;
    end;


function g_dtls_server_connection_get_type:TGType;cdecl;external libgio2;
function g_dtls_server_connection_new(base_socket:PGDatagramBased; certificate:PGTlsCertificate; error:PPGError):PGDatagramBased;cdecl;external libgio2;
{$endif}
{ __G_DTLS_SERVER_CONNECTION_H__  }

// === Konventiert am: 26-6-26 19:17:21 ===

function G_TYPE_DTLS_SERVER_CONNECTION : TGType;
function G_DTLS_SERVER_CONNECTION(obj : Pointer) : PGDtlsServerConnection;
function G_IS_DTLS_SERVER_CONNECTION(obj : Pointer) : Tgboolean;
function G_DTLS_SERVER_CONNECTION_GET_INTERFACE(obj : Pointer) : PGDtlsServerConnectionInterface;

implementation

function G_TYPE_DTLS_SERVER_CONNECTION : TGType;
  begin
    G_TYPE_DTLS_SERVER_CONNECTION:=g_dtls_server_connection_get_type;
  end;

function G_DTLS_SERVER_CONNECTION(obj : Pointer) : PGDtlsServerConnection;
begin
  Result := PGDtlsServerConnection(g_type_check_instance_cast(obj, G_TYPE_DTLS_SERVER_CONNECTION));
end;

function G_IS_DTLS_SERVER_CONNECTION(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  G_TYPE_DTLS_SERVER_CONNECTION);
end;

function G_DTLS_SERVER_CONNECTION_GET_INTERFACE(obj : Pointer) : PGDtlsServerConnectionInterface;
begin
  Result := g_type_interface_peek(obj, G_TYPE_DTLS_SERVER_CONNECTION);
end;



end.
