unit amqp;

interface

uses
  fp_amqp;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  Ptimeval = type Pointer;

const
  AMQP_VERSION_MAJOR = 0;
  AMQP_VERSION_MINOR = 11;
  AMQP_VERSION_PATCH = 0;
  AMQP_VERSION_IS_RELEASE = 1;

function amqp_version_number: Tuint32_t; cdecl; external librabbitmq;
function amqp_version: pchar; cdecl; external librabbitmq;

const
  AMQP_DEFAULT_FRAME_SIZE = 131072;
  AMQP_DEFAULT_MAX_CHANNELS = 2047;
  AMQP_DEFAULT_HEARTBEAT = 0;
  AMQP_DEFAULT_VHOST = '/';

type
  Pamqp_field_value_kind_t = ^Tamqp_field_value_kind_t;
  Tamqp_field_value_kind_t = longint;
const
  AMQP_FIELD_KIND_BOOLEAN = 't';
  AMQP_FIELD_KIND_I8 = 'b';
  AMQP_FIELD_KIND_U8 = 'B';
  AMQP_FIELD_KIND_I16 = 's';
  AMQP_FIELD_KIND_U16 = 'u';
  AMQP_FIELD_KIND_I32 = 'I';
  AMQP_FIELD_KIND_U32 = 'i';
  AMQP_FIELD_KIND_I64 = 'l';
  AMQP_FIELD_KIND_U64 = 'L';
  AMQP_FIELD_KIND_F32 = 'f';
  AMQP_FIELD_KIND_F64 = 'd';
  AMQP_FIELD_KIND_DECIMAL = 'D';
  AMQP_FIELD_KIND_UTF8 = 'S';
  AMQP_FIELD_KIND_ARRAY = 'A';
  AMQP_FIELD_KIND_TIMESTAMP = 'T';
  AMQP_FIELD_KIND_TABLE = 'F';
  AMQP_FIELD_KIND_VOID = 'V';
  AMQP_FIELD_KIND_BYTES = 'x';

type
  Pamqp_response_type_enum = ^Tamqp_response_type_enum;
  Tamqp_response_type_enum = longint;
const
  AMQP_RESPONSE_NONE = 0;
  AMQP_RESPONSE_NORMAL = 1;
  AMQP_RESPONSE_LIBRARY_EXCEPTION = 2;
  AMQP_RESPONSE_SERVER_EXCEPTION = 3;

type
  Pamqp_sasl_method_enum = ^Tamqp_sasl_method_enum;
  Tamqp_sasl_method_enum = longint;
const
  AMQP_SASL_METHOD_UNDEFINED = -(1);
  AMQP_SASL_METHOD_PLAIN = 0;
  AMQP_SASL_METHOD_EXTERNAL = 1;

type
  Pamqp_status_enum = ^Tamqp_status_enum;
  Tamqp_status_enum = longint;
const
  AMQP_STATUS_OK = $0;
  AMQP_STATUS_NO_MEMORY = -($0001);
  AMQP_STATUS_BAD_AMQP_DATA = -($0002);
  AMQP_STATUS_UNKNOWN_CLASS = -($0003);
  AMQP_STATUS_UNKNOWN_METHOD = -($0004);
  AMQP_STATUS_HOSTNAME_RESOLUTION_FAILED = -($0005);
  AMQP_STATUS_INCOMPATIBLE_AMQP_VERSION = -($0006);
  AMQP_STATUS_CONNECTION_CLOSED = -($0007);
  AMQP_STATUS_BAD_URL = -($0008);
  AMQP_STATUS_SOCKET_ERROR = -($0009);
  AMQP_STATUS_INVALID_PARAMETER = -($000A);
  AMQP_STATUS_TABLE_TOO_BIG = -($000B);
  AMQP_STATUS_WRONG_METHOD = -($000C);
  AMQP_STATUS_TIMEOUT = -($000D);
  AMQP_STATUS_TIMER_FAILURE = -($000E);
  AMQP_STATUS_HEARTBEAT_TIMEOUT = -($000F);
  AMQP_STATUS_UNEXPECTED_STATE = -($0010);
  AMQP_STATUS_SOCKET_CLOSED = -($0011);
  AMQP_STATUS_SOCKET_INUSE = -($0012);
  AMQP_STATUS_BROKER_UNSUPPORTED_SASL_METHOD = -($0013);
  AMQP_STATUS_UNSUPPORTED = -($0014);
  _AMQP_STATUS_NEXT_VALUE = -($0015);
  AMQP_STATUS_TCP_ERROR = -($0100);
  AMQP_STATUS_TCP_SOCKETLIB_INIT_ERROR = -($0101);
  _AMQP_STATUS_TCP_NEXT_VALUE = -($0102);
  AMQP_STATUS_SSL_ERROR = -($0200);
  AMQP_STATUS_SSL_HOSTNAME_VERIFY_FAILED = -($0201);
  AMQP_STATUS_SSL_PEER_VERIFY_FAILED = -($0202);
  AMQP_STATUS_SSL_CONNECTION_FAILED = -($0203);
  AMQP_STATUS_SSL_SET_ENGINE_FAILED = -($0204);
  _AMQP_STATUS_SSL_NEXT_VALUE = -($0205);

type
  Pamqp_delivery_mode_enum = ^Tamqp_delivery_mode_enum;
  Tamqp_delivery_mode_enum = longint;
const
  AMQP_DELIVERY_NONPERSISTENT = 1;
  AMQP_DELIVERY_PERSISTENT = 2;

type
  Pamqp_boolean_t = ^Tamqp_boolean_t;
  Tamqp_boolean_t = Boolean32;

  Pamqp_method_number_t = ^Tamqp_method_number_t;
  Tamqp_method_number_t = Tuint32_t;

  Pamqp_flags_t = ^Tamqp_flags_t;
  Tamqp_flags_t = Tuint32_t;

  Pamqp_channel_t = ^Tamqp_channel_t;
  Tamqp_channel_t = Tuint16_t;

  Pamqp_table_entry_t = ^Tamqp_table_entry_t;
  Pamqp_field_value_t = ^Tamqp_field_value_t;

  Pamqp_bytes_t = ^Tamqp_bytes_t;
  Tamqp_bytes_t = record
    len: Tsize_t;
    bytes: pointer;
  end;

  Pamqp_decimal_t = ^Tamqp_decimal_t;
  Tamqp_decimal_t = record
    decimals: Tuint8_t;
    value: Tuint32_t;
  end;

  Pamqp_table_t = ^Tamqp_table_t;
  Tamqp_table_t = record
    num_entries: longint;
    entries: Pamqp_table_entry_t;
  end;

  Pamqp_array_t = ^Tamqp_array_t;
  Tamqp_array_t = record
    num_entries: longint;
    entries: Pamqp_field_value_t;
  end;

  Tamqp_field_value_t = record
    kind: Tuint8_t;
    value: record
      case longint of
        0: (boolean: Tamqp_boolean_t);
        1: (i8: Tint8_t);
        2: (u8: Tuint8_t);
        3: (i16: Tint16_t);
        4: (u16: Tuint16_t);
        5: (i32: Tint32_t);
        6: (u32: Tuint32_t);
        7: (i64: Tint64_t);
        8: (u64: Tuint64_t);
        9: (f32: single);
        10: (f64: double);
        11: (decimal: Tamqp_decimal_t);
        12: (bytes: Tamqp_bytes_t);
        13: (table: Tamqp_table_t);
        14: (arr: Tamqp_array_t);
      end;
  end;

  Tamqp_table_entry_t = record
    key: Tamqp_bytes_t;
    value: Tamqp_field_value_t;
  end;

type
  Pamqp_pool_blocklist_t = ^Tamqp_pool_blocklist_t;
  Tamqp_pool_blocklist_t = record
    num_blocks: longint;
    blocklist: ^pointer;
  end;

  Pamqp_pool_t = ^Tamqp_pool_t;
  Tamqp_pool_t = record
    pagesize: Tsize_t;
    pages: Tamqp_pool_blocklist_t;
    large_blocks: Tamqp_pool_blocklist_t;
    next_page: longint;
    alloc_block: pchar;
    alloc_used: Tsize_t;
  end;

  Pamqp_method_t = ^Tamqp_method_t;
  Tamqp_method_t = record
    id: Tamqp_method_number_t;
    decoded: pointer;
  end;

  Pamqp_frame_t = ^Tamqp_frame_t;
  Tamqp_frame_t = record
    frame_type: Tuint8_t;
    channel: Tamqp_channel_t;
    payload: record
      case longint of
        0: (method: Tamqp_method_t);
        1: (properties: record
            class_id: Tuint16_t;
            body_size: Tuint64_t;
            decoded: pointer;
            raw: Tamqp_bytes_t;
            end);
        2: (body_fragment: Tamqp_bytes_t);
        3: (protocol_header: record
            transport_high: Tuint8_t;
            transport_low: Tuint8_t;
            protocol_version_major: Tuint8_t;
            protocol_version_minor: Tuint8_t;
            end);
      end;
  end;

type
  Pamqp_rpc_reply_t = ^Tamqp_rpc_reply_t;
  Tamqp_rpc_reply_t = record
    reply_type: Tamqp_response_type_enum;
    reply: Tamqp_method_t;
    library_error: longint;
  end;

type
  Tamqp_connection_state_t = type Pointer;
  Tamqp_socket_t = type Pointer;
  Pamqp_socket_t = ^Tamqp_socket_t;

var
  amqp_empty_bytes: Tamqp_bytes_t; cvar;external librabbitmq;
  amqp_empty_table: Tamqp_table_t; cvar;external librabbitmq;
  amqp_empty_array: Tamqp_array_t; cvar;external librabbitmq;

procedure init_amqp_pool(pool: Pamqp_pool_t; pagesize: Tsize_t); cdecl; external librabbitmq;
procedure recycle_amqp_pool(pool: Pamqp_pool_t); cdecl; external librabbitmq;
procedure empty_amqp_pool(pool: Pamqp_pool_t); cdecl; external librabbitmq;
function amqp_pool_alloc(pool: Pamqp_pool_t; amount: Tsize_t): pointer; cdecl; external librabbitmq;
procedure amqp_pool_alloc_bytes(pool: Pamqp_pool_t; amount: Tsize_t; output: Pamqp_bytes_t); cdecl; external librabbitmq;
function amqp_cstring_bytes(cstr: pchar): Tamqp_bytes_t; cdecl; external librabbitmq;
function amqp_bytes_malloc_dup(src: Tamqp_bytes_t): Tamqp_bytes_t; cdecl; external librabbitmq;
function amqp_bytes_malloc(amount: Tsize_t): Tamqp_bytes_t; cdecl; external librabbitmq;
procedure amqp_bytes_free(bytes: Tamqp_bytes_t); cdecl; external librabbitmq;
function amqp_new_connection: Tamqp_connection_state_t; cdecl; external librabbitmq;
function amqp_get_sockfd(state: Tamqp_connection_state_t): longint; cdecl; external librabbitmq;
procedure amqp_set_sockfd(state: Tamqp_connection_state_t; sockfd: longint); cdecl; external librabbitmq; deprecated;
function amqp_tune_connection(state: Tamqp_connection_state_t; channel_max: longint; frame_max: longint; heartbeat: longint): longint; cdecl; external librabbitmq;
function amqp_get_channel_max(state: Tamqp_connection_state_t): longint; cdecl; external librabbitmq;
function amqp_get_frame_max(state: Tamqp_connection_state_t): longint; cdecl; external librabbitmq;
function amqp_get_heartbeat(state: Tamqp_connection_state_t): longint; cdecl; external librabbitmq;
function amqp_destroy_connection(state: Tamqp_connection_state_t): longint; cdecl; external librabbitmq;
function amqp_handle_input(state: Tamqp_connection_state_t; received_data: Tamqp_bytes_t; decoded_frame: Pamqp_frame_t): longint; cdecl; external librabbitmq;
function amqp_release_buffers_ok(state: Tamqp_connection_state_t): Tamqp_boolean_t; cdecl; external librabbitmq;
procedure amqp_release_buffers(state: Tamqp_connection_state_t); cdecl; external librabbitmq;
procedure amqp_maybe_release_buffers(state: Tamqp_connection_state_t); cdecl; external librabbitmq;
procedure amqp_maybe_release_buffers_on_channel(state: Tamqp_connection_state_t; channel: Tamqp_channel_t); cdecl; external librabbitmq;
function amqp_send_frame(state: Tamqp_connection_state_t; frame: Pamqp_frame_t): longint; cdecl; external librabbitmq;
function amqp_table_entry_cmp(entry1: pointer; entry2: pointer): longint; cdecl; external librabbitmq;
function amqp_open_socket(hostname: pchar; portnumber: longint): longint; cdecl; external librabbitmq;
function amqp_send_header(state: Tamqp_connection_state_t): longint; cdecl; external librabbitmq;
function amqp_frames_enqueued(state: Tamqp_connection_state_t): Tamqp_boolean_t; cdecl; external librabbitmq;
function amqp_simple_wait_frame(state: Tamqp_connection_state_t; decoded_frame: Pamqp_frame_t): longint; cdecl; external librabbitmq;
function amqp_simple_wait_frame_noblock(state: Tamqp_connection_state_t; decoded_frame: Pamqp_frame_t; tv: Ptimeval): longint; cdecl; external librabbitmq;
function amqp_simple_wait_method(state: Tamqp_connection_state_t; expected_channel: Tamqp_channel_t; expected_method: Tamqp_method_number_t; output: Pamqp_method_t): longint; cdecl; external librabbitmq;
function amqp_send_method(state: Tamqp_connection_state_t; channel: Tamqp_channel_t; id: Tamqp_method_number_t; decoded: pointer): longint; cdecl; external librabbitmq;
function amqp_simple_rpc(state: Tamqp_connection_state_t; channel: Tamqp_channel_t; request_id: Tamqp_method_number_t; expected_reply_ids: Pamqp_method_number_t; decoded_request_method: pointer): Tamqp_rpc_reply_t; cdecl; external librabbitmq;
function amqp_simple_rpc_decoded(state: Tamqp_connection_state_t; channel: Tamqp_channel_t; request_id: Tamqp_method_number_t; reply_id: Tamqp_method_number_t; decoded_request_method: pointer): pointer; cdecl; external librabbitmq;
function amqp_get_rpc_reply(state: Tamqp_connection_state_t): Tamqp_rpc_reply_t; cdecl; external librabbitmq;
function amqp_login(state: Tamqp_connection_state_t; vhost: pchar; channel_max: longint; frame_max: longint; heartbeat: longint;
  sasl_method: Tamqp_sasl_method_enum): Tamqp_rpc_reply_t; cdecl; varargs; external librabbitmq;
function amqp_login_with_properties(state: Tamqp_connection_state_t; vhost: pchar; channel_max: longint; frame_max: longint; heartbeat: longint;
  properties: Pamqp_table_t; sasl_method: Tamqp_sasl_method_enum): Tamqp_rpc_reply_t; cdecl; varargs; external librabbitmq;

type
  Pamqp_basic_properties_t_ = type Pointer;

function amqp_basic_publish(state: Tamqp_connection_state_t; channel: Tamqp_channel_t; exchange: Tamqp_bytes_t; routing_key: Tamqp_bytes_t; mandatory: Tamqp_boolean_t;
  immediate: Tamqp_boolean_t; properties: Pamqp_basic_properties_t_; body: Tamqp_bytes_t): longint; cdecl; external librabbitmq;
function amqp_channel_close(state: Tamqp_connection_state_t; channel: Tamqp_channel_t; code: longint): Tamqp_rpc_reply_t; cdecl; external librabbitmq;
function amqp_connection_close(state: Tamqp_connection_state_t; code: longint): Tamqp_rpc_reply_t; cdecl; external librabbitmq;
function amqp_basic_ack(state: Tamqp_connection_state_t; channel: Tamqp_channel_t; delivery_tag: Tuint64_t; multiple: Tamqp_boolean_t): longint; cdecl; external librabbitmq;
function amqp_basic_get(state: Tamqp_connection_state_t; channel: Tamqp_channel_t; queue: Tamqp_bytes_t; no_ack: Tamqp_boolean_t): Tamqp_rpc_reply_t; cdecl; external librabbitmq;
function amqp_basic_reject(state: Tamqp_connection_state_t; channel: Tamqp_channel_t; delivery_tag: Tuint64_t; requeue: Tamqp_boolean_t): longint; cdecl; external librabbitmq;
function amqp_basic_nack(state: Tamqp_connection_state_t; channel: Tamqp_channel_t; delivery_tag: Tuint64_t; multiple: Tamqp_boolean_t; requeue: Tamqp_boolean_t): longint; cdecl; external librabbitmq;
function amqp_data_in_buffer(state: Tamqp_connection_state_t): Tamqp_boolean_t; cdecl; external librabbitmq;
function amqp_error_string(err: longint): pchar; cdecl; external librabbitmq; deprecated;
function amqp_error_string2(err: longint): pchar; cdecl; external librabbitmq;
function amqp_decode_table(encoded: Tamqp_bytes_t; pool: Pamqp_pool_t; output: Pamqp_table_t; offset: Psize_t): longint; cdecl; external librabbitmq;
function amqp_encode_table(encoded: Tamqp_bytes_t; input: Pamqp_table_t; offset: Psize_t): longint; cdecl; external librabbitmq;
function amqp_table_clone(original: Pamqp_table_t; clone: Pamqp_table_t; pool: Pamqp_pool_t): longint; cdecl; external librabbitmq;

type // Ausgelagert von amqp_framing
  Pamqp_basic_properties_t = ^Tamqp_basic_properties_t;
  Tamqp_basic_properties_t = record
    _flags: Tamqp_flags_t;
    content_type: Tamqp_bytes_t;
    content_encoding: Tamqp_bytes_t;
    headers: Tamqp_table_t;
    delivery_mode: Tuint8_t;
    priority: Tuint8_t;
    correlation_id: Tamqp_bytes_t;
    reply_to: Tamqp_bytes_t;
    expiration: Tamqp_bytes_t;
    message_id: Tamqp_bytes_t;
    timestamp: Tuint64_t;
    _type: Tamqp_bytes_t;
    user_id: Tamqp_bytes_t;
    app_id: Tamqp_bytes_t;
    cluster_id: Tamqp_bytes_t;
  end;
type
  Pamqp_message_t = ^Tamqp_message_t;
  Tamqp_message_t = record
    properties: Tamqp_basic_properties_t;
    body: Tamqp_bytes_t;
    pool: Tamqp_pool_t;
  end;

function amqp_read_message(state: Tamqp_connection_state_t; channel: Tamqp_channel_t; message: Pamqp_message_t; flags: longint): Tamqp_rpc_reply_t; cdecl; external librabbitmq;
procedure amqp_destroy_message(message: Pamqp_message_t); cdecl; external librabbitmq;

type
  Pamqp_envelope_t = ^Tamqp_envelope_t;
  Tamqp_envelope_t = record
    channel: Tamqp_channel_t;
    consumer_tag: Tamqp_bytes_t;
    delivery_tag: Tuint64_t;
    redelivered: Tamqp_boolean_t;
    exchange: Tamqp_bytes_t;
    routing_key: Tamqp_bytes_t;
    message: Tamqp_message_t;
  end;

function amqp_consume_message(state: Tamqp_connection_state_t; envelope: Pamqp_envelope_t; timeout: Ptimeval; flags: longint): Tamqp_rpc_reply_t; cdecl; external librabbitmq;
procedure amqp_destroy_envelope(envelope: Pamqp_envelope_t); cdecl; external librabbitmq;

type
  Pamqp_connection_info = ^Tamqp_connection_info;
  Tamqp_connection_info = record
    user: pchar;
    password: pchar;
    host: pchar;
    vhost: pchar;
    port: longint;
    ssl: Tamqp_boolean_t;
  end;

procedure amqp_default_connection_info(parsed: Pamqp_connection_info); cdecl; external librabbitmq;
function amqp_parse_url(url: pchar; parsed: Pamqp_connection_info): longint; cdecl; external librabbitmq;
function amqp_socket_open(self: Pamqp_socket_t; host: pchar; port: longint): longint; cdecl; external librabbitmq;
function amqp_socket_open_noblock(self: Pamqp_socket_t; host: pchar; port: longint; timeout: Ptimeval): longint; cdecl; external librabbitmq;
function amqp_socket_get_sockfd(self: Pamqp_socket_t): longint; cdecl; external librabbitmq;
function amqp_get_socket(state: Tamqp_connection_state_t): Pamqp_socket_t; cdecl; external librabbitmq;
function amqp_get_server_properties(state: Tamqp_connection_state_t): Pamqp_table_t; cdecl; external librabbitmq;
function amqp_get_client_properties(state: Tamqp_connection_state_t): Pamqp_table_t; cdecl; external librabbitmq;
function amqp_get_handshake_timeout(state: Tamqp_connection_state_t): Ptimeval; cdecl; external librabbitmq;
function amqp_set_handshake_timeout(state: Tamqp_connection_state_t; timeout: Ptimeval): longint; cdecl; external librabbitmq;
function amqp_get_rpc_timeout(state: Tamqp_connection_state_t): Ptimeval; cdecl; external librabbitmq;
function amqp_set_rpc_timeout(state: Tamqp_connection_state_t; timeout: Ptimeval): longint; cdecl; external librabbitmq;

// === Konventiert am: 4-9-26 19:56:40 ===

function AMQP_VERSION_CODE(major, minor, patch, release: longint): longint;



implementation


function AMQP_VERSION_CODE(major, minor, patch, release: longint): longint;
begin
  AMQP_VERSION_CODE := (((major shl 24) or (minor shl 16)) or (patch shl 8)) or release;
end;


end.
