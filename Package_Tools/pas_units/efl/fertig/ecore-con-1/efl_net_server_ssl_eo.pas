unit efl_net_server_ssl_eo;

interface

uses
  efl, fp_eo, fp_eina, fp_efl, fp_ecore, efl_net_ssl_context_eo;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PEfl_Net_Server_Ssl = ^TEfl_Net_Server_Ssl;
  TEfl_Net_Server_Ssl = TEo;

{$ifdef EFL_BETA_API_SUPPORT}
function EFL_NET_SERVER_SSL_CLASS: PEfl_Class;

function efl_net_server_ssl_class_get: PEfl_Class; cdecl; external libecore_con;
procedure efl_net_server_ssl_context_set(obj: PEo; ssl_context: PEfl_Net_Ssl_Context); cdecl; external libecore_con;
function efl_net_server_ssl_context_get(obj: PEo): PEfl_Net_Ssl_Context; cdecl; external libecore_con;
{$endif}

// === Konventiert am: 9-6-25 19:04:33 ===


implementation


{$ifdef EFL_BETA_API_SUPPORT}
function EFL_NET_SERVER_SSL_CLASS: PEfl_Class;
begin
  EFL_NET_SERVER_SSL_CLASS := efl_net_server_ssl_class_get;
end;
{$endif}


end.
