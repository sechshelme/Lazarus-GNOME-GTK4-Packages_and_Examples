
unit gtlsinteraction;
interface

{
  Automatically converted by H2Pas 1.0.0 from gtlsinteraction.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gtlsinteraction.h
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
PGError  = ^GError;
PGTlsConnection  = ^GTlsConnection;
PGTlsInteraction  = ^GTlsInteraction;
PGTlsInteractionClass  = ^GTlsInteractionClass;
PGTlsInteractionPrivate  = ^GTlsInteractionPrivate;
PGTlsPassword  = ^GTlsPassword;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GIO - GLib Input, Output and Streaming Library
 *
 * Copyright (C) 2011 Collabora, Ltd.
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
 * Author: Stef Walter <stefw@collabora.co.uk>
  }
{$ifndef __G_TLS_INTERACTION_H__}
{$define __G_TLS_INTERACTION_H__}
{$if !defined (__GIO_GIO_H_INSIDE__) && !defined (GIO_COMPILATION)}
{$error "Only <gio/gio.h> can be included directly."}
{$endif}
{$include <gio/giotypes.h>}

{ was #define dname def_expr }
function G_TYPE_TLS_INTERACTION : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_TLS_INTERACTION(o : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_TLS_INTERACTION_CLASS(k : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_TLS_INTERACTION(o : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_TLS_INTERACTION_CLASS(k : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_TLS_INTERACTION_GET_CLASS(o : longint) : longint;

type
{< private > }
  PGTlsInteraction = ^TGTlsInteraction;
  TGTlsInteraction = record
      parent_instance : TGObject;
      priv : PGTlsInteractionPrivate;
    end;

{< private > }
{< public > }
{< private > }
{ Padding for future expansion  }
  PGTlsInteractionClass = ^TGTlsInteractionClass;
  TGTlsInteractionClass = record
      parent_class : TGObjectClass;
      ask_password : function (interaction:PGTlsInteraction; password:PGTlsPassword; cancellable:PGCancellable; error:PPGError):TGTlsInteractionResult;cdecl;
      ask_password_async : procedure (interaction:PGTlsInteraction; password:PGTlsPassword; cancellable:PGCancellable; callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;
      ask_password_finish : function (interaction:PGTlsInteraction; result:PGAsyncResult; error:PPGError):TGTlsInteractionResult;cdecl;
      request_certificate : function (interaction:PGTlsInteraction; connection:PGTlsConnection; flags:TGTlsCertificateRequestFlags; cancellable:PGCancellable; error:PPGError):TGTlsInteractionResult;cdecl;
      request_certificate_async : procedure (interaction:PGTlsInteraction; connection:PGTlsConnection; flags:TGTlsCertificateRequestFlags; cancellable:PGCancellable; callback:TGAsyncReadyCallback; 
                    user_data:Tgpointer);cdecl;
      request_certificate_finish : function (interaction:PGTlsInteraction; result:PGAsyncResult; error:PPGError):TGTlsInteractionResult;cdecl;
      padding : array[0..20] of Tgpointer;
    end;


function g_tls_interaction_get_type:TGType;cdecl;external;
function g_tls_interaction_invoke_ask_password(interaction:PGTlsInteraction; password:PGTlsPassword; cancellable:PGCancellable; error:PPGError):TGTlsInteractionResult;cdecl;external;
function g_tls_interaction_ask_password(interaction:PGTlsInteraction; password:PGTlsPassword; cancellable:PGCancellable; error:PPGError):TGTlsInteractionResult;cdecl;external;
procedure g_tls_interaction_ask_password_async(interaction:PGTlsInteraction; password:PGTlsPassword; cancellable:PGCancellable; callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external;
function g_tls_interaction_ask_password_finish(interaction:PGTlsInteraction; result:PGAsyncResult; error:PPGError):TGTlsInteractionResult;cdecl;external;
function g_tls_interaction_invoke_request_certificate(interaction:PGTlsInteraction; connection:PGTlsConnection; flags:TGTlsCertificateRequestFlags; cancellable:PGCancellable; error:PPGError):TGTlsInteractionResult;cdecl;external;
function g_tls_interaction_request_certificate(interaction:PGTlsInteraction; connection:PGTlsConnection; flags:TGTlsCertificateRequestFlags; cancellable:PGCancellable; error:PPGError):TGTlsInteractionResult;cdecl;external;
procedure g_tls_interaction_request_certificate_async(interaction:PGTlsInteraction; connection:PGTlsConnection; flags:TGTlsCertificateRequestFlags; cancellable:PGCancellable; callback:TGAsyncReadyCallback; 
            user_data:Tgpointer);cdecl;external;
function g_tls_interaction_request_certificate_finish(interaction:PGTlsInteraction; result:PGAsyncResult; error:PPGError):TGTlsInteractionResult;cdecl;external;
{$endif}
{ __G_TLS_INTERACTION_H__  }

implementation

{ was #define dname def_expr }
function G_TYPE_TLS_INTERACTION : longint; { return type might be wrong }
  begin
    G_TYPE_TLS_INTERACTION:=g_tls_interaction_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_TLS_INTERACTION(o : longint) : longint;
begin
  G_TLS_INTERACTION:=G_TYPE_CHECK_INSTANCE_CAST(o,G_TYPE_TLS_INTERACTION,GTlsInteraction);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_TLS_INTERACTION_CLASS(k : longint) : longint;
begin
  G_TLS_INTERACTION_CLASS:=G_TYPE_CHECK_CLASS_CAST(k,G_TYPE_TLS_INTERACTION,GTlsInteractionClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_TLS_INTERACTION(o : longint) : longint;
begin
  G_IS_TLS_INTERACTION:=G_TYPE_CHECK_INSTANCE_TYPE(o,G_TYPE_TLS_INTERACTION);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_TLS_INTERACTION_CLASS(k : longint) : longint;
begin
  G_IS_TLS_INTERACTION_CLASS:=G_TYPE_CHECK_CLASS_TYPE(k,G_TYPE_TLS_INTERACTION);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_TLS_INTERACTION_GET_CLASS(o : longint) : longint;
begin
  G_TLS_INTERACTION_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(o,G_TYPE_TLS_INTERACTION,GTlsInteractionClass);
end;


end.
