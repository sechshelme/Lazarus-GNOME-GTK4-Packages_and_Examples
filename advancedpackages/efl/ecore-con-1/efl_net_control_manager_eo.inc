{$IFDEF read_interface}


type
  PEfl_Net_Control_Manager = ^TEfl_Net_Control_Manager;
  TEfl_Net_Control_Manager = TEo;

  {$ifdef EFL_BETA_API_SUPPORT}
type
  PEfl_Net_Control_State = ^TEfl_Net_Control_State;
  TEfl_Net_Control_State = longint;

const
  EFL_NET_CONTROL_STATE_OFFLINE = 0;
  EFL_NET_CONTROL_STATE_LOCAL = 1;
  EFL_NET_CONTROL_STATE_ONLINE = 2;
  {$endif}

  {$ifdef EFL_BETA_API_SUPPORT}
type
  PEfl_Net_Control_Agent_Request_Input_Field = ^TEfl_Net_Control_Agent_Request_Input_Field;
  TEfl_Net_Control_Agent_Request_Input_Field = longint;

const
  EFL_NET_CONTROL_AGENT_REQUEST_INPUT_FIELD_NAME = 1;
  EFL_NET_CONTROL_AGENT_REQUEST_INPUT_FIELD_SSID = 2;
  EFL_NET_CONTROL_AGENT_REQUEST_INPUT_FIELD_USERNAME = 4;
  EFL_NET_CONTROL_AGENT_REQUEST_INPUT_FIELD_PASSPHRASE = 8;
  EFL_NET_CONTROL_AGENT_REQUEST_INPUT_FIELD_WPS = 16;
  {$endif}

  {$ifdef EFL_BETA_API_SUPPORT}
type
  TEfl_Net_Control_Agent_Request_Input_Information = record
    name: pchar;
    value: pchar;
  end;
  PEfl_Net_Control_Agent_Request_Input_Information = ^TEfl_Net_Control_Agent_Request_Input_Information;
  {$endif}

  {$ifdef EFL_BETA_API_SUPPORT}
type
  TEfl_Net_Control_Agent_Request_Input = record
    access_point: PEfl_Net_Control_Access_Point;
    fields: TEfl_Net_Control_Agent_Request_Input_Field;
    passphrase_type: pchar;
    informational: PEina_Accessor;
  end;
  PEfl_Net_Control_Agent_Request_Input = ^TEfl_Net_Control_Agent_Request_Input;
  {$endif}

  {$ifdef EFL_BETA_API_SUPPORT}
type
  TEfl_Net_Control_Agent_Error = record
    access_point: PEfl_Net_Control_Access_Point;
    message: pchar;
  end;
  PEfl_Net_Control_Agent_Error = ^TEfl_Net_Control_Agent_Error;
  {$endif}

  {$ifdef EFL_BETA_API_SUPPORT}
type
  TEfl_Net_Control_Agent_Browser_Url = record
    access_point: PEfl_Net_Control_Access_Point;
    url: pchar;
  end;
  PEfl_Net_Control_Agent_Browser_Url = ^TEfl_Net_Control_Agent_Browser_Url;
  {$endif}

{$ifdef EFL_BETA_API_SUPPORT}
function EFL_NET_CONTROL_MANAGER_CLASS: PEfl_Class;

function efl_net_control_manager_class_get: PEfl_Class; cdecl; external libecore_con;
procedure efl_net_control_manager_radios_offline_set(obj: PEo; radios_offline: TEina_Bool); cdecl; external libecore_con;
function efl_net_control_manager_radios_offline_get(obj: PEo): TEina_Bool; cdecl; external libecore_con;
function efl_net_control_manager_state_get(obj: PEo): TEfl_Net_Control_State; cdecl; external libecore_con;
function efl_net_control_manager_access_points_get(obj: PEo): PEina_Iterator; cdecl; external libecore_con;
function efl_net_control_manager_technologies_get(obj: PEo): PEina_Iterator; cdecl; external libecore_con;
procedure efl_net_control_manager_agent_enabled_set(obj: PEo; agent_enabled: TEina_Bool); cdecl; external libecore_con;
function efl_net_control_manager_agent_enabled_get(obj: PEo): TEina_Bool; cdecl; external libecore_con;
procedure efl_net_control_manager_agent_reply(obj: PEo; name: pchar; ssid: PEina_Slice; username: pchar; passphrase: pchar; wps: pchar); cdecl; external libecore_con;

var
  _EFL_NET_CONTROL_MANAGER_EVENT_ACCESS_POINT_ADD: TEfl_Event_Description; cvar;external libecore_con;
  _EFL_NET_CONTROL_MANAGER_EVENT_ACCESS_POINT_DEL: TEfl_Event_Description; cvar;external libecore_con;
  _EFL_NET_CONTROL_MANAGER_EVENT_ACCESS_POINTS_CHANGED: TEfl_Event_Description; cvar;external libecore_con;
  _EFL_NET_CONTROL_MANAGER_EVENT_TECHNOLOGY_ADD: TEfl_Event_Description; cvar;external libecore_con;
  _EFL_NET_CONTROL_MANAGER_EVENT_TECHNOLOGY_DEL: TEfl_Event_Description; cvar;external libecore_con;
  _EFL_NET_CONTROL_MANAGER_EVENT_RADIOS_OFFLINE_CHANGED: TEfl_Event_Description; cvar;external libecore_con;
  _EFL_NET_CONTROL_MANAGER_EVENT_STATE_CHANGED: TEfl_Event_Description; cvar;external libecore_con;
  _EFL_NET_CONTROL_MANAGER_EVENT_AGENT_RELEASED: TEfl_Event_Description; cvar;external libecore_con;
  _EFL_NET_CONTROL_MANAGER_EVENT_AGENT_ERROR: TEfl_Event_Description; cvar;external libecore_con;
  _EFL_NET_CONTROL_MANAGER_EVENT_AGENT_BROWSER_URL: TEfl_Event_Description; cvar;external libecore_con;
  _EFL_NET_CONTROL_MANAGER_EVENT_AGENT_REQUEST_INPUT: TEfl_Event_Description; cvar;external libecore_con;

function EFL_NET_CONTROL_MANAGER_EVENT_ACCESS_POINT_ADD: PEfl_Event_Description;
function EFL_NET_CONTROL_MANAGER_EVENT_ACCESS_POINT_DEL: PEfl_Event_Description;
function EFL_NET_CONTROL_MANAGER_EVENT_ACCESS_POINTS_CHANGED: PEfl_Event_Description;
function EFL_NET_CONTROL_MANAGER_EVENT_TECHNOLOGY_ADD: PEfl_Event_Description;
function EFL_NET_CONTROL_MANAGER_EVENT_TECHNOLOGY_DEL: PEfl_Event_Description;
function EFL_NET_CONTROL_MANAGER_EVENT_RADIOS_OFFLINE_CHANGED: PEfl_Event_Description;
function EFL_NET_CONTROL_MANAGER_EVENT_STATE_CHANGED: PEfl_Event_Description;
function EFL_NET_CONTROL_MANAGER_EVENT_AGENT_RELEASED: PEfl_Event_Description;
function EFL_NET_CONTROL_MANAGER_EVENT_AGENT_ERROR: PEfl_Event_Description;
function EFL_NET_CONTROL_MANAGER_EVENT_AGENT_BROWSER_URL: PEfl_Event_Description;
function EFL_NET_CONTROL_MANAGER_EVENT_AGENT_REQUEST_INPUT: PEfl_Event_Description;
{$endif}

// === Konventiert am: 8-6-25 19:32:32 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


{$ifdef EFL_BETA_API_SUPPORT}
function EFL_NET_CONTROL_MANAGER_CLASS: PEfl_Class;
begin
  EFL_NET_CONTROL_MANAGER_CLASS := efl_net_control_manager_class_get;
end;

function EFL_NET_CONTROL_MANAGER_EVENT_ACCESS_POINT_ADD: PEfl_Event_Description;
begin
  EFL_NET_CONTROL_MANAGER_EVENT_ACCESS_POINT_ADD := @(_EFL_NET_CONTROL_MANAGER_EVENT_ACCESS_POINT_ADD);
end;

function EFL_NET_CONTROL_MANAGER_EVENT_ACCESS_POINT_DEL: PEfl_Event_Description;
begin
  EFL_NET_CONTROL_MANAGER_EVENT_ACCESS_POINT_DEL := @(_EFL_NET_CONTROL_MANAGER_EVENT_ACCESS_POINT_DEL);
end;

function EFL_NET_CONTROL_MANAGER_EVENT_ACCESS_POINTS_CHANGED: PEfl_Event_Description;
begin
  EFL_NET_CONTROL_MANAGER_EVENT_ACCESS_POINTS_CHANGED := @(_EFL_NET_CONTROL_MANAGER_EVENT_ACCESS_POINTS_CHANGED);
end;

function EFL_NET_CONTROL_MANAGER_EVENT_TECHNOLOGY_ADD: PEfl_Event_Description;
begin
  EFL_NET_CONTROL_MANAGER_EVENT_TECHNOLOGY_ADD := @(_EFL_NET_CONTROL_MANAGER_EVENT_TECHNOLOGY_ADD);
end;

function EFL_NET_CONTROL_MANAGER_EVENT_TECHNOLOGY_DEL: PEfl_Event_Description;
begin
  EFL_NET_CONTROL_MANAGER_EVENT_TECHNOLOGY_DEL := @(_EFL_NET_CONTROL_MANAGER_EVENT_TECHNOLOGY_DEL);
end;

function EFL_NET_CONTROL_MANAGER_EVENT_RADIOS_OFFLINE_CHANGED: PEfl_Event_Description;
begin
  EFL_NET_CONTROL_MANAGER_EVENT_RADIOS_OFFLINE_CHANGED := @(_EFL_NET_CONTROL_MANAGER_EVENT_RADIOS_OFFLINE_CHANGED);
end;

function EFL_NET_CONTROL_MANAGER_EVENT_STATE_CHANGED: PEfl_Event_Description;
begin
  EFL_NET_CONTROL_MANAGER_EVENT_STATE_CHANGED := @(_EFL_NET_CONTROL_MANAGER_EVENT_STATE_CHANGED);
end;

function EFL_NET_CONTROL_MANAGER_EVENT_AGENT_RELEASED: PEfl_Event_Description;
begin
  EFL_NET_CONTROL_MANAGER_EVENT_AGENT_RELEASED := @(_EFL_NET_CONTROL_MANAGER_EVENT_AGENT_RELEASED);
end;

function EFL_NET_CONTROL_MANAGER_EVENT_AGENT_ERROR: PEfl_Event_Description;
begin
  EFL_NET_CONTROL_MANAGER_EVENT_AGENT_ERROR := @(_EFL_NET_CONTROL_MANAGER_EVENT_AGENT_ERROR);
end;

function EFL_NET_CONTROL_MANAGER_EVENT_AGENT_BROWSER_URL: PEfl_Event_Description;
begin
  EFL_NET_CONTROL_MANAGER_EVENT_AGENT_BROWSER_URL := @(_EFL_NET_CONTROL_MANAGER_EVENT_AGENT_BROWSER_URL);
end;

function EFL_NET_CONTROL_MANAGER_EVENT_AGENT_REQUEST_INPUT: PEfl_Event_Description;
begin
  EFL_NET_CONTROL_MANAGER_EVENT_AGENT_REQUEST_INPUT := @(_EFL_NET_CONTROL_MANAGER_EVENT_AGENT_REQUEST_INPUT);
end;
{$endif}


{$ENDIF read_implementation}
