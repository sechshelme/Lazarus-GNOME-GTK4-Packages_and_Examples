unit gtcpconnection;

interface

uses
  fp_glib2;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GIO - GLib Input, Output and Streaming Library
 *
 * Copyright © 2008, 2009 Codethink Limited
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
  }
{$ifndef __G_TCP_CONNECTION_H__}
{$define __G_TCP_CONNECTION_H__}
{$if !defined (__GIO_GIO_H_INSIDE__) && !defined (GIO_COMPILATION)}
{$error "Only <gio/gio.h> can be included directly."}
{$endif}
{$include <gio/gsocketconnection.h>}

type
  PGTcpConnectionClass = ^TGTcpConnectionClass;
  TGTcpConnectionClass = record
      parent_class : TGSocketConnectionClass;
    end;

  PGTcpConnection = ^TGTcpConnection;
  TGTcpConnection = record
      parent_instance : TGSocketConnection;
      priv : PGTcpConnectionPrivate;
    end;


function g_tcp_connection_get_type:TGType;cdecl;external libgio2;
procedure g_tcp_connection_set_graceful_disconnect(connection:PGTcpConnection; graceful_disconnect:Tgboolean);cdecl;external libgio2;
function g_tcp_connection_get_graceful_disconnect(connection:PGTcpConnection):Tgboolean;cdecl;external libgio2;
{$endif}
{ __G_TCP_CONNECTION_H__  }

// === Konventiert am: 26-6-26 19:59:41 ===

function G_TYPE_TCP_CONNECTION : TGType;
function G_TCP_CONNECTION(obj : Pointer) : PGTcpConnection;
function G_TCP_CONNECTION_CLASS(klass : Pointer) : PGTcpConnectionClass;
function G_IS_TCP_CONNECTION(obj : Pointer) : Tgboolean;
function G_IS_TCP_CONNECTION_CLASS(klass : Pointer) : Tgboolean;
function G_TCP_CONNECTION_GET_CLASS(obj : Pointer) : PGTcpConnectionClass;

implementation

function G_TYPE_TCP_CONNECTION : TGType;
  begin
    G_TYPE_TCP_CONNECTION:=g_tcp_connection_get_type;
  end;

function G_TCP_CONNECTION(obj : Pointer) : PGTcpConnection;
begin
  Result := PGTcpConnection(g_type_check_instance_cast(obj, G_TYPE_TCP_CONNECTION));
end;

function G_TCP_CONNECTION_CLASS(klass : Pointer) : PGTcpConnectionClass;
begin
  Result := PGTcpConnectionClass(g_type_check_class_cast(klass, G_TYPE_TCP_CONNECTION));
end;

function G_IS_TCP_CONNECTION(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  G_TYPE_TCP_CONNECTION);
end;

function G_IS_TCP_CONNECTION_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  G_TYPE_TCP_CONNECTION);
end;

function G_TCP_CONNECTION_GET_CLASS(obj : Pointer) : PGTcpConnectionClass;
begin
  Result := PGTcpConnectionClass(PGTypeInstance(obj)^.g_class);
end;



end.
