unit gtcpwrapperconnection;

interface

uses
  fp_glib2;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GIO - GLib Input, Output and Streaming Library
 * Copyright © 2010 Collabora Ltd.
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
 * Authors: Nicolas Dufresne <nicolas.dufresne@collabora.co.uk>
 *
  }
{$ifndef __G_TCP_WRAPPER_CONNECTION_H__}
{$define __G_TCP_WRAPPER_CONNECTION_H__}
{$if !defined (__GIO_GIO_H_INSIDE__) && !defined (GIO_COMPILATION)}
{$error "Only <gio/gio.h> can be included directly."}
{$endif}
{$include <gio/gtcpconnection.h>}

type
  PGTcpWrapperConnectionClass = ^TGTcpWrapperConnectionClass;
  TGTcpWrapperConnectionClass = record
      parent_class : TGTcpConnectionClass;
    end;

  PGTcpWrapperConnection = ^TGTcpWrapperConnection;
  TGTcpWrapperConnection = record
      parent_instance : TGTcpConnection;
      priv : PGTcpWrapperConnectionPrivate;
    end;


function g_tcp_wrapper_connection_get_type:TGType;cdecl;external libgio2;
function g_tcp_wrapper_connection_new(base_io_stream:PGIOStream; socket:PGSocket):PGSocketConnection;cdecl;external libgio2;
function g_tcp_wrapper_connection_get_base_io_stream(conn:PGTcpWrapperConnection):PGIOStream;cdecl;external libgio2;
{$endif}
{ __G_TCP_WRAPPER_CONNECTION_H__  }

// === Konventiert am: 26-6-26 19:59:38 ===

function G_TYPE_TCP_WRAPPER_CONNECTION : TGType;
function G_TCP_WRAPPER_CONNECTION(obj : Pointer) : PGTcpWrapperConnection;
function G_TCP_WRAPPER_CONNECTION_CLASS(klass : Pointer) : PGTcpWrapperConnectionClass;
function G_IS_TCP_WRAPPER_CONNECTION(obj : Pointer) : Tgboolean;
function G_IS_TCP_WRAPPER_CONNECTION_CLASS(klass : Pointer) : Tgboolean;
function G_TCP_WRAPPER_CONNECTION_GET_CLASS(obj : Pointer) : PGTcpWrapperConnectionClass;

implementation

function G_TYPE_TCP_WRAPPER_CONNECTION : TGType;
  begin
    G_TYPE_TCP_WRAPPER_CONNECTION:=g_tcp_wrapper_connection_get_type;
  end;

function G_TCP_WRAPPER_CONNECTION(obj : Pointer) : PGTcpWrapperConnection;
begin
  Result := PGTcpWrapperConnection(g_type_check_instance_cast(obj, G_TYPE_TCP_WRAPPER_CONNECTION));
end;

function G_TCP_WRAPPER_CONNECTION_CLASS(klass : Pointer) : PGTcpWrapperConnectionClass;
begin
  Result := PGTcpWrapperConnectionClass(g_type_check_class_cast(klass, G_TYPE_TCP_WRAPPER_CONNECTION));
end;

function G_IS_TCP_WRAPPER_CONNECTION(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  G_TYPE_TCP_WRAPPER_CONNECTION);
end;

function G_IS_TCP_WRAPPER_CONNECTION_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  G_TYPE_TCP_WRAPPER_CONNECTION);
end;

function G_TCP_WRAPPER_CONNECTION_GET_CLASS(obj : Pointer) : PGTcpWrapperConnectionClass;
begin
  Result := PGTcpWrapperConnectionClass(PGTypeInstance(obj)^.g_class);
end;



end.
