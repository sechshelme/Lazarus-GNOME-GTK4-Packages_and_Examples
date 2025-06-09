{$IFDEF read_interface}


type
  PEfl_Net_Session = ^TEfl_Net_Session;
  TEfl_Net_Session = TEo;

  {$ifdef EFL_BETA_API_SUPPORT}
type
  PEfl_Net_Session_State = ^TEfl_Net_Session_State;
  TEfl_Net_Session_State = longint;

const
  EFL_NET_SESSION_STATE_OFFLINE = 0;
  EFL_NET_SESSION_STATE_LOCAL = 1;
  EFL_NET_SESSION_STATE_ONLINE = 2;
  {$endif}

  {$ifdef EFL_BETA_API_SUPPORT}
type
  PEfl_Net_Session_Technology = ^TEfl_Net_Session_Technology;
  TEfl_Net_Session_Technology = longint;

const
  EFL_NET_SESSION_TECHNOLOGY_UNKNOWN = 0;
  EFL_NET_SESSION_TECHNOLOGY_ETHERNET = 2;
  EFL_NET_SESSION_TECHNOLOGY_WIFI = 4;
  EFL_NET_SESSION_TECHNOLOGY_BLUETOOTH = 8;
  EFL_NET_SESSION_TECHNOLOGY_CELLULAR = 16;
  EFL_NET_SESSION_TECHNOLOGY_VPN = 64;
  EFL_NET_SESSION_TECHNOLOGY_GADGET = 128;
  EFL_NET_SESSION_TECHNOLOGY_ALL = 222;
  {$endif}

{$ifdef EFL_BETA_API_SUPPORT}
function EFL_NET_SESSION_CLASS: PEfl_Class;

function efl_net_session_class_get: PEfl_Class; cdecl; external libecore_con;
procedure efl_net_session_connect(obj: PEo; online_required: TEina_Bool; technologies_allowed: TEfl_Net_Session_Technology); cdecl; external libecore_con;
procedure efl_net_session_disconnect(obj: PEo); cdecl; external libecore_con;
function efl_net_session_network_name_get(obj: PEo): pchar; cdecl; external libecore_con;
function efl_net_session_state_get(obj: PEo): TEfl_Net_Session_State; cdecl; external libecore_con;
function efl_net_session_technology_get(obj: PEo): TEfl_Net_Session_Technology; cdecl; external libecore_con;
function efl_net_session_interface_get(obj: PEo): pchar; cdecl; external libecore_con;
procedure efl_net_session_ipv4_get(obj: PEo; address: PPchar; netmask: PPchar; gateway: PPchar); cdecl; external libecore_con;
procedure efl_net_session_ipv6_get(obj: PEo; address: PPchar; prefix_length: Puint8; netmask: PPchar; gateway: PPchar); cdecl; external libecore_con;

var
  _EFL_NET_SESSION_EVENT_CHANGED: TEfl_Event_Description; cvar;external libecore_con;

function EFL_NET_SESSION_EVENT_CHANGED: PEfl_Event_Description;
{$endif}

// === Konventiert am: 9-6-25 19:30:54 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


{$ifdef EFL_BETA_API_SUPPORT}
function EFL_NET_SESSION_CLASS: PEfl_Class;
begin
  EFL_NET_SESSION_CLASS := efl_net_session_class_get;
end;

function EFL_NET_SESSION_EVENT_CHANGED: PEfl_Event_Description;
begin
  EFL_NET_SESSION_EVENT_CHANGED := @(_EFL_NET_SESSION_EVENT_CHANGED);
end;
{$endif}


{$ENDIF read_implementation}
