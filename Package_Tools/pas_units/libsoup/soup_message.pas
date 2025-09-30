unit soup_message;

interface

uses
  fp_glib2, fp_soup, soup_multipart, soup_status;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}



type
  TSoupMessage = record
  end;
  PSoupMessage = ^TSoupMessage;

  TSoupMessageClass = record
    parent_class: TGObjectClass;
  end;
  PSoupMessageClass = ^TSoupMessageClass;

function soup_message_get_type: TGType; cdecl; external libsoup;
function soup_message_new(method: pchar; uri_string: pchar): PSoupMessage; cdecl; external libsoup;
function soup_message_new_from_uri(method: pchar; uri: PGUri): PSoupMessage; cdecl; external libsoup;
function soup_message_new_options_ping(base_uri: PGUri): PSoupMessage; cdecl; external libsoup;
function soup_message_new_from_encoded_form(method: pchar; uri_string: pchar; encoded_form: pchar): PSoupMessage; cdecl; external libsoup;
function soup_message_new_from_multipart(uri_string: pchar; multipart: PSoupMultipart): PSoupMessage; cdecl; external libsoup;
procedure soup_message_set_request_body(msg: PSoupMessage; content_type: pchar; stream: PGInputStream; content_length: Tgssize); cdecl; external libsoup;
procedure soup_message_set_request_body_from_bytes(msg: PSoupMessage; content_type: pchar; bytes: PGBytes); cdecl; external libsoup;
function soup_message_get_http_version(msg: PSoupMessage): TSoupHTTPVersion; cdecl; external libsoup;
function soup_message_is_keepalive(msg: PSoupMessage): Tgboolean; cdecl; external libsoup;
function soup_message_get_uri(msg: PSoupMessage): PGUri; cdecl; external libsoup;
procedure soup_message_set_uri(msg: PSoupMessage; uri: PGUri); cdecl; external libsoup;
function soup_message_get_first_party(msg: PSoupMessage): PGUri; cdecl; external libsoup;
procedure soup_message_set_first_party(msg: PSoupMessage; first_party: PGUri); cdecl; external libsoup;
function soup_message_get_site_for_cookies(msg: PSoupMessage): PGUri; cdecl; external libsoup;
procedure soup_message_set_site_for_cookies(msg: PSoupMessage; site_for_cookies: PGUri); cdecl; external libsoup;
procedure soup_message_set_is_top_level_navigation(msg: PSoupMessage; is_top_level_navigation: Tgboolean); cdecl; external libsoup;
function soup_message_get_is_top_level_navigation(msg: PSoupMessage): Tgboolean; cdecl; external libsoup;

type
  PSoupMessageFlags = ^TSoupMessageFlags;
  TSoupMessageFlags = longint;

const
  SOUP_MESSAGE_NO_REDIRECT = 1 shl 1;
  SOUP_MESSAGE_NEW_CONNECTION = 1 shl 2;
  SOUP_MESSAGE_IDEMPOTENT = 1 shl 3;
  SOUP_MESSAGE_DO_NOT_USE_AUTH_CACHE = 1 shl 4;
  SOUP_MESSAGE_COLLECT_METRICS = 1 shl 5;

procedure soup_message_set_flags(msg: PSoupMessage; flags: TSoupMessageFlags); cdecl; external libsoup;
function soup_message_get_flags(msg: PSoupMessage): TSoupMessageFlags; cdecl; external libsoup;
procedure soup_message_add_flags(msg: PSoupMessage; flags: TSoupMessageFlags); cdecl; external libsoup;
procedure soup_message_remove_flags(msg: PSoupMessage; flags: TSoupMessageFlags); cdecl; external libsoup;
function soup_message_query_flags(msg: PSoupMessage; flags: TSoupMessageFlags): Tgboolean; cdecl; external libsoup;
function soup_message_get_tls_peer_certificate(msg: PSoupMessage): PGTlsCertificate; cdecl; external libsoup;
function soup_message_get_tls_peer_certificate_errors(msg: PSoupMessage): TGTlsCertificateFlags; cdecl; external libsoup;
function soup_message_get_tls_protocol_version(msg: PSoupMessage): TGTlsProtocolVersion; cdecl; external libsoup;
function soup_message_get_tls_ciphersuite_name(msg: PSoupMessage): pchar; cdecl; external libsoup;
procedure soup_message_set_tls_client_certificate(msg: PSoupMessage; certificate: PGTlsCertificate); cdecl; external libsoup;
procedure soup_message_tls_client_certificate_password_request_complete(msg: PSoupMessage); cdecl; external libsoup;
function soup_message_add_header_handler(msg: PSoupMessage; signal: pchar; header: pchar; callback: TGCallback; user_data: Tgpointer): Tguint; cdecl; external libsoup;
function soup_message_add_status_code_handler(msg: PSoupMessage; signal: pchar; status_code: Tguint; callback: TGCallback; user_data: Tgpointer): Tguint; cdecl; external libsoup;
procedure soup_message_disable_feature(msg: PSoupMessage; feature_type: TGType); cdecl; external libsoup;
function soup_message_is_feature_disabled(msg: PSoupMessage; feature_type: TGType): Tgboolean; cdecl; external libsoup;

type
  PSoupMessagePriority = ^TSoupMessagePriority;
  TSoupMessagePriority = longint;

const
  SOUP_MESSAGE_PRIORITY_VERY_LOW = 0;
  SOUP_MESSAGE_PRIORITY_LOW = 1;
  SOUP_MESSAGE_PRIORITY_NORMAL = 2;
  SOUP_MESSAGE_PRIORITY_HIGH = 3;
  SOUP_MESSAGE_PRIORITY_VERY_HIGH = 4;

procedure soup_message_set_priority(msg: PSoupMessage; priority: TSoupMessagePriority); cdecl; external libsoup;
function soup_message_get_priority(msg: PSoupMessage): TSoupMessagePriority; cdecl; external libsoup;
function soup_message_get_method(msg: PSoupMessage): pchar; cdecl; external libsoup;
procedure soup_message_set_method(msg: PSoupMessage; method: pchar); cdecl; external libsoup;
function soup_message_get_status(msg: PSoupMessage): TSoupStatus; cdecl; external libsoup;
function soup_message_get_reason_phrase(msg: PSoupMessage): pchar; cdecl; external libsoup;
function soup_message_get_request_headers(msg: PSoupMessage): PSoupMessageHeaders; cdecl; external libsoup;
function soup_message_get_response_headers(msg: PSoupMessage): PSoupMessageHeaders; cdecl; external libsoup;
function soup_message_get_is_options_ping(msg: PSoupMessage): Tgboolean; cdecl; external libsoup;
procedure soup_message_set_is_options_ping(msg: PSoupMessage; is_options_ping: Tgboolean); cdecl; external libsoup;
function soup_message_get_connection_id(msg: PSoupMessage): Tguint64; cdecl; external libsoup;
function soup_message_get_remote_address(msg: PSoupMessage): PGSocketAddress; cdecl; external libsoup;
function soup_message_get_metrics(msg: PSoupMessage): PSoupMessageMetrics; cdecl; external libsoup;
procedure soup_message_set_force_http1(msg: PSoupMessage; value: Tgboolean); cdecl; external libsoup;
function soup_message_get_force_http1(msg: PSoupMessage): Tgboolean; cdecl; external libsoup;

// === Konventiert am: 29-9-25 19:44:35 ===

function SOUP_TYPE_MESSAGE: TGType;
function SOUP_MESSAGE(obj: Pointer): PSoupMessage;
function SOUP_IS_MESSAGE(obj: Pointer): Tgboolean;

implementation

function SOUP_TYPE_MESSAGE: TGType;
begin
  Result := soup_message_get_type;
end;

function SOUP_MESSAGE(obj: Pointer): PSoupMessage;
begin
  Result := PSoupMessage(g_type_check_instance_cast(obj, SOUP_TYPE_MESSAGE));
end;

function SOUP_IS_MESSAGE(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, SOUP_TYPE_MESSAGE);
end;

end.
