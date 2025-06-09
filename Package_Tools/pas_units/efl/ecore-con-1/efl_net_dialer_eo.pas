unit efl_net_dialer_eo;

interface

uses
  efl, fp_eo, fp_eina, fp_efl, fp_ecore;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PEfl_Net_Dialer = ^TEfl_Net_Dialer;
  TEfl_Net_Dialer = TEo;

{$ifdef EFL_BETA_API_SUPPORT}
function efl_net_dialer_error_couldnt_connect_get: TEina_Error; cdecl; external libecore_con;
function EFL_NET_DIALER_ERROR_COULDNT_CONNECT: TEina_Error;
{$endif}

{$ifdef EFL_BETA_API_SUPPORT}
function efl_net_dialer_error_couldnt_resolve_proxy_get: TEina_Error; cdecl; external libecore_con;
function EFL_NET_DIALER_ERROR_COULDNT_RESOLVE_PROXY: TEina_Error;
{$endif}

{$ifdef EFL_BETA_API_SUPPORT}
function efl_net_dialer_error_proxy_authentication_failed_get: TEina_Error; cdecl; external libecore_con;
function EFL_NET_DIALER_ERROR_PROXY_AUTHENTICATION_FAILED: TEina_Error;
{$endif}

{$ifdef EFL_BETA_API_SUPPORT}
function EFL_NET_DIALER_INTERFACE: PEfl_Class;

function efl_net_dialer_interface_get: PEfl_Class; cdecl; external libecore_con;
function efl_net_dialer_dial(obj: PEo; address: pchar): TEina_Error; cdecl; external libecore_con;
procedure efl_net_dialer_address_dial_set(obj: PEo; address: pchar); cdecl; external libecore_con;
function efl_net_dialer_address_dial_get(obj: PEo): pchar; cdecl; external libecore_con;
procedure efl_net_dialer_connected_set(obj: PEo; connected: TEina_Bool); cdecl; external libecore_con;
function efl_net_dialer_connected_get(obj: PEo): TEina_Bool; cdecl; external libecore_con;
procedure efl_net_dialer_proxy_set(obj: PEo; proxy_url: pchar); cdecl; external libecore_con;
function efl_net_dialer_proxy_get(obj: PEo): pchar; cdecl; external libecore_con;
procedure efl_net_dialer_timeout_dial_set(obj: PEo; seconds: double); cdecl; external libecore_con;
function efl_net_dialer_timeout_dial_get(obj: PEo): double; cdecl; external libecore_con;

var
  _EFL_NET_DIALER_EVENT_DIALER_RESOLVED: TEfl_Event_Description; cvar;external libecore_con;
  _EFL_NET_DIALER_EVENT_DIALER_ERROR: TEfl_Event_Description; cvar;external libecore_con;
  _EFL_NET_DIALER_EVENT_DIALER_CONNECTED: TEfl_Event_Description; cvar;external libecore_con;

function EFL_NET_DIALER_EVENT_DIALER_RESOLVED: PEfl_Event_Description;
function EFL_NET_DIALER_EVENT_DIALER_ERROR: PEfl_Event_Description;
function EFL_NET_DIALER_EVENT_DIALER_CONNECTED: PEfl_Event_Description;
{$endif}

// === Konventiert am: 9-6-25 17:03:10 ===


implementation


{$ifdef EFL_BETA_API_SUPPORT}
function EFL_NET_DIALER_ERROR_COULDNT_CONNECT: TEina_Error;
begin
  EFL_NET_DIALER_ERROR_COULDNT_CONNECT := efl_net_dialer_error_couldnt_connect_get;
end;

function EFL_NET_DIALER_ERROR_COULDNT_RESOLVE_PROXY: TEina_Error;
begin
  EFL_NET_DIALER_ERROR_COULDNT_RESOLVE_PROXY := efl_net_dialer_error_couldnt_resolve_proxy_get;
end;

function EFL_NET_DIALER_ERROR_PROXY_AUTHENTICATION_FAILED: TEina_Error;
begin
  EFL_NET_DIALER_ERROR_PROXY_AUTHENTICATION_FAILED := efl_net_dialer_error_proxy_authentication_failed_get;
end;

function EFL_NET_DIALER_INTERFACE: PEfl_Class;
begin
  EFL_NET_DIALER_INTERFACE := efl_net_dialer_interface_get;
end;

function EFL_NET_DIALER_EVENT_DIALER_RESOLVED: PEfl_Event_Description;
begin
  EFL_NET_DIALER_EVENT_DIALER_RESOLVED := @(_EFL_NET_DIALER_EVENT_DIALER_RESOLVED);
end;

function EFL_NET_DIALER_EVENT_DIALER_ERROR: PEfl_Event_Description;
begin
  EFL_NET_DIALER_EVENT_DIALER_ERROR := @(_EFL_NET_DIALER_EVENT_DIALER_ERROR);
end;

function EFL_NET_DIALER_EVENT_DIALER_CONNECTED: PEfl_Event_Description;
begin
  EFL_NET_DIALER_EVENT_DIALER_CONNECTED := @(_EFL_NET_DIALER_EVENT_DIALER_CONNECTED);
end;
{$endif}



end.
