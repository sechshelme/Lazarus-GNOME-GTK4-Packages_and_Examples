unit fp_zmq;

interface

const
  {$IFDEF Linux}
  libzmq = 'zmq';
  {$ENDIF}

  {$IFDEF Windows}
  libzmq = 'zmq'; // ??????
  {$ENDIF}

type
  Tuint8_t = uint8;
  Puint8_t = ^Tuint8_t;
  PPuint8_t = ^Puint8_t;
  Tuint16_t = uint16;
  Puint16_t = ^Tuint16_t;
  PPuint16_t = ^Puint16_t;
  Tuint32_t = uint32;
  Puint32_t = ^Tuint32_t;
  PPuint32_t = ^Puint32_t;
  Tuint64_t = uint64;
  Puint64_t = ^Tuint64_t;
  PPuint64_t = ^Puint64_t;

  Tint8_t = int8;
  Pint8_t = ^Tint8_t;
  PPint8_t = ^Pint8_t;
  Tint16_t = int16;
  Pint16_t = ^Tint16_t;
  PPint16_t = ^Pint16_t;
  Tint32_t = int32;
  Pint32_t = ^Tint32_t;
  PPint32_t = ^Pint32_t;
  Tint64_t = int64;
  Pint64_t = ^Tint64_t;
  PPint64_t = ^Pint64_t;

  Tsize_t = SizeUInt;
  Psize_t = ^Tsize_t;


  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


const
  ZMQ_VERSION_MAJOR = 4;
  ZMQ_VERSION_MINOR = 3;
  ZMQ_VERSION_PATCH = 5;

function ZMQ_MAKE_VERSION(major, minor, patch: longint): longint;
function ZMQ_VERSION: longint;

const
  ZMQ_HAUSNUMERO = 156384712;
  ENOTSUP = ZMQ_HAUSNUMERO + 1;
  EPROTONOSUPPORT = ZMQ_HAUSNUMERO + 2;
  ENOBUFS = ZMQ_HAUSNUMERO + 3;
  ENETDOWN = ZMQ_HAUSNUMERO + 4;
  EADDRINUSE = ZMQ_HAUSNUMERO + 5;
  EADDRNOTAVAIL = ZMQ_HAUSNUMERO + 6;
  ECONNREFUSED = ZMQ_HAUSNUMERO + 7;
  EINPROGRESS = ZMQ_HAUSNUMERO + 8;
  ENOTSOCK = ZMQ_HAUSNUMERO + 9;
  EMSGSIZE = ZMQ_HAUSNUMERO + 10;
  EAFNOSUPPORT = ZMQ_HAUSNUMERO + 11;
  ENETUNREACH = ZMQ_HAUSNUMERO + 12;
  ECONNABORTED = ZMQ_HAUSNUMERO + 13;
  ECONNRESET = ZMQ_HAUSNUMERO + 14;
  ENOTCONN = ZMQ_HAUSNUMERO + 15;
  ETIMEDOUT = ZMQ_HAUSNUMERO + 16;
  EHOSTUNREACH = ZMQ_HAUSNUMERO + 17;
  ENETRESET = ZMQ_HAUSNUMERO + 18;

  EFSM = ZMQ_HAUSNUMERO + 51;
  ENOCOMPATPROTO = ZMQ_HAUSNUMERO + 52;
  ETERM = ZMQ_HAUSNUMERO + 53;
  EMTHREAD = ZMQ_HAUSNUMERO + 54;

function zmq_errno: longint; cdecl; external libzmq;
function zmq_strerror(errnum_: longint): pchar; cdecl; external libzmq;
procedure zmq_version(major_: Plongint; minor_: Plongint; patch_: Plongint); cdecl; external libzmq;

const
  ZMQ_IO_THREADS = 1;
  ZMQ_MAX_SOCKETS = 2;
  ZMQ_SOCKET_LIMIT = 3;
  ZMQ_THREAD_PRIORITY = 3;
  ZMQ_THREAD_SCHED_POLICY = 4;
  ZMQ_MAX_MSGSZ = 5;
  ZMQ_MSG_T_SIZE = 6;
  ZMQ_THREAD_AFFINITY_CPU_ADD = 7;
  ZMQ_THREAD_AFFINITY_CPU_REMOVE = 8;
  ZMQ_THREAD_NAME_PREFIX = 9;

  ZMQ_IO_THREADS_DFLT = 1;
  ZMQ_MAX_SOCKETS_DFLT = 1023;
  ZMQ_THREAD_PRIORITY_DFLT = -(1);
  ZMQ_THREAD_SCHED_POLICY_DFLT = -(1);

function zmq_ctx_new: pointer; cdecl; external libzmq;
function zmq_ctx_term(context_: pointer): longint; cdecl; external libzmq;
function zmq_ctx_shutdown(context_: pointer): longint; cdecl; external libzmq;
function zmq_ctx_set(context_: pointer; option_: longint; optval_: longint): longint; cdecl; external libzmq;
function zmq_ctx_get(context_: pointer; option_: longint): longint; cdecl; external libzmq;
function zmq_init(io_threads_: longint): pointer; cdecl; external libzmq;
function zmq_term(context_: pointer): longint; cdecl; external libzmq;
function zmq_ctx_destroy(context_: pointer): longint; cdecl; external libzmq;

type
  Pzmq_msg_t = type Pointer;

  Tzmq_free_fn = procedure(data_: pointer; hint_: pointer); cdecl;

function zmq_msg_init(msg_: Pzmq_msg_t): longint; cdecl; external libzmq;
function zmq_msg_init_size(msg_: Pzmq_msg_t; size_: Tsize_t): longint; cdecl; external libzmq;
function zmq_msg_init_data(msg_: Pzmq_msg_t; data_: pointer; size_: Tsize_t; ffn_: Tzmq_free_fn; hint_: pointer): longint; cdecl; external libzmq;
function zmq_msg_send(msg_: Pzmq_msg_t; s_: pointer; flags_: longint): longint; cdecl; external libzmq;
function zmq_msg_recv(msg_: Pzmq_msg_t; s_: pointer; flags_: longint): longint; cdecl; external libzmq;
function zmq_msg_close(msg_: Pzmq_msg_t): longint; cdecl; external libzmq;
function zmq_msg_move(dest_: Pzmq_msg_t; src_: Pzmq_msg_t): longint; cdecl; external libzmq;
function zmq_msg_copy(dest_: Pzmq_msg_t; src_: Pzmq_msg_t): longint; cdecl; external libzmq;
function zmq_msg_data(msg_: Pzmq_msg_t): pointer; cdecl; external libzmq;
function zmq_msg_size(msg_: Pzmq_msg_t): Tsize_t; cdecl; external libzmq;
function zmq_msg_more(msg_: Pzmq_msg_t): longint; cdecl; external libzmq;
function zmq_msg_get(msg_: Pzmq_msg_t; property_: longint): longint; cdecl; external libzmq;
function zmq_msg_set(msg_: Pzmq_msg_t; property_: longint; optval_: longint): longint; cdecl; external libzmq;
function zmq_msg_gets(msg_: Pzmq_msg_t; property_: pchar): pchar; cdecl; external libzmq;

const
  ZMQ_PAIR = 0;
  ZMQ_PUB = 1;
  ZMQ_SUB = 2;
  ZMQ_REQ = 3;
  ZMQ_REP = 4;
  ZMQ_DEALER = 5;
  ZMQ_ROUTER = 6;
  ZMQ_PULL = 7;
  ZMQ_PUSH = 8;
  ZMQ_XPUB = 9;
  ZMQ_XSUB = 10;
  ZMQ_STREAM = 11;

  ZMQ_XREQ = ZMQ_DEALER;
  ZMQ_XREP = ZMQ_ROUTER;

  ZMQ_AFFINITY = 4;
  ZMQ_ROUTING_ID = 5;
  ZMQ_SUBSCRIBE = 6;
  ZMQ_UNSUBSCRIBE = 7;
  ZMQ_RATE = 8;
  ZMQ_RECOVERY_IVL = 9;
  ZMQ_SNDBUF = 11;
  ZMQ_RCVBUF = 12;
  ZMQ_RCVMORE = 13;
  ZMQ_FD = 14;
  ZMQ_EVENTS = 15;
  ZMQ_TYPE = 16;
  ZMQ_LINGER = 17;
  ZMQ_RECONNECT_IVL = 18;
  ZMQ_BACKLOG = 19;
  ZMQ_RECONNECT_IVL_MAX = 21;
  ZMQ_MAXMSGSIZE = 22;
  ZMQ_SNDHWM = 23;
  ZMQ_RCVHWM = 24;
  ZMQ_MULTICAST_HOPS = 25;
  ZMQ_RCVTIMEO = 27;
  ZMQ_SNDTIMEO = 28;
  ZMQ_LAST_ENDPOINT = 32;
  ZMQ_ROUTER_MANDATORY = 33;
  ZMQ_TCP_KEEPALIVE = 34;
  ZMQ_TCP_KEEPALIVE_CNT = 35;
  ZMQ_TCP_KEEPALIVE_IDLE = 36;
  ZMQ_TCP_KEEPALIVE_INTVL = 37;
  ZMQ_IMMEDIATE = 39;
  ZMQ_XPUB_VERBOSE = 40;
  ZMQ_ROUTER_RAW = 41;
  ZMQ_IPV6 = 42;
  ZMQ_MECHANISM = 43;
  ZMQ_PLAIN_SERVER = 44;
  ZMQ_PLAIN_USERNAME = 45;
  ZMQ_PLAIN_PASSWORD = 46;
  ZMQ_CURVE_SERVER = 47;
  ZMQ_CURVE_PUBLICKEY = 48;
  ZMQ_CURVE_SECRETKEY = 49;
  ZMQ_CURVE_SERVERKEY = 50;
  ZMQ_PROBE_ROUTER = 51;
  ZMQ_REQ_CORRELATE = 52;
  ZMQ_REQ_RELAXED = 53;
  ZMQ_CONFLATE = 54;
  ZMQ_ZAP_DOMAIN = 55;
  ZMQ_ROUTER_HANDOVER = 56;
  ZMQ_TOS = 57;
  ZMQ_CONNECT_ROUTING_ID = 61;
  ZMQ_GSSAPI_SERVER = 62;
  ZMQ_GSSAPI_PRINCIPAL = 63;
  ZMQ_GSSAPI_SERVICE_PRINCIPAL = 64;
  ZMQ_GSSAPI_PLAINTEXT = 65;
  ZMQ_HANDSHAKE_IVL = 66;
  ZMQ_SOCKS_PROXY = 68;
  ZMQ_XPUB_NODROP = 69;
  ZMQ_BLOCKY = 70;
  ZMQ_XPUB_MANUAL = 71;
  ZMQ_XPUB_WELCOME_MSG = 72;
  ZMQ_STREAM_NOTIFY = 73;
  ZMQ_INVERT_MATCHING = 74;
  ZMQ_HEARTBEAT_IVL = 75;
  ZMQ_HEARTBEAT_TTL = 76;
  ZMQ_HEARTBEAT_TIMEOUT = 77;
  ZMQ_XPUB_VERBOSER = 78;
  ZMQ_CONNECT_TIMEOUT = 79;
  ZMQ_TCP_MAXRT = 80;
  ZMQ_THREAD_SAFE = 81;
  ZMQ_MULTICAST_MAXTPDU = 84;
  ZMQ_VMCI_BUFFER_SIZE = 85;
  ZMQ_VMCI_BUFFER_MIN_SIZE = 86;
  ZMQ_VMCI_BUFFER_MAX_SIZE = 87;
  ZMQ_VMCI_CONNECT_TIMEOUT = 88;
  ZMQ_USE_FD = 89;
  ZMQ_GSSAPI_PRINCIPAL_NAMETYPE = 90;
  ZMQ_GSSAPI_SERVICE_PRINCIPAL_NAMETYPE = 91;
  ZMQ_BINDTODEVICE = 92;

  ZMQ_MORE = 1;
  ZMQ_SHARED = 3;

  ZMQ_DONTWAIT = 1;
  ZMQ_SNDMORE = 2;

  ZMQ_NULL = 0;
  ZMQ_PLAIN = 1;
  ZMQ_CURVE = 2;
  ZMQ_GSSAPI = 3;

  ZMQ_GROUP_MAX_LENGTH = 255;

  ZMQ_IDENTITY = ZMQ_ROUTING_ID;
  ZMQ_CONNECT_RID = ZMQ_CONNECT_ROUTING_ID;
  ZMQ_TCP_ACCEPT_FILTER = 38;
  ZMQ_IPC_FILTER_PID = 58;
  ZMQ_IPC_FILTER_UID = 59;
  ZMQ_IPC_FILTER_GID = 60;
  ZMQ_IPV4ONLY = 31;
  ZMQ_DELAY_ATTACH_ON_CONNECT = ZMQ_IMMEDIATE;
  ZMQ_NOBLOCK = ZMQ_DONTWAIT;
  ZMQ_FAIL_UNROUTABLE = ZMQ_ROUTER_MANDATORY;
  ZMQ_ROUTER_BEHAVIOR = ZMQ_ROUTER_MANDATORY;

  ZMQ_SRCFD = 2;

  ZMQ_GSSAPI_NT_HOSTBASED = 0;
  ZMQ_GSSAPI_NT_USER_NAME = 1;
  ZMQ_GSSAPI_NT_KRB5_PRINCIPAL = 2;

  ZMQ_EVENT_CONNECTED = $0001;
  ZMQ_EVENT_CONNECT_DELAYED = $0002;
  ZMQ_EVENT_CONNECT_RETRIED = $0004;
  ZMQ_EVENT_LISTENING = $0008;
  ZMQ_EVENT_BIND_FAILED = $0010;
  ZMQ_EVENT_ACCEPTED = $0020;
  ZMQ_EVENT_ACCEPT_FAILED = $0040;
  ZMQ_EVENT_CLOSED = $0080;
  ZMQ_EVENT_CLOSE_FAILED = $0100;
  ZMQ_EVENT_DISCONNECTED = $0200;
  ZMQ_EVENT_MONITOR_STOPPED = $0400;
  ZMQ_EVENT_ALL = $FFFF;

  ZMQ_EVENT_HANDSHAKE_FAILED_NO_DETAIL = $0800;
  ZMQ_EVENT_HANDSHAKE_SUCCEEDED = $1000;
  ZMQ_EVENT_HANDSHAKE_FAILED_PROTOCOL = $2000;
  ZMQ_EVENT_HANDSHAKE_FAILED_AUTH = $4000;

  ZMQ_PROTOCOL_ERROR_ZMTP_UNSPECIFIED = $10000000;
  ZMQ_PROTOCOL_ERROR_ZMTP_UNEXPECTED_COMMAND = $10000001;
  ZMQ_PROTOCOL_ERROR_ZMTP_INVALID_SEQUENCE = $10000002;
  ZMQ_PROTOCOL_ERROR_ZMTP_KEY_EXCHANGE = $10000003;
  ZMQ_PROTOCOL_ERROR_ZMTP_MALFORMED_COMMAND_UNSPECIFIED = $10000011;
  ZMQ_PROTOCOL_ERROR_ZMTP_MALFORMED_COMMAND_MESSAGE = $10000012;
  ZMQ_PROTOCOL_ERROR_ZMTP_MALFORMED_COMMAND_HELLO = $10000013;
  ZMQ_PROTOCOL_ERROR_ZMTP_MALFORMED_COMMAND_INITIATE = $10000014;
  ZMQ_PROTOCOL_ERROR_ZMTP_MALFORMED_COMMAND_ERROR = $10000015;
  ZMQ_PROTOCOL_ERROR_ZMTP_MALFORMED_COMMAND_READY = $10000016;
  ZMQ_PROTOCOL_ERROR_ZMTP_MALFORMED_COMMAND_WELCOME = $10000017;
  ZMQ_PROTOCOL_ERROR_ZMTP_INVALID_METADATA = $10000018;
  ZMQ_PROTOCOL_ERROR_ZMTP_CRYPTOGRAPHIC = $11000001;
  ZMQ_PROTOCOL_ERROR_ZMTP_MECHANISM_MISMATCH = $11000002;
  ZMQ_PROTOCOL_ERROR_ZAP_UNSPECIFIED = $20000000;
  ZMQ_PROTOCOL_ERROR_ZAP_MALFORMED_REPLY = $20000001;
  ZMQ_PROTOCOL_ERROR_ZAP_BAD_REQUEST_ID = $20000002;
  ZMQ_PROTOCOL_ERROR_ZAP_BAD_VERSION = $20000003;
  ZMQ_PROTOCOL_ERROR_ZAP_INVALID_STATUS_CODE = $20000004;
  ZMQ_PROTOCOL_ERROR_ZAP_INVALID_METADATA = $20000005;
  ZMQ_PROTOCOL_ERROR_WS_UNSPECIFIED = $30000000;

function zmq_socket(para1: pointer; type_: longint): pointer; cdecl; external libzmq;
function zmq_close(s_: pointer): longint; cdecl; external libzmq;
function zmq_setsockopt(s_: pointer; option_: longint; optval_: pointer; optvallen_: Tsize_t): longint; cdecl; external libzmq;
function zmq_getsockopt(s_: pointer; option_: longint; optval_: pointer; optvallen_: Psize_t): longint; cdecl; external libzmq;
function zmq_bind(s_: pointer; addr_: pchar): longint; cdecl; external libzmq;
function zmq_connect(s_: pointer; addr_: pchar): longint; cdecl; external libzmq;
function zmq_unbind(s_: pointer; addr_: pchar): longint; cdecl; external libzmq;
function zmq_disconnect(s_: pointer; addr_: pchar): longint; cdecl; external libzmq;
function zmq_send(s_: pointer; buf_: pointer; len_: Tsize_t; flags_: longint): longint; cdecl; external libzmq;
function zmq_send_const(s_: pointer; buf_: pointer; len_: Tsize_t; flags_: longint): longint; cdecl; external libzmq;
function zmq_recv(s_: pointer; buf_: pointer; len_: Tsize_t; flags_: longint): longint; cdecl; external libzmq;
function zmq_socket_monitor(s_: pointer; addr_: pchar; events_: longint): longint; cdecl; external libzmq;

type
  {$IFDEF Linux}
  Tzmq_fd_t = longint;
  {$ENDIF}

  {$IFDEF Windows}
  Tzmq_fd_t = qword;
  {$ENDIF}
  Pzmq_fd_t = ^Tzmq_fd_t;

const
  ZMQ_POLLIN = 1;
  ZMQ_POLLOUT = 2;
  ZMQ_POLLERR = 4;
  ZMQ_POLLPRI = 8;

type
  Tzmq_pollitem_t = record
    socket: pointer;
    fd: Tzmq_fd_t;
    events: smallint;
    revents: smallint;
  end;
  Pzmq_pollitem_t = ^Tzmq_pollitem_t;

const
  ZMQ_POLLITEMS_DFLT = 16;

function zmq_poll(items_: Pzmq_pollitem_t; nitems_: longint; timeout_: longint): longint; cdecl; external libzmq;
function zmq_proxy(frontend_: pointer; backend_: pointer; capture_: pointer): longint; cdecl; external libzmq;
function zmq_proxy_steerable(frontend_: pointer; backend_: pointer; capture_: pointer; control_: pointer): longint; cdecl; external libzmq;

const
  ZMQ_HAS_CAPABILITIES = 1;

function zmq_has(capability_: pchar): longint; cdecl; external libzmq;

const
  ZMQ_STREAMER = 1;
  ZMQ_FORWARDER = 2;
  ZMQ_QUEUE = 3;

function zmq_device(type_: longint; frontend_: pointer; backend_: pointer): longint; cdecl; external libzmq;
function zmq_sendmsg(s_: pointer; msg_: Pzmq_msg_t; flags_: longint): longint; cdecl; external libzmq;
function zmq_recvmsg(s_: pointer; msg_: Pzmq_msg_t; flags_: longint): longint; cdecl; external libzmq;

type
  Piovec = type Pointer;

function zmq_sendiov(s_: pointer; iov_: Piovec; count_: Tsize_t; flags_: longint): longint; cdecl; external libzmq;
function zmq_recviov(s_: pointer; iov_: Piovec; count_: Psize_t; flags_: longint): longint; cdecl; external libzmq;

function zmq_z85_encode(dest_: pchar; data_: Puint8_t; size_: Tsize_t): pchar; cdecl; external libzmq;
function zmq_z85_decode(dest_: Puint8_t; string_: pchar): Puint8_t; cdecl; external libzmq;
function zmq_curve_keypair(z85_public_key_: pchar; z85_secret_key_: pchar): longint; cdecl; external libzmq;
function zmq_curve_public(z85_public_key_: pchar; z85_secret_key_: pchar): longint; cdecl; external libzmq;
function zmq_atomic_counter_new: pointer; cdecl; external libzmq;
procedure zmq_atomic_counter_set(counter_: pointer; value_: longint); cdecl; external libzmq;
function zmq_atomic_counter_inc(counter_: pointer): longint; cdecl; external libzmq;
function zmq_atomic_counter_dec(counter_: pointer): longint; cdecl; external libzmq;
function zmq_atomic_counter_value(counter_: pointer): longint; cdecl; external libzmq;
procedure zmq_atomic_counter_destroy(counter_p_: Ppointer); cdecl; external libzmq;

type
  Tzmq_timer_fn = procedure(timer_id: longint; arg: pointer); cdecl;

function zmq_timers_new: pointer; cdecl; external libzmq;
function zmq_timers_destroy(timers_p: Ppointer): longint; cdecl; external libzmq;
function zmq_timers_add(timers: pointer; interval: Tsize_t; handler: Tzmq_timer_fn; arg: pointer): longint; cdecl; external libzmq;
function zmq_timers_cancel(timers: pointer; timer_id: longint): longint; cdecl; external libzmq;
function zmq_timers_set_interval(timers: pointer; timer_id: longint; interval: Tsize_t): longint; cdecl; external libzmq;
function zmq_timers_reset(timers: pointer; timer_id: longint): longint; cdecl; external libzmq;
function zmq_timers_timeout(timers: pointer): longint; cdecl; external libzmq;
function zmq_timers_execute(timers: pointer): longint; cdecl; external libzmq;
function zmq_stopwatch_start: pointer; cdecl; external libzmq;
function zmq_stopwatch_intermediate(watch_: pointer): dword; cdecl; external libzmq;
function zmq_stopwatch_stop(watch_: pointer): dword; cdecl; external libzmq;
procedure zmq_sleep(seconds_: longint); cdecl; external libzmq;

type
  Tzmq_thread_fn = procedure(para1: pointer); cdecl;

function zmq_threadstart(func_: Tzmq_thread_fn; arg_: pointer): pointer; cdecl; external libzmq;
procedure zmq_threadclose(thread_: pointer); cdecl; external libzmq;

const
  ZMQ_SERVER = 12;
  ZMQ_CLIENT = 13;
  ZMQ_RADIO = 14;
  ZMQ_DISH = 15;
  ZMQ_GATHER = 16;
  ZMQ_SCATTER = 17;
  ZMQ_DGRAM = 18;
  ZMQ_PEER = 19;
  ZMQ_CHANNEL = 20;

  ZMQ_ZAP_ENFORCE_DOMAIN = 93;
  ZMQ_LOOPBACK_FASTPATH = 94;
  ZMQ_METADATA = 95;
  ZMQ_MULTICAST_LOOP = 96;
  ZMQ_ROUTER_NOTIFY = 97;
  ZMQ_XPUB_MANUAL_LAST_VALUE = 98;
  ZMQ_SOCKS_USERNAME = 99;
  ZMQ_SOCKS_PASSWORD = 100;
  ZMQ_IN_BATCH_SIZE = 101;
  ZMQ_OUT_BATCH_SIZE = 102;
  ZMQ_WSS_KEY_PEM = 103;
  ZMQ_WSS_CERT_PEM = 104;
  ZMQ_WSS_TRUST_PEM = 105;
  ZMQ_WSS_HOSTNAME = 106;
  ZMQ_WSS_TRUST_SYSTEM = 107;
  ZMQ_ONLY_FIRST_SUBSCRIBE = 108;
  ZMQ_RECONNECT_STOP = 109;
  ZMQ_HELLO_MSG = 110;
  ZMQ_DISCONNECT_MSG = 111;
  ZMQ_PRIORITY = 112;
  ZMQ_BUSY_POLL = 113;
  ZMQ_HICCUP_MSG = 114;
  ZMQ_XSUB_VERBOSE_UNSUBSCRIBE = 115;
  ZMQ_TOPICS_COUNT = 116;
  ZMQ_NORM_MODE = 117;
  ZMQ_NORM_UNICAST_NACK = 118;
  ZMQ_NORM_BUFFER_SIZE = 119;
  ZMQ_NORM_SEGMENT_SIZE = 120;
  ZMQ_NORM_BLOCK_SIZE = 121;
  ZMQ_NORM_NUM_PARITY = 122;
  ZMQ_NORM_NUM_AUTOPARITY = 123;
  ZMQ_NORM_PUSH = 124;

  ZMQ_NORM_FIXED = 0;
  ZMQ_NORM_CC = 1;
  ZMQ_NORM_CCL = 2;
  ZMQ_NORM_CCE = 3;
  ZMQ_NORM_CCE_ECNONLY = 4;

  ZMQ_RECONNECT_STOP_CONN_REFUSED = $1;
  ZMQ_RECONNECT_STOP_HANDSHAKE_FAILED = $2;
  ZMQ_RECONNECT_STOP_AFTER_DISCONNECT = $4;

  ZMQ_ZERO_COPY_RECV = 10;

function zmq_ctx_set_ext(context_: pointer; option_: longint; optval_: pointer; optvallen_: Tsize_t): longint; cdecl; external libzmq;
function zmq_ctx_get_ext(context_: pointer; option_: longint; optval_: pointer; optvallen_: Psize_t): longint; cdecl; external libzmq;
function zmq_join(s: pointer; group: pchar): longint; cdecl; external libzmq;
function zmq_leave(s: pointer; group: pchar): longint; cdecl; external libzmq;
function zmq_connect_peer(s_: pointer; addr_: pchar): Tuint32_t; cdecl; external libzmq;
function zmq_msg_set_routing_id(msg: Pzmq_msg_t; routing_id: Tuint32_t): longint; cdecl; external libzmq;
function zmq_msg_routing_id(msg: Pzmq_msg_t): Tuint32_t; cdecl; external libzmq;
function zmq_msg_set_group(msg: Pzmq_msg_t; group: pchar): longint; cdecl; external libzmq;
function zmq_msg_group(msg: Pzmq_msg_t): pchar; cdecl; external libzmq;
function zmq_msg_init_buffer(msg_: Pzmq_msg_t; buf_: pointer; size_: Tsize_t): longint; cdecl; external libzmq;

const
  ZMQ_MSG_PROPERTY_ROUTING_ID = 'Routing-Id';
  ZMQ_MSG_PROPERTY_SOCKET_TYPE = 'Socket-Type';
  ZMQ_MSG_PROPERTY_USER_ID = 'User-Id';
  ZMQ_MSG_PROPERTY_PEER_ADDRESS = 'Peer-Address';

  ZMQ_NOTIFY_CONNECT = 1;
  ZMQ_NOTIFY_DISCONNECT = 2;

type
  Tzmq_poller_event_t = record
    socket: pointer;
    fd: Tzmq_fd_t;
    user_data: pointer;
    events: smallint;
  end;
  Pzmq_poller_event_t = ^Tzmq_poller_event_t;

function zmq_poller_new: pointer; cdecl; external libzmq;
function zmq_poller_destroy(poller_p: Ppointer): longint; cdecl; external libzmq;
function zmq_poller_size(poller: pointer): longint; cdecl; external libzmq;
function zmq_poller_add(poller: pointer; socket: pointer; user_data: pointer; events: smallint): longint; cdecl; external libzmq;
function zmq_poller_modify(poller: pointer; socket: pointer; events: smallint): longint; cdecl; external libzmq;
function zmq_poller_remove(poller: pointer; socket: pointer): longint; cdecl; external libzmq;
function zmq_poller_wait(poller: pointer; event: Pzmq_poller_event_t; timeout: longint): longint; cdecl; external libzmq;
function zmq_poller_wait_all(poller: pointer; events: Pzmq_poller_event_t; n_events: longint; timeout: longint): longint; cdecl; external libzmq;
function zmq_poller_fd(poller: pointer; fd: Pzmq_fd_t): longint; cdecl; external libzmq;
function zmq_poller_add_fd(poller: pointer; fd: Tzmq_fd_t; user_data: pointer; events: smallint): longint; cdecl; external libzmq;
function zmq_poller_modify_fd(poller: pointer; fd: Tzmq_fd_t; events: smallint): longint; cdecl; external libzmq;
function zmq_poller_remove_fd(poller: pointer; fd: Tzmq_fd_t): longint; cdecl; external libzmq;
function zmq_socket_get_peer_state(socket: pointer; routing_id: pointer; routing_id_size: Tsize_t): longint; cdecl; external libzmq;

const
  ZMQ_EVENT_PIPES_STATS = $10000;
  ZMQ_CURRENT_EVENT_VERSION = 1;
  ZMQ_CURRENT_EVENT_VERSION_DRAFT = 2;

function zmq_socket_monitor_versioned(s_: pointer; addr_: pchar; events_: Tuint64_t; event_version_: longint; type_: longint): longint; cdecl; external libzmq;
function zmq_socket_monitor_pipes_stats(s: pointer): longint; cdecl; external libzmq;

function zmq_ppoll(items_: Pzmq_pollitem_t; nitems_: longint; timeout_: longint; sigmask_: pointer): longint; cdecl; external libzmq;


// === Konventiert am: 14-1-26 19:17:29 ===


implementation


function ZMQ_MAKE_VERSION(major, minor, patch: longint): longint;
begin
  ZMQ_MAKE_VERSION := ((major * 10000) + (minor * 100)) + patch;
end;

function ZMQ_VERSION: longint;
begin
  ZMQ_VERSION := ZMQ_MAKE_VERSION(ZMQ_VERSION_MAJOR, ZMQ_VERSION_MINOR, ZMQ_VERSION_PATCH);
end;


end.
