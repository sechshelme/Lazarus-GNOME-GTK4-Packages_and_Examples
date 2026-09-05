{$IFDEF read_interface}



function amqp_tcp_socket_new(state:Tamqp_connection_state_t):Pamqp_socket_t;cdecl;external librabbitmq;
procedure amqp_tcp_socket_set_sockfd(self:Pamqp_socket_t; sockfd:longint);cdecl;external librabbitmq;

// === Konventiert am: 4-9-26 19:56:48 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
