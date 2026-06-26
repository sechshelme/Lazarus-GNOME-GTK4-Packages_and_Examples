
unit gtlsconnection;
interface

{
  Automatically converted by H2Pas 1.0.0 from gtlsconnection.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gtlsconnection.h
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
PGByteArray  = ^GByteArray;
PGCancellable  = ^GCancellable;
Pgchar  = ^gchar;
PGError  = ^GError;
PGTlsCertificate  = ^GTlsCertificate;
PGTlsConnection  = ^GTlsConnection;
PGTlsConnectionClass  = ^GTlsConnectionClass;
PGTlsConnectionPrivate  = ^GTlsConnectionPrivate;
PGTlsDatabase  = ^GTlsDatabase;
PGTlsInteraction  = ^GTlsInteraction;
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
{$ifndef __G_TLS_CONNECTION_H__}
{$define __G_TLS_CONNECTION_H__}
{$if !defined (__GIO_GIO_H_INSIDE__) && !defined (GIO_COMPILATION)}
{$error "Only <gio/gio.h> can be included directly."}
{$endif}
{$include <gio/giostream.h>}

{ was #define dname def_expr }
function G_TYPE_TLS_CONNECTION : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_TLS_CONNECTION(inst : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_TLS_CONNECTION_CLASS(_class : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_TLS_CONNECTION(inst : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_TLS_CONNECTION_CLASS(_class : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_TLS_CONNECTION_GET_CLASS(inst : longint) : longint;

type
  PGTlsConnection = ^TGTlsConnection;
  TGTlsConnection = record
      parent_instance : TGIOStream;
      priv : PGTlsConnectionPrivate;
    end;

{*
 * GTlsConnectionClass:
 * @parent_class: The parent class.
 * @accept_certificate: Check whether to accept a certificate.
 * @handshake: Perform a handshake operation.
 * @handshake_async: Start an asynchronous handshake operation.
 * @handshake_finish: Finish an asynchronous handshake operation.
 * @get_binding_data: Retrieve TLS channel binding data (Since: 2.66)
 * @get_negotiated_protocol: Get ALPN-negotiated protocol (Since: 2.70)
 *
 * The class structure for the #GTlsConnection type.
 *
 * Since: 2.28
  }
{ signals  }
{ methods  }
(* Const before type ignored *)
{< private > }
{ Padding for future expansion  }
  PGTlsConnectionClass = ^TGTlsConnectionClass;
  TGTlsConnectionClass = record
      parent_class : TGIOStreamClass;
      accept_certificate : function (connection:PGTlsConnection; peer_cert:PGTlsCertificate; errors:TGTlsCertificateFlags):Tgboolean;cdecl;
      handshake : function (conn:PGTlsConnection; cancellable:PGCancellable; error:PPGError):Tgboolean;cdecl;
      handshake_async : procedure (conn:PGTlsConnection; io_priority:longint; cancellable:PGCancellable; callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;
      handshake_finish : function (conn:PGTlsConnection; result:PGAsyncResult; error:PPGError):Tgboolean;cdecl;
      get_binding_data : function (conn:PGTlsConnection; _type:TGTlsChannelBindingType; data:PGByteArray; error:PPGError):Tgboolean;cdecl;
      get_negotiated_protocol : function (conn:PGTlsConnection):Pgchar;cdecl;
      padding : array[0..5] of Tgpointer;
    end;


function g_tls_connection_get_type:TGType;cdecl;external;
procedure g_tls_connection_set_use_system_certdb(conn:PGTlsConnection; use_system_certdb:Tgboolean);cdecl;external;
function g_tls_connection_get_use_system_certdb(conn:PGTlsConnection):Tgboolean;cdecl;external;
procedure g_tls_connection_set_database(conn:PGTlsConnection; database:PGTlsDatabase);cdecl;external;
function g_tls_connection_get_database(conn:PGTlsConnection):PGTlsDatabase;cdecl;external;
procedure g_tls_connection_set_certificate(conn:PGTlsConnection; certificate:PGTlsCertificate);cdecl;external;
function g_tls_connection_get_certificate(conn:PGTlsConnection):PGTlsCertificate;cdecl;external;
procedure g_tls_connection_set_interaction(conn:PGTlsConnection; interaction:PGTlsInteraction);cdecl;external;
function g_tls_connection_get_interaction(conn:PGTlsConnection):PGTlsInteraction;cdecl;external;
function g_tls_connection_get_peer_certificate(conn:PGTlsConnection):PGTlsCertificate;cdecl;external;
function g_tls_connection_get_peer_certificate_errors(conn:PGTlsConnection):TGTlsCertificateFlags;cdecl;external;
procedure g_tls_connection_set_require_close_notify(conn:PGTlsConnection; require_close_notify:Tgboolean);cdecl;external;
function g_tls_connection_get_require_close_notify(conn:PGTlsConnection):Tgboolean;cdecl;external;
{xxxxxGLIB_DEPRECATED_IN_2_60 }
procedure g_tls_connection_set_rehandshake_mode(conn:PGTlsConnection; mode:TGTlsRehandshakeMode);cdecl;external;
{xxxxxGLIB_DEPRECATED_IN_2_60 }
function g_tls_connection_get_rehandshake_mode(conn:PGTlsConnection):TGTlsRehandshakeMode;cdecl;external;
(* Const before type ignored *)
(* Const before declarator ignored *)
procedure g_tls_connection_set_advertised_protocols(conn:PGTlsConnection; protocols:PPgchar);cdecl;external;
(* Const before type ignored *)
function g_tls_connection_get_negotiated_protocol(conn:PGTlsConnection):Pgchar;cdecl;external;
function g_tls_connection_get_channel_binding_data(conn:PGTlsConnection; _type:TGTlsChannelBindingType; data:PGByteArray; error:PPGError):Tgboolean;cdecl;external;
function g_tls_connection_handshake(conn:PGTlsConnection; cancellable:PGCancellable; error:PPGError):Tgboolean;cdecl;external;
procedure g_tls_connection_handshake_async(conn:PGTlsConnection; io_priority:longint; cancellable:PGCancellable; callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external;
function g_tls_connection_handshake_finish(conn:PGTlsConnection; result:PGAsyncResult; error:PPGError):Tgboolean;cdecl;external;
function g_tls_connection_get_protocol_version(conn:PGTlsConnection):TGTlsProtocolVersion;cdecl;external;
function g_tls_connection_get_ciphersuite_name(conn:PGTlsConnection):Pgchar;cdecl;external;
{*
 * G_TLS_ERROR:
 *
 * Error domain for TLS. Errors in this domain will be from the
 * #GTlsError enumeration. See #GError for more information on error
 * domains.
  }
{ was #define dname def_expr }
function G_TLS_ERROR : longint; { return type might be wrong }

function g_tls_error_quark:TGQuark;cdecl;external;
{*
 * G_TLS_CHANNEL_BINDING_ERROR:
 *
 * Error domain for TLS channel binding. Errors in this domain will be from the
 * #GTlsChannelBindingError enumeration. See #GError for more information on error
 * domains.
 *
 * Since: 2.66
  }
{ was #define dname def_expr }
function G_TLS_CHANNEL_BINDING_ERROR : longint; { return type might be wrong }

function g_tls_channel_binding_error_quark:TGQuark;cdecl;external;
{< protected > }
function g_tls_connection_emit_accept_certificate(conn:PGTlsConnection; peer_cert:PGTlsCertificate; errors:TGTlsCertificateFlags):Tgboolean;cdecl;external;
{$endif}
{ __G_TLS_CONNECTION_H__  }

implementation

{ was #define dname def_expr }
function G_TYPE_TLS_CONNECTION : longint; { return type might be wrong }
  begin
    G_TYPE_TLS_CONNECTION:=g_tls_connection_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_TLS_CONNECTION(inst : longint) : longint;
begin
  G_TLS_CONNECTION:=G_TYPE_CHECK_INSTANCE_CAST(inst,G_TYPE_TLS_CONNECTION,GTlsConnection);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_TLS_CONNECTION_CLASS(_class : longint) : longint;
begin
  G_TLS_CONNECTION_CLASS:=G_TYPE_CHECK_CLASS_CAST(_class,G_TYPE_TLS_CONNECTION,GTlsConnectionClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_TLS_CONNECTION(inst : longint) : longint;
begin
  G_IS_TLS_CONNECTION:=G_TYPE_CHECK_INSTANCE_TYPE(inst,G_TYPE_TLS_CONNECTION);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_TLS_CONNECTION_CLASS(_class : longint) : longint;
begin
  G_IS_TLS_CONNECTION_CLASS:=G_TYPE_CHECK_CLASS_TYPE(_class,G_TYPE_TLS_CONNECTION);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_TLS_CONNECTION_GET_CLASS(inst : longint) : longint;
begin
  G_TLS_CONNECTION_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(inst,G_TYPE_TLS_CONNECTION,GTlsConnectionClass);
end;

{ was #define dname def_expr }
function G_TLS_ERROR : longint; { return type might be wrong }
  begin
    G_TLS_ERROR:=g_tls_error_quark;
  end;

{ was #define dname def_expr }
function G_TLS_CHANNEL_BINDING_ERROR : longint; { return type might be wrong }
  begin
    G_TLS_CHANNEL_BINDING_ERROR:=g_tls_channel_binding_error_quark;
  end;


end.
