{$IFDEF read_interface}


const
  HTTP_OK = 200;
  HTTP_NOCONTENT = 204;
  HTTP_MOVEPERM = 301;
  HTTP_MOVETEMP = 302;
  HTTP_NOTMODIFIED = 304;
  HTTP_BADREQUEST = 400;
  HTTP_NOTFOUND = 404;
  HTTP_BADMETHOD = 405;
  HTTP_ENTITYTOOLARGE = 413;
  HTTP_EXPECTATIONFAILED = 417;
  HTTP_INTERNAL = 500;
  HTTP_NOTIMPLEMENTED = 501;
  HTTP_SERVUNAVAIL = 503;

function evhttp_new(base: Pevent_base): Pevhttp; cdecl; external libevent;
function evhttp_bind_socket(http: Pevhttp; address: pchar; port: Tev_uint16_t): longint; cdecl; external libevent;
function evhttp_bind_socket_with_handle(http: Pevhttp; address: pchar; port: Tev_uint16_t): Pevhttp_bound_socket; cdecl; external libevent;
function evhttp_accept_socket(http: Pevhttp; fd: Tevutil_socket_t): longint; cdecl; external libevent;
function evhttp_accept_socket_with_handle(http: Pevhttp; fd: Tevutil_socket_t): Pevhttp_bound_socket; cdecl; external libevent;
function evhttp_bind_listener(http: Pevhttp; listener: Pevconnlistener): Pevhttp_bound_socket; cdecl; external libevent;
function evhttp_bound_socket_get_listener(bound: Pevhttp_bound_socket): Pevconnlistener; cdecl; external libevent;

type
  Tevhttp_bound_socket_foreach_fn = procedure(para1: Pevhttp_bound_socket; para2: pointer); cdecl;

procedure evhttp_foreach_bound_socket(http: Pevhttp; _function: Tevhttp_bound_socket_foreach_fn; argument: pointer); cdecl; external libevent;
procedure evhttp_del_accept_socket(http: Pevhttp; bound_socket: Pevhttp_bound_socket); cdecl; external libevent;
function evhttp_bound_socket_get_fd(bound_socket: Pevhttp_bound_socket): Tevutil_socket_t; cdecl; external libevent;
procedure evhttp_free(http: Pevhttp); cdecl; external libevent;
procedure evhttp_set_max_headers_size(http: Pevhttp; max_headers_size: Tev_ssize_t); cdecl; external libevent;
procedure evhttp_set_max_body_size(http: Pevhttp; max_body_size: Tev_ssize_t); cdecl; external libevent;
procedure evhttp_set_default_content_type(http: Pevhttp; content_type: pchar); cdecl; external libevent;
procedure evhttp_set_allowed_methods(http: Pevhttp; methods: Tev_uint16_t); cdecl; external libevent;

type
  TEvHttpCallback = procedure(para1: PEvhttp_request; para2: pointer); cdecl;

function evhttp_set_cb(http: PEvhttp; path: pchar; cb: TEvHttpCallback; cb_arg: pointer): longint; cdecl; external libevent;
function evhttp_del_cb(para1: Pevhttp; para2: pchar): longint; cdecl; external libevent;

type
  TEvHttpGenCallback = procedure(para1: PEvhttp_request; para2: pointer); cdecl;
  TEvHttpBevCallback = function(para1: Pevent_base; para2: pointer): Pbufferevent; cdecl;

procedure evhttp_set_gencb(http: PEvhttp; cb: TEvHttpGenCallback; arg: pointer); cdecl; external libevent;
procedure evhttp_set_bevcb(http: PEvhttp; cb: TEvHttpBevCallback; arg: pointer); cdecl; external libevent;
function evhttp_add_virtual_host(http: Pevhttp; pattern: pchar; vhost: Pevhttp): longint; cdecl; external libevent;
function evhttp_remove_virtual_host(http: Pevhttp; vhost: Pevhttp): longint; cdecl; external libevent;
function evhttp_add_server_alias(http: Pevhttp; alias: pchar): longint; cdecl; external libevent;
function evhttp_remove_server_alias(http: Pevhttp; alias: pchar): longint; cdecl; external libevent;
procedure evhttp_set_timeout(http: Pevhttp; timeout_in_secs: longint); cdecl; external libevent;
procedure evhttp_set_timeout_tv(http: Pevhttp; tv: Ptimeval); cdecl; external libevent;

const
  EVHTTP_SERVER_LINGERING_CLOSE = $0001;

function evhttp_set_flags(http: Pevhttp; flags: longint): longint; cdecl; external libevent;
procedure evhttp_send_error(req: Pevhttp_request; error: longint; reason: pchar); cdecl; external libevent;
procedure evhttp_send_reply(req: Pevhttp_request; code: longint; reason: pchar; databuf: Pevbuffer); cdecl; external libevent;
procedure evhttp_send_reply_start(req: Pevhttp_request; code: longint; reason: pchar); cdecl; external libevent;
procedure evhttp_send_reply_chunk(req: Pevhttp_request; databuf: Pevbuffer); cdecl; external libevent;

type
  TEvHttpReplyChunkCallback = procedure(para1: PEvhttp_connection; para2: pointer); cdecl;

procedure evhttp_send_reply_chunk_with_cb(para1: PEvhttp_request; para2: PEvbuffer; cb: TEvHttpReplyChunkCallback; arg: pointer); cdecl; external libevent;
procedure evhttp_send_reply_end(req: Pevhttp_request); cdecl; external libevent;

function evhttp_connection_base_bufferevent_new(base: Pevent_base; dnsbase: Pevdns_base; bev: Pbufferevent; address: pchar; port: Tev_uint16_t): Pevhttp_connection; cdecl; external libevent;
function evhttp_connection_get_bufferevent(evcon: Pevhttp_connection): Pbufferevent; cdecl; external libevent;
function evhttp_connection_get_server(evcon: Pevhttp_connection): Pevhttp; cdecl; external libevent;

type
  TEvHttpRequestCallback = procedure(para1: PEvhttp_request; para2: pointer); cdecl;
  TEvHttpRequestHeaderCallback = function(para1: PEvhttp_request; para2: pointer): longint; cdecl;

function evhttp_request_new(cb: TEvHttpRequestCallback; arg: pointer): PEvhttp_request; cdecl; external libevent;
procedure evhttp_request_set_chunked_cb(para1: PEvhttp_request; cb: TEvHttpRequestCallback); cdecl; external libevent;
procedure evhttp_request_set_header_cb(para1: PEvhttp_request; cb: TEvHttpRequestHeaderCallback); cdecl; external libevent;

type
  TEvHttpRequestErrorCallback = procedure(para1: Tevhttp_request_error; para2: pointer); cdecl;
  TEvHttpRequestCompleteCallback = procedure(para1: PEvhttp_request; para2: pointer); cdecl;

procedure evhttp_request_set_error_cb(para1: PEvhttp_request; para2: TEvHttpRequestErrorCallback); cdecl; external libevent;
procedure evhttp_request_set_on_complete_cb(req: PEvhttp_request; cb: TEvHttpRequestCompleteCallback; cb_arg: pointer); cdecl; external libevent;
procedure evhttp_request_free(req: Pevhttp_request); cdecl; external libevent;
function evhttp_connection_base_new(base: Pevent_base; dnsbase: Pevdns_base; address: pchar; port: Tev_uint16_t): Pevhttp_connection; cdecl; external libevent;
procedure evhttp_connection_set_family(evcon: Pevhttp_connection; family: longint); cdecl; external libevent;

const
  EVHTTP_CON_REUSE_CONNECTED_ADDR = $0008;
  EVHTTP_CON_READ_ON_WRITE_ERROR = $0010;
  EVHTTP_CON_LINGERING_CLOSE = $0020;
  EVHTTP_CON_PUBLIC_FLAGS_END = $100000;

function evhttp_connection_set_flags(evcon: Pevhttp_connection; flags: longint): longint; cdecl; external libevent;
procedure evhttp_request_own(req: Pevhttp_request); cdecl; external libevent;
function evhttp_request_is_owned(req: Pevhttp_request): longint; cdecl; external libevent;
function evhttp_request_get_connection(req: Pevhttp_request): Pevhttp_connection; cdecl; external libevent;
function evhttp_connection_get_base(req: Pevhttp_connection): Pevent_base; cdecl; external libevent;
procedure evhttp_connection_set_max_headers_size(evcon: Pevhttp_connection; new_max_headers_size: Tev_ssize_t); cdecl; external libevent;
procedure evhttp_connection_set_max_body_size(evcon: Pevhttp_connection; new_max_body_size: Tev_ssize_t); cdecl; external libevent;
procedure evhttp_connection_free(evcon: Pevhttp_connection); cdecl; external libevent;
procedure evhttp_connection_free_on_completion(evcon: Pevhttp_connection); cdecl; external libevent;
procedure evhttp_connection_set_local_address(evcon: Pevhttp_connection; address: pchar); cdecl; external libevent;
procedure evhttp_connection_set_local_port(evcon: Pevhttp_connection; port: Tev_uint16_t); cdecl; external libevent;
procedure evhttp_connection_set_timeout(evcon: Pevhttp_connection; timeout_in_secs: longint); cdecl; external libevent;
procedure evhttp_connection_set_timeout_tv(evcon: Pevhttp_connection; tv: Ptimeval); cdecl; external libevent;
procedure evhttp_connection_set_initial_retry_tv(evcon: Pevhttp_connection; tv: Ptimeval); cdecl; external libevent;
procedure evhttp_connection_set_retries(evcon: Pevhttp_connection; retry_max: longint); cdecl; external libevent;

type
  TEvHttpConnectionCloseCallback = procedure(para1: PEvhttp_connection; para2: pointer); cdecl;

procedure evhttp_connection_set_closecb(evcon: PEvhttp_connection; para2: TEvHttpConnectionCloseCallback; para3: pointer); cdecl; external libevent;
procedure evhttp_connection_get_peer(evcon: Pevhttp_connection; address: PPchar; port: Pev_uint16_t); cdecl; external libevent;
function evhttp_connection_get_addr(evcon: Pevhttp_connection): Psockaddr; cdecl; external libevent;
function evhttp_make_request(evcon: Pevhttp_connection; req: Pevhttp_request; _type: Tevhttp_cmd_type; uri: pchar): longint; cdecl; external libevent;
procedure evhttp_cancel_request(req: Pevhttp_request); cdecl; external libevent;

function evhttp_request_get_uri(req: Pevhttp_request): pchar; cdecl; external libevent;
function evhttp_request_get_evhttp_uri(req: Pevhttp_request): Pevhttp_uri; cdecl; external libevent;
function evhttp_request_get_command(req: Pevhttp_request): Tevhttp_cmd_type; cdecl; external libevent;
function evhttp_request_get_response_code(req: Pevhttp_request): longint; cdecl; external libevent;
function evhttp_request_get_response_code_line(req: Pevhttp_request): pchar; cdecl; external libevent;
function evhttp_request_get_input_headers(req: Pevhttp_request): Pevkeyvalq; cdecl; external libevent;
function evhttp_request_get_output_headers(req: Pevhttp_request): Pevkeyvalq; cdecl; external libevent;
function evhttp_request_get_input_buffer(req: Pevhttp_request): Pevbuffer; cdecl; external libevent;
function evhttp_request_get_output_buffer(req: Pevhttp_request): Pevbuffer; cdecl; external libevent;
function evhttp_request_get_host(req: Pevhttp_request): pchar; cdecl; external libevent;
function evhttp_find_header(headers: Pevkeyvalq; key: pchar): pchar; cdecl; external libevent;
function evhttp_remove_header(headers: Pevkeyvalq; key: pchar): longint; cdecl; external libevent;
function evhttp_add_header(headers: Pevkeyvalq; key: pchar; value: pchar): longint; cdecl; external libevent;
procedure evhttp_clear_headers(headers: Pevkeyvalq); cdecl; external libevent;
function evhttp_encode_uri(str: pchar): pchar; cdecl; external libevent;
function evhttp_uriencode(str: pchar; size: Tev_ssize_t; space_to_plus: longint): pchar; cdecl; external libevent;
function evhttp_decode_uri(uri: pchar): pchar; cdecl; external libevent;
function evhttp_uridecode(uri: pchar; decode_plus: longint; size_out: Psize_t): pchar; cdecl; external libevent;
function evhttp_parse_query(uri: pchar; headers: Pevkeyvalq): longint; cdecl; external libevent;
function evhttp_parse_query_str(uri: pchar; headers: Pevkeyvalq): longint; cdecl; external libevent;
function evhttp_htmlescape(html: pchar): pchar; cdecl; external libevent;
function evhttp_uri_new: Pevhttp_uri; cdecl; external libevent;
procedure evhttp_uri_set_flags(uri: Pevhttp_uri; flags: dword); cdecl; external libevent;
function evhttp_uri_get_scheme(uri: Pevhttp_uri): pchar; cdecl; external libevent;
function evhttp_uri_get_userinfo(uri: Pevhttp_uri): pchar; cdecl; external libevent;
function evhttp_uri_get_host(uri: Pevhttp_uri): pchar; cdecl; external libevent;
function evhttp_uri_get_port(uri: Pevhttp_uri): longint; cdecl; external libevent;
function evhttp_uri_get_path(uri: Pevhttp_uri): pchar; cdecl; external libevent;
function evhttp_uri_get_query(uri: Pevhttp_uri): pchar; cdecl; external libevent;
function evhttp_uri_get_fragment(uri: Pevhttp_uri): pchar; cdecl; external libevent;
function evhttp_uri_set_scheme(uri: Pevhttp_uri; scheme: pchar): longint; cdecl; external libevent;
function evhttp_uri_set_userinfo(uri: Pevhttp_uri; userinfo: pchar): longint; cdecl; external libevent;
function evhttp_uri_set_host(uri: Pevhttp_uri; host: pchar): longint; cdecl; external libevent;
function evhttp_uri_set_port(uri: Pevhttp_uri; port: longint): longint; cdecl; external libevent;
function evhttp_uri_set_path(uri: Pevhttp_uri; path: pchar): longint; cdecl; external libevent;
function evhttp_uri_set_query(uri: Pevhttp_uri; query: pchar): longint; cdecl; external libevent;
function evhttp_uri_set_fragment(uri: Pevhttp_uri; fragment: pchar): longint; cdecl; external libevent;
function evhttp_uri_parse_with_flags(source_uri: pchar; flags: dword): Pevhttp_uri; cdecl; external libevent;

const
  EVHTTP_URI_NONCONFORMANT = $01;

function evhttp_uri_parse(source_uri: pchar): Pevhttp_uri; cdecl; external libevent;
procedure evhttp_uri_free(uri: Pevhttp_uri); cdecl; external libevent;
function evhttp_uri_join(uri: Pevhttp_uri; buf: pchar; limit: Tsize_t): pchar; cdecl; external libevent;

// === Konventiert am: 26-8-25 19:37:45 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
