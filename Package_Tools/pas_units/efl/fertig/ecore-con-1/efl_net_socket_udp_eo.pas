unit efl_net_socket_udp_eo;

interface

uses
  efl, fp_eo, fp_eina, fp_efl, fp_ecore, efl_net_ip_address_eo;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PEfl_Net_Socket_Udp = ^TEfl_Net_Socket_Udp;
  TEfl_Net_Socket_Udp = TEo;

{$ifdef EFL_BETA_API_SUPPORT}
function EFL_NET_SOCKET_UDP_CLASS: PEfl_Class;

function efl_net_socket_udp_class_get: PEfl_Class; cdecl; external libecore_con;
function efl_net_socket_udp_next_datagram_size_query(obj: PEo): Tsize_t; cdecl; external libecore_con;
function efl_net_socket_udp_cork_set(obj: PEo; cork: TEina_Bool): TEina_Bool; cdecl; external libecore_con;
function efl_net_socket_udp_cork_get(obj: PEo): TEina_Bool; cdecl; external libecore_con;
function efl_net_socket_udp_dont_route_set(obj: PEo; dont_route: TEina_Bool): TEina_Bool; cdecl; external libecore_con;
function efl_net_socket_udp_dont_route_get(obj: PEo): TEina_Bool; cdecl; external libecore_con;
function efl_net_socket_udp_reuse_address_set(obj: PEo; reuse_address: TEina_Bool): TEina_Bool; cdecl; external libecore_con;
function efl_net_socket_udp_reuse_address_get(obj: PEo): TEina_Bool; cdecl; external libecore_con;
function efl_net_socket_udp_reuse_port_set(obj: PEo; reuse_port: TEina_Bool): TEina_Bool; cdecl; external libecore_con;
function efl_net_socket_udp_reuse_port_get(obj: PEo): TEina_Bool; cdecl; external libecore_con;
function efl_net_socket_udp_multicast_join(obj: PEo; address: pchar): TEina_Error; cdecl; external libecore_con;
function efl_net_socket_udp_multicast_leave(obj: PEo; address: pchar): TEina_Error; cdecl; external libecore_con;
function efl_net_socket_udp_multicast_groups_get(obj: PEo): PEina_Iterator; cdecl; external libecore_con;
function efl_net_socket_udp_multicast_time_to_live_set(obj: PEo; ttl: uint8): TEina_Error; cdecl; external libecore_con;
function efl_net_socket_udp_multicast_time_to_live_get(obj: PEo): uint8; cdecl; external libecore_con;
function efl_net_socket_udp_multicast_loopback_set(obj: PEo; loopback: TEina_Bool): TEina_Error; cdecl; external libecore_con;
function efl_net_socket_udp_multicast_loopback_get(obj: PEo): TEina_Bool; cdecl; external libecore_con;
function efl_net_socket_udp_bind_set(obj: PEo; address: pchar): TEina_Error; cdecl; external libecore_con;
function efl_net_socket_udp_bind_get(obj: PEo): pchar; cdecl; external libecore_con;
procedure efl_net_socket_udp_init(obj: PEo; remote_address: PEfl_Net_Ip_Address); cdecl; external libecore_con;
{$endif}

// === Konventiert am: 9-6-25 17:03:18 ===


implementation


{$ifdef EFL_BETA_API_SUPPORT}
function EFL_NET_SOCKET_UDP_CLASS: PEfl_Class;
begin
  EFL_NET_SOCKET_UDP_CLASS := efl_net_socket_udp_class_get;
end;
{$endif}


end.
