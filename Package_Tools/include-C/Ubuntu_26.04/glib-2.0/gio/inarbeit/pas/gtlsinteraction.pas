unit gtlsinteraction;

interface

uses
  fp_glib2;

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


function g_tls_interaction_get_type:TGType;cdecl;external libgio2;
function g_tls_interaction_invoke_ask_password(interaction:PGTlsInteraction; password:PGTlsPassword; cancellable:PGCancellable; error:PPGError):TGTlsInteractionResult;cdecl;external libgio2;
function g_tls_interaction_ask_password(interaction:PGTlsInteraction; password:PGTlsPassword; cancellable:PGCancellable; error:PPGError):TGTlsInteractionResult;cdecl;external libgio2;
procedure g_tls_interaction_ask_password_async(interaction:PGTlsInteraction; password:PGTlsPassword; cancellable:PGCancellable; callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external libgio2;
function g_tls_interaction_ask_password_finish(interaction:PGTlsInteraction; result:PGAsyncResult; error:PPGError):TGTlsInteractionResult;cdecl;external libgio2;
function g_tls_interaction_invoke_request_certificate(interaction:PGTlsInteraction; connection:PGTlsConnection; flags:TGTlsCertificateRequestFlags; cancellable:PGCancellable; error:PPGError):TGTlsInteractionResult;cdecl;external libgio2;
function g_tls_interaction_request_certificate(interaction:PGTlsInteraction; connection:PGTlsConnection; flags:TGTlsCertificateRequestFlags; cancellable:PGCancellable; error:PPGError):TGTlsInteractionResult;cdecl;external libgio2;
procedure g_tls_interaction_request_certificate_async(interaction:PGTlsInteraction; connection:PGTlsConnection; flags:TGTlsCertificateRequestFlags; cancellable:PGCancellable; callback:TGAsyncReadyCallback; 
            user_data:Tgpointer);cdecl;external libgio2;
function g_tls_interaction_request_certificate_finish(interaction:PGTlsInteraction; result:PGAsyncResult; error:PPGError):TGTlsInteractionResult;cdecl;external libgio2;
{$endif}
{ __G_TLS_INTERACTION_H__  }

// === Konventiert am: 26-6-26 20:03:48 ===

function G_TYPE_TLS_INTERACTION : TGType;
function G_TLS_INTERACTION(obj : Pointer) : PGTlsInteraction;
function G_TLS_INTERACTION_CLASS(klass : Pointer) : PGTlsInteractionClass;
function G_IS_TLS_INTERACTION(obj : Pointer) : Tgboolean;
function G_IS_TLS_INTERACTION_CLASS(klass : Pointer) : Tgboolean;
function G_TLS_INTERACTION_GET_CLASS(obj : Pointer) : PGTlsInteractionClass;

implementation

function G_TYPE_TLS_INTERACTION : TGType;
  begin
    G_TYPE_TLS_INTERACTION:=g_tls_interaction_get_type;
  end;

function G_TLS_INTERACTION(obj : Pointer) : PGTlsInteraction;
begin
  Result := PGTlsInteraction(g_type_check_instance_cast(obj, G_TYPE_TLS_INTERACTION));
end;

function G_TLS_INTERACTION_CLASS(klass : Pointer) : PGTlsInteractionClass;
begin
  Result := PGTlsInteractionClass(g_type_check_class_cast(klass, G_TYPE_TLS_INTERACTION));
end;

function G_IS_TLS_INTERACTION(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  G_TYPE_TLS_INTERACTION);
end;

function G_IS_TLS_INTERACTION_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  G_TYPE_TLS_INTERACTION);
end;

function G_TLS_INTERACTION_GET_CLASS(obj : Pointer) : PGTlsInteractionClass;
begin
  Result := PGTlsInteractionClass(PGTypeInstance(obj)^.g_class);
end;



end.
