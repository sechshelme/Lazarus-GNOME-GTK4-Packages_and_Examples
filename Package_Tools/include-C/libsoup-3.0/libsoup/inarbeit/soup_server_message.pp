
unit soup_server_message;
interface

{
  Automatically converted by H2Pas 1.0.0 from soup_server_message.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    soup_server_message.h
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
PGIOStream  = ^GIOStream;
PGSocket  = ^GSocket;
PGSocketAddress  = ^GSocketAddress;
PGTlsCertificate  = ^GTlsCertificate;
PGUri  = ^GUri;
PSoupMessageBody  = ^SoupMessageBody;
PSoupMessageHeaders  = ^SoupMessageHeaders;
PSoupServerMessage  = ^SoupServerMessage;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright (C) 2020 Igalia S.L.
  }
{$ifndef __SOUP_SERVER_MESSAGE_H__}

const
  __SOUP_SERVER_MESSAGE_H__ = 1;  
{$include "soup-types.h"}
{$include "soup-message-body.h"}
{$include "soup-message-headers.h"}
{$include "soup-method.h"}

{ was #define dname def_expr }
function SOUP_TYPE_SERVER_MESSAGE : longint; { return type might be wrong }

{G_DECLARE_FINAL_TYPE (SoupServerMessage, soup_server_message, SOUP, SERVER_MESSAGE, GObject) }
function soup_server_message_get_request_headers(msg:PSoupServerMessage):PSoupMessageHeaders;cdecl;external;
function soup_server_message_get_response_headers(msg:PSoupServerMessage):PSoupMessageHeaders;cdecl;external;
function soup_server_message_get_request_body(msg:PSoupServerMessage):PSoupMessageBody;cdecl;external;
function soup_server_message_get_response_body(msg:PSoupServerMessage):PSoupMessageBody;cdecl;external;
(* Const before type ignored *)
function soup_server_message_get_method(msg:PSoupServerMessage):Pchar;cdecl;external;
function soup_server_message_get_http_version(msg:PSoupServerMessage):TSoupHTTPVersion;cdecl;external;
procedure soup_server_message_set_http_version(msg:PSoupServerMessage; version:TSoupHTTPVersion);cdecl;external;
(* Const before type ignored *)
function soup_server_message_get_reason_phrase(msg:PSoupServerMessage):Pchar;cdecl;external;
function soup_server_message_get_status(msg:PSoupServerMessage):Tguint;cdecl;external;
(* Const before type ignored *)
procedure soup_server_message_set_status(msg:PSoupServerMessage; status_code:Tguint; reason_phrase:Pchar);cdecl;external;
function soup_server_message_get_uri(msg:PSoupServerMessage):PGUri;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure soup_server_message_set_response(msg:PSoupServerMessage; content_type:Pchar; resp_use:TSoupMemoryUse; resp_body:Pchar; resp_length:Tgsize);cdecl;external;
(* Const before type ignored *)
procedure soup_server_message_set_redirect(msg:PSoupServerMessage; status_code:Tguint; redirect_uri:Pchar);cdecl;external;
function soup_server_message_get_socket(msg:PSoupServerMessage):PGSocket;cdecl;external;
function soup_server_message_get_local_address(msg:PSoupServerMessage):PGSocketAddress;cdecl;external;
function soup_server_message_get_remote_address(msg:PSoupServerMessage):PGSocketAddress;cdecl;external;
(* Const before type ignored *)
function soup_server_message_get_remote_host(msg:PSoupServerMessage):Pchar;cdecl;external;
function soup_server_message_steal_connection(msg:PSoupServerMessage):PGIOStream;cdecl;external;
function soup_server_message_is_options_ping(msg:PSoupServerMessage):Tgboolean;cdecl;external;
procedure soup_server_message_pause(msg:PSoupServerMessage);cdecl;external;
procedure soup_server_message_unpause(msg:PSoupServerMessage);cdecl;external;
function soup_server_message_get_tls_peer_certificate(msg:PSoupServerMessage):PGTlsCertificate;cdecl;external;
function soup_server_message_get_tls_peer_certificate_errors(msg:PSoupServerMessage):TGTlsCertificateFlags;cdecl;external;
{$endif}
{ __SOUP_SERVER_MESSAGE_H__  }

implementation

{ was #define dname def_expr }
function SOUP_TYPE_SERVER_MESSAGE : longint; { return type might be wrong }
  begin
    SOUP_TYPE_SERVER_MESSAGE:=soup_server_message_get_type;
  end;


end.
