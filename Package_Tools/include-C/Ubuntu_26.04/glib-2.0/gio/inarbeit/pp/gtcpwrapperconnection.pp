
unit gtcpwrapperconnection;
interface

{
  Automatically converted by H2Pas 1.0.0 from gtcpwrapperconnection.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gtcpwrapperconnection.h
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
PGIOStream  = ^GIOStream;
PGSocket  = ^GSocket;
PGSocketConnection  = ^GSocketConnection;
PGTcpWrapperConnection  = ^GTcpWrapperConnection;
PGTcpWrapperConnectionClass  = ^GTcpWrapperConnectionClass;
PGTcpWrapperConnectionPrivate  = ^GTcpWrapperConnectionPrivate;
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

{ was #define dname def_expr }
function G_TYPE_TCP_WRAPPER_CONNECTION : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_TCP_WRAPPER_CONNECTION(inst : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_TCP_WRAPPER_CONNECTION_CLASS(_class : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_TCP_WRAPPER_CONNECTION(inst : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_TCP_WRAPPER_CONNECTION_CLASS(_class : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_TCP_WRAPPER_CONNECTION_GET_CLASS(inst : longint) : longint;

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


function g_tcp_wrapper_connection_get_type:TGType;cdecl;external;
function g_tcp_wrapper_connection_new(base_io_stream:PGIOStream; socket:PGSocket):PGSocketConnection;cdecl;external;
function g_tcp_wrapper_connection_get_base_io_stream(conn:PGTcpWrapperConnection):PGIOStream;cdecl;external;
{$endif}
{ __G_TCP_WRAPPER_CONNECTION_H__  }

implementation

{ was #define dname def_expr }
function G_TYPE_TCP_WRAPPER_CONNECTION : longint; { return type might be wrong }
  begin
    G_TYPE_TCP_WRAPPER_CONNECTION:=g_tcp_wrapper_connection_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_TCP_WRAPPER_CONNECTION(inst : longint) : longint;
begin
  G_TCP_WRAPPER_CONNECTION:=G_TYPE_CHECK_INSTANCE_CAST(inst,G_TYPE_TCP_WRAPPER_CONNECTION,GTcpWrapperConnection);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_TCP_WRAPPER_CONNECTION_CLASS(_class : longint) : longint;
begin
  G_TCP_WRAPPER_CONNECTION_CLASS:=G_TYPE_CHECK_CLASS_CAST(_class,G_TYPE_TCP_WRAPPER_CONNECTION,GTcpWrapperConnectionClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_TCP_WRAPPER_CONNECTION(inst : longint) : longint;
begin
  G_IS_TCP_WRAPPER_CONNECTION:=G_TYPE_CHECK_INSTANCE_TYPE(inst,G_TYPE_TCP_WRAPPER_CONNECTION);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_TCP_WRAPPER_CONNECTION_CLASS(_class : longint) : longint;
begin
  G_IS_TCP_WRAPPER_CONNECTION_CLASS:=G_TYPE_CHECK_CLASS_TYPE(_class,G_TYPE_TCP_WRAPPER_CONNECTION);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_TCP_WRAPPER_CONNECTION_GET_CLASS(inst : longint) : longint;
begin
  G_TCP_WRAPPER_CONNECTION_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(inst,G_TYPE_TCP_WRAPPER_CONNECTION,GTcpWrapperConnectionClass);
end;


end.
