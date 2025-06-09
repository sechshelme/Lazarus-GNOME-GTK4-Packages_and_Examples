unit efl_net_server_eo;

interface

uses
  efl, fp_eo, fp_eina, fp_efl, fp_ecore, efl_net_socket_eo;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PEfl_Net_Server = ^TEfl_Net_Server;
  TEfl_Net_Server = TEo;

{$ifdef EFL_BETA_API_SUPPORT}
function EFL_NET_SERVER_INTERFACE: PEfl_Class;

function efl_net_server_interface_get: PEfl_Class; cdecl; external libecore_con;
function efl_net_server_serve(obj: PEo; address: pchar): TEina_Error; cdecl; external libecore_con;
procedure efl_net_server_address_set(obj: PEo; address: pchar); cdecl; external libecore_con;
function efl_net_server_address_get(obj: PEo): pchar; cdecl; external libecore_con;
procedure efl_net_server_clients_count_set(obj: PEo; count: dword); cdecl; external libecore_con;
function efl_net_server_clients_count_get(obj: PEo): dword; cdecl; external libecore_con;
procedure efl_net_server_clients_limit_set(obj: PEo; limit: dword; reject_excess: TEina_Bool); cdecl; external libecore_con;
procedure efl_net_server_clients_limit_get(obj: PEo; limit: Pdword; reject_excess: PEina_Bool); cdecl; external libecore_con;
function efl_net_server_client_announce(obj: PEo; client: PEfl_Net_Socket): TEina_Bool; cdecl; external libecore_con;
procedure efl_net_server_serving_set(obj: PEo; serving: TEina_Bool); cdecl; external libecore_con;
function efl_net_server_serving_get(obj: PEo): TEina_Bool; cdecl; external libecore_con;

var
  _EFL_NET_SERVER_EVENT_CLIENT_ADD: TEfl_Event_Description; cvar;external libecore_con;
  _EFL_NET_SERVER_EVENT_CLIENT_REJECTED: TEfl_Event_Description; cvar;external libecore_con;
  _EFL_NET_SERVER_EVENT_SERVER_ERROR: TEfl_Event_Description; cvar;external libecore_con;
  _EFL_NET_SERVER_EVENT_SERVING: TEfl_Event_Description; cvar;external libecore_con;

function EFL_NET_SERVER_EVENT_CLIENT_ADD: PEfl_Event_Description;
function EFL_NET_SERVER_EVENT_CLIENT_REJECTED: PEfl_Event_Description;
function EFL_NET_SERVER_EVENT_SERVER_ERROR: PEfl_Event_Description;
function EFL_NET_SERVER_EVENT_SERVING: PEfl_Event_Description;
{$endif}

// === Konventiert am: 9-6-25 17:03:15 ===


implementation


{$ifdef EFL_BETA_API_SUPPORT}
function EFL_NET_SERVER_INTERFACE: PEfl_Class;
begin
  EFL_NET_SERVER_INTERFACE := efl_net_server_interface_get;
end;

function EFL_NET_SERVER_EVENT_CLIENT_ADD: PEfl_Event_Description;
begin
  EFL_NET_SERVER_EVENT_CLIENT_ADD := @(_EFL_NET_SERVER_EVENT_CLIENT_ADD);
end;

function EFL_NET_SERVER_EVENT_CLIENT_REJECTED: PEfl_Event_Description;
begin
  EFL_NET_SERVER_EVENT_CLIENT_REJECTED := @(_EFL_NET_SERVER_EVENT_CLIENT_REJECTED);
end;

function EFL_NET_SERVER_EVENT_SERVER_ERROR: PEfl_Event_Description;
begin
  EFL_NET_SERVER_EVENT_SERVER_ERROR := @(_EFL_NET_SERVER_EVENT_SERVER_ERROR);
end;

function EFL_NET_SERVER_EVENT_SERVING: PEfl_Event_Description;
begin
  EFL_NET_SERVER_EVENT_SERVING := @(_EFL_NET_SERVER_EVENT_SERVING);
end;
{$endif}


end.
