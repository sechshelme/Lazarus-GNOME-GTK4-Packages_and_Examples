{$IFDEF read_interface}


type
  TSoupSessionClass = record
    parent_class: TGObjectClass;
    request_queued: procedure(session: PSoupSession; msg: PSoupMessage); cdecl;
    request_unqueued: procedure(session: PSoupSession; msg: PSoupMessage); cdecl;
    _soup_reserved1: procedure; cdecl;
    _soup_reserved2: procedure; cdecl;
    _soup_reserved3: procedure; cdecl;
    _soup_reserved4: procedure; cdecl;
    _soup_reserved5: procedure; cdecl;
    _soup_reserved6: procedure; cdecl;
    _soup_reserved7: procedure; cdecl;
    _soup_reserved8: procedure; cdecl;
  end;
  PSoupSessionClass = ^TSoupSessionClass;

function soup_session_get_type: TGType; cdecl; external libsoup;
function soup_session_error_quark: TGQuark; cdecl; external libsoup;

function SOUP_SESSION_ERROR: TGQuark;

type
  PSoupSessionError = ^TSoupSessionError;
  TSoupSessionError = longint;

const
  SOUP_SESSION_ERROR_PARSING = 0;
  SOUP_SESSION_ERROR_ENCODING = 1;
  SOUP_SESSION_ERROR_TOO_MANY_REDIRECTS = 2;
  SOUP_SESSION_ERROR_TOO_MANY_RESTARTS = 3;
  SOUP_SESSION_ERROR_REDIRECT_NO_LOCATION = 4;
  SOUP_SESSION_ERROR_REDIRECT_BAD_URI = 5;
  SOUP_SESSION_ERROR_MESSAGE_ALREADY_IN_QUEUE = 6;

function soup_session_new: PSoupSession; cdecl; external libsoup;
function soup_session_new_with_options(optname1: pchar; args: array of const): PSoupSession; cdecl; external libsoup;
function soup_session_new_with_options(optname1: pchar): PSoupSession; cdecl; external libsoup;
function soup_session_get_local_address(session: PSoupSession): PGInetSocketAddress; cdecl; external libsoup;
function soup_session_get_max_conns(session: PSoupSession): Tguint; cdecl; external libsoup;
function soup_session_get_max_conns_per_host(session: PSoupSession): Tguint; cdecl; external libsoup;
procedure soup_session_set_proxy_resolver(session: PSoupSession; proxy_resolver: PGProxyResolver); cdecl; external libsoup;
function soup_session_get_proxy_resolver(session: PSoupSession): PGProxyResolver; cdecl; external libsoup;
procedure soup_session_set_tls_database(session: PSoupSession; tls_database: PGTlsDatabase); cdecl; external libsoup;
function soup_session_get_tls_database(session: PSoupSession): PGTlsDatabase; cdecl; external libsoup;
procedure soup_session_set_tls_interaction(session: PSoupSession; tls_interaction: PGTlsInteraction); cdecl; external libsoup;
function soup_session_get_tls_interaction(session: PSoupSession): PGTlsInteraction; cdecl; external libsoup;
procedure soup_session_set_timeout(session: PSoupSession; timeout: Tguint); cdecl; external libsoup;
function soup_session_get_timeout(session: PSoupSession): Tguint; cdecl; external libsoup;
procedure soup_session_set_idle_timeout(session: PSoupSession; timeout: Tguint); cdecl; external libsoup;
function soup_session_get_idle_timeout(session: PSoupSession): Tguint; cdecl; external libsoup;
procedure soup_session_set_user_agent(session: PSoupSession; user_agent: pchar); cdecl; external libsoup;
function soup_session_get_user_agent(session: PSoupSession): pchar; cdecl; external libsoup;
procedure soup_session_set_accept_language(session: PSoupSession; accept_language: pchar); cdecl; external libsoup;
function soup_session_get_accept_language(session: PSoupSession): pchar; cdecl; external libsoup;
procedure soup_session_set_accept_language_auto(session: PSoupSession; accept_language_auto: Tgboolean); cdecl; external libsoup;
function soup_session_get_accept_language_auto(session: PSoupSession): Tgboolean; cdecl; external libsoup;
function soup_session_get_remote_connectable(session: PSoupSession): PGSocketConnectable; cdecl; external libsoup;
procedure soup_session_abort(session: PSoupSession); cdecl; external libsoup;
procedure soup_session_send_async(session: PSoupSession; msg: PSoupMessage; io_priority: longint; cancellable: PGCancellable; callback: TGAsyncReadyCallback;
  user_data: Tgpointer); cdecl; external libsoup;
function soup_session_send_finish(session: PSoupSession; result: PGAsyncResult; error: PPGError): PGInputStream; cdecl; external libsoup;
function soup_session_send(session: PSoupSession; msg: PSoupMessage; cancellable: PGCancellable; error: PPGError): PGInputStream; cdecl; external libsoup;
procedure soup_session_send_and_read_async(session: PSoupSession; msg: PSoupMessage; io_priority: longint; cancellable: PGCancellable; callback: TGAsyncReadyCallback;
  user_data: Tgpointer); cdecl; external libsoup;
function soup_session_send_and_read_finish(session: PSoupSession; result: PGAsyncResult; error: PPGError): PGBytes; cdecl; external libsoup;
function soup_session_send_and_read(session: PSoupSession; msg: PSoupMessage; cancellable: PGCancellable; error: PPGError): PGBytes; cdecl; external libsoup;
procedure soup_session_send_and_splice_async(session: PSoupSession; msg: PSoupMessage; out_stream: PGOutputStream; flags: TGOutputStreamSpliceFlags; io_priority: longint;
  cancellable: PGCancellable; callback: TGAsyncReadyCallback; user_data: Tgpointer); cdecl; external libsoup;
function soup_session_send_and_splice_finish(session: PSoupSession; result: PGAsyncResult; error: PPGError): Tgssize; cdecl; external libsoup;
function soup_session_send_and_splice(session: PSoupSession; msg: PSoupMessage; out_stream: PGOutputStream; flags: TGOutputStreamSpliceFlags; cancellable: PGCancellable;
  error: PPGError): Tgssize; cdecl; external libsoup;
function soup_session_get_async_result_message(session: PSoupSession; result: PGAsyncResult): PSoupMessage; cdecl; external libsoup;
procedure soup_session_add_feature(session: PSoupSession; feature: PSoupSessionFeature); cdecl; external libsoup;
procedure soup_session_add_feature_by_type(session: PSoupSession; feature_type: TGType); cdecl; external libsoup;
procedure soup_session_remove_feature(session: PSoupSession; feature: PSoupSessionFeature); cdecl; external libsoup;
procedure soup_session_remove_feature_by_type(session: PSoupSession; feature_type: TGType); cdecl; external libsoup;
function soup_session_has_feature(session: PSoupSession; feature_type: TGType): Tgboolean; cdecl; external libsoup;
function soup_session_get_feature(session: PSoupSession; feature_type: TGType): PSoupSessionFeature; cdecl; external libsoup;
function soup_session_get_feature_for_message(session: PSoupSession; feature_type: TGType; msg: PSoupMessage): PSoupSessionFeature; cdecl; external libsoup;
procedure soup_session_websocket_connect_async(session: PSoupSession; msg: PSoupMessage; origin: pchar; protocols: PPchar; io_priority: longint;
  cancellable: PGCancellable; callback: TGAsyncReadyCallback; user_data: Tgpointer); cdecl; external libsoup;
function soup_session_websocket_connect_finish(session: PSoupSession; result: PGAsyncResult; error: PPGError): PSoupWebsocketConnection; cdecl; external libsoup;
procedure soup_session_preconnect_async(session: PSoupSession; msg: PSoupMessage; io_priority: longint; cancellable: PGCancellable; callback: TGAsyncReadyCallback;
  user_data: Tgpointer); cdecl; external libsoup;
function soup_session_preconnect_finish(session: PSoupSession; result: PGAsyncResult; error: PPGError): Tgboolean; cdecl; external libsoup;

// === Konventiert am: 29-9-25 19:44:05 ===

function SOUP_TYPE_SESSION: TGType;
function SOUP_SESSION(obj: Pointer): PSoupSession;
function SOUP_IS_SESSION(obj: Pointer): Tgboolean;
function SOUP_SESSION_CLASS(klass: Pointer): PSoupSessionClass;
function SOUP_IS_SESSION_CLASS(klass: Pointer): Tgboolean;
function SOUP_SESSION_GET_CLASS(obj: Pointer): PSoupSessionClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function SOUP_TYPE_SESSION: TGType;
begin
  Result := soup_session_get_type;
end;

function SOUP_SESSION(obj: Pointer): PSoupSession;
begin
  Result := PSoupSession(g_type_check_instance_cast(obj, SOUP_TYPE_SESSION));
end;

function SOUP_IS_SESSION(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, SOUP_TYPE_SESSION);
end;

function SOUP_SESSION_CLASS(klass: Pointer): PSoupSessionClass;
begin
  Result := PSoupSessionClass(g_type_check_class_cast(klass, SOUP_TYPE_SESSION));
end;

function SOUP_IS_SESSION_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, SOUP_TYPE_SESSION);
end;

function SOUP_SESSION_GET_CLASS(obj: Pointer): PSoupSessionClass;
begin
  Result := PSoupSessionClass(PGTypeInstance(obj)^.g_class);
end;


function SOUP_SESSION_ERROR: TGQuark;
begin
  SOUP_SESSION_ERROR := soup_session_error_quark;
end;


{$ENDIF read_implementation}
