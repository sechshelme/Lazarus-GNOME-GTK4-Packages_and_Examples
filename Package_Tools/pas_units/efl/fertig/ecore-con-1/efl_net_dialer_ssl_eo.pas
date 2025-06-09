unit efl_net_dialer_ssl_eo;

interface

uses
  efl, fp_eo, fp_eina, fp_efl, fp_ecore, efl_net_ssl_context_eo;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PEfl_Net_Dialer_Ssl = ^TEfl_Net_Dialer_Ssl;
  TEfl_Net_Dialer_Ssl = TEo;

{$ifdef EFL_BETA_API_SUPPORT}
function EFL_NET_DIALER_SSL_CLASS: PEfl_Class;

function efl_net_dialer_ssl_class_get: PEfl_Class; cdecl; external libecore_con;
procedure efl_net_dialer_ssl_context_set(obj: PEo; ssl_context: PEfl_Net_Ssl_Context); cdecl; external libecore_con;
function efl_net_dialer_ssl_context_get(obj: PEo): PEfl_Net_Ssl_Context; cdecl; external libecore_con;
function efl_net_dialer_ssl_keep_alive_set(obj: PEo; keep_alive: TEina_Bool): TEina_Bool; cdecl; external libecore_con;
function efl_net_dialer_ssl_keep_alive_get(obj: PEo): TEina_Bool; cdecl; external libecore_con;
function efl_net_dialer_ssl_no_delay_set(obj: PEo; no_delay: TEina_Bool): TEina_Bool; cdecl; external libecore_con;
function efl_net_dialer_ssl_no_delay_get(obj: PEo): TEina_Bool; cdecl; external libecore_con;
{$endif}

// === Konventiert am: 9-6-25 19:15:29 ===


implementation


{$ifdef EFL_BETA_API_SUPPORT}
function EFL_NET_DIALER_SSL_CLASS: PEfl_Class;
begin
  EFL_NET_DIALER_SSL_CLASS := efl_net_dialer_ssl_class_get;
end;
{$endif}


end.
