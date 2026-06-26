
unit gdtlsclientconnection;
interface

{
  Automatically converted by H2Pas 1.0.0 from gdtlsclientconnection.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gdtlsclientconnection.h
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
PGDatagramBased  = ^GDatagramBased;
PGDtlsClientConnection  = ^GDtlsClientConnection;
PGDtlsClientConnectionInterface  = ^GDtlsClientConnectionInterface;
PGError  = ^GError;
PGList  = ^GList;
PGSocketConnectable  = ^GSocketConnectable;
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
{$ifndef __G_DTLS_CLIENT_CONNECTION_H__}
{$define __G_DTLS_CLIENT_CONNECTION_H__}
{$if !defined (__GIO_GIO_H_INSIDE__) && !defined (GIO_COMPILATION)}
{$error "Only <gio/gio.h> can be included directly."}
{$endif}
{$include <gio/gdtlsconnection.h>}

{ was #define dname def_expr }
function G_TYPE_DTLS_CLIENT_CONNECTION : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_DTLS_CLIENT_CONNECTION(inst : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_DTLS_CLIENT_CONNECTION(inst : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_DTLS_CLIENT_CONNECTION_GET_INTERFACE(inst : longint) : longint;

type
{*
 * GDtlsClientConnectionInterface:
 * @g_iface: The parent interface.
 *
 * vtable for a #GDtlsClientConnection implementation.
 *
 * Since: 2.48
  }
  PGDtlsClientConnectionInterface = ^TGDtlsClientConnectionInterface;
  TGDtlsClientConnectionInterface = record
      g_iface : TGTypeInterface;
    end;


function g_dtls_client_connection_get_type:TGType;cdecl;external;
function g_dtls_client_connection_new(base_socket:PGDatagramBased; server_identity:PGSocketConnectable; error:PPGError):PGDatagramBased;cdecl;external;
function g_dtls_client_connection_get_validation_flags(conn:PGDtlsClientConnection):TGTlsCertificateFlags;cdecl;external;
procedure g_dtls_client_connection_set_validation_flags(conn:PGDtlsClientConnection; flags:TGTlsCertificateFlags);cdecl;external;
function g_dtls_client_connection_get_server_identity(conn:PGDtlsClientConnection):PGSocketConnectable;cdecl;external;
procedure g_dtls_client_connection_set_server_identity(conn:PGDtlsClientConnection; identity:PGSocketConnectable);cdecl;external;
function g_dtls_client_connection_get_accepted_cas(conn:PGDtlsClientConnection):PGList;cdecl;external;
{$endif}
{ __G_DTLS_CLIENT_CONNECTION_H__  }

implementation

{ was #define dname def_expr }
function G_TYPE_DTLS_CLIENT_CONNECTION : longint; { return type might be wrong }
  begin
    G_TYPE_DTLS_CLIENT_CONNECTION:=g_dtls_client_connection_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_DTLS_CLIENT_CONNECTION(inst : longint) : longint;
begin
  G_DTLS_CLIENT_CONNECTION:=G_TYPE_CHECK_INSTANCE_CAST(inst,G_TYPE_DTLS_CLIENT_CONNECTION,GDtlsClientConnection);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_DTLS_CLIENT_CONNECTION(inst : longint) : longint;
begin
  G_IS_DTLS_CLIENT_CONNECTION:=G_TYPE_CHECK_INSTANCE_TYPE(inst,G_TYPE_DTLS_CLIENT_CONNECTION);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_DTLS_CLIENT_CONNECTION_GET_INTERFACE(inst : longint) : longint;
begin
  G_DTLS_CLIENT_CONNECTION_GET_INTERFACE:=G_TYPE_INSTANCE_GET_INTERFACE(inst,G_TYPE_DTLS_CLIENT_CONNECTION,GDtlsClientConnectionInterface);
end;


end.
