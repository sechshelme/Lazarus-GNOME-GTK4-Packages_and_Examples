{$IFDEF read_interface}


type
  PPEfl_Net_Socket = ^PEfl_Net_Socket;
  PEfl_Net_Socket = ^TEfl_Net_Socket;
  TEfl_Net_Socket = TEo;

{$ifdef EFL_BETA_API_SUPPORT}
function EFL_NET_SOCKET_INTERFACE: PEfl_Class;

function efl_net_socket_interface_get: PEfl_Class; cdecl; external libecore_con;
procedure efl_net_socket_address_local_set(obj: PEo; address: pchar); cdecl; external libecore_con;
function efl_net_socket_address_local_get(obj: PEo): pchar; cdecl; external libecore_con;
procedure efl_net_socket_address_remote_set(obj: PEo; address: pchar); cdecl; external libecore_con;
function efl_net_socket_address_remote_get(obj: PEo): pchar; cdecl; external libecore_con;
{$endif}

// === Konventiert am: 9-6-25 17:14:21 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


{$ifdef EFL_BETA_API_SUPPORT}
function EFL_NET_SOCKET_INTERFACE: PEfl_Class;
begin
  EFL_NET_SOCKET_INTERFACE := efl_net_socket_interface_get;
end;
{$endif}


{$ENDIF read_implementation}
