unit gunixconnection;

interface

uses
  fp_glib2;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GIO - GLib Input, Output and Streaming Library
 *
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
 * Authors: Ryan Lortie <desrt@desrt.ca>
  }
{$ifndef __G_UNIX_CONNECTION_H__}
{$define __G_UNIX_CONNECTION_H__}
{$include <gio/gio.h>}

type
  PGUnixConnectionClass = ^TGUnixConnectionClass;
  TGUnixConnectionClass = record
      parent_class : TGSocketConnectionClass;
    end;

  PGUnixConnection = ^TGUnixConnection;
  TGUnixConnection = record
      parent_instance : TGSocketConnection;
      priv : PGUnixConnectionPrivate;
    end;


function g_unix_connection_get_type:TGType;cdecl;external libgio2;
function g_unix_connection_send_fd(connection:PGUnixConnection; fd:Tgint; cancellable:PGCancellable; error:PPGError):Tgboolean;cdecl;external libgio2;
function g_unix_connection_receive_fd(connection:PGUnixConnection; cancellable:PGCancellable; error:PPGError):Tgint;cdecl;external libgio2;
function g_unix_connection_send_credentials(connection:PGUnixConnection; cancellable:PGCancellable; error:PPGError):Tgboolean;cdecl;external libgio2;
procedure g_unix_connection_send_credentials_async(connection:PGUnixConnection; cancellable:PGCancellable; callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external libgio2;
function g_unix_connection_send_credentials_finish(connection:PGUnixConnection; result:PGAsyncResult; error:PPGError):Tgboolean;cdecl;external libgio2;
function g_unix_connection_receive_credentials(connection:PGUnixConnection; cancellable:PGCancellable; error:PPGError):PGCredentials;cdecl;external libgio2;
procedure g_unix_connection_receive_credentials_async(connection:PGUnixConnection; cancellable:PGCancellable; callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external libgio2;
function g_unix_connection_receive_credentials_finish(connection:PGUnixConnection; result:PGAsyncResult; error:PPGError):PGCredentials;cdecl;external libgio2;
{$endif}
{ __G_UNIX_CONNECTION_H__  }

// === Konventiert am: 26-6-26 20:03:30 ===

function G_TYPE_UNIX_CONNECTION : TGType;
function G_UNIX_CONNECTION(obj : Pointer) : PGUnixConnection;
function G_UNIX_CONNECTION_CLASS(klass : Pointer) : PGUnixConnectionClass;
function G_IS_UNIX_CONNECTION(obj : Pointer) : Tgboolean;
function G_IS_UNIX_CONNECTION_CLASS(klass : Pointer) : Tgboolean;
function G_UNIX_CONNECTION_GET_CLASS(obj : Pointer) : PGUnixConnectionClass;

implementation

function G_TYPE_UNIX_CONNECTION : TGType;
  begin
    G_TYPE_UNIX_CONNECTION:=g_unix_connection_get_type;
  end;

function G_UNIX_CONNECTION(obj : Pointer) : PGUnixConnection;
begin
  Result := PGUnixConnection(g_type_check_instance_cast(obj, G_TYPE_UNIX_CONNECTION));
end;

function G_UNIX_CONNECTION_CLASS(klass : Pointer) : PGUnixConnectionClass;
begin
  Result := PGUnixConnectionClass(g_type_check_class_cast(klass, G_TYPE_UNIX_CONNECTION));
end;

function G_IS_UNIX_CONNECTION(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  G_TYPE_UNIX_CONNECTION);
end;

function G_IS_UNIX_CONNECTION_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  G_TYPE_UNIX_CONNECTION);
end;

function G_UNIX_CONNECTION_GET_CLASS(obj : Pointer) : PGUnixConnectionClass;
begin
  Result := PGUnixConnectionClass(PGTypeInstance(obj)^.g_class);
end;



end.
