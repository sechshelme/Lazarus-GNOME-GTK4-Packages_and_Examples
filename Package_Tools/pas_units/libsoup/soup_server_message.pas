unit soup_server_message;

interface

uses
  fp_glib2, fp_soup;

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

{G_DECLARE_FINAL_TYPE (SoupServerMessage, soup_server_message, SOUP, SERVER_MESSAGE, GObject) }
function soup_server_message_get_request_headers(msg:PSoupServerMessage):PSoupMessageHeaders;cdecl;external libsoup;
function soup_server_message_get_response_headers(msg:PSoupServerMessage):PSoupMessageHeaders;cdecl;external libsoup;
function soup_server_message_get_request_body(msg:PSoupServerMessage):PSoupMessageBody;cdecl;external libsoup;
function soup_server_message_get_response_body(msg:PSoupServerMessage):PSoupMessageBody;cdecl;external libsoup;
function soup_server_message_get_method(msg:PSoupServerMessage):Pchar;cdecl;external libsoup;
function soup_server_message_get_http_version(msg:PSoupServerMessage):TSoupHTTPVersion;cdecl;external libsoup;
procedure soup_server_message_set_http_version(msg:PSoupServerMessage; version:TSoupHTTPVersion);cdecl;external libsoup;
function soup_server_message_get_reason_phrase(msg:PSoupServerMessage):Pchar;cdecl;external libsoup;
function soup_server_message_get_status(msg:PSoupServerMessage):Tguint;cdecl;external libsoup;
procedure soup_server_message_set_status(msg:PSoupServerMessage; status_code:Tguint; reason_phrase:Pchar);cdecl;external libsoup;
function soup_server_message_get_uri(msg:PSoupServerMessage):PGUri;cdecl;external libsoup;
procedure soup_server_message_set_response(msg:PSoupServerMessage; content_type:Pchar; resp_use:TSoupMemoryUse; resp_body:Pchar; resp_length:Tgsize);cdecl;external libsoup;
procedure soup_server_message_set_redirect(msg:PSoupServerMessage; status_code:Tguint; redirect_uri:Pchar);cdecl;external libsoup;
function soup_server_message_get_socket(msg:PSoupServerMessage):PGSocket;cdecl;external libsoup;
function soup_server_message_get_local_address(msg:PSoupServerMessage):PGSocketAddress;cdecl;external libsoup;
function soup_server_message_get_remote_address(msg:PSoupServerMessage):PGSocketAddress;cdecl;external libsoup;
function soup_server_message_get_remote_host(msg:PSoupServerMessage):Pchar;cdecl;external libsoup;
function soup_server_message_steal_connection(msg:PSoupServerMessage):PGIOStream;cdecl;external libsoup;
function soup_server_message_is_options_ping(msg:PSoupServerMessage):Tgboolean;cdecl;external libsoup;
procedure soup_server_message_pause(msg:PSoupServerMessage);cdecl;external libsoup;
procedure soup_server_message_unpause(msg:PSoupServerMessage);cdecl;external libsoup;
function soup_server_message_get_tls_peer_certificate(msg:PSoupServerMessage):PGTlsCertificate;cdecl;external libsoup;
function soup_server_message_get_tls_peer_certificate_errors(msg:PSoupServerMessage):TGTlsCertificateFlags;cdecl;external libsoup;
{$endif}
{ __SOUP_SERVER_MESSAGE_H__  }

// === Konventiert am: 29-9-25 19:44:10 ===

function SOUP_TYPE_SERVER_MESSAGE: TGType;
function SOUP_SERVER_MESSAGE(obj: Pointer): PSoupServerMessage;
function SOUP_IS_SERVER_MESSAGE(obj: Pointer): Tgboolean;

implementation

function SOUP_TYPE_SERVER_MESSAGE: TGType;
begin
  Result := soup_server_message_get_type;
end;

function SOUP_SERVER_MESSAGE(obj: Pointer): PSoupServerMessage;
begin
  Result := PSoupServerMessage(g_type_check_instance_cast(obj, SOUP_TYPE_SERVER_MESSAGE));
end;

function SOUP_IS_SERVER_MESSAGE(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, SOUP_TYPE_SERVER_MESSAGE);
end;

type 
  TSoupServerMessage = record
  end;
  PSoupServerMessage = ^TSoupServerMessage;

  TSoupServerMessageClass = record
    parent_class: TGObjectClass;
  end;
  PSoupServerMessageClass = ^TSoupServerMessageClass;

function soup_server_message_get_type: TGType; cdecl; external libgxxxxxxx;



end.
