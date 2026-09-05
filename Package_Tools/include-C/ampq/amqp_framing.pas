unit amqp_framing;

interface

uses
  fp_rabbitmq, amqp;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}



const
  AMQP_PROTOCOL_VERSION_MAJOR = 0;
  AMQP_PROTOCOL_VERSION_MINOR = 9;
  AMQP_PROTOCOL_VERSION_REVISION = 1;
  AMQP_PROTOCOL_PORT = 5672;
  AMQP_FRAME_METHOD = 1;
  AMQP_FRAME_HEADER = 2;
  AMQP_FRAME_BODY = 3;
  AMQP_FRAME_HEARTBEAT = 8;
  AMQP_FRAME_MIN_SIZE = 4096;
  AMQP_FRAME_END = 206;
  AMQP_REPLY_SUCCESS = 200;
  AMQP_CONTENT_TOO_LARGE = 311;
  AMQP_NO_ROUTE = 312;
  AMQP_NO_CONSUMERS = 313;
  AMQP_ACCESS_REFUSED = 403;
  AMQP_NOT_FOUND = 404;
  AMQP_RESOURCE_LOCKED = 405;
  AMQP_PRECONDITION_FAILED = 406;
  AMQP_CONNECTION_FORCED = 320;
  AMQP_INVALID_PATH = 402;
  AMQP_FRAME_ERROR = 501;
  AMQP_SYNTAX_ERROR = 502;
  AMQP_COMMAND_INVALID = 503;
  AMQP_CHANNEL_ERROR = 504;
  AMQP_UNEXPECTED_FRAME = 505;
  AMQP_RESOURCE_ERROR = 506;
  AMQP_NOT_ALLOWED = 530;
  AMQP_NOT_IMPLEMENTED = 540;
  AMQP_INTERNAL_ERROR = 541;

function amqp_constant_name(constantNumber: longint): pchar; cdecl; external librabbitmq;
function amqp_constant_is_hard_error(constantNumber: longint): Tamqp_boolean_t; cdecl; external librabbitmq;
function amqp_method_name(methodNumber: Tamqp_method_number_t): pchar; cdecl; external librabbitmq;
function amqp_method_has_content(methodNumber: Tamqp_method_number_t): Tamqp_boolean_t; cdecl; external librabbitmq;
function amqp_decode_method(methodNumber: Tamqp_method_number_t; pool: Pamqp_pool_t; encoded: Tamqp_bytes_t; decoded: Ppointer): longint; cdecl; external librabbitmq;
function amqp_decode_properties(class_id: Tuint16_t; pool: Pamqp_pool_t; encoded: Tamqp_bytes_t; decoded: Ppointer): longint; cdecl; external librabbitmq;
function amqp_encode_method(methodNumber: Tamqp_method_number_t; decoded: pointer; encoded: Tamqp_bytes_t): longint; cdecl; external librabbitmq;
function amqp_encode_properties(class_id: Tuint16_t; decoded: pointer; encoded: Tamqp_bytes_t): longint; cdecl; external librabbitmq;

type
  Pamqp_connection_start_t = ^Tamqp_connection_start_t;
  Tamqp_connection_start_t = record
    version_major: Tuint8_t;
    version_minor: Tuint8_t;
    server_properties: Tamqp_table_t;
    mechanisms: Tamqp_bytes_t;
    locales: Tamqp_bytes_t;
  end;

type
  Pamqp_connection_start_ok_t = ^Tamqp_connection_start_ok_t;
  Tamqp_connection_start_ok_t = record
    client_properties: Tamqp_table_t;
    mechanism: Tamqp_bytes_t;
    response: Tamqp_bytes_t;
    locale: Tamqp_bytes_t;
  end;

type
  Pamqp_connection_secure_t = ^Tamqp_connection_secure_t;
  Tamqp_connection_secure_t = record
    challenge: Tamqp_bytes_t;
  end;

type
  Pamqp_connection_secure_ok_t = ^Tamqp_connection_secure_ok_t;
  Tamqp_connection_secure_ok_t = record
    response: Tamqp_bytes_t;
  end;

type
  Pamqp_connection_tune_t = ^Tamqp_connection_tune_t;
  Tamqp_connection_tune_t = record
    channel_max: Tuint16_t;
    frame_max: Tuint32_t;
    heartbeat: Tuint16_t;
  end;

type
  Pamqp_connection_tune_ok_t = ^Tamqp_connection_tune_ok_t;
  Tamqp_connection_tune_ok_t = record
    channel_max: Tuint16_t;
    frame_max: Tuint32_t;
    heartbeat: Tuint16_t;
  end;

type
  Pamqp_connection_open_t = ^Tamqp_connection_open_t;
  Tamqp_connection_open_t = record
    virtual_host: Tamqp_bytes_t;
    capabilities: Tamqp_bytes_t;
    insist: Tamqp_boolean_t;
  end;

type
  Pamqp_connection_open_ok_t = ^Tamqp_connection_open_ok_t;
  Tamqp_connection_open_ok_t = record
    known_hosts: Tamqp_bytes_t;
  end;

type
  Pamqp_connection_close_t = ^Tamqp_connection_close_t;
  Tamqp_connection_close_t = record
    reply_code: Tuint16_t;
    reply_text: Tamqp_bytes_t;
    class_id: Tuint16_t;
    method_id: Tuint16_t;
  end;

type
  Pamqp_connection_close_ok_t = ^Tamqp_connection_close_ok_t;
  Tamqp_connection_close_ok_t = record
    dummy: char;
  end;

type
  Pamqp_connection_blocked_t = ^Tamqp_connection_blocked_t;
  Tamqp_connection_blocked_t = record
    reason: Tamqp_bytes_t;
  end;

type
  Pamqp_connection_unblocked_t = ^Tamqp_connection_unblocked_t;
  Tamqp_connection_unblocked_t = record
    dummy: char;
  end;

type
  Pamqp_channel_open_t = ^Tamqp_channel_open_t;
  Tamqp_channel_open_t = record
    out_of_band: Tamqp_bytes_t;
  end;

type
  Pamqp_channel_open_ok_t = ^Tamqp_channel_open_ok_t;
  Tamqp_channel_open_ok_t = record
    channel_id: Tamqp_bytes_t;
  end;

type
  Pamqp_channel_flow_t = ^Tamqp_channel_flow_t;
  Tamqp_channel_flow_t = record
    active: Tamqp_boolean_t;
  end;

type
  Pamqp_channel_flow_ok_t = ^Tamqp_channel_flow_ok_t;
  Tamqp_channel_flow_ok_t = record
    active: Tamqp_boolean_t;
  end;

type
  Pamqp_channel_close_t = ^Tamqp_channel_close_t;
  Tamqp_channel_close_t = record
    reply_code: Tuint16_t;
    reply_text: Tamqp_bytes_t;
    class_id: Tuint16_t;
    method_id: Tuint16_t;
  end;

type
  Pamqp_channel_close_ok_t = ^Tamqp_channel_close_ok_t;
  Tamqp_channel_close_ok_t = record
    dummy: char;
  end;

type
  Pamqp_access_request_t = ^Tamqp_access_request_t;
  Tamqp_access_request_t = record
    realm: Tamqp_bytes_t;
    exclusive: Tamqp_boolean_t;
    passive: Tamqp_boolean_t;
    active: Tamqp_boolean_t;
    write: Tamqp_boolean_t;
    read: Tamqp_boolean_t;
  end;

type
  Pamqp_access_request_ok_t = ^Tamqp_access_request_ok_t;
  Tamqp_access_request_ok_t = record
    ticket: Tuint16_t;
  end;

type
  Pamqp_exchange_declare_t = ^Tamqp_exchange_declare_t;
  Tamqp_exchange_declare_t = record
    ticket: Tuint16_t;
    exchange: Tamqp_bytes_t;
    _type: Tamqp_bytes_t;
    passive: Tamqp_boolean_t;
    durable: Tamqp_boolean_t;
    auto_delete: Tamqp_boolean_t;
    internal: Tamqp_boolean_t;
    nowait: Tamqp_boolean_t;
    arguments: Tamqp_table_t;
  end;

type
  Pamqp_exchange_declare_ok_t = ^Tamqp_exchange_declare_ok_t;
  Tamqp_exchange_declare_ok_t = record
    dummy: char;
  end;

type
  Pamqp_exchange_delete_t = ^Tamqp_exchange_delete_t;
  Tamqp_exchange_delete_t = record
    ticket: Tuint16_t;
    exchange: Tamqp_bytes_t;
    if_unused: Tamqp_boolean_t;
    nowait: Tamqp_boolean_t;
  end;

type
  Pamqp_exchange_delete_ok_t = ^Tamqp_exchange_delete_ok_t;
  Tamqp_exchange_delete_ok_t = record
    dummy: char;
  end;

type
  Pamqp_exchange_bind_t = ^Tamqp_exchange_bind_t;
  Tamqp_exchange_bind_t = record
    ticket: Tuint16_t;
    destination: Tamqp_bytes_t;
    source: Tamqp_bytes_t;
    routing_key: Tamqp_bytes_t;
    nowait: Tamqp_boolean_t;
    arguments: Tamqp_table_t;
  end;

type
  Pamqp_exchange_bind_ok_t = ^Tamqp_exchange_bind_ok_t;
  Tamqp_exchange_bind_ok_t = record
    dummy: char;
  end;

type
  Pamqp_exchange_unbind_t_ = ^Tamqp_exchange_unbind_t_;
  Tamqp_exchange_unbind_t_ = record
    ticket: Tuint16_t;
    destination: Tamqp_bytes_t;
    source: Tamqp_bytes_t;
    routing_key: Tamqp_bytes_t;
    nowait: Tamqp_boolean_t;
    arguments: Tamqp_table_t;
  end;

type
  Pamqp_exchange_unbind_ok_t = ^Tamqp_exchange_unbind_ok_t;
  Tamqp_exchange_unbind_ok_t = record
    dummy: char;
  end;

type
  Pamqp_queue_declare_t = ^Tamqp_queue_declare_t;
  Tamqp_queue_declare_t = record
    ticket: Tuint16_t;
    queue: Tamqp_bytes_t;
    passive: Tamqp_boolean_t;
    durable: Tamqp_boolean_t;
    exclusive: Tamqp_boolean_t;
    auto_delete: Tamqp_boolean_t;
    nowait: Tamqp_boolean_t;
    arguments: Tamqp_table_t;
  end;

type
  Pamqp_queue_declare_ok_t = ^Tamqp_queue_declare_ok_t;
  Tamqp_queue_declare_ok_t = record
    queue: Tamqp_bytes_t;
    message_count: Tuint32_t;
    consumer_count: Tuint32_t;
  end;

type
  Pamqp_queue_bind_t = ^Tamqp_queue_bind_t;
  Tamqp_queue_bind_t = record
    ticket: Tuint16_t;
    queue: Tamqp_bytes_t;
    exchange: Tamqp_bytes_t;
    routing_key: Tamqp_bytes_t;
    nowait: Tamqp_boolean_t;
    arguments: Tamqp_table_t;
  end;

type
  Pamqp_queue_bind_ok_t = ^Tamqp_queue_bind_ok_t;
  Tamqp_queue_bind_ok_t = record
    dummy: char;
  end;

type
  Pamqp_queue_purge_t = ^Tamqp_queue_purge_t;
  Tamqp_queue_purge_t = record
    ticket: Tuint16_t;
    queue: Tamqp_bytes_t;
    nowait: Tamqp_boolean_t;
  end;

type
  Pamqp_queue_purge_ok_t = ^Tamqp_queue_purge_ok_t;
  Tamqp_queue_purge_ok_t = record
    message_count: Tuint32_t;
  end;

type
  Pamqp_queue_delete_t = ^Tamqp_queue_delete_t;
  Tamqp_queue_delete_t = record
    ticket: Tuint16_t;
    queue: Tamqp_bytes_t;
    if_unused: Tamqp_boolean_t;
    if_empty: Tamqp_boolean_t;
    nowait: Tamqp_boolean_t;
  end;

type
  Pamqp_queue_delete_ok_t = ^Tamqp_queue_delete_ok_t;
  Tamqp_queue_delete_ok_t = record
    message_count: Tuint32_t;
  end;

type
  Pamqp_queue_unbind_t = ^Tamqp_queue_unbind_t;
  Tamqp_queue_unbind_t = record
    ticket: Tuint16_t;
    queue: Tamqp_bytes_t;
    exchange: Tamqp_bytes_t;
    routing_key: Tamqp_bytes_t;
    arguments: Tamqp_table_t;
  end;

type
  Pamqp_queue_unbind_ok_t = ^Tamqp_queue_unbind_ok_t;
  Tamqp_queue_unbind_ok_t = record
    dummy: char;
  end;

type
  Pamqp_basic_qos_t = ^Tamqp_basic_qos_t;
  Tamqp_basic_qos_t = record
    prefetch_size: Tuint32_t;
    prefetch_count: Tuint16_t;
    global: Tamqp_boolean_t;
  end;

type
  Pamqp_basic_qos_ok_t = ^Tamqp_basic_qos_ok_t;
  Tamqp_basic_qos_ok_t = record
    dummy: char;
  end;

type
  Pamqp_basic_consume_t = ^Tamqp_basic_consume_t;
  Tamqp_basic_consume_t = record
    ticket: Tuint16_t;
    queue: Tamqp_bytes_t;
    consumer_tag: Tamqp_bytes_t;
    no_local: Tamqp_boolean_t;
    no_ack: Tamqp_boolean_t;
    exclusive: Tamqp_boolean_t;
    nowait: Tamqp_boolean_t;
    arguments: Tamqp_table_t;
  end;

type
  Pamqp_basic_consume_ok_t = ^Tamqp_basic_consume_ok_t;
  Tamqp_basic_consume_ok_t = record
    consumer_tag: Tamqp_bytes_t;
  end;

type
  Pamqp_basic_cancel_t = ^Tamqp_basic_cancel_t;
  Tamqp_basic_cancel_t = record
    consumer_tag: Tamqp_bytes_t;
    nowait: Tamqp_boolean_t;
  end;

type
  Pamqp_basic_cancel_ok_t = ^Tamqp_basic_cancel_ok_t;
  Tamqp_basic_cancel_ok_t = record
    consumer_tag: Tamqp_bytes_t;
  end;

type
  Pamqp_basic_publish_t = ^Tamqp_basic_publish_t;
  Tamqp_basic_publish_t = record
    ticket: Tuint16_t;
    exchange: Tamqp_bytes_t;
    routing_key: Tamqp_bytes_t;
    mandatory: Tamqp_boolean_t;
    immediate: Tamqp_boolean_t;
  end;

type
  Pamqp_basic_return_t = ^Tamqp_basic_return_t;
  Tamqp_basic_return_t = record
    reply_code: Tuint16_t;
    reply_text: Tamqp_bytes_t;
    exchange: Tamqp_bytes_t;
    routing_key: Tamqp_bytes_t;
  end;

type
  Pamqp_basic_deliver_t = ^Tamqp_basic_deliver_t;
  Tamqp_basic_deliver_t = record
    consumer_tag: Tamqp_bytes_t;
    delivery_tag: Tuint64_t;
    redelivered: Tamqp_boolean_t;
    exchange: Tamqp_bytes_t;
    routing_key: Tamqp_bytes_t;
  end;

type
  Pamqp_basic_get_t = ^Tamqp_basic_get_t;
  Tamqp_basic_get_t = record
    ticket: Tuint16_t;
    queue: Tamqp_bytes_t;
    no_ack: Tamqp_boolean_t;
  end;

type
  Pamqp_basic_get_ok_t = ^Tamqp_basic_get_ok_t;
  Tamqp_basic_get_ok_t = record
    delivery_tag: Tuint64_t;
    redelivered: Tamqp_boolean_t;
    exchange: Tamqp_bytes_t;
    routing_key: Tamqp_bytes_t;
    message_count: Tuint32_t;
  end;

type
  Pamqp_basic_get_empty_t = ^Tamqp_basic_get_empty_t;
  Tamqp_basic_get_empty_t = record
    cluster_id: Tamqp_bytes_t;
  end;

type
  Pamqp_basic_ack_t = ^Tamqp_basic_ack_t;
  Tamqp_basic_ack_t = record
    delivery_tag: Tuint64_t;
    multiple: Tamqp_boolean_t;
  end;

type
  Pamqp_basic_reject_t = ^Tamqp_basic_reject_t;
  Tamqp_basic_reject_t = record
    delivery_tag: Tuint64_t;
    requeue: Tamqp_boolean_t;
  end;

type
  Pamqp_basic_recover_async_t = ^Tamqp_basic_recover_async_t;
  Tamqp_basic_recover_async_t = record
    requeue: Tamqp_boolean_t;
  end;

type
  Pamqp_basic_recover_t = ^Tamqp_basic_recover_t;
  Tamqp_basic_recover_t = record
    requeue: Tamqp_boolean_t;
  end;

type
  Pamqp_basic_recover_ok_t = ^Tamqp_basic_recover_ok_t;
  Tamqp_basic_recover_ok_t = record
    dummy: char;
  end;

type
  Pamqp_basic_nack_t = ^Tamqp_basic_nack_t;
  Tamqp_basic_nack_t = record
    delivery_tag: Tuint64_t;
    multiple: Tamqp_boolean_t;
    requeue: Tamqp_boolean_t;
  end;

type
  Pamqp_tx_select_t = ^Tamqp_tx_select_t;
  Tamqp_tx_select_t = record
    dummy: char;
  end;

type
  Pamqp_tx_select_ok_t = ^Tamqp_tx_select_ok_t;
  Tamqp_tx_select_ok_t = record
    dummy: char;
  end;

type
  Pamqp_tx_commit_t = ^Tamqp_tx_commit_t;
  Tamqp_tx_commit_t = record
    dummy: char;
  end;

type
  Pamqp_tx_commit_ok_t = ^Tamqp_tx_commit_ok_t;
  Tamqp_tx_commit_ok_t = record
    dummy: char;
  end;

type
  Pamqp_tx_rollback_t = ^Tamqp_tx_rollback_t;
  Tamqp_tx_rollback_t = record
    dummy: char;
  end;

type
  Pamqp_tx_rollback_ok_t = ^Tamqp_tx_rollback_ok_t;
  Tamqp_tx_rollback_ok_t = record
    dummy: char;
  end;

type
  Pamqp_confirm_select_t = ^Tamqp_confirm_select_t;
  Tamqp_confirm_select_t = record
    nowait: Tamqp_boolean_t;
  end;

type
  Pamqp_confirm_select_ok_t = ^Tamqp_confirm_select_ok_t;
  Tamqp_confirm_select_ok_t = record
    dummy: char;
  end;

type
  Pamqp_connection_properties_t = ^Tamqp_connection_properties_t;
  Tamqp_connection_properties_t = record
    _flags: Tamqp_flags_t;
    dummy: char;
  end;

type
  Pamqp_channel_properties_t = ^Tamqp_channel_properties_t;
  Tamqp_channel_properties_t = record
    _flags: Tamqp_flags_t;
    dummy: char;
  end;

type
  Pamqp_access_properties_t = ^Tamqp_access_properties_t;
  Tamqp_access_properties_t = record
    _flags: Tamqp_flags_t;
    dummy: char;
  end;

type
  Pamqp_exchange_properties_t = ^Tamqp_exchange_properties_t;
  Tamqp_exchange_properties_t = record
    _flags: Tamqp_flags_t;
    dummy: char;
  end;

type
  Pamqp_queue_properties_t = ^Tamqp_queue_properties_t;
  Tamqp_queue_properties_t = record
    _flags: Tamqp_flags_t;
    dummy: char;
  end;

const
  AMQP_BASIC_CLASS = $003C;
  AMQP_BASIC_CONTENT_TYPE_FLAG = 1 shl 15;
  AMQP_BASIC_CONTENT_ENCODING_FLAG = 1 shl 14;
  AMQP_BASIC_HEADERS_FLAG = 1 shl 13;
  AMQP_BASIC_DELIVERY_MODE_FLAG = 1 shl 12;
  AMQP_BASIC_PRIORITY_FLAG = 1 shl 11;
  AMQP_BASIC_CORRELATION_ID_FLAG = 1 shl 10;
  AMQP_BASIC_REPLY_TO_FLAG = 1 shl 9;
  AMQP_BASIC_EXPIRATION_FLAG = 1 shl 8;
  AMQP_BASIC_MESSAGE_ID_FLAG = 1 shl 7;
  AMQP_BASIC_TIMESTAMP_FLAG = 1 shl 6;
  AMQP_BASIC_TYPE_FLAG = 1 shl 5;
  AMQP_BASIC_USER_ID_FLAG = 1 shl 4;
  AMQP_BASIC_APP_ID_FLAG = 1 shl 3;
  AMQP_BASIC_CLUSTER_ID_FLAG = 1 shl 2;

const
  AMQP_TX_CLASS = $005A;

type
  Pamqp_tx_properties_t = ^Tamqp_tx_properties_t;
  Tamqp_tx_properties_t = record
    _flags: Tamqp_flags_t;
    dummy: char;
  end;

const
  AMQP_CONFIRM_CLASS = $0055;

type
  Pamqp_confirm_properties_t = ^Tamqp_confirm_properties_t;
  Tamqp_confirm_properties_t = record
    _flags: Tamqp_flags_t;
    dummy: char;
  end;

function amqp_channel_open(state: Tamqp_connection_state_t; channel: Tamqp_channel_t): Pamqp_channel_open_ok_t; cdecl; external librabbitmq;
function amqp_channel_flow(state: Tamqp_connection_state_t; channel: Tamqp_channel_t; active: Tamqp_boolean_t): Pamqp_channel_flow_ok_t; cdecl; external librabbitmq;
function amqp_exchange_declare(state: Tamqp_connection_state_t; channel: Tamqp_channel_t; exchange: Tamqp_bytes_t; _type: Tamqp_bytes_t; passive: Tamqp_boolean_t;
  durable: Tamqp_boolean_t; auto_delete: Tamqp_boolean_t; internal: Tamqp_boolean_t; arguments: Tamqp_table_t): Pamqp_exchange_declare_ok_t; cdecl; external librabbitmq;
function amqp_exchange_delete(state: Tamqp_connection_state_t; channel: Tamqp_channel_t; exchange: Tamqp_bytes_t; if_unused: Tamqp_boolean_t): Pamqp_exchange_delete_ok_t; cdecl; external librabbitmq;
function amqp_exchange_bind(state: Tamqp_connection_state_t; channel: Tamqp_channel_t; destination: Tamqp_bytes_t; source: Tamqp_bytes_t; routing_key: Tamqp_bytes_t;
  arguments: Tamqp_table_t): Pamqp_exchange_bind_ok_t; cdecl; external librabbitmq;
function amqp_exchange_unbind(state: Tamqp_connection_state_t; channel: Tamqp_channel_t; destination: Tamqp_bytes_t; source: Tamqp_bytes_t; routing_key: Tamqp_bytes_t;
  arguments: Tamqp_table_t): Pamqp_exchange_unbind_ok_t; cdecl; external librabbitmq;
function amqp_queue_declare(state: Tamqp_connection_state_t; channel: Tamqp_channel_t; queue: Tamqp_bytes_t; passive: Tamqp_boolean_t; durable: Tamqp_boolean_t;
  exclusive: Tamqp_boolean_t; auto_delete: Tamqp_boolean_t; arguments: Tamqp_table_t): Pamqp_queue_declare_ok_t; cdecl; external librabbitmq;
function amqp_queue_bind(state: Tamqp_connection_state_t; channel: Tamqp_channel_t; queue: Tamqp_bytes_t; exchange: Tamqp_bytes_t; routing_key: Tamqp_bytes_t;
  arguments: Tamqp_table_t): Pamqp_queue_bind_ok_t; cdecl; external librabbitmq;
function amqp_queue_purge(state: Tamqp_connection_state_t; channel: Tamqp_channel_t; queue: Tamqp_bytes_t): Pamqp_queue_purge_ok_t; cdecl; external librabbitmq;
function amqp_queue_delete(state: Tamqp_connection_state_t; channel: Tamqp_channel_t; queue: Tamqp_bytes_t; if_unused: Tamqp_boolean_t; if_empty: Tamqp_boolean_t): Pamqp_queue_delete_ok_t; cdecl; external librabbitmq;
function amqp_queue_unbind(state: Tamqp_connection_state_t; channel: Tamqp_channel_t; queue: Tamqp_bytes_t; exchange: Tamqp_bytes_t; routing_key: Tamqp_bytes_t;
  arguments: Tamqp_table_t): Pamqp_queue_unbind_ok_t; cdecl; external librabbitmq;
function amqp_basic_qos(state: Tamqp_connection_state_t; channel: Tamqp_channel_t; prefetch_size: Tuint32_t; prefetch_count: Tuint16_t; global: Tamqp_boolean_t): Pamqp_basic_qos_ok_t; cdecl; external librabbitmq;
function amqp_basic_consume(state: Tamqp_connection_state_t; channel: Tamqp_channel_t; queue: Tamqp_bytes_t; consumer_tag: Tamqp_bytes_t; no_local: Tamqp_boolean_t;
  no_ack: Tamqp_boolean_t; exclusive: Tamqp_boolean_t; arguments: Tamqp_table_t): Pamqp_basic_consume_ok_t; cdecl; external librabbitmq;
function amqp_basic_cancel(state: Tamqp_connection_state_t; channel: Tamqp_channel_t; consumer_tag: Tamqp_bytes_t): Pamqp_basic_cancel_ok_t; cdecl; external librabbitmq;
function amqp_basic_recover(state: Tamqp_connection_state_t; channel: Tamqp_channel_t; requeue: Tamqp_boolean_t): Pamqp_basic_recover_ok_t; cdecl; external librabbitmq;
function amqp_tx_select(state: Tamqp_connection_state_t; channel: Tamqp_channel_t): Pamqp_tx_select_ok_t; cdecl; external librabbitmq;
function amqp_tx_commit(state: Tamqp_connection_state_t; channel: Tamqp_channel_t): Pamqp_tx_commit_ok_t; cdecl; external librabbitmq;
function amqp_tx_rollback(state: Tamqp_connection_state_t; channel: Tamqp_channel_t): Pamqp_tx_rollback_ok_t; cdecl; external librabbitmq;
function amqp_confirm_select(state: Tamqp_connection_state_t; channel: Tamqp_channel_t): Pamqp_confirm_select_ok_t; cdecl; external librabbitmq;

// === Konventiert am: 4-9-26 19:56:42 ===

const
  AMQP_CONNECTION_START_METHOD = Tamqp_method_number_t($000A000A);
  AMQP_CONNECTION_START_OK_METHOD = Tamqp_method_number_t($000A000B);
  AMQP_CONNECTION_SECURE_METHOD = Tamqp_method_number_t($000A0014);
  AMQP_CONNECTION_SECURE_OK_METHOD = Tamqp_method_number_t($000A0015);
  AMQP_CONNECTION_TUNE_METHOD = Tamqp_method_number_t($000A001E);
  AMQP_CONNECTION_TUNE_OK_METHOD = Tamqp_method_number_t($000A001F);
  AMQP_CONNECTION_OPEN_METHOD = Tamqp_method_number_t($000A0028);
  AMQP_CONNECTION_OPEN_OK_METHOD = Tamqp_method_number_t($000A0029);
  AMQP_CONNECTION_CLOSE_METHOD = Tamqp_method_number_t($000A0032);
  AMQP_CONNECTION_CLOSE_OK_METHOD = Tamqp_method_number_t($000A0033);
  AMQP_CONNECTION_BLOCKED_METHOD = Tamqp_method_number_t($000A003C);
  AMQP_CONNECTION_UNBLOCKED_METHOD = Tamqp_method_number_t($000A003D);
  AMQP_CHANNEL_OPEN_METHOD = Tamqp_method_number_t($0014000A);
  AMQP_CHANNEL_OPEN_OK_METHOD = Tamqp_method_number_t($0014000B);
  AMQP_CHANNEL_FLOW_METHOD = Tamqp_method_number_t($00140014);
  AMQP_CHANNEL_FLOW_OK_METHOD = Tamqp_method_number_t($00140015);
  AMQP_CHANNEL_CLOSE_METHOD = Tamqp_method_number_t($00140028);
  AMQP_CHANNEL_CLOSE_OK_METHOD = Tamqp_method_number_t($00140029);
  AMQP_ACCESS_REQUEST_METHOD = Tamqp_method_number_t($001E000A);
  AMQP_ACCESS_REQUEST_OK_METHOD = Tamqp_method_number_t($001E000B);
  AMQP_EXCHANGE_DECLARE_METHOD = Tamqp_method_number_t($0028000A);
  AMQP_EXCHANGE_DECLARE_OK_METHOD = Tamqp_method_number_t($0028000B);
  AMQP_EXCHANGE_DELETE_METHOD = Tamqp_method_number_t($00280014);
  AMQP_EXCHANGE_DELETE_OK_METHOD = Tamqp_method_number_t($00280015);
  AMQP_EXCHANGE_BIND_METHOD = Tamqp_method_number_t($0028001E);
  AMQP_EXCHANGE_BIND_OK_METHOD = Tamqp_method_number_t($0028001F);
  AMQP_EXCHANGE_UNBIND_METHOD = Tamqp_method_number_t($00280028);
  AMQP_EXCHANGE_UNBIND_OK_METHOD = Tamqp_method_number_t($00280033);
  AMQP_QUEUE_DECLARE_METHOD = Tamqp_method_number_t($0032000A);
  AMQP_QUEUE_DECLARE_OK_METHOD = Tamqp_method_number_t($0032000B);
  AMQP_QUEUE_BIND_METHOD = Tamqp_method_number_t($00320014);
  AMQP_QUEUE_BIND_OK_METHOD = Tamqp_method_number_t($00320015);
  AMQP_QUEUE_PURGE_METHOD = Tamqp_method_number_t($0032001E);
  AMQP_QUEUE_PURGE_OK_METHOD = Tamqp_method_number_t($0032001F);
  AMQP_QUEUE_DELETE_METHOD = Tamqp_method_number_t($00320028);
  AMQP_QUEUE_DELETE_OK_METHOD = Tamqp_method_number_t($00320029);
  AMQP_QUEUE_UNBIND_METHOD = Tamqp_method_number_t($00320032);
  AMQP_QUEUE_UNBIND_OK_METHOD = Tamqp_method_number_t($00320033);
  AMQP_BASIC_QOS_METHOD = Tamqp_method_number_t($003C000A);
  AMQP_BASIC_QOS_OK_METHOD = Tamqp_method_number_t($003C000B);
  AMQP_BASIC_CONSUME_METHOD = Tamqp_method_number_t($003C0014);
  AMQP_BASIC_CONSUME_OK_METHOD = Tamqp_method_number_t($003C0015);
  AMQP_BASIC_CANCEL_METHOD = Tamqp_method_number_t($003C001E);
  AMQP_BASIC_CANCEL_OK_METHOD = Tamqp_method_number_t($003C001F);
  AMQP_BASIC_PUBLISH_METHOD = Tamqp_method_number_t($003C0028);
  AMQP_BASIC_RETURN_METHOD = Tamqp_method_number_t($003C0032);
  AMQP_BASIC_DELIVER_METHOD = Tamqp_method_number_t($003C003C);
  AMQP_BASIC_GET_METHOD = Tamqp_method_number_t($003C0046);
  AMQP_BASIC_GET_OK_METHOD = Tamqp_method_number_t($003C0047);
  AMQP_BASIC_GET_EMPTY_METHOD = Tamqp_method_number_t($003C0048);
  AMQP_BASIC_ACK_METHOD = Tamqp_method_number_t($003C0050);
  AMQP_BASIC_REJECT_METHOD = Tamqp_method_number_t($003C005A);
  AMQP_BASIC_RECOVER_ASYNC_METHOD = Tamqp_method_number_t($003C0064);
  AMQP_BASIC_RECOVER_METHOD = Tamqp_method_number_t($003C006E);
  AMQP_BASIC_RECOVER_OK_METHOD = Tamqp_method_number_t($003C006F);
  AMQP_BASIC_NACK_METHOD = Tamqp_method_number_t($003C0078);
  AMQP_TX_SELECT_METHOD = Tamqp_method_number_t($005A000A);
  AMQP_TX_SELECT_OK_METHOD = Tamqp_method_number_t($005A000B);
  AMQP_TX_COMMIT_METHOD = Tamqp_method_number_t($005A0014);
  AMQP_TX_COMMIT_OK_METHOD = Tamqp_method_number_t($005A0015);
  AMQP_TX_ROLLBACK_METHOD = Tamqp_method_number_t($005A001E);
  AMQP_TX_ROLLBACK_OK_METHOD = Tamqp_method_number_t($005A001F);
  AMQP_CONFIRM_SELECT_METHOD = Tamqp_method_number_t($0055000A);
  AMQP_CONFIRM_SELECT_OK_METHOD = Tamqp_method_number_t($0055000B);

implementation

end.
