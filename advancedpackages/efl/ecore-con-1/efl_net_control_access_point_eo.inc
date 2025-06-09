{$IFDEF read_interface}


type
  PEfl_Net_Control_Access_Point = ^TEfl_Net_Control_Access_Point;
  TEfl_Net_Control_Access_Point = TEo;

  {$ifdef EFL_BETA_API_SUPPORT}
type
  PEfl_Net_Control_Access_Point_State = ^TEfl_Net_Control_Access_Point_State;
  TEfl_Net_Control_Access_Point_State = longint;

const
  EFL_NET_CONTROL_ACCESS_POINT_STATE_IDLE = 0;
  EFL_NET_CONTROL_ACCESS_POINT_STATE_ASSOCIATION = 1;
  EFL_NET_CONTROL_ACCESS_POINT_STATE_CONFIGURATION = 2;
  EFL_NET_CONTROL_ACCESS_POINT_STATE_LOCAL = 3;
  EFL_NET_CONTROL_ACCESS_POINT_STATE_ONLINE = 4;
  EFL_NET_CONTROL_ACCESS_POINT_STATE_DISCONNECT = 5;
  EFL_NET_CONTROL_ACCESS_POINT_STATE_FAILURE = 6;
  {$endif}

  {$ifdef EFL_BETA_API_SUPPORT}
type
  PEfl_Net_Control_Access_Point_Error = ^TEfl_Net_Control_Access_Point_Error;
  TEfl_Net_Control_Access_Point_Error = longint;

const
  EFL_NET_CONTROL_ACCESS_POINT_ERROR_NONE = 0;
  EFL_NET_CONTROL_ACCESS_POINT_ERROR_OUT_OF_RANGE = 1;
  EFL_NET_CONTROL_ACCESS_POINT_ERROR_PIN_MISSING = 2;
  EFL_NET_CONTROL_ACCESS_POINT_ERROR_DHCP_FAILED = 3;
  EFL_NET_CONTROL_ACCESS_POINT_ERROR_CONNECT_FAILED = 4;
  EFL_NET_CONTROL_ACCESS_POINT_ERROR_LOGIN_FAILED = 5;
  {$endif}

  {$ifdef EFL_BETA_API_SUPPORT}
type
  PEfl_Net_Control_Access_Point_Security = ^TEfl_Net_Control_Access_Point_Security;
  TEfl_Net_Control_Access_Point_Security = longint;

const
  EFL_NET_CONTROL_ACCESS_POINT_SECURITY_UNKNOW = 0;
  EFL_NET_CONTROL_ACCESS_POINT_SECURITY_NONE = 1;
  EFL_NET_CONTROL_ACCESS_POINT_SECURITY_WEP = 2;
  EFL_NET_CONTROL_ACCESS_POINT_SECURITY_PSK = 4;
  EFL_NET_CONTROL_ACCESS_POINT_SECURITY_IEEE802_1X = 8;
  {$endif}

  {$ifdef EFL_BETA_API_SUPPORT}
type
  PEfl_Net_Control_Access_Point_Ipv4_Method = ^TEfl_Net_Control_Access_Point_Ipv4_Method;
  TEfl_Net_Control_Access_Point_Ipv4_Method = longint;

const
  EFL_NET_CONTROL_ACCESS_POINT_IPV4_METHOD_OFF = 0;
  EFL_NET_CONTROL_ACCESS_POINT_IPV4_METHOD_DHCP = 1;
  EFL_NET_CONTROL_ACCESS_POINT_IPV4_METHOD_MANUAL = 2;
  EFL_NET_CONTROL_ACCESS_POINT_IPV4_METHOD_UNSET = 3;
  {$endif}

  {$ifdef EFL_BETA_API_SUPPORT}
type
  PEfl_Net_Control_Access_Point_Ipv6_Method = ^TEfl_Net_Control_Access_Point_Ipv6_Method;
  TEfl_Net_Control_Access_Point_Ipv6_Method = longint;

const
  EFL_NET_CONTROL_ACCESS_POINT_IPV6_METHOD_OFF = 0;
  EFL_NET_CONTROL_ACCESS_POINT_IPV6_METHOD_FIXED = 1;
  EFL_NET_CONTROL_ACCESS_POINT_IPV6_METHOD_MANUAL = 2;
  EFL_NET_CONTROL_ACCESS_POINT_IPV6_METHOD_AUTO_PRIVACY_NONE = 3;
  EFL_NET_CONTROL_ACCESS_POINT_IPV6_METHOD_AUTO_PRIVACY_PUBLIC = 4;
  EFL_NET_CONTROL_ACCESS_POINT_IPV6_METHOD_AUTO_PRIVACY_TEMPORARY = 5;
  EFL_NET_CONTROL_ACCESS_POINT_IPV6_METHOD_TUNNEL6TO4 = 6;
  EFL_NET_CONTROL_ACCESS_POINT_IPV6_METHOD_UNSET = 7;
  {$endif}

  {$ifdef EFL_BETA_API_SUPPORT}
type
  PEfl_Net_Control_Access_Point_Proxy_Method = ^TEfl_Net_Control_Access_Point_Proxy_Method;
  TEfl_Net_Control_Access_Point_Proxy_Method = longint;

const
  EFL_NET_CONTROL_ACCESS_POINT_PROXY_METHOD_OFF = 0;
  EFL_NET_CONTROL_ACCESS_POINT_PROXY_METHOD_AUTO = 1;
  EFL_NET_CONTROL_ACCESS_POINT_PROXY_METHOD_MANUAL = 2;
  EFL_NET_CONTROL_ACCESS_POINT_PROXY_METHOD_UNSET = 3;
  {$endif}

{$ifdef EFL_BETA_API_SUPPORT}
function EFL_NET_CONTROL_ACCESS_POINT_CLASS: PEfl_Class;

function efl_net_control_access_point_class_get: PEfl_Class; cdecl; external libecore_con;
function efl_net_control_access_point_connect(obj: PEo): PEina_Future; cdecl; external libecore_con;
procedure efl_net_control_access_point_disconnect(obj: PEo); cdecl; external libecore_con;
procedure efl_net_control_access_point_forget(obj: PEo); cdecl; external libecore_con;
function efl_net_control_access_point_state_get(obj: PEo): TEfl_Net_Control_Access_Point_State; cdecl; external libecore_con;
function efl_net_control_access_point_error_get(obj: PEo): TEfl_Net_Control_Access_Point_Error; cdecl; external libecore_con;
function efl_net_control_access_point_ssid_get(obj: PEo): pchar; cdecl; external libecore_con;
procedure efl_net_control_access_point_priority_set(obj: PEo; priority: dword); cdecl; external libecore_con;
function efl_net_control_access_point_priority_get(obj: PEo): dword; cdecl; external libecore_con;
function efl_net_control_access_point_technology_get(obj: PEo): PEfl_Net_Control_Technology; cdecl; external libecore_con;
function efl_net_control_access_point_strength_get(obj: PEo): uint8; cdecl; external libecore_con;
function efl_net_control_access_point_roaming_get(obj: PEo): TEina_Bool; cdecl; external libecore_con;
procedure efl_net_control_access_point_auto_connect_set(obj: PEo; auto_connect: TEina_Bool); cdecl; external libecore_con;
function efl_net_control_access_point_auto_connect_get(obj: PEo): TEina_Bool; cdecl; external libecore_con;
function efl_net_control_access_point_remembered_get(obj: PEo): TEina_Bool; cdecl; external libecore_con;
function efl_net_control_access_point_immutable_get(obj: PEo): TEina_Bool; cdecl; external libecore_con;
function efl_net_control_access_point_security_get(obj: PEo): TEfl_Net_Control_Access_Point_Security; cdecl; external libecore_con;
function efl_net_control_access_point_name_servers_get(obj: PEo): PEina_Iterator; cdecl; external libecore_con;
function efl_net_control_access_point_time_servers_get(obj: PEo): PEina_Iterator; cdecl; external libecore_con;
function efl_net_control_access_point_domains_get(obj: PEo): PEina_Iterator; cdecl; external libecore_con;
procedure efl_net_control_access_point_ipv4_get(obj: PEo; method: PEfl_Net_Control_Access_Point_Ipv4_Method; address: PPchar; netmask: PPchar; gateway: PPchar); cdecl; external libecore_con;
procedure efl_net_control_access_point_ipv6_get(obj: PEo; method: PEfl_Net_Control_Access_Point_Ipv6_Method; address: PPchar; prefix_length: Puint8; netmask: PPchar; gateway: PPchar); cdecl; external libecore_con;
procedure efl_net_control_access_point_proxy_get(obj: PEo; method: PEfl_Net_Control_Access_Point_Proxy_Method; url: PPchar; servers: PPEina_Iterator; excludes: PPEina_Iterator); cdecl; external libecore_con;
procedure efl_net_control_access_point_configuration_name_servers_set(obj: PEo; name_servers: PEina_Iterator); cdecl; external libecore_con;
function efl_net_control_access_point_configuration_name_servers_get(obj: PEo): PEina_Iterator; cdecl; external libecore_con;
procedure efl_net_control_access_point_configuration_time_servers_set(obj: PEo; time_servers: PEina_Iterator); cdecl; external libecore_con;
function efl_net_control_access_point_configuration_time_servers_get(obj: PEo): PEina_Iterator; cdecl; external libecore_con;
procedure efl_net_control_access_point_configuration_domains_set(obj: PEo; domains: PEina_Iterator); cdecl; external libecore_con;
function efl_net_control_access_point_configuration_domains_get(obj: PEo): PEina_Iterator; cdecl; external libecore_con;
procedure efl_net_control_access_point_configuration_ipv4_set(obj: PEo; method: TEfl_Net_Control_Access_Point_Ipv4_Method; address: pchar; netmask: pchar; gateway: pchar); cdecl; external libecore_con;
procedure efl_net_control_access_point_configuration_ipv4_get(obj: PEo; method: PEfl_Net_Control_Access_Point_Ipv4_Method; address: PPchar; netmask: PPchar; gateway: PPchar); cdecl; external libecore_con;
procedure efl_net_control_access_point_configuration_ipv6_set(obj: PEo; method: TEfl_Net_Control_Access_Point_Ipv6_Method; address: pchar; prefix_length: uint8; netmask: pchar; gateway: pchar); cdecl; external libecore_con;
procedure efl_net_control_access_point_configuration_ipv6_get(obj: PEo; method: PEfl_Net_Control_Access_Point_Ipv6_Method; address: PPchar; prefix_length: Puint8; netmask: PPchar; gateway: PPchar); cdecl; external libecore_con;
procedure efl_net_control_access_point_configuration_proxy_set(obj: PEo; method: TEfl_Net_Control_Access_Point_Proxy_Method; url: pchar; servers: PEina_Iterator; excludes: PEina_Iterator); cdecl; external libecore_con;
procedure efl_net_control_access_point_configuration_proxy_get(obj: PEo; method: PEfl_Net_Control_Access_Point_Proxy_Method; url: PPchar; servers: PPEina_Iterator; excludes: PPEina_Iterator); cdecl; external libecore_con;

var
  _EFL_NET_CONTROL_ACCESS_POINT_EVENT_CHANGED: TEfl_Event_Description; cvar;external libecore_con;

function EFL_NET_CONTROL_ACCESS_POINT_EVENT_CHANGED: PEfl_Event_Description;
{$endif}

// === Konventiert am: 8-6-25 19:32:29 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


{$ifdef EFL_BETA_API_SUPPORT}
function EFL_NET_CONTROL_ACCESS_POINT_CLASS: PEfl_Class;
begin
  EFL_NET_CONTROL_ACCESS_POINT_CLASS := efl_net_control_access_point_class_get;
end;

function EFL_NET_CONTROL_ACCESS_POINT_EVENT_CHANGED: PEfl_Event_Description;
begin
  EFL_NET_CONTROL_ACCESS_POINT_EVENT_CHANGED := @(_EFL_NET_CONTROL_ACCESS_POINT_EVENT_CHANGED);
end;
{$endif}


{$ENDIF read_implementation}
