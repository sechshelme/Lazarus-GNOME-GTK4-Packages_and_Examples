
unit gdtlsconnection;
interface

{
  Automatically converted by H2Pas 1.0.0 from gdtlsconnection.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gdtlsconnection.h
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
PGDtlsConnection  = ^GDtlsConnection;
PGDtlsConnectionInterface  = ^GDtlsConnectionInterface;
PGError  = ^GError;
PGTlsCertificate  = ^GTlsCertificate;
PGTlsDatabase  = ^GTlsDatabase;
PGTlsInteraction  = ^GTlsInteraction;
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
{$ifndef __G_DTLS_CONNECTION_H__}
{$define __G_DTLS_CONNECTION_H__}
{$if !defined (__GIO_GIO_H_INSIDE__) && !defined (GIO_COMPILATION)}
{$error "Only <gio/gio.h> can be included directly."}
{$endif}
{$include <gio/gdatagrambased.h>}

{ was #define dname def_expr }
function G_TYPE_DTLS_CONNECTION : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_DTLS_CONNECTION(inst : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_DTLS_CONNECTION(inst : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_DTLS_CONNECTION_GET_INTERFACE(inst : longint) : longint;

type
{*
 * GDtlsConnectionInterface:
 * @g_iface: The parent interface.
 * @accept_certificate: Check whether to accept a certificate.
 * @handshake: Perform a handshake operation.
 * @handshake_async: Start an asynchronous handshake operation.
 * @handshake_finish: Finish an asynchronous handshake operation.
 * @shutdown: Shut down one or both directions of the connection.
 * @shutdown_async: Start an asynchronous shutdown operation.
 * @shutdown_finish: Finish an asynchronous shutdown operation.
 * @set_advertised_protocols: Set APLN protocol list (Since: 2.60)
 * @get_negotiated_protocol: Get ALPN-negotiated protocol (Since: 2.60)
 * @get_binding_data: Retrieve TLS channel binding data (Since: 2.66)
 *
 * Virtual method table for a #GDtlsConnection implementation.
 *
 * Since: 2.48
  }
{ signals  }
{ methods  }
(* Const before type ignored *)
(* Const before declarator ignored *)
(* Const before type ignored *)
  PGDtlsConnectionInterface = ^TGDtlsConnectionInterface;
  TGDtlsConnectionInterface = record
      g_iface : TGTypeInterface;
      accept_certificate : function (connection:PGDtlsConnection; peer_cert:PGTlsCertificate; errors:TGTlsCertificateFlags):Tgboolean;cdecl;
      handshake : function (conn:PGDtlsConnection; cancellable:PGCancellable; error:PPGError):Tgboolean;cdecl;
      handshake_async : procedure (conn:PGDtlsConnection; io_priority:longint; cancellable:PGCancellable; callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;
      handshake_finish : function (conn:PGDtlsConnection; result:PGAsyncResult; error:PPGError):Tgboolean;cdecl;
      shutdown : function (conn:PGDtlsConnection; shutdown_read:Tgboolean; shutdown_write:Tgboolean; cancellable:PGCancellable; error:PPGError):Tgboolean;cdecl;
      shutdown_async : procedure (conn:PGDtlsConnection; shutdown_read:Tgboolean; shutdown_write:Tgboolean; io_priority:longint; cancellable:PGCancellable; 
                    callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;
      shutdown_finish : function (conn:PGDtlsConnection; result:PGAsyncResult; error:PPGError):Tgboolean;cdecl;
      set_advertised_protocols : procedure (conn:PGDtlsConnection; protocols:PPgchar);cdecl;
      get_negotiated_protocol : function (conn:PGDtlsConnection):Pgchar;cdecl;
      get_binding_data : function (conn:PGDtlsConnection; _type:TGTlsChannelBindingType; data:PGByteArray; error:PPGError):Tgboolean;cdecl;
    end;


function g_dtls_connection_get_type:TGType;cdecl;external;
procedure g_dtls_connection_set_database(conn:PGDtlsConnection; database:PGTlsDatabase);cdecl;external;
function g_dtls_connection_get_database(conn:PGDtlsConnection):PGTlsDatabase;cdecl;external;
procedure g_dtls_connection_set_certificate(conn:PGDtlsConnection; certificate:PGTlsCertificate);cdecl;external;
function g_dtls_connection_get_certificate(conn:PGDtlsConnection):PGTlsCertificate;cdecl;external;
procedure g_dtls_connection_set_interaction(conn:PGDtlsConnection; interaction:PGTlsInteraction);cdecl;external;
function g_dtls_connection_get_interaction(conn:PGDtlsConnection):PGTlsInteraction;cdecl;external;
function g_dtls_connection_get_peer_certificate(conn:PGDtlsConnection):PGTlsCertificate;cdecl;external;
function g_dtls_connection_get_peer_certificate_errors(conn:PGDtlsConnection):TGTlsCertificateFlags;cdecl;external;
procedure g_dtls_connection_set_require_close_notify(conn:PGDtlsConnection; require_close_notify:Tgboolean);cdecl;external;
function g_dtls_connection_get_require_close_notify(conn:PGDtlsConnection):Tgboolean;cdecl;external;
{xxxxxGLIB_DEPRECATED_IN_2_60 }
procedure g_dtls_connection_set_rehandshake_mode(conn:PGDtlsConnection; mode:TGTlsRehandshakeMode);cdecl;external;
{xxxxxGLIB_DEPRECATED_IN_2_60 }
function g_dtls_connection_get_rehandshake_mode(conn:PGDtlsConnection):TGTlsRehandshakeMode;cdecl;external;
function g_dtls_connection_handshake(conn:PGDtlsConnection; cancellable:PGCancellable; error:PPGError):Tgboolean;cdecl;external;
procedure g_dtls_connection_handshake_async(conn:PGDtlsConnection; io_priority:longint; cancellable:PGCancellable; callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external;
function g_dtls_connection_handshake_finish(conn:PGDtlsConnection; result:PGAsyncResult; error:PPGError):Tgboolean;cdecl;external;
function g_dtls_connection_shutdown(conn:PGDtlsConnection; shutdown_read:Tgboolean; shutdown_write:Tgboolean; cancellable:PGCancellable; error:PPGError):Tgboolean;cdecl;external;
procedure g_dtls_connection_shutdown_async(conn:PGDtlsConnection; shutdown_read:Tgboolean; shutdown_write:Tgboolean; io_priority:longint; cancellable:PGCancellable; 
            callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external;
function g_dtls_connection_shutdown_finish(conn:PGDtlsConnection; result:PGAsyncResult; error:PPGError):Tgboolean;cdecl;external;
function g_dtls_connection_close(conn:PGDtlsConnection; cancellable:PGCancellable; error:PPGError):Tgboolean;cdecl;external;
procedure g_dtls_connection_close_async(conn:PGDtlsConnection; io_priority:longint; cancellable:PGCancellable; callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external;
function g_dtls_connection_close_finish(conn:PGDtlsConnection; result:PGAsyncResult; error:PPGError):Tgboolean;cdecl;external;
{< protected > }
function g_dtls_connection_emit_accept_certificate(conn:PGDtlsConnection; peer_cert:PGTlsCertificate; errors:TGTlsCertificateFlags):Tgboolean;cdecl;external;
(* Const before type ignored *)
(* Const before declarator ignored *)
procedure g_dtls_connection_set_advertised_protocols(conn:PGDtlsConnection; protocols:PPgchar);cdecl;external;
(* Const before type ignored *)
function g_dtls_connection_get_negotiated_protocol(conn:PGDtlsConnection):Pgchar;cdecl;external;
function g_dtls_connection_get_channel_binding_data(conn:PGDtlsConnection; _type:TGTlsChannelBindingType; data:PGByteArray; error:PPGError):Tgboolean;cdecl;external;
function g_dtls_connection_get_protocol_version(conn:PGDtlsConnection):TGTlsProtocolVersion;cdecl;external;
function g_dtls_connection_get_ciphersuite_name(conn:PGDtlsConnection):Pgchar;cdecl;external;
{$endif}
{ __G_DTLS_CONNECTION_H__  }

implementation

{ was #define dname def_expr }
function G_TYPE_DTLS_CONNECTION : longint; { return type might be wrong }
  begin
    G_TYPE_DTLS_CONNECTION:=g_dtls_connection_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_DTLS_CONNECTION(inst : longint) : longint;
begin
  G_DTLS_CONNECTION:=G_TYPE_CHECK_INSTANCE_CAST(inst,G_TYPE_DTLS_CONNECTION,GDtlsConnection);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_DTLS_CONNECTION(inst : longint) : longint;
begin
  G_IS_DTLS_CONNECTION:=G_TYPE_CHECK_INSTANCE_TYPE(inst,G_TYPE_DTLS_CONNECTION);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_DTLS_CONNECTION_GET_INTERFACE(inst : longint) : longint;
begin
  G_DTLS_CONNECTION_GET_INTERFACE:=G_TYPE_INSTANCE_GET_INTERFACE(inst,G_TYPE_DTLS_CONNECTION,GDtlsConnectionInterface);
end;


end.
