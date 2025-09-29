
unit soup_message;
interface

{
  Automatically converted by H2Pas 1.0.0 from soup_message.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    soup_message.h
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
PGBytes  = ^GBytes;
PGInputStream  = ^GInputStream;
PGSocketAddress  = ^GSocketAddress;
PGTlsCertificate  = ^GTlsCertificate;
PGUri  = ^GUri;
PSoupMessage  = ^SoupMessage;
PSoupMessageFlags  = ^SoupMessageFlags;
PSoupMessageHeaders  = ^SoupMessageHeaders;
PSoupMessageMetrics  = ^SoupMessageMetrics;
PSoupMessagePriority  = ^SoupMessagePriority;
PSoupMultipart  = ^SoupMultipart;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ -*- Mode: C; tab-width: 8; indent-tabs-mode: nil; c-basic-offset: 8 -*-  }
{
 * Copyright (C) 2000-2003, Ximian, Inc.
  }
(** unsupported pragma#pragma once*)
{$include "soup-types.h"}
{$include "soup-message-body.h"}
{$include "soup-message-headers.h"}
{$include "soup-method.h"}
{$include "soup-multipart.h"}

{ was #define dname def_expr }
function SOUP_TYPE_MESSAGE : longint; { return type might be wrong }

{G_DECLARE_FINAL_TYPE (SoupMessage, soup_message, SOUP, MESSAGE, GObject) }
(* Const before type ignored *)
(* Const before type ignored *)
function soup_message_new(method:Pchar; uri_string:Pchar):PSoupMessage;cdecl;external;
(* Const before type ignored *)
function soup_message_new_from_uri(method:Pchar; uri:PGUri):PSoupMessage;cdecl;external;
function soup_message_new_options_ping(base_uri:PGUri):PSoupMessage;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function soup_message_new_from_encoded_form(method:Pchar; uri_string:Pchar; encoded_form:Pchar):PSoupMessage;cdecl;external;
(* Const before type ignored *)
function soup_message_new_from_multipart(uri_string:Pchar; multipart:PSoupMultipart):PSoupMessage;cdecl;external;
(* Const before type ignored *)
procedure soup_message_set_request_body(msg:PSoupMessage; content_type:Pchar; stream:PGInputStream; content_length:Tgssize);cdecl;external;
(* Const before type ignored *)
procedure soup_message_set_request_body_from_bytes(msg:PSoupMessage; content_type:Pchar; bytes:PGBytes);cdecl;external;
function soup_message_get_http_version(msg:PSoupMessage):TSoupHTTPVersion;cdecl;external;
function soup_message_is_keepalive(msg:PSoupMessage):Tgboolean;cdecl;external;
function soup_message_get_uri(msg:PSoupMessage):PGUri;cdecl;external;
procedure soup_message_set_uri(msg:PSoupMessage; uri:PGUri);cdecl;external;
function soup_message_get_first_party(msg:PSoupMessage):PGUri;cdecl;external;
procedure soup_message_set_first_party(msg:PSoupMessage; first_party:PGUri);cdecl;external;
function soup_message_get_site_for_cookies(msg:PSoupMessage):PGUri;cdecl;external;
procedure soup_message_set_site_for_cookies(msg:PSoupMessage; site_for_cookies:PGUri);cdecl;external;
procedure soup_message_set_is_top_level_navigation(msg:PSoupMessage; is_top_level_navigation:Tgboolean);cdecl;external;
function soup_message_get_is_top_level_navigation(msg:PSoupMessage):Tgboolean;cdecl;external;
type
  PSoupMessageFlags = ^TSoupMessageFlags;
  TSoupMessageFlags =  Longint;
  Const
    SOUP_MESSAGE_NO_REDIRECT = 1 shl 1;
    SOUP_MESSAGE_NEW_CONNECTION = 1 shl 2;
    SOUP_MESSAGE_IDEMPOTENT = 1 shl 3;
    SOUP_MESSAGE_DO_NOT_USE_AUTH_CACHE = 1 shl 4;
    SOUP_MESSAGE_COLLECT_METRICS = 1 shl 5;
;

procedure soup_message_set_flags(msg:PSoupMessage; flags:TSoupMessageFlags);cdecl;external;
function soup_message_get_flags(msg:PSoupMessage):TSoupMessageFlags;cdecl;external;
procedure soup_message_add_flags(msg:PSoupMessage; flags:TSoupMessageFlags);cdecl;external;
procedure soup_message_remove_flags(msg:PSoupMessage; flags:TSoupMessageFlags);cdecl;external;
function soup_message_query_flags(msg:PSoupMessage; flags:TSoupMessageFlags):Tgboolean;cdecl;external;
function soup_message_get_tls_peer_certificate(msg:PSoupMessage):PGTlsCertificate;cdecl;external;
function soup_message_get_tls_peer_certificate_errors(msg:PSoupMessage):TGTlsCertificateFlags;cdecl;external;
function soup_message_get_tls_protocol_version(msg:PSoupMessage):TGTlsProtocolVersion;cdecl;external;
(* Const before type ignored *)
function soup_message_get_tls_ciphersuite_name(msg:PSoupMessage):Pchar;cdecl;external;
procedure soup_message_set_tls_client_certificate(msg:PSoupMessage; certificate:PGTlsCertificate);cdecl;external;
procedure soup_message_tls_client_certificate_password_request_complete(msg:PSoupMessage);cdecl;external;
{ Specialized signal handlers  }
(* Const before type ignored *)
(* Const before type ignored *)
function soup_message_add_header_handler(msg:PSoupMessage; signal:Pchar; header:Pchar; callback:TGCallback; user_data:Tgpointer):Tguint;cdecl;external;
(* Const before type ignored *)
function soup_message_add_status_code_handler(msg:PSoupMessage; signal:Pchar; status_code:Tguint; callback:TGCallback; user_data:Tgpointer):Tguint;cdecl;external;
procedure soup_message_disable_feature(msg:PSoupMessage; feature_type:TGType);cdecl;external;
function soup_message_is_feature_disabled(msg:PSoupMessage; feature_type:TGType):Tgboolean;cdecl;external;
type
  PSoupMessagePriority = ^TSoupMessagePriority;
  TSoupMessagePriority =  Longint;
  Const
    SOUP_MESSAGE_PRIORITY_VERY_LOW = 0;
    SOUP_MESSAGE_PRIORITY_LOW = 1;
    SOUP_MESSAGE_PRIORITY_NORMAL = 2;
    SOUP_MESSAGE_PRIORITY_HIGH = 3;
    SOUP_MESSAGE_PRIORITY_VERY_HIGH = 4;
;

procedure soup_message_set_priority(msg:PSoupMessage; priority:TSoupMessagePriority);cdecl;external;
function soup_message_get_priority(msg:PSoupMessage):TSoupMessagePriority;cdecl;external;
(* Const before type ignored *)
function soup_message_get_method(msg:PSoupMessage):Pchar;cdecl;external;
(* Const before type ignored *)
procedure soup_message_set_method(msg:PSoupMessage; method:Pchar);cdecl;external;
function soup_message_get_status(msg:PSoupMessage):TSoupStatus;cdecl;external;
(* Const before type ignored *)
function soup_message_get_reason_phrase(msg:PSoupMessage):Pchar;cdecl;external;
function soup_message_get_request_headers(msg:PSoupMessage):PSoupMessageHeaders;cdecl;external;
function soup_message_get_response_headers(msg:PSoupMessage):PSoupMessageHeaders;cdecl;external;
function soup_message_get_is_options_ping(msg:PSoupMessage):Tgboolean;cdecl;external;
procedure soup_message_set_is_options_ping(msg:PSoupMessage; is_options_ping:Tgboolean);cdecl;external;
function soup_message_get_connection_id(msg:PSoupMessage):Tguint64;cdecl;external;
function soup_message_get_remote_address(msg:PSoupMessage):PGSocketAddress;cdecl;external;
function soup_message_get_metrics(msg:PSoupMessage):PSoupMessageMetrics;cdecl;external;
procedure soup_message_set_force_http1(msg:PSoupMessage; value:Tgboolean);cdecl;external;
function soup_message_get_force_http1(msg:PSoupMessage):Tgboolean;cdecl;external;

implementation

{ was #define dname def_expr }
function SOUP_TYPE_MESSAGE : longint; { return type might be wrong }
  begin
    SOUP_TYPE_MESSAGE:=soup_message_get_type;
  end;


end.
