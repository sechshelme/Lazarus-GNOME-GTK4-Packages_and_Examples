unit soup_server_message;

interface

uses
  fp_glib2, fp_soup, soup_message_body, soup_status;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}



type
  TSoupServerMessage = record
  end;
  PSoupServerMessage = ^TSoupServerMessage;

  TSoupServerMessageClass = record
    parent_class: TGObjectClass;
  end;
  PSoupServerMessageClass = ^TSoupServerMessageClass;

function soup_server_message_get_type: TGType; cdecl; external libsoup;
function soup_server_message_get_request_headers(msg: PSoupServerMessage): PSoupMessageHeaders; cdecl; external libsoup;
function soup_server_message_get_response_headers(msg: PSoupServerMessage): PSoupMessageHeaders; cdecl; external libsoup;
function soup_server_message_get_request_body(msg: PSoupServerMessage): PSoupMessageBody; cdecl; external libsoup;
function soup_server_message_get_response_body(msg: PSoupServerMessage): PSoupMessageBody; cdecl; external libsoup;
function soup_server_message_get_method(msg: PSoupServerMessage): pchar; cdecl; external libsoup;
function soup_server_message_get_http_version(msg: PSoupServerMessage): TSoupHTTPVersion; cdecl; external libsoup;
procedure soup_server_message_set_http_version(msg: PSoupServerMessage; version: TSoupHTTPVersion); cdecl; external libsoup;
function soup_server_message_get_reason_phrase(msg: PSoupServerMessage): pchar; cdecl; external libsoup;
function soup_server_message_get_status(msg: PSoupServerMessage): Tguint; cdecl; external libsoup;
procedure soup_server_message_set_status(msg: PSoupServerMessage; status_code: Tguint; reason_phrase: pchar); cdecl; external libsoup;
function soup_server_message_get_uri(msg: PSoupServerMessage): PGUri; cdecl; external libsoup;
procedure soup_server_message_set_response(msg: PSoupServerMessage; content_type: pchar; resp_use: TSoupMemoryUse; resp_body: pchar; resp_length: Tgsize); cdecl; external libsoup;
procedure soup_server_message_set_redirect(msg: PSoupServerMessage; status_code: Tguint; redirect_uri: pchar); cdecl; external libsoup;
function soup_server_message_get_socket(msg: PSoupServerMessage): PGSocket; cdecl; external libsoup;
function soup_server_message_get_local_address(msg: PSoupServerMessage): PGSocketAddress; cdecl; external libsoup;
function soup_server_message_get_remote_address(msg: PSoupServerMessage): PGSocketAddress; cdecl; external libsoup;
function soup_server_message_get_remote_host(msg: PSoupServerMessage): pchar; cdecl; external libsoup;
function soup_server_message_steal_connection(msg: PSoupServerMessage): PGIOStream; cdecl; external libsoup;
function soup_server_message_is_options_ping(msg: PSoupServerMessage): Tgboolean; cdecl; external libsoup;
procedure soup_server_message_pause(msg: PSoupServerMessage); cdecl; external libsoup;
procedure soup_server_message_unpause(msg: PSoupServerMessage); cdecl; external libsoup;
function soup_server_message_get_tls_peer_certificate(msg: PSoupServerMessage): PGTlsCertificate; cdecl; external libsoup;
function soup_server_message_get_tls_peer_certificate_errors(msg: PSoupServerMessage): TGTlsCertificateFlags; cdecl; external libsoup;

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


end.
