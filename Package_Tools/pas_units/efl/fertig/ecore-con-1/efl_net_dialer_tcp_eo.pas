unit efl_net_dialer_tcp_eo;

interface

uses
  efl, fp_eo, fp_eina, fp_efl, fp_ecore;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PEfl_Net_Dialer_Tcp = ^TEfl_Net_Dialer_Tcp;
  TEfl_Net_Dialer_Tcp = TEo;

{$ifdef EFL_BETA_API_SUPPORT}
function EFL_NET_DIALER_TCP_CLASS: PEfl_Class;

function efl_net_dialer_tcp_class_get: PEfl_Class; cdecl; external libecore_con;
{$endif}

// === Konventiert am: 9-6-25 19:15:32 ===


implementation


{$ifdef EFL_BETA_API_SUPPORT}
function EFL_NET_DIALER_TCP_CLASS: PEfl_Class;
begin
  EFL_NET_DIALER_TCP_CLASS := efl_net_dialer_tcp_class_get;
end;
{$endif}


end.
