{$IFDEF read_interface}


type
  PEfl_Net_Dialer_Simple = ^TEfl_Net_Dialer_Simple;
  TEfl_Net_Dialer_Simple = TEo;

{$ifdef EFL_BETA_API_SUPPORT}
function EFL_NET_DIALER_SIMPLE_CLASS: PEfl_Class;

function efl_net_dialer_simple_class_get: PEfl_Class; cdecl; external libecore_con;
procedure efl_net_dialer_simple_inner_class_set(obj: PEo; klass: PEfl_Class); cdecl; external libecore_con;
function efl_net_dialer_simple_inner_class_get(obj: PEo): PEfl_Class; cdecl; external libecore_con;
{$endif}

// === Konventiert am: 9-6-25 19:15:27 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


{$ifdef EFL_BETA_API_SUPPORT}
function EFL_NET_DIALER_SIMPLE_CLASS: PEfl_Class;
begin
  EFL_NET_DIALER_SIMPLE_CLASS := efl_net_dialer_simple_class_get;
end;
{$endif}


{$ENDIF read_implementation}
