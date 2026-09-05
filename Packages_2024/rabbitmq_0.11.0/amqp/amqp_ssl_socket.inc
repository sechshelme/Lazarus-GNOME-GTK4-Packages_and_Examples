{$IFDEF read_interface}


function amqp_ssl_socket_new(state: Tamqp_connection_state_t): Pamqp_socket_t; cdecl; external librabbitmq;
function amqp_ssl_socket_get_context(self: Pamqp_socket_t): pointer; cdecl; external librabbitmq;
function amqp_ssl_socket_set_cacert(self: Pamqp_socket_t; cacert: pchar): longint; cdecl; external librabbitmq;
procedure amqp_ssl_socket_set_key_passwd(self: Pamqp_socket_t; passwd: pchar); cdecl; external librabbitmq;
function amqp_ssl_socket_set_key(self: Pamqp_socket_t; cert: pchar; key: pchar): longint; cdecl; external librabbitmq;
function amqp_ssl_socket_set_key_engine(self: Pamqp_socket_t; cert: pchar; key: pchar): longint; cdecl; external librabbitmq;
function amqp_ssl_socket_set_key_buffer(self: Pamqp_socket_t; cert: pchar; key: pointer; n: Tsize_t): longint; cdecl; external librabbitmq;
procedure amqp_ssl_socket_set_verify(self: Pamqp_socket_t; verify: Tamqp_boolean_t); cdecl; external librabbitmq; deprecated;
procedure amqp_ssl_socket_set_verify_peer(self: Pamqp_socket_t; verify: Tamqp_boolean_t); cdecl; external librabbitmq;

procedure amqp_ssl_socket_set_verify_hostname(self: Pamqp_socket_t; verify: Tamqp_boolean_t); cdecl; external librabbitmq;

type
  Pamqp_tls_version_t = ^Tamqp_tls_version_t;
  Tamqp_tls_version_t = longint;
const
  AMQP_TLSv1 = 1;
  AMQP_TLSv1_1 = 2;
  AMQP_TLSv1_2 = 3;
  AMQP_TLSvLATEST = $FFFF;

function amqp_ssl_socket_set_ssl_versions(self: Pamqp_socket_t; min: Tamqp_tls_version_t; max: Tamqp_tls_version_t): longint; cdecl; external librabbitmq;
procedure amqp_set_initialize_ssl_library(do_initialize: Tamqp_boolean_t); cdecl; external librabbitmq;
function amqp_initialize_ssl_library: longint; cdecl; external librabbitmq;
function amqp_set_ssl_engine(engine: pchar): longint; cdecl; external librabbitmq;
function amqp_uninitialize_ssl_library: longint; cdecl; external librabbitmq;

// === Konventiert am: 4-9-26 19:56:45 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
