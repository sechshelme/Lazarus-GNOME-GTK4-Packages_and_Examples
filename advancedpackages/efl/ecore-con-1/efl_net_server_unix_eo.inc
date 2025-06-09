{$IFDEF read_interface}


type
  PEfl_Net_Server_Unix = ^TEfl_Net_Server_Unix;
  TEfl_Net_Server_Unix = TEo;

{$ifdef EFL_BETA_API_SUPPORT}
function EFL_NET_SERVER_UNIX_CLASS: PEfl_Class;

function efl_net_server_unix_class_get: PEfl_Class; cdecl; external libecore_con;
procedure efl_net_server_unix_unlink_before_bind_set(obj: PEo; unlink_before_bind: TEina_Bool); cdecl; external libecore_con;
function efl_net_server_unix_unlink_before_bind_get(obj: PEo): TEina_Bool; cdecl; external libecore_con;
procedure efl_net_server_unix_leading_directories_create_set(obj: PEo; leading_directories_create: TEina_Bool; mode: dword); cdecl; external libecore_con;
procedure efl_net_server_unix_leading_directories_create_get(obj: PEo; leading_directories_create: PEina_Bool; mode: Pdword); cdecl; external libecore_con;
{$endif}

// === Konventiert am: 9-6-25 19:04:43 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


{$ifdef EFL_BETA_API_SUPPORT}
function EFL_NET_SERVER_UNIX_CLASS: PEfl_Class;
begin
  EFL_NET_SERVER_UNIX_CLASS := efl_net_server_unix_class_get;
end;
{$endif}


{$ENDIF read_implementation}
