{$IFDEF read_interface}


type
  PEfl_Net_Socket_Ssl = ^TEfl_Net_Socket_Ssl;
  TEfl_Net_Socket_Ssl = TEo;

{$ifdef EFL_BETA_API_SUPPORT}
function efl_net_socket_ssl_error_handshake_get: TEina_Error; cdecl; external libecore_con;
function EFL_NET_SOCKET_SSL_ERROR_HANDSHAKE: TEina_Error;
{$endif}

{$ifdef EFL_BETA_API_SUPPORT}
function efl_net_socket_ssl_error_certificate_verify_failed_get: TEina_Error; cdecl; external libecore_con;
function EFL_NET_SOCKET_SSL_ERROR_CERTIFICATE_VERIFY_FAILED: TEina_Error;
{$endif}

{$ifdef EFL_BETA_API_SUPPORT}
function EFL_NET_SOCKET_SSL_CLASS: PEfl_Class;

function efl_net_socket_ssl_class_get: PEfl_Class; cdecl; external libecore_con;
procedure efl_net_socket_ssl_adopt(obj: PEo; efl_net_socket: PEfl_Net_Socket; ctx: PEfl_Net_Ssl_Context); cdecl; external libecore_con;
function efl_net_socket_ssl_adopted_get(obj: PEo; efl_net_socket: PPEfl_Net_Socket; ctx: PPEfl_Net_Ssl_Context): TEina_Bool; cdecl; external libecore_con;
procedure efl_net_socket_ssl_verify_mode_set(obj: PEo; verify_mode: TEfl_Net_Ssl_Verify_Mode); cdecl; external libecore_con;
function efl_net_socket_ssl_verify_mode_get(obj: PEo): TEfl_Net_Ssl_Verify_Mode; cdecl; external libecore_con;
procedure efl_net_socket_ssl_hostname_verify_set(obj: PEo; hostname_verify: TEina_Bool); cdecl; external libecore_con;
function efl_net_socket_ssl_hostname_verify_get(obj: PEo): TEina_Bool; cdecl; external libecore_con;
procedure efl_net_socket_ssl_hostname_override_set(obj: PEo; hostname_override: pchar); cdecl; external libecore_con;
function efl_net_socket_ssl_hostname_override_get(obj: PEo): pchar; cdecl; external libecore_con;

var
  _EFL_NET_SOCKET_SSL_EVENT_SSL_READY: TEfl_Event_Description; cvar;external libecore_con;
  _EFL_NET_SOCKET_SSL_EVENT_SSL_ERROR: TEfl_Event_Description; cvar;external libecore_con;

function EFL_NET_SOCKET_SSL_EVENT_SSL_READY: PEfl_Event_Description;
function EFL_NET_SOCKET_SSL_EVENT_SSL_ERROR: PEfl_Event_Description;
{$endif}

// === Konventiert am: 9-6-25 17:14:29 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


{$ifdef EFL_BETA_API_SUPPORT}
function EFL_NET_SOCKET_SSL_ERROR_HANDSHAKE: TEina_Error;
begin
  EFL_NET_SOCKET_SSL_ERROR_HANDSHAKE := efl_net_socket_ssl_error_handshake_get;
end;

function EFL_NET_SOCKET_SSL_ERROR_CERTIFICATE_VERIFY_FAILED: TEina_Error;
begin
  EFL_NET_SOCKET_SSL_ERROR_CERTIFICATE_VERIFY_FAILED := efl_net_socket_ssl_error_certificate_verify_failed_get;
end;

function EFL_NET_SOCKET_SSL_CLASS: PEfl_Class;
begin
  EFL_NET_SOCKET_SSL_CLASS := efl_net_socket_ssl_class_get;
end;

function EFL_NET_SOCKET_SSL_EVENT_SSL_READY: PEfl_Event_Description;
begin
  EFL_NET_SOCKET_SSL_EVENT_SSL_READY := @(_EFL_NET_SOCKET_SSL_EVENT_SSL_READY);
end;

function EFL_NET_SOCKET_SSL_EVENT_SSL_ERROR: PEfl_Event_Description;
begin
  EFL_NET_SOCKET_SSL_EVENT_SSL_ERROR := @(_EFL_NET_SOCKET_SSL_EVENT_SSL_ERROR);
end;
{$endif}


{$ENDIF read_implementation}
