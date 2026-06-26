
unit gtlsserverconnection;
interface

{
  Automatically converted by H2Pas 1.0.0 from gtlsserverconnection.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gtlsserverconnection.h
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
PGError  = ^GError;
PGIOStream  = ^GIOStream;
PGTlsCertificate  = ^GTlsCertificate;
PGTlsServerConnectionInterface  = ^GTlsServerConnectionInterface;
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
{$ifndef __G_TLS_SERVER_CONNECTION_H__}
{$define __G_TLS_SERVER_CONNECTION_H__}
{$if !defined (__GIO_GIO_H_INSIDE__) && !defined (GIO_COMPILATION)}
{$error "Only <gio/gio.h> can be included directly."}
{$endif}
{$include <gio/gtlsconnection.h>}

{ was #define dname def_expr }
function G_TYPE_TLS_SERVER_CONNECTION : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_TLS_SERVER_CONNECTION(inst : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_TLS_SERVER_CONNECTION(inst : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_TLS_SERVER_CONNECTION_GET_INTERFACE(inst : longint) : longint;

type
{*
 * GTlsServerConnectionInterface:
 * @g_iface: The parent interface.
 *
 * vtable for a #GTlsServerConnection implementation.
 *
 * Since: 2.26
  }
  PGTlsServerConnectionInterface = ^TGTlsServerConnectionInterface;
  TGTlsServerConnectionInterface = record
      g_iface : TGTypeInterface;
    end;


function g_tls_server_connection_get_type:TGType;cdecl;external;
function g_tls_server_connection_new(base_io_stream:PGIOStream; certificate:PGTlsCertificate; error:PPGError):PGIOStream;cdecl;external;
{$endif}
{ __G_TLS_SERVER_CONNECTION_H__  }

implementation

{ was #define dname def_expr }
function G_TYPE_TLS_SERVER_CONNECTION : longint; { return type might be wrong }
  begin
    G_TYPE_TLS_SERVER_CONNECTION:=g_tls_server_connection_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_TLS_SERVER_CONNECTION(inst : longint) : longint;
begin
  G_TLS_SERVER_CONNECTION:=G_TYPE_CHECK_INSTANCE_CAST(inst,G_TYPE_TLS_SERVER_CONNECTION,GTlsServerConnection);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_TLS_SERVER_CONNECTION(inst : longint) : longint;
begin
  G_IS_TLS_SERVER_CONNECTION:=G_TYPE_CHECK_INSTANCE_TYPE(inst,G_TYPE_TLS_SERVER_CONNECTION);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_TLS_SERVER_CONNECTION_GET_INTERFACE(inst : longint) : longint;
begin
  G_TLS_SERVER_CONNECTION_GET_INTERFACE:=G_TYPE_INSTANCE_GET_INTERFACE(inst,G_TYPE_TLS_SERVER_CONNECTION,GTlsServerConnectionInterface);
end;


end.
