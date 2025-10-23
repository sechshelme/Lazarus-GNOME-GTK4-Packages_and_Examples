{$IFDEF read_interface}



function soup_cacheability_get_type: TGType; cdecl; external libsoup;
function SOUP_TYPE_CACHEABILITY: TGType;

function soup_cache_type_get_type: TGType; cdecl; external libsoup;
function SOUP_TYPE_CACHE_TYPE: TGType;

function soup_cookie_jar_accept_policy_get_type: TGType; cdecl; external libsoup;
function SOUP_TYPE_COOKIE_JAR_ACCEPT_POLICY: TGType;

function soup_same_site_policy_get_type: TGType; cdecl; external libsoup;
function SOUP_TYPE_SAME_SITE_POLICY: TGType;

function soup_memory_use_get_type: TGType; cdecl; external libsoup;
function SOUP_TYPE_MEMORY_USE: TGType;

function soup_server_listen_options_get_type: TGType; cdecl; external libsoup;
function SOUP_TYPE_SERVER_LISTEN_OPTIONS: TGType;

function soup_date_format_get_type: TGType; cdecl; external libsoup;
function SOUP_TYPE_DATE_FORMAT: TGType;

function soup_logger_log_level_get_type: TGType; cdecl; external libsoup;
function SOUP_TYPE_LOGGER_LOG_LEVEL: TGType;

function soup_message_headers_type_get_type: TGType; cdecl; external libsoup;
function SOUP_TYPE_MESSAGE_HEADERS_TYPE: TGType;

function soup_encoding_get_type: TGType; cdecl; external libsoup;
function SOUP_TYPE_ENCODING: TGType;

function soup_expectation_get_type: TGType; cdecl; external libsoup;
function SOUP_TYPE_EXPECTATION: TGType;

function soup_message_flags_get_type: TGType; cdecl; external libsoup;
function SOUP_TYPE_MESSAGE_FLAGS: TGType;

function soup_message_priority_get_type: TGType; cdecl; external libsoup;
function SOUP_TYPE_MESSAGE_PRIORITY: TGType;

function soup_session_error_get_type: TGType; cdecl; external libsoup;
function SOUP_TYPE_SESSION_ERROR: TGType;

function soup_status_get_type: TGType; cdecl; external libsoup;
function SOUP_TYPE_STATUS: TGType;

function soup_http_version_get_type: TGType; cdecl; external libsoup;
function SOUP_TYPE_HTTP_VERSION: TGType;

function soup_tld_error_get_type: TGType; cdecl; external libsoup;
function SOUP_TYPE_TLD_ERROR: TGType;

function soup_uri_component_get_type: TGType; cdecl; external libsoup;
function SOUP_TYPE_URI_COMPONENT: TGType;

function soup_websocket_error_get_type: TGType; cdecl; external libsoup;
function SOUP_TYPE_WEBSOCKET_ERROR: TGType;

function soup_websocket_connection_type_get_type: TGType; cdecl; external libsoup;
function SOUP_TYPE_WEBSOCKET_CONNECTION_TYPE: TGType;

function soup_websocket_data_type_get_type: TGType; cdecl; external libsoup;
function SOUP_TYPE_WEBSOCKET_DATA_TYPE: TGType;

function soup_websocket_close_code_get_type: TGType; cdecl; external libsoup;
function SOUP_TYPE_WEBSOCKET_CLOSE_CODE: TGType;

function soup_websocket_state_get_type: TGType; cdecl; external libsoup;
function SOUP_TYPE_WEBSOCKET_STATE: TGType;


// === Konventiert am: 29-9-25 19:44:56 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



function SOUP_TYPE_CACHEABILITY: TGType;
begin
  SOUP_TYPE_CACHEABILITY := soup_cacheability_get_type;
end;

function SOUP_TYPE_CACHE_TYPE: TGType;
begin
  SOUP_TYPE_CACHE_TYPE := soup_cache_type_get_type;
end;

function SOUP_TYPE_COOKIE_JAR_ACCEPT_POLICY: TGType;
begin
  SOUP_TYPE_COOKIE_JAR_ACCEPT_POLICY := soup_cookie_jar_accept_policy_get_type;
end;

function SOUP_TYPE_SAME_SITE_POLICY: TGType;
begin
  SOUP_TYPE_SAME_SITE_POLICY := soup_same_site_policy_get_type;
end;

function SOUP_TYPE_MEMORY_USE: TGType;
begin
  SOUP_TYPE_MEMORY_USE := soup_memory_use_get_type;
end;

function SOUP_TYPE_SERVER_LISTEN_OPTIONS: TGType;
begin
  SOUP_TYPE_SERVER_LISTEN_OPTIONS := soup_server_listen_options_get_type;
end;

function SOUP_TYPE_DATE_FORMAT: TGType;
begin
  SOUP_TYPE_DATE_FORMAT := soup_date_format_get_type;
end;

function SOUP_TYPE_LOGGER_LOG_LEVEL: TGType;
begin
  SOUP_TYPE_LOGGER_LOG_LEVEL := soup_logger_log_level_get_type;
end;

function SOUP_TYPE_MESSAGE_HEADERS_TYPE: TGType;
begin
  SOUP_TYPE_MESSAGE_HEADERS_TYPE := soup_message_headers_type_get_type;
end;

function SOUP_TYPE_ENCODING: TGType;
begin
  SOUP_TYPE_ENCODING := soup_encoding_get_type;
end;

function SOUP_TYPE_EXPECTATION: TGType;
begin
  SOUP_TYPE_EXPECTATION := soup_expectation_get_type;
end;

function SOUP_TYPE_MESSAGE_FLAGS: TGType;
begin
  SOUP_TYPE_MESSAGE_FLAGS := soup_message_flags_get_type;
end;

function SOUP_TYPE_MESSAGE_PRIORITY: TGType;
begin
  SOUP_TYPE_MESSAGE_PRIORITY := soup_message_priority_get_type;
end;

function SOUP_TYPE_SESSION_ERROR: TGType;
begin
  SOUP_TYPE_SESSION_ERROR := soup_session_error_get_type;
end;

function SOUP_TYPE_STATUS: TGType;
begin
  SOUP_TYPE_STATUS := soup_status_get_type;
end;

function SOUP_TYPE_HTTP_VERSION: TGType;
begin
  SOUP_TYPE_HTTP_VERSION := soup_http_version_get_type;
end;

function SOUP_TYPE_TLD_ERROR: TGType;
begin
  SOUP_TYPE_TLD_ERROR := soup_tld_error_get_type;
end;

function SOUP_TYPE_URI_COMPONENT: TGType;
begin
  SOUP_TYPE_URI_COMPONENT := soup_uri_component_get_type;
end;

function SOUP_TYPE_WEBSOCKET_ERROR: TGType;
begin
  SOUP_TYPE_WEBSOCKET_ERROR := soup_websocket_error_get_type;
end;

function SOUP_TYPE_WEBSOCKET_CONNECTION_TYPE: TGType;
begin
  SOUP_TYPE_WEBSOCKET_CONNECTION_TYPE := soup_websocket_connection_type_get_type;
end;

function SOUP_TYPE_WEBSOCKET_DATA_TYPE: TGType;
begin
  SOUP_TYPE_WEBSOCKET_DATA_TYPE := soup_websocket_data_type_get_type;
end;

function SOUP_TYPE_WEBSOCKET_CLOSE_CODE: TGType;
begin
  SOUP_TYPE_WEBSOCKET_CLOSE_CODE := soup_websocket_close_code_get_type;
end;

function SOUP_TYPE_WEBSOCKET_STATE: TGType;
begin
  SOUP_TYPE_WEBSOCKET_STATE := soup_websocket_state_get_type;
end;


{$ENDIF read_implementation}
