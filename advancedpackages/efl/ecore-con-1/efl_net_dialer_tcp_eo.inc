{$IFDEF read_interface}


type
  PEfl_Net_Dialer_Tcp = ^TEfl_Net_Dialer_Tcp;
  TEfl_Net_Dialer_Tcp = TEo;

{$ifdef EFL_BETA_API_SUPPORT}
function EFL_NET_DIALER_TCP_CLASS: PEfl_Class;

function efl_net_dialer_tcp_class_get: PEfl_Class; cdecl; external libecore_con;
{$endif}

// === Konventiert am: 9-6-25 19:15:32 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


{$ifdef EFL_BETA_API_SUPPORT}
function EFL_NET_DIALER_TCP_CLASS: PEfl_Class;
begin
  EFL_NET_DIALER_TCP_CLASS := efl_net_dialer_tcp_class_get;
end;
{$endif}


{$ENDIF read_implementation}
