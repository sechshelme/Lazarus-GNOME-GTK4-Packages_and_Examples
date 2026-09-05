unit amqp_tcp_socket;

interface

uses
  fp_amqp, amqp;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}



function amqp_tcp_socket_new(state:Tamqp_connection_state_t):Pamqp_socket_t;cdecl;external librabbitmq;
procedure amqp_tcp_socket_set_sockfd(self:Pamqp_socket_t; sockfd:longint);cdecl;external librabbitmq;

// === Konventiert am: 4-9-26 19:56:48 ===


implementation



end.
