
unit gunixconnection;
interface

{
  Automatically converted by H2Pas 1.0.0 from gunixconnection.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gunixconnection.h
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
PGCredentials  = ^GCredentials;
PGError  = ^GError;
PGUnixConnection  = ^GUnixConnection;
PGUnixConnectionClass  = ^GUnixConnectionClass;
PGUnixConnectionPrivate  = ^GUnixConnectionPrivate;
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

{ was #define dname def_expr }
function G_TYPE_UNIX_CONNECTION : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_UNIX_CONNECTION(inst : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_UNIX_CONNECTION_CLASS(_class : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_UNIX_CONNECTION(inst : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_UNIX_CONNECTION_CLASS(_class : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_UNIX_CONNECTION_GET_CLASS(inst : longint) : longint;

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


function g_unix_connection_get_type:TGType;cdecl;external;
function g_unix_connection_send_fd(connection:PGUnixConnection; fd:Tgint; cancellable:PGCancellable; error:PPGError):Tgboolean;cdecl;external;
function g_unix_connection_receive_fd(connection:PGUnixConnection; cancellable:PGCancellable; error:PPGError):Tgint;cdecl;external;
function g_unix_connection_send_credentials(connection:PGUnixConnection; cancellable:PGCancellable; error:PPGError):Tgboolean;cdecl;external;
procedure g_unix_connection_send_credentials_async(connection:PGUnixConnection; cancellable:PGCancellable; callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external;
function g_unix_connection_send_credentials_finish(connection:PGUnixConnection; result:PGAsyncResult; error:PPGError):Tgboolean;cdecl;external;
function g_unix_connection_receive_credentials(connection:PGUnixConnection; cancellable:PGCancellable; error:PPGError):PGCredentials;cdecl;external;
procedure g_unix_connection_receive_credentials_async(connection:PGUnixConnection; cancellable:PGCancellable; callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external;
function g_unix_connection_receive_credentials_finish(connection:PGUnixConnection; result:PGAsyncResult; error:PPGError):PGCredentials;cdecl;external;
{$endif}
{ __G_UNIX_CONNECTION_H__  }

implementation

{ was #define dname def_expr }
function G_TYPE_UNIX_CONNECTION : longint; { return type might be wrong }
  begin
    G_TYPE_UNIX_CONNECTION:=g_unix_connection_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_UNIX_CONNECTION(inst : longint) : longint;
begin
  G_UNIX_CONNECTION:=G_TYPE_CHECK_INSTANCE_CAST(inst,G_TYPE_UNIX_CONNECTION,GUnixConnection);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_UNIX_CONNECTION_CLASS(_class : longint) : longint;
begin
  G_UNIX_CONNECTION_CLASS:=G_TYPE_CHECK_CLASS_CAST(_class,G_TYPE_UNIX_CONNECTION,GUnixConnectionClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_UNIX_CONNECTION(inst : longint) : longint;
begin
  G_IS_UNIX_CONNECTION:=G_TYPE_CHECK_INSTANCE_TYPE(inst,G_TYPE_UNIX_CONNECTION);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_UNIX_CONNECTION_CLASS(_class : longint) : longint;
begin
  G_IS_UNIX_CONNECTION_CLASS:=G_TYPE_CHECK_CLASS_TYPE(_class,G_TYPE_UNIX_CONNECTION);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_UNIX_CONNECTION_GET_CLASS(inst : longint) : longint;
begin
  G_UNIX_CONNECTION_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(inst,G_TYPE_UNIX_CONNECTION,GUnixConnectionClass);
end;


end.
