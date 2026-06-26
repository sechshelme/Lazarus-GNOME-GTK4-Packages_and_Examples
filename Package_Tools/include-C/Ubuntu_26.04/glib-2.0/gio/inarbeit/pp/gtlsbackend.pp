
unit gtlsbackend;
interface

{
  Automatically converted by H2Pas 1.0.0 from gtlsbackend.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gtlsbackend.h
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
PGTlsBackend  = ^GTlsBackend;
PGTlsBackendInterface  = ^GTlsBackendInterface;
PGTlsDatabase  = ^GTlsDatabase;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GIO - GLib Input, Output and Streaming Library
 *
 * Copyright (C) 2010 Red Hat, Inc.
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
{$ifndef __G_TLS_BACKEND_H__}
{$define __G_TLS_BACKEND_H__}
{$if !defined (__GIO_GIO_H_INSIDE__) && !defined (GIO_COMPILATION)}
{$error "Only <gio/gio.h> can be included directly."}
{$endif}
{$include <gio/giotypes.h>}
{*
 * G_TLS_BACKEND_EXTENSION_POINT_NAME:
 *
 * Extension point for TLS functionality via #GTlsBackend.
 * See [Extending GIO](overview.html#extending-gio).
  }

const
  G_TLS_BACKEND_EXTENSION_POINT_NAME = 'gio-tls-backend';  

{ was #define dname def_expr }
function G_TYPE_TLS_BACKEND : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_TLS_BACKEND(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_TLS_BACKEND(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_TLS_BACKEND_GET_INTERFACE(obj : longint) : longint;

type
{*
 * GTlsBackendInterface:
 * @g_iface: The parent interface.
 * @supports_tls: returns whether the backend supports TLS.
 * @supports_dtls: returns whether the backend supports DTLS
 * @get_default_database: returns a default #GTlsDatabase instance.
 * @get_certificate_type: returns the #GTlsCertificate implementation type
 * @get_client_connection_type: returns the #GTlsClientConnection implementation type
 * @get_server_connection_type: returns the #GTlsServerConnection implementation type
 * @get_file_database_type: returns the #GTlsFileDatabase implementation type.
 * @get_dtls_client_connection_type: returns the #GDtlsClientConnection implementation type
 * @get_dtls_server_connection_type: returns the #GDtlsServerConnection implementation type
 *
 * Provides an interface for describing TLS-related types.
 *
 * Since: 2.28
  }
{ methods  }
  PGTlsBackendInterface = ^TGTlsBackendInterface;
  TGTlsBackendInterface = record
      g_iface : TGTypeInterface;
      supports_tls : function (backend:PGTlsBackend):Tgboolean;cdecl;
      get_certificate_type : function :TGType;cdecl;
      get_client_connection_type : function :TGType;cdecl;
      get_server_connection_type : function :TGType;cdecl;
      get_file_database_type : function :TGType;cdecl;
      get_default_database : function (backend:PGTlsBackend):PGTlsDatabase;cdecl;
      supports_dtls : function (backend:PGTlsBackend):Tgboolean;cdecl;
      get_dtls_client_connection_type : function :TGType;cdecl;
      get_dtls_server_connection_type : function :TGType;cdecl;
    end;


function g_tls_backend_get_type:TGType;cdecl;external;
function g_tls_backend_get_default:PGTlsBackend;cdecl;external;
function g_tls_backend_get_default_database(backend:PGTlsBackend):PGTlsDatabase;cdecl;external;
procedure g_tls_backend_set_default_database(backend:PGTlsBackend; database:PGTlsDatabase);cdecl;external;
function g_tls_backend_supports_tls(backend:PGTlsBackend):Tgboolean;cdecl;external;
function g_tls_backend_supports_dtls(backend:PGTlsBackend):Tgboolean;cdecl;external;
function g_tls_backend_get_certificate_type(backend:PGTlsBackend):TGType;cdecl;external;
function g_tls_backend_get_client_connection_type(backend:PGTlsBackend):TGType;cdecl;external;
function g_tls_backend_get_server_connection_type(backend:PGTlsBackend):TGType;cdecl;external;
function g_tls_backend_get_file_database_type(backend:PGTlsBackend):TGType;cdecl;external;
function g_tls_backend_get_dtls_client_connection_type(backend:PGTlsBackend):TGType;cdecl;external;
function g_tls_backend_get_dtls_server_connection_type(backend:PGTlsBackend):TGType;cdecl;external;
{$endif}
{ __G_TLS_BACKEND_H__  }

implementation

{ was #define dname def_expr }
function G_TYPE_TLS_BACKEND : longint; { return type might be wrong }
  begin
    G_TYPE_TLS_BACKEND:=g_tls_backend_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_TLS_BACKEND(obj : longint) : longint;
begin
  G_TLS_BACKEND:=G_TYPE_CHECK_INSTANCE_CAST(obj,G_TYPE_TLS_BACKEND,GTlsBackend);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_TLS_BACKEND(obj : longint) : longint;
begin
  G_IS_TLS_BACKEND:=G_TYPE_CHECK_INSTANCE_TYPE(obj,G_TYPE_TLS_BACKEND);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_TLS_BACKEND_GET_INTERFACE(obj : longint) : longint;
begin
  G_TLS_BACKEND_GET_INTERFACE:=G_TYPE_INSTANCE_GET_INTERFACE(obj,G_TYPE_TLS_BACKEND,GTlsBackendInterface);
end;


end.
