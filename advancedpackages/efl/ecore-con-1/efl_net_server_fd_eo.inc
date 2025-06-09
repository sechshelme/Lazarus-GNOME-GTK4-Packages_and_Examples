{$IFDEF read_interface}


type
  PEfl_Net_Server_Fd = ^TEfl_Net_Server_Fd;
  TEfl_Net_Server_Fd = TEo;

{$ifdef EFL_BETA_API_SUPPORT}
function EFL_NET_SERVER_FD_CLASS: PEfl_Class;

function efl_net_server_fd_class_get: PEfl_Class; cdecl; external libecore_con;
function efl_net_server_fd_socket_activate(obj: PEo; address: pchar): TEina_Error; cdecl; external libecore_con;
procedure efl_net_server_fd_family_set(obj: PEo; family: longint); cdecl; external libecore_con;
function efl_net_server_fd_family_get(obj: PEo): longint; cdecl; external libecore_con;
function efl_net_server_fd_close_on_exec_set(obj: PEo; close_on_exec: TEina_Bool): TEina_Bool; cdecl; external libecore_con;
function efl_net_server_fd_close_on_exec_get(obj: PEo): TEina_Bool; cdecl; external libecore_con;
function efl_net_server_fd_reuse_address_set(obj: PEo; reuse_address: TEina_Bool): TEina_Bool; cdecl; external libecore_con;
function efl_net_server_fd_reuse_address_get(obj: PEo): TEina_Bool; cdecl; external libecore_con;
function efl_net_server_fd_reuse_port_set(obj: PEo; reuse_port: TEina_Bool): TEina_Bool; cdecl; external libecore_con;
function efl_net_server_fd_reuse_port_get(obj: PEo): TEina_Bool; cdecl; external libecore_con;
procedure efl_net_server_fd_process_incoming_data(obj: PEo); cdecl; external libecore_con;
procedure efl_net_server_fd_client_add(obj: PEo; client_fd: longint); cdecl; external libecore_con;
procedure efl_net_server_fd_client_reject(obj: PEo; client_fd: longint); cdecl; external libecore_con;
{$endif}

// === Konventiert am: 9-6-25 19:04:25 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


{$ifdef EFL_BETA_API_SUPPORT}
function EFL_NET_SERVER_FD_CLASS: PEfl_Class;
begin
  EFL_NET_SERVER_FD_CLASS := efl_net_server_fd_class_get;
end;
{$endif}


{$ENDIF read_implementation}
