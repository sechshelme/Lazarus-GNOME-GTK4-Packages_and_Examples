unit efl_net_control_technology_eo;

interface

uses
  efl, fp_eo, fp_eina, fp_efl, fp_ecore;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PEfl_Net_Control_Technology = ^TEfl_Net_Control_Technology;
  TEfl_Net_Control_Technology = TEo;

  {$ifdef EFL_BETA_API_SUPPORT}
type
  PEfl_Net_Control_Technology_Type = ^TEfl_Net_Control_Technology_Type;
  TEfl_Net_Control_Technology_Type = longint;

const
  EFL_NET_CONTROL_TECHNOLOGY_TYPE_UNKNOWN = 0;
  EFL_NET_CONTROL_TECHNOLOGY_TYPE_SYSTEM = 1;
  EFL_NET_CONTROL_TECHNOLOGY_TYPE_ETHERNET = 2;
  EFL_NET_CONTROL_TECHNOLOGY_TYPE_WIFI = 3;
  EFL_NET_CONTROL_TECHNOLOGY_TYPE_BLUETOOTH = 4;
  EFL_NET_CONTROL_TECHNOLOGY_TYPE_CELLULAR = 5;
  EFL_NET_CONTROL_TECHNOLOGY_TYPE_GPS = 6;
  EFL_NET_CONTROL_TECHNOLOGY_TYPE_VPN = 7;
  EFL_NET_CONTROL_TECHNOLOGY_TYPE_GADGET = 8;
  EFL_NET_CONTROL_TECHNOLOGY_TYPE_P2P = 9;
  {$endif}

{$ifdef EFL_BETA_API_SUPPORT}
function EFL_NET_CONTROL_TECHNOLOGY_CLASS: PEfl_Class;

function efl_net_control_technology_class_get: PEfl_Class; cdecl; external libecore_con;
procedure efl_net_control_technology_powered_set(obj: PEo; powered: TEina_Bool); cdecl; external libecore_con;
function efl_net_control_technology_powered_get(obj: PEo): TEina_Bool; cdecl; external libecore_con;
procedure efl_net_control_technology_tethering_set(obj: PEo; enabled: TEina_Bool; identifier: pchar; passphrase: pchar); cdecl; external libecore_con;
procedure efl_net_control_technology_tethering_get(obj: PEo; enabled: PEina_Bool; identifier: PPchar; passphrase: PPchar); cdecl; external libecore_con;
function efl_net_control_technology_connected_get(obj: PEo): TEina_Bool; cdecl; external libecore_con;
function efl_net_control_technology_type_get(obj: PEo): TEfl_Net_Control_Technology_Type; cdecl; external libecore_con;
function efl_net_control_technology_scan(obj: PEo): PEina_Future; cdecl; external libecore_con;

var
  _EFL_NET_CONTROL_TECHNOLOGY_EVENT_CHANGED: TEfl_Event_Description; cvar;external libecore_con;

function EFL_NET_CONTROL_TECHNOLOGY_EVENT_CHANGED: PEfl_Event_Description;
{$endif}

// === Konventiert am: 8-6-25 19:54:58 ===


implementation


{$ifdef EFL_BETA_API_SUPPORT}
function EFL_NET_CONTROL_TECHNOLOGY_CLASS: PEfl_Class;
begin
  EFL_NET_CONTROL_TECHNOLOGY_CLASS := efl_net_control_technology_class_get;
end;

function EFL_NET_CONTROL_TECHNOLOGY_EVENT_CHANGED: PEfl_Event_Description;
begin
  EFL_NET_CONTROL_TECHNOLOGY_EVENT_CHANGED := @(_EFL_NET_CONTROL_TECHNOLOGY_EVENT_CHANGED);
end;
{$endif}


end.
