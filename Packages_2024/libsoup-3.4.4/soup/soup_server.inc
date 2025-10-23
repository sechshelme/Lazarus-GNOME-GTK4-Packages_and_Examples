{$IFDEF read_interface}


type
  PSoupServerListenOptions = ^TSoupServerListenOptions;
  TSoupServerListenOptions = longint;

const
  SOUP_SERVER_LISTEN_HTTPS = 1 shl 0;
  SOUP_SERVER_LISTEN_IPV4_ONLY = 1 shl 1;
  SOUP_SERVER_LISTEN_IPV6_ONLY = 1 shl 2;

type
  TSoupServer = record
    parent_instance: TGObject;
  end;
  PSoupServer = ^TSoupServer;

  TSoupServerClass = record
    parent_class: TGObjectClass;
    request_started: procedure(server: PSoupServer; msg: PSoupServerMessage); cdecl;
    request_read: procedure(server: PSoupServer; msg: PSoupServerMessage); cdecl;
    request_finished: procedure(server: PSoupServer; msg: PSoupServerMessage); cdecl;
    request_aborted: procedure(server: PSoupServer; msg: PSoupServerMessage); cdecl;
    padding: array[0..5] of Tgpointer;
  end;
  PSoupServerClass = ^TSoupServerClass;

function soup_server_get_type: TGType; cdecl; external libsoup;
function soup_server_new(optname1: pchar): PSoupServer; cdecl; varargs; external libsoup;
procedure soup_server_set_tls_certificate(server: PSoupServer; certificate: PGTlsCertificate); cdecl; external libsoup;
function soup_server_get_tls_certificate(server: PSoupServer): PGTlsCertificate; cdecl; external libsoup;
procedure soup_server_set_tls_database(server: PSoupServer; tls_database: PGTlsDatabase); cdecl; external libsoup;
function soup_server_get_tls_database(server: PSoupServer): PGTlsDatabase; cdecl; external libsoup;
procedure soup_server_set_tls_auth_mode(server: PSoupServer; mode: TGTlsAuthenticationMode); cdecl; external libsoup;
function soup_server_get_tls_auth_mode(server: PSoupServer): TGTlsAuthenticationMode; cdecl; external libsoup;
function soup_server_is_https(server: PSoupServer): Tgboolean; cdecl; external libsoup;
function soup_server_listen(server: PSoupServer; address: PGSocketAddress; options: TSoupServerListenOptions; error: PPGError): Tgboolean; cdecl; external libsoup;
function soup_server_listen_all(server: PSoupServer; port: Tguint; options: TSoupServerListenOptions; error: PPGError): Tgboolean; cdecl; external libsoup;
function soup_server_listen_local(server: PSoupServer; port: Tguint; options: TSoupServerListenOptions; error: PPGError): Tgboolean; cdecl; external libsoup;
function soup_server_listen_socket(server: PSoupServer; socket: PGSocket; options: TSoupServerListenOptions; error: PPGError): Tgboolean; cdecl; external libsoup;
function soup_server_get_uris(server: PSoupServer): PGSList; cdecl; external libsoup;
function soup_server_get_listeners(server: PSoupServer): PGSList; cdecl; external libsoup;
procedure soup_server_disconnect(server: PSoupServer); cdecl; external libsoup;
function soup_server_accept_iostream(server: PSoupServer; stream: PGIOStream; local_addr: PGSocketAddress; remote_addr: PGSocketAddress; error: PPGError): Tgboolean; cdecl; external libsoup;

type
  TSoupServerCallback = procedure(server: PSoupServer; msg: PSoupServerMessage; path: pchar; query: PGHashTable; user_data: Tgpointer); cdecl;

procedure soup_server_add_handler(server: PSoupServer; path: pchar; callback: TSoupServerCallback; user_data: Tgpointer; destroy: TGDestroyNotify); cdecl; external libsoup;
procedure soup_server_add_early_handler(server: PSoupServer; path: pchar; callback: TSoupServerCallback; user_data: Tgpointer; destroy: TGDestroyNotify); cdecl; external libsoup;

type
  TSoupServerWebsocketCallback = procedure(server: PSoupServer; msg: PSoupServerMessage; path: pchar; connection: PSoupWebsocketConnection; user_data: Tgpointer); cdecl;

procedure soup_server_add_websocket_handler(server: PSoupServer; path: pchar; origin: pchar; protocols: PPchar; callback: TSoupServerWebsocketCallback;
  user_data: Tgpointer; destroy: TGDestroyNotify); cdecl; external libsoup;
procedure soup_server_add_websocket_extension(server: PSoupServer; extension_type: TGType); cdecl; external libsoup;
procedure soup_server_remove_websocket_extension(server: PSoupServer; extension_type: TGType); cdecl; external libsoup;
procedure soup_server_remove_handler(server: PSoupServer; path: pchar); cdecl; external libsoup;
procedure soup_server_add_auth_domain(server: PSoupServer; auth_domain: PSoupAuthDomain); cdecl; external libsoup;
procedure soup_server_remove_auth_domain(server: PSoupServer; auth_domain: PSoupAuthDomain); cdecl; external libsoup;
procedure soup_server_pause_message(server: PSoupServer; msg: PSoupServerMessage); cdecl; external libsoup; deprecated;
procedure soup_server_unpause_message(server: PSoupServer; msg: PSoupServerMessage); cdecl; external libsoup; deprecated;

// === Konventiert am: 29-9-25 19:44:12 ===

function SOUP_TYPE_SERVER: TGType;
function SOUP_SERVER(obj: Pointer): PSoupServer;
function SOUP_IS_SERVER(obj: Pointer): Tgboolean;
function SOUP_SERVER_CLASS(klass: Pointer): PSoupServerClass;
function SOUP_IS_SERVER_CLASS(klass: Pointer): Tgboolean;
function SOUP_SERVER_GET_CLASS(obj: Pointer): PSoupServerClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function SOUP_TYPE_SERVER: TGType;
begin
  Result := soup_server_get_type;
end;

function SOUP_SERVER(obj: Pointer): PSoupServer;
begin
  Result := PSoupServer(g_type_check_instance_cast(obj, SOUP_TYPE_SERVER));
end;

function SOUP_IS_SERVER(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, SOUP_TYPE_SERVER);
end;

function SOUP_SERVER_CLASS(klass: Pointer): PSoupServerClass;
begin
  Result := PSoupServerClass(g_type_check_class_cast(klass, SOUP_TYPE_SERVER));
end;

function SOUP_IS_SERVER_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, SOUP_TYPE_SERVER);
end;

function SOUP_SERVER_GET_CLASS(obj: Pointer): PSoupServerClass;
begin
  Result := PSoupServerClass(PGTypeInstance(obj)^.g_class);
end;


{$ENDIF read_implementation}
