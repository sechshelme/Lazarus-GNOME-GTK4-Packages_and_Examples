{$IFDEF read_interface}


type
  PEcore_Con_Type = ^TEcore_Con_Type;
  TEcore_Con_Type = longint;

const
  ECORE_CON_LOCAL_USER = 0;
  ECORE_CON_LOCAL_SYSTEM = 1;
  ECORE_CON_LOCAL_ABSTRACT = 2;
  ECORE_CON_REMOTE_TCP = 3;
  ECORE_CON_REMOTE_MCAST = 4;
  ECORE_CON_REMOTE_UDP = 5;
  ECORE_CON_REMOTE_BROADCAST = 6;
  ECORE_CON_REMOTE_NODELAY = 7;
  ECORE_CON_REMOTE_CORK = 8;
  ECORE_CON_USE_SSL2 = 16;
  ECORE_CON_USE_SSL3 = 32;
  ECORE_CON_USE_TLS = 64;
  ECORE_CON_USE_MIXED = 96;
  ECORE_CON_LOAD_CERT = 128;
  ECORE_CON_NO_PROXY = 256;
  ECORE_CON_SOCKET_ACTIVATE = 512;

const
  ECORE_CON_USE_SSL = ECORE_CON_USE_SSL2;
  ECORE_CON_REMOTE_SYSTEM = ECORE_CON_REMOTE_TCP;

type
  TEcore_Con_Socks = record
  end;
  PEcore_Con_Socks = ^TEcore_Con_Socks;

  TEcore_Con_Dns_Cb = procedure(canonname: pchar; ip: pchar; addr: Psockaddr; addrlen: longint; data: pointer); cdecl;

  PEcore_Con_Server = ^TEcore_Con_Server;
  TEcore_Con_Server = record
  end;

  PEcore_Con_Client = ^TEcore_Con_Client;
  TEcore_Con_Client = record
  end;

  PEcore_Con_Url = ^TEcore_Con_Url;
  TEcore_Con_Url = record
  end;

  TEcore_Con_Event_Client_Add = record
    client: PEcore_Con_Client;
  end;
  PEcore_Con_Event_Client_Add = ^TEcore_Con_Event_Client_Add;

  TEcore_Con_Event_Client_Upgrade = record
    client: PEcore_Con_Client;
  end;
  PEcore_Con_Event_Client_Upgrade = ^TEcore_Con_Event_Client_Upgrade;

  TEcore_Con_Event_Client_Del = record
    client: PEcore_Con_Client;
  end;
  PEcore_Con_Event_Client_Del = ^TEcore_Con_Event_Client_Del;

  TEcore_Con_Event_Client_Error = record
    client: PEcore_Con_Client;
    error: pchar;
  end;
  PEcore_Con_Event_Client_Error = ^TEcore_Con_Event_Client_Error;

  TEcore_Con_Event_Server_Add = record
    server: PEcore_Con_Server;
  end;
  PEcore_Con_Event_Server_Add = ^TEcore_Con_Event_Server_Add;

  TEcore_Con_Event_Server_Upgrade = record
    server: PEcore_Con_Server;
  end;
  PEcore_Con_Event_Server_Upgrade = ^TEcore_Con_Event_Server_Upgrade;

  TEcore_Con_Event_Server_Del = record
    server: PEcore_Con_Server;
  end;
  PEcore_Con_Event_Server_Del = ^TEcore_Con_Event_Server_Del;

  TEcore_Con_Event_Server_Error = record
    server: PEcore_Con_Server;
    error: pchar;
  end;
  PEcore_Con_Event_Server_Error = ^TEcore_Con_Event_Server_Error;

  TEcore_Con_Event_Client_Data = record
    client: PEcore_Con_Client;
    data: pointer;
    size: longint;
  end;
  PEcore_Con_Event_Client_Data = ^TEcore_Con_Event_Client_Data;

  TEcore_Con_Event_Server_Data = record
    server: PEcore_Con_Server;
    data: pointer;
    size: longint;
  end;
  PEcore_Con_Event_Server_Data = ^TEcore_Con_Event_Server_Data;

  TEcore_Con_Event_Client_Write = record
    client: PEcore_Con_Client;
    size: longint;
  end;
  PEcore_Con_Event_Client_Write = ^TEcore_Con_Event_Client_Write;

  TEcore_Con_Event_Server_Write = record
    server: PEcore_Con_Server;
    size: longint;
  end;
  PEcore_Con_Event_Server_Write = ^TEcore_Con_Event_Server_Write;

  TEcore_Con_Event_Proxy_Bind = record
    server: PEcore_Con_Server;
    ip: pchar;
    port: longint;
  end;
  PEcore_Con_Event_Proxy_Bind = ^TEcore_Con_Event_Proxy_Bind;

  TEcore_Con_Event_Url_Data = record
    url_con: PEcore_Con_Url;
    size: longint;
    data: array[0..0] of byte;
  end;
  PEcore_Con_Event_Url_Data = ^TEcore_Con_Event_Url_Data;

  TEcore_Con_Event_Url_Complete = record
    url_con: PEcore_Con_Url;
    status: longint;
  end;
  PEcore_Con_Event_Url_Complete = ^TEcore_Con_Event_Url_Complete;

  TEcore_Con_Event_Url_Progress = record
    url_con: PEcore_Con_Url;
    down: record
      total: double;
      now: double;
      end;
    up: record
      total: double;
      now: double;
      end;
  end;
  PEcore_Con_Event_Url_Progress = ^TEcore_Con_Event_Url_Progress;

var
  ECORE_CON_EVENT_CLIENT_ADD: longint; cvar;external libecore_con;
  ECORE_CON_EVENT_CLIENT_DEL: longint; cvar;external libecore_con;
  ECORE_CON_EVENT_CLIENT_ERROR: longint; cvar;external libecore_con;
  ECORE_CON_EVENT_CLIENT_UPGRADE: longint; cvar;external libecore_con;
  ECORE_CON_EVENT_SERVER_ADD: longint; cvar;external libecore_con;
  ECORE_CON_EVENT_SERVER_DEL: longint; cvar;external libecore_con;
  ECORE_CON_EVENT_SERVER_ERROR: longint; cvar;external libecore_con;
  ECORE_CON_EVENT_SERVER_UPGRADE: longint; cvar;external libecore_con;
  ECORE_CON_EVENT_CLIENT_WRITE: longint; cvar;external libecore_con;
  ECORE_CON_EVENT_SERVER_WRITE: longint; cvar;external libecore_con;
  ECORE_CON_EVENT_CLIENT_DATA: longint; cvar;external libecore_con;
  ECORE_CON_EVENT_SERVER_DATA: longint; cvar;external libecore_con;
  ECORE_CON_EVENT_PROXY_BIND: longint; cvar;external libecore_con;
  ECORE_CON_EVENT_URL_DATA: longint; cvar;external libecore_con;
  ECORE_CON_EVENT_URL_COMPLETE: longint; cvar;external libecore_con;
  ECORE_CON_EVENT_URL_PROGRESS: longint; cvar;external libecore_con;

function ecore_con_init: longint; cdecl; external libecore_con;
function ecore_con_shutdown: longint; cdecl; external libecore_con;
function ecore_con_lookup(name: pchar; done_cb: TEcore_Con_Dns_Cb; data: pointer): TEina_Bool; cdecl; external libecore_con;
function ecore_con_ssl_available_get: longint; cdecl; external libecore_con;
function ecore_con_ssl_server_cert_add(svr: PEcore_Con_Server; cert: pchar): TEina_Bool; cdecl; external libecore_con;
function ecore_con_ssl_server_privkey_add(svr: PEcore_Con_Server; key_file: pchar): TEina_Bool; cdecl; external libecore_con;
function ecore_con_ssl_server_crl_add(svr: PEcore_Con_Server; crl_file: pchar): TEina_Bool; cdecl; external libecore_con;
function ecore_con_ssl_server_cafile_add(svr: PEcore_Con_Server; ca_file: pchar): TEina_Bool; cdecl; external libecore_con;
procedure ecore_con_ssl_server_verify(svr: PEcore_Con_Server); cdecl; external libecore_con;
procedure ecore_con_ssl_server_verify_basic(svr: PEcore_Con_Server); cdecl; external libecore_con;
procedure ecore_con_ssl_server_verify_name_set(svr: PEcore_Con_Server; name: pchar); cdecl; external libecore_con;
function ecore_con_ssl_server_verify_name_get(svr: PEcore_Con_Server): pchar; cdecl; external libecore_con;
function ecore_con_ssl_server_upgrade(svr: PEcore_Con_Server; ssl_type: TEcore_Con_Type): TEina_Bool; cdecl; external libecore_con;
function ecore_con_ssl_client_upgrade(cl: PEcore_Con_Client; ssl_type: TEcore_Con_Type): TEina_Bool; cdecl; external libecore_con;
function ecore_con_socks4_remote_add(ip: pchar; port: longint; username: pchar): PEcore_Con_Socks; cdecl; external libecore_con;
function ecore_con_socks4_remote_exists(ip: pchar; port: longint; username: pchar): TEina_Bool; cdecl; external libecore_con;
procedure ecore_con_socks4_remote_del(ip: pchar; port: longint; username: pchar); cdecl; external libecore_con;
function ecore_con_socks5_remote_add(ip: pchar; port: longint; username: pchar; password: pchar): PEcore_Con_Socks; cdecl; external libecore_con;
function ecore_con_socks5_remote_exists(ip: pchar; port: longint; username: pchar; password: pchar): TEina_Bool; cdecl; external libecore_con;
procedure ecore_con_socks5_remote_del(ip: pchar; port: longint; username: pchar; password: pchar); cdecl; external libecore_con;
procedure ecore_con_socks_lookup_set(ecs: PEcore_Con_Socks; enable: TEina_Bool); cdecl; external libecore_con;
function ecore_con_socks_lookup_get(ecs: PEcore_Con_Socks): TEina_Bool; cdecl; external libecore_con;
procedure ecore_con_socks_bind_set(ecs: PEcore_Con_Socks; is_bind: TEina_Bool); cdecl; external libecore_con;
function ecore_con_socks_bind_get(ecs: PEcore_Con_Socks): TEina_Bool; cdecl; external libecore_con;
function ecore_con_socks_version_get(ecs: PEcore_Con_Socks): dword; cdecl; external libecore_con;
procedure ecore_con_socks_remote_del(ecs: PEcore_Con_Socks); cdecl; external libecore_con;
procedure ecore_con_socks_apply_once(ecs: PEcore_Con_Socks); cdecl; external libecore_con;
procedure ecore_con_socks_apply_always(ecs: PEcore_Con_Socks); cdecl; external libecore_con;
function ecore_con_local_path_new(is_system: TEina_Bool; name: pchar; port: longint): pchar; cdecl; external libecore_con;
function ecore_con_server_add(_type: TEcore_Con_Type; name: pchar; port: longint; data: pointer): PEcore_Con_Server; cdecl; external libecore_con;
function ecore_con_server_connect(_type: TEcore_Con_Type; name: pchar; port: longint; data: pointer): PEcore_Con_Server; cdecl; external libecore_con;
function ecore_con_server_del(svr: PEcore_Con_Server): pointer; cdecl; external libecore_con;
function ecore_con_server_name_get(svr: PEcore_Con_Server): pchar; cdecl; external libecore_con;
function ecore_con_server_data_get(svr: PEcore_Con_Server): pointer; cdecl; external libecore_con;
function ecore_con_server_data_set(svr: PEcore_Con_Server; data: pointer): pointer; cdecl; external libecore_con;
function ecore_con_server_connected_get(svr: PEcore_Con_Server): TEina_Bool; cdecl; external libecore_con;
function ecore_con_server_port_get(svr: PEcore_Con_Server): longint; cdecl; external libecore_con;
function ecore_con_server_uptime_get(svr: PEcore_Con_Server): double; cdecl; external libecore_con;
function ecore_con_server_send(svr: PEcore_Con_Server; data: pointer; size: longint): longint; cdecl; external libecore_con;
procedure ecore_con_server_client_limit_set(svr: PEcore_Con_Server; client_limit: longint; reject_excess_clients: char); cdecl; external libecore_con;
function ecore_con_server_clients_get(svr: PEcore_Con_Server): PEina_List; cdecl; external libecore_con;
function ecore_con_server_ip_get(svr: PEcore_Con_Server): pchar; cdecl; external libecore_con;
procedure ecore_con_server_flush(svr: PEcore_Con_Server); cdecl; external libecore_con;
procedure ecore_con_server_timeout_set(svr: PEcore_Con_Server; timeout: double); cdecl; external libecore_con;
function ecore_con_server_timeout_get(svr: PEcore_Con_Server): double; cdecl; external libecore_con;
function ecore_con_server_fd_get(svr: PEcore_Con_Server): longint; cdecl; external libecore_con;
function ecore_con_client_fd_get(cl: PEcore_Con_Client): longint; cdecl; external libecore_con;
function ecore_con_client_send(cl: PEcore_Con_Client; data: pointer; size: longint): longint; cdecl; external libecore_con;
function ecore_con_client_del(cl: PEcore_Con_Client): pointer; cdecl; external libecore_con;
procedure ecore_con_client_data_set(cl: PEcore_Con_Client; data: pointer); cdecl; external libecore_con;
function ecore_con_client_data_get(cl: PEcore_Con_Client): pointer; cdecl; external libecore_con;
function ecore_con_client_ip_get(cl: PEcore_Con_Client): pchar; cdecl; external libecore_con;
procedure ecore_con_client_flush(cl: PEcore_Con_Client); cdecl; external libecore_con;
function ecore_con_client_uptime_get(cl: PEcore_Con_Client): double; cdecl; external libecore_con;
function ecore_con_client_timeout_get(cl: PEcore_Con_Client): double; cdecl; external libecore_con;
procedure ecore_con_client_timeout_set(cl: PEcore_Con_Client; timeout: double); cdecl; external libecore_con;
function ecore_con_client_connected_get(cl: PEcore_Con_Client): TEina_Bool; cdecl; external libecore_con;
function ecore_con_client_port_get(cl: PEcore_Con_Client): longint; cdecl; external libecore_con;
function ecore_con_client_server_get(cl: PEcore_Con_Client): PEcore_Con_Server; cdecl; external libecore_con;

type
  PEcore_Con_Url_Time = ^TEcore_Con_Url_Time;
  TEcore_Con_Url_Time = longint;

const
  ECORE_CON_URL_TIME_NONE = 0;
  ECORE_CON_URL_TIME_IFMODSINCE = 1;
  ECORE_CON_URL_TIME_IFUNMODSINCE = 2;

type
  PEcore_Con_Url_Http_Version = ^TEcore_Con_Url_Http_Version;
  TEcore_Con_Url_Http_Version = longint;

const
  ECORE_CON_URL_HTTP_VERSION_1_0 = 0;
  ECORE_CON_URL_HTTP_VERSION_1_1 = 1;

function ecore_con_url_http_version_set(url_con: PEcore_Con_Url; version: TEcore_Con_Url_Http_Version): TEina_Bool; cdecl; external libecore_con;
function ecore_con_url_init: longint; cdecl; external libecore_con;
function ecore_con_url_shutdown: longint; cdecl; external libecore_con;
procedure ecore_con_url_pipeline_set(enable: TEina_Bool); cdecl; external libecore_con;
function ecore_con_url_pipeline_get: TEina_Bool; cdecl; external libecore_con;
function ecore_con_url_new(url: pchar): PEcore_Con_Url; cdecl; external libecore_con;
function ecore_con_url_url_set(url_con: PEcore_Con_Url; url: pchar): TEina_Bool; cdecl; external libecore_con;
function ecore_con_url_url_get(url_con: PEcore_Con_Url): pchar; cdecl; external libecore_con;
function ecore_con_url_custom_new(url: pchar; custom_request: pchar): PEcore_Con_Url; cdecl; external libecore_con;
procedure ecore_con_url_free(url_con: PEcore_Con_Url); cdecl; external libecore_con;
procedure ecore_con_url_data_set(url_con: PEcore_Con_Url; data: pointer); cdecl; external libecore_con;
function ecore_con_url_data_get(url_con: PEcore_Con_Url): pointer; cdecl; external libecore_con;
procedure ecore_con_url_additional_header_add(url_con: PEcore_Con_Url; key: pchar; value: pchar); cdecl; external libecore_con;
procedure ecore_con_url_additional_headers_clear(url_con: PEcore_Con_Url); cdecl; external libecore_con;
function ecore_con_url_response_headers_get(url_con: PEcore_Con_Url): PEina_List; cdecl; external libecore_con;
procedure ecore_con_url_fd_set(url_con: PEcore_Con_Url; fd: longint); cdecl; external libecore_con;
function ecore_con_url_received_bytes_get(url_con: PEcore_Con_Url): longint; cdecl; external libecore_con;
function ecore_con_url_httpauth_set(url_con: PEcore_Con_Url; username: pchar; password: pchar; safe: TEina_Bool): TEina_Bool; cdecl; external libecore_con;
function ecore_con_url_get(url_con: PEcore_Con_Url): TEina_Bool; cdecl; external libecore_con;
function ecore_con_url_head(url_con: PEcore_Con_Url): TEina_Bool; cdecl; external libecore_con;
function ecore_con_url_post(url_con: PEcore_Con_Url; data: pointer; length: longint; content_type: pchar): TEina_Bool; cdecl; external libecore_con;
procedure ecore_con_url_time(url_con: PEcore_Con_Url; time_condition: TEcore_Con_Url_Time; timestamp: double); cdecl; external libecore_con;
function ecore_con_url_ftp_upload(url_con: PEcore_Con_Url; filename: pchar; user: pchar; pass: pchar; upload_dir: pchar): TEina_Bool; cdecl; external libecore_con;
procedure ecore_con_url_verbose_set(url_con: PEcore_Con_Url; verbose: TEina_Bool); cdecl; external libecore_con;
procedure ecore_con_url_ftp_use_epsv_set(url_con: PEcore_Con_Url; use_epsv: TEina_Bool); cdecl; external libecore_con;
procedure ecore_con_url_cookies_init(url_con: PEcore_Con_Url); cdecl; external libecore_con;
procedure ecore_con_url_cookies_ignore_old_session_set(url_con: PEcore_Con_Url; ignore: TEina_Bool); cdecl; external libecore_con;
procedure ecore_con_url_cookies_clear(url_con: PEcore_Con_Url); cdecl; external libecore_con;
procedure ecore_con_url_cookies_session_clear(url_con: PEcore_Con_Url); cdecl; external libecore_con;
procedure ecore_con_url_cookies_file_add(url_con: PEcore_Con_Url; file_name: pchar); cdecl; external libecore_con;
function ecore_con_url_cookies_jar_file_set(url_con: PEcore_Con_Url; cookiejar_file: pchar): TEina_Bool; cdecl; external libecore_con;
procedure ecore_con_url_cookies_jar_write(url_con: PEcore_Con_Url); cdecl; external libecore_con;
procedure ecore_con_url_ssl_verify_peer_set(url_con: PEcore_Con_Url; verify: TEina_Bool); cdecl; external libecore_con;
function ecore_con_url_ssl_ca_set(url_con: PEcore_Con_Url; ca_path: pchar): longint; cdecl; external libecore_con;
function ecore_con_url_proxy_set(url_con: PEcore_Con_Url; proxy: pchar): TEina_Bool; cdecl; external libecore_con;
function ecore_con_url_proxy_username_set(url_con: PEcore_Con_Url; username: pchar): TEina_Bool; cdecl; external libecore_con;
function ecore_con_url_proxy_password_set(url_con: PEcore_Con_Url; password: pchar): TEina_Bool; cdecl; external libecore_con;
procedure ecore_con_url_timeout_set(url_con: PEcore_Con_Url; timeout: double); cdecl; external libecore_con;
function ecore_con_url_status_code_get(url_con: PEcore_Con_Url): longint; cdecl; external libecore_con;
procedure ecore_con_url_limit_upload_speed(url_obj: PEcore_Con_Url; max_speed: Toff_t); cdecl; external libecore_con;
procedure ecore_con_url_limit_download_speed(url_obj: PEcore_Con_Url; max_speed: Toff_t); cdecl; external libecore_con;

// === Konventiert am: 8-6-25 17:40:37 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
