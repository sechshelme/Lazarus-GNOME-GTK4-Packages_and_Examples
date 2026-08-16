{$IFDEF read_interface}


type
  Prist_peer = type Pointer;
  PPrist_peer = ^Prist_peer;

type
  Trist_timing_mode = longint;
const
  RIST_TIMING_MODE_SOURCE = 0;
  RIST_TIMING_MODE_ARRIVAL = 1;
  RIST_TIMING_MODE_RTC = 2;

type
  Trist_recovery_mode = longint;
const
  RIST_RECOVERY_MODE_UNCONFIGURED = 0;
  RIST_RECOVERY_MODE_DISABLED = 1;
  RIST_RECOVERY_MODE_TIME = 2;

type
  Trist_congestion_control_mode = longint;
const
  RIST_CONGESTION_CONTROL_MODE_OFF = 0;
  RIST_CONGESTION_CONTROL_MODE_NORMAL = 1;
  RIST_CONGESTION_CONTROL_MODE_AGGRESSIVE = 2;

const
  RIST_PEER_CONFIG_VERSION = 0;

const
  RIST_DEFAULT_VIRT_SRC_PORT = 1971;
  RIST_DEFAULT_VIRT_DST_PORT = 1968;
  RIST_DEFAULT_RECOVERY_MODE = RIST_RECOVERY_MODE_TIME;
  RIST_DEFAULT_RECOVERY_MAXBITRATE = 100000;
  RIST_DEFAULT_RECOVERY_MAXBITRATE_RETURN = 0;
  RIST_DEFAULT_RECOVERY_LENGTH_MIN = 1000;
  RIST_DEFAULT_RECOVERY_LENGTH_MAX = 1000;
  RIST_DEFAULT_RECOVERY_REORDER_BUFFER = 15;
  RIST_DEFAULT_RECOVERY_RTT_MIN = 5;
  RIST_DEFAULT_RECOVERY_RTT_MAX = 500;
  RIST_DEFAULT_CONGESTION_CONTROL_MODE = RIST_CONGESTION_CONTROL_MODE_NORMAL;
  RIST_DEFAULT_MIN_RETRIES = 6;
  RIST_DEFAULT_MAX_RETRIES = 20;
  RIST_DEFAULT_VERBOSE_LEVEL = RIST_LOG_INFO;
  RIST_DEFAULT_PROFILE = RIST_PROFILE_MAIN;
  RIST_DEFAULT_SESSION_TIMEOUT = 2000;
  RIST_DEFAULT_KEEPALIVE_INTERVAL = 1000;
  RIST_DEFAULT_TIMING_MODE = RIST_TIMING_MODE_SOURCE;

type
  PPrist_peer_config = ^Prist_peer_config;
  Prist_peer_config = ^Trist_peer_config;
  Trist_peer_config = record
    version: longint;
    address_family: longint;
    initiate_conn: longint;
    address: array[0..(RIST_MAX_STRING_LONG) - 1] of char;
    miface: array[0..(RIST_MAX_STRING_SHORT) - 1] of char;
    physical_port: Tuint16_t;
    virt_dst_port: Tuint16_t;
    recovery_mode: Trist_recovery_mode;
    recovery_maxbitrate: Tuint32_t;
    recovery_maxbitrate_return: Tuint32_t;
    recovery_length_min: Tuint32_t;
    recovery_length_max: Tuint32_t;
    recovery_reorder_buffer: Tuint32_t;
    recovery_rtt_min: Tuint32_t;
    recovery_rtt_max: Tuint32_t;
    weight: Tuint32_t;
    secret: array[0..(RIST_MAX_STRING_SHORT) - 1] of char;
    key_size: longint;
    key_rotation: Tuint32_t;
    compression: longint;
    cname: array[0..(RIST_MAX_STRING_SHORT) - 1] of char;
    congestion_control_mode: Trist_congestion_control_mode;
    min_retries: Tuint32_t;
    max_retries: Tuint32_t;
    session_timeout: Tuint32_t;
    keepalive_interval: Tuint32_t;
    timing_mode: Tuint32_t;
    srp_username: array[0..(RIST_MAX_STRING_LONG) - 1] of char;
    srp_password: array[0..(RIST_MAX_STRING_LONG) - 1] of char;
  end;

function rist_peer_config_defaults_set(peer_config: Prist_peer_config): longint; cdecl; external librist;
function rist_parse_address(url: pchar; peer_config: PPrist_peer_config): longint; cdecl; external librist; deprecated;
function rist_parse_address2(url: pchar; peer_config: PPrist_peer_config): longint; cdecl; external librist;
function rist_peer_config_free(peer_config: PPrist_peer_config): longint; cdecl; external librist; deprecated;
function rist_peer_config_free2(peer_config: PPrist_peer_config): longint; cdecl; external librist;
function rist_peer_create(ctx: Prist_ctx; peer: PPrist_peer; config: Prist_peer_config): longint; cdecl; external librist;
function rist_peer_destroy(ctx: Prist_ctx; peer: Prist_peer): longint; cdecl; external librist;
function rist_peer_weight_set(ctx: Prist_ctx; peer: Prist_peer; weight: Tuint32_t): longint; cdecl; external librist;
function rist_peer_get_socket(peer: Prist_peer; socket: Plongint; socket_extra: Plongint): longint; cdecl; external librist;

type
  Trist_connection_status = longint;
const
  RIST_CONNECTION_ESTABLISHED = 0;
  RIST_CONNECTION_TIMED_OUT = 1;
  RIST_CLIENT_CONNECTED = 2;
  RIST_CLIENT_TIMED_OUT = 3;

type
  Tconnection_status_callback_t = procedure(arg: pointer; peer: Prist_peer; peer_connection_status: Trist_connection_status); cdecl;

function rist_connection_status_callback_set(ctx: Prist_ctx; para2: Tconnection_status_callback_t; arg: pointer): longint; cdecl; external librist;

type
  Trist_auth_handler_connect_cb = function(arg: pointer; conn_ip: pchar; conn_port: Tuint16_t; local_ip: pchar; local_port: Tuint16_t; peer: Prist_peer): longint; cdecl;
  Trist_auth_handler_disconnect_cb = function(arg: pointer; peer: Prist_peer): longint; cdecl;

function rist_auth_handler_set(ctx: Prist_ctx; connect_cb: Trist_auth_handler_connect_cb; disconnect_cb: Trist_auth_handler_disconnect_cb; arg: pointer): longint; cdecl; external librist;
function rist_peer_get_id(peer: Prist_peer): Tuint32_t; cdecl; external librist;

function rist_peer_update_secret(peer: Prist_peer; password: pchar): longint; cdecl; external librist;

// === Konventiert am: 15-8-26 19:16:53 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
