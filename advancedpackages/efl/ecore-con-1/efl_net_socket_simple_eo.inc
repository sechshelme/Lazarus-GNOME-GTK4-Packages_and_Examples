{$IFDEF read_interface}


type
  PEfl_Net_Socket_Simple = ^TEfl_Net_Socket_Simple;
  TEfl_Net_Socket_Simple = TEo;

{$ifdef EFL_BETA_API_SUPPORT}
function EFL_NET_SOCKET_SIMPLE_CLASS: PEfl_Class;

function efl_net_socket_simple_class_get: PEfl_Class; cdecl; external libecore_con;
{$endif}

// === Konventiert am: 9-6-25 17:14:27 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


{$ifdef EFL_BETA_API_SUPPORT}
function EFL_NET_SOCKET_SIMPLE_CLASS: PEfl_Class;
begin
  EFL_NET_SOCKET_SIMPLE_CLASS := efl_net_socket_simple_class_get;
end;
{$endif}


{$ENDIF read_implementation}
