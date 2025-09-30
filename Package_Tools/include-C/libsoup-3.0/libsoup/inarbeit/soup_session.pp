
unit soup_session;
interface

{
  Automatically converted by H2Pas 1.0.0 from soup_session.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    soup_session.h
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
Pchar  = ^char;
PGAsyncResult  = ^GAsyncResult;
PGBytes  = ^GBytes;
PGCancellable  = ^GCancellable;
PGError  = ^GError;
PGInetSocketAddress  = ^GInetSocketAddress;
PGInputStream  = ^GInputStream;
PGOutputStream  = ^GOutputStream;
PGProxyResolver  = ^GProxyResolver;
PGSocketConnectable  = ^GSocketConnectable;
PGTlsDatabase  = ^GTlsDatabase;
PGTlsInteraction  = ^GTlsInteraction;
PSoupMessage  = ^SoupMessage;
PSoupSession  = ^SoupSession;
PSoupSessionClass  = ^SoupSessionClass;
PSoupSessionError  = ^SoupSessionError;
PSoupSessionFeature  = ^SoupSessionFeature;
PSoupWebsocketConnection  = ^SoupWebsocketConnection;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ -*- Mode: C; tab-width: 8; indent-tabs-mode: nil; c-basic-offset: 8 -*-  }
{
 * Copyright (C) 2000-2003, Ximian, Inc.
  }
(** unsupported pragma#pragma once*)
{$include "soup-types.h"}
{$include "soup-message.h"}
{$include "soup-websocket-connection.h"}

{ was #define dname def_expr }
function SOUP_TYPE_SESSION : longint; { return type might be wrong }

{G_DECLARE_DERIVABLE_TYPE (SoupSession, soup_session, SOUP, SESSION, GObject) }
type
  PSoupSessionClass = ^TSoupSessionClass;
  TSoupSessionClass = record
      parent_class : TGObjectClass;
      request_queued : procedure (session:PSoupSession; msg:PSoupMessage);cdecl;
      request_unqueued : procedure (session:PSoupSession; msg:PSoupMessage);cdecl;
      _soup_reserved1 : procedure ;cdecl;
      _soup_reserved2 : procedure ;cdecl;
      _soup_reserved3 : procedure ;cdecl;
      _soup_reserved4 : procedure ;cdecl;
      _soup_reserved5 : procedure ;cdecl;
      _soup_reserved6 : procedure ;cdecl;
      _soup_reserved7 : procedure ;cdecl;
      _soup_reserved8 : procedure ;cdecl;
    end;

{*
 * soup_session_error_quark:
 * Registers error quark for SoupSession if needed.
 *
 * Returns: Error quark for SoupSession.
  }

function soup_session_error_quark:TGQuark;cdecl;external;
{ was #define dname def_expr }
function SOUP_SESSION_ERROR : longint; { return type might be wrong }

type
  PSoupSessionError = ^TSoupSessionError;
  TSoupSessionError =  Longint;
  Const
    SOUP_SESSION_ERROR_PARSING = 0;
    SOUP_SESSION_ERROR_ENCODING = 1;
    SOUP_SESSION_ERROR_TOO_MANY_REDIRECTS = 2;
    SOUP_SESSION_ERROR_TOO_MANY_RESTARTS = 3;
    SOUP_SESSION_ERROR_REDIRECT_NO_LOCATION = 4;
    SOUP_SESSION_ERROR_REDIRECT_BAD_URI = 5;
    SOUP_SESSION_ERROR_MESSAGE_ALREADY_IN_QUEUE = 6;
;

function soup_session_new:PSoupSession;cdecl;external;
(* Const before type ignored *)
function soup_session_new_with_options(optname1:Pchar; args:array of const):PSoupSession;cdecl;external;
function soup_session_new_with_options(optname1:Pchar):PSoupSession;cdecl;external;
function soup_session_get_local_address(session:PSoupSession):PGInetSocketAddress;cdecl;external;
function soup_session_get_max_conns(session:PSoupSession):Tguint;cdecl;external;
function soup_session_get_max_conns_per_host(session:PSoupSession):Tguint;cdecl;external;
procedure soup_session_set_proxy_resolver(session:PSoupSession; proxy_resolver:PGProxyResolver);cdecl;external;
function soup_session_get_proxy_resolver(session:PSoupSession):PGProxyResolver;cdecl;external;
procedure soup_session_set_tls_database(session:PSoupSession; tls_database:PGTlsDatabase);cdecl;external;
function soup_session_get_tls_database(session:PSoupSession):PGTlsDatabase;cdecl;external;
procedure soup_session_set_tls_interaction(session:PSoupSession; tls_interaction:PGTlsInteraction);cdecl;external;
function soup_session_get_tls_interaction(session:PSoupSession):PGTlsInteraction;cdecl;external;
procedure soup_session_set_timeout(session:PSoupSession; timeout:Tguint);cdecl;external;
function soup_session_get_timeout(session:PSoupSession):Tguint;cdecl;external;
procedure soup_session_set_idle_timeout(session:PSoupSession; timeout:Tguint);cdecl;external;
function soup_session_get_idle_timeout(session:PSoupSession):Tguint;cdecl;external;
(* Const before type ignored *)
procedure soup_session_set_user_agent(session:PSoupSession; user_agent:Pchar);cdecl;external;
(* Const before type ignored *)
function soup_session_get_user_agent(session:PSoupSession):Pchar;cdecl;external;
(* Const before type ignored *)
procedure soup_session_set_accept_language(session:PSoupSession; accept_language:Pchar);cdecl;external;
(* Const before type ignored *)
function soup_session_get_accept_language(session:PSoupSession):Pchar;cdecl;external;
procedure soup_session_set_accept_language_auto(session:PSoupSession; accept_language_auto:Tgboolean);cdecl;external;
function soup_session_get_accept_language_auto(session:PSoupSession):Tgboolean;cdecl;external;
function soup_session_get_remote_connectable(session:PSoupSession):PGSocketConnectable;cdecl;external;
procedure soup_session_abort(session:PSoupSession);cdecl;external;
procedure soup_session_send_async(session:PSoupSession; msg:PSoupMessage; io_priority:longint; cancellable:PGCancellable; callback:TGAsyncReadyCallback; 
            user_data:Tgpointer);cdecl;external;
function soup_session_send_finish(session:PSoupSession; result:PGAsyncResult; error:PPGError):PGInputStream;cdecl;external;
function soup_session_send(session:PSoupSession; msg:PSoupMessage; cancellable:PGCancellable; error:PPGError):PGInputStream;cdecl;external;
procedure soup_session_send_and_read_async(session:PSoupSession; msg:PSoupMessage; io_priority:longint; cancellable:PGCancellable; callback:TGAsyncReadyCallback; 
            user_data:Tgpointer);cdecl;external;
function soup_session_send_and_read_finish(session:PSoupSession; result:PGAsyncResult; error:PPGError):PGBytes;cdecl;external;
function soup_session_send_and_read(session:PSoupSession; msg:PSoupMessage; cancellable:PGCancellable; error:PPGError):PGBytes;cdecl;external;
procedure soup_session_send_and_splice_async(session:PSoupSession; msg:PSoupMessage; out_stream:PGOutputStream; flags:TGOutputStreamSpliceFlags; io_priority:longint; 
            cancellable:PGCancellable; callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external;
function soup_session_send_and_splice_finish(session:PSoupSession; result:PGAsyncResult; error:PPGError):Tgssize;cdecl;external;
function soup_session_send_and_splice(session:PSoupSession; msg:PSoupMessage; out_stream:PGOutputStream; flags:TGOutputStreamSpliceFlags; cancellable:PGCancellable; 
           error:PPGError):Tgssize;cdecl;external;
function soup_session_get_async_result_message(session:PSoupSession; result:PGAsyncResult):PSoupMessage;cdecl;external;
procedure soup_session_add_feature(session:PSoupSession; feature:PSoupSessionFeature);cdecl;external;
procedure soup_session_add_feature_by_type(session:PSoupSession; feature_type:TGType);cdecl;external;
procedure soup_session_remove_feature(session:PSoupSession; feature:PSoupSessionFeature);cdecl;external;
procedure soup_session_remove_feature_by_type(session:PSoupSession; feature_type:TGType);cdecl;external;
function soup_session_has_feature(session:PSoupSession; feature_type:TGType):Tgboolean;cdecl;external;
function soup_session_get_feature(session:PSoupSession; feature_type:TGType):PSoupSessionFeature;cdecl;external;
function soup_session_get_feature_for_message(session:PSoupSession; feature_type:TGType; msg:PSoupMessage):PSoupSessionFeature;cdecl;external;
(* Const before type ignored *)
procedure soup_session_websocket_connect_async(session:PSoupSession; msg:PSoupMessage; origin:Pchar; protocols:PPchar; io_priority:longint; 
            cancellable:PGCancellable; callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external;
function soup_session_websocket_connect_finish(session:PSoupSession; result:PGAsyncResult; error:PPGError):PSoupWebsocketConnection;cdecl;external;
procedure soup_session_preconnect_async(session:PSoupSession; msg:PSoupMessage; io_priority:longint; cancellable:PGCancellable; callback:TGAsyncReadyCallback; 
            user_data:Tgpointer);cdecl;external;
function soup_session_preconnect_finish(session:PSoupSession; result:PGAsyncResult; error:PPGError):Tgboolean;cdecl;external;

implementation

{ was #define dname def_expr }
function SOUP_TYPE_SESSION : longint; { return type might be wrong }
  begin
    SOUP_TYPE_SESSION:=soup_session_get_type;
  end;

{ was #define dname def_expr }
function SOUP_SESSION_ERROR : longint; { return type might be wrong }
  begin
    SOUP_SESSION_ERROR:=soup_session_error_quark;
  end;


end.
