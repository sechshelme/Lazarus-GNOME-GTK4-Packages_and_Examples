unit efl_net_socket_tcp_eo;

interface

uses
  efl, fp_eo, fp_eina, fp_efl, fp_ecore;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PEfl_Net_Socket_Tcp = ^TEfl_Net_Socket_Tcp;
  TEfl_Net_Socket_Tcp = TEo;

{$ifdef EFL_BETA_API_SUPPORT}
function EFL_NET_SOCKET_TCP_CLASS: PEfl_Class;

function efl_net_socket_tcp_class_get: PEfl_Class; cdecl; external libecore_con;
function efl_net_socket_tcp_keep_alive_set(obj: PEo; keep_alive: TEina_Bool): TEina_Bool; cdecl; external libecore_con;
function efl_net_socket_tcp_keep_alive_get(obj: PEo): TEina_Bool; cdecl; external libecore_con;
function efl_net_socket_tcp_no_delay_set(obj: PEo; no_delay: TEina_Bool): TEina_Bool; cdecl; external libecore_con;
function efl_net_socket_tcp_no_delay_get(obj: PEo): TEina_Bool; cdecl; external libecore_con;
function efl_net_socket_tcp_cork_set(obj: PEo; cork: TEina_Bool): TEina_Bool; cdecl; external libecore_con;
function efl_net_socket_tcp_cork_get(obj: PEo): TEina_Bool; cdecl; external libecore_con;
{$endif}

// === Konventiert am: 9-6-25 17:14:32 ===


implementation


{$ifdef EFL_BETA_API_SUPPORT}
function EFL_NET_SOCKET_TCP_CLASS: PEfl_Class;
begin
  EFL_NET_SOCKET_TCP_CLASS := efl_net_socket_tcp_class_get;
end;
{$endif}


end.
