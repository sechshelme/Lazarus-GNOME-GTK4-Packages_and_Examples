{$IFDEF read_interface}


type
  PEfl_Net_Dialer_Unix = ^TEfl_Net_Dialer_Unix;
  TEfl_Net_Dialer_Unix = TEo;

{$ifdef EFL_BETA_API_SUPPORT}
function EFL_NET_DIALER_UNIX_CLASS: PEfl_Class;

function efl_net_dialer_unix_class_get: PEfl_Class; cdecl; external libecore_con;
{$endif}

// === Konventiert am: 9-6-25 19:15:38 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


{$ifdef EFL_BETA_API_SUPPORT}
function EFL_NET_DIALER_UNIX_CLASS: PEfl_Class;
begin
  EFL_NET_DIALER_UNIX_CLASS := efl_net_dialer_unix_class_get;
end;
{$endif}


{$ENDIF read_implementation}
