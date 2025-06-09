unit efl_net_server_simple_eo;

interface

uses
  efl, fp_eo, fp_eina, fp_efl, fp_ecore;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PEfl_Net_Server_Simple = ^TEfl_Net_Server_Simple;
  TEfl_Net_Server_Simple = TEo;

{$ifdef EFL_BETA_API_SUPPORT}
function EFL_NET_SERVER_SIMPLE_CLASS: PEfl_Class;

function efl_net_server_simple_class_get: PEfl_Class; cdecl; external libecore_con;
procedure efl_net_server_simple_inner_class_set(obj: PEo; klass: PEfl_Class); cdecl; external libecore_con;
function efl_net_server_simple_inner_class_get(obj: PEo): PEfl_Class; cdecl; external libecore_con;
procedure efl_net_server_simple_inner_server_set(obj: PEo; server: PEfl_Object); cdecl; external libecore_con;
function efl_net_server_simple_inner_server_get(obj: PEo): PEfl_Object; cdecl; external libecore_con;
{$endif}

// === Konventiert am: 9-6-25 19:04:30 ===


implementation


{$ifdef EFL_BETA_API_SUPPORT}
function EFL_NET_SERVER_SIMPLE_CLASS: PEfl_Class;
begin
  EFL_NET_SERVER_SIMPLE_CLASS := efl_net_server_simple_class_get;
end;
{$endif}


end.
