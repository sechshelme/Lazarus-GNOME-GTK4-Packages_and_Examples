{$IFDEF read_interface}


{$ifdef EFL_BETA_API_SUPPORT}
function efl_net_error_couldnt_resolve_host_get: TEina_Error; cdecl; external libecore_con;
function EFL_NET_ERROR_COULDNT_RESOLVE_HOST: TEina_Error;
{$endif}

// === Konventiert am: 9-6-25 19:30:57 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


{$ifdef EFL_BETA_API_SUPPORT}
function EFL_NET_ERROR_COULDNT_RESOLVE_HOST: TEina_Error;
begin
  EFL_NET_ERROR_COULDNT_RESOLVE_HOST := efl_net_error_couldnt_resolve_host_get;
end;
{$endif}


{$ENDIF read_implementation}
