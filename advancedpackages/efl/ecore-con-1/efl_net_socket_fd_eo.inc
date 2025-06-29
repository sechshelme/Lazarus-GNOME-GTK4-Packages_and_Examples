{$IFDEF read_interface}


type
  PEfl_Net_Socket_Fd = ^TEfl_Net_Socket_Fd;
  TEfl_Net_Socket_Fd = TEo;

{$ifdef EFL_BETA_API_SUPPORT}
function EFL_NET_SOCKET_FD_CLASS: PEfl_Class;

function efl_net_socket_fd_class_get: PEfl_Class; cdecl; external libecore_con;
procedure efl_net_socket_fd_family_set(obj: PEo; family: longint); cdecl; external libecore_con;
function efl_net_socket_fd_family_get(obj: PEo): longint; cdecl; external libecore_con;
{$endif}

// === Konventiert am: 9-6-25 17:14:24 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


{$ifdef EFL_BETA_API_SUPPORT}
function EFL_NET_SOCKET_FD_CLASS: PEfl_Class;
begin
  EFL_NET_SOCKET_FD_CLASS := efl_net_socket_fd_class_get;
end;
{$endif}


{$ENDIF read_implementation}
