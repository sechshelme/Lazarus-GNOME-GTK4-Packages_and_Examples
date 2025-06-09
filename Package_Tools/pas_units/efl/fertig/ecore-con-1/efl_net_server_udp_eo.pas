unit efl_net_server_udp_eo;

interface

uses
  efl, fp_eo, fp_eina, fp_efl, fp_ecore;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PEfl_Net_Server_Udp = ^TEfl_Net_Server_Udp;
  TEfl_Net_Server_Udp = TEo;

{$ifdef EFL_BETA_API_SUPPORT}
function EFL_NET_SERVER_UDP_CLASS: PEfl_Class;

function efl_net_server_udp_class_get: PEfl_Class; cdecl; external libecore_con;
function efl_net_server_udp_dont_route_set(obj: PEo; dont_route: TEina_Bool): TEina_Bool; cdecl; external libecore_con;
function efl_net_server_udp_dont_route_get(obj: PEo): TEina_Bool; cdecl; external libecore_con;
function efl_net_server_udp_multicast_join(obj: PEo; address: pchar): TEina_Error; cdecl; external libecore_con;
function efl_net_server_udp_multicast_leave(obj: PEo; address: pchar): TEina_Error; cdecl; external libecore_con;
function efl_net_server_udp_multicast_groups_get(obj: PEo): PEina_Iterator; cdecl; external libecore_con;
function efl_net_server_udp_multicast_time_to_live_set(obj: PEo; ttl: uint8): TEina_Error; cdecl; external libecore_con;
function efl_net_server_udp_multicast_time_to_live_get(obj: PEo): uint8; cdecl; external libecore_con;
function efl_net_server_udp_multicast_loopback_set(obj: PEo; loopback: TEina_Bool): TEina_Error; cdecl; external libecore_con;
function efl_net_server_udp_multicast_loopback_get(obj: PEo): TEina_Bool; cdecl; external libecore_con;
{$endif}

// === Konventiert am: 9-6-25 19:04:40 ===


implementation


{$ifdef EFL_BETA_API_SUPPORT}
function EFL_NET_SERVER_UDP_CLASS: PEfl_Class;
begin
  EFL_NET_SERVER_UDP_CLASS := efl_net_server_udp_class_get;
end;
{$endif}


end.
