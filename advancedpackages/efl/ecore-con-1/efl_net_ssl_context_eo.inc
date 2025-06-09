{$IFDEF read_interface}


type
  PPEfl_Net_Ssl_Context = ^PEfl_Net_Ssl_Context;
  PEfl_Net_Ssl_Context = ^TEfl_Net_Ssl_Context;
  TEfl_Net_Ssl_Context = TEo;

{$ifdef EFL_BETA_API_SUPPORT}
function EFL_NET_SSL_CONTEXT_CLASS: PEfl_Class;

function efl_net_ssl_context_class_get: PEfl_Class; cdecl; external libecore_con;
function efl_net_ssl_context_default_dialer_get: PEfl_Net_Ssl_Context; cdecl; external libecore_con;
procedure efl_net_ssl_context_setup(obj: PEo; cipher: TEfl_Net_Ssl_Cipher; is_dialer: TEina_Bool); cdecl; external libecore_con;
procedure efl_net_ssl_context_certificates_set(obj: PEo; paths: PEina_Iterator); cdecl; external libecore_con;
function efl_net_ssl_context_certificates_get(obj: PEo): PEina_Iterator; cdecl; external libecore_con;
procedure efl_net_ssl_context_private_keys_set(obj: PEo; paths: PEina_Iterator); cdecl; external libecore_con;
function efl_net_ssl_context_private_keys_get(obj: PEo): PEina_Iterator; cdecl; external libecore_con;
procedure efl_net_ssl_context_certificate_revocation_lists_set(obj: PEo; paths: PEina_Iterator); cdecl; external libecore_con;
function efl_net_ssl_context_certificate_revocation_lists_get(obj: PEo): PEina_Iterator; cdecl; external libecore_con;
procedure efl_net_ssl_context_certificate_authorities_set(obj: PEo; paths: PEina_Iterator); cdecl; external libecore_con;
function efl_net_ssl_context_certificate_authorities_get(obj: PEo): PEina_Iterator; cdecl; external libecore_con;
procedure efl_net_ssl_context_default_paths_load_set(obj: PEo; default_paths_load: TEina_Bool); cdecl; external libecore_con;
function efl_net_ssl_context_default_paths_load_get(obj: PEo): TEina_Bool; cdecl; external libecore_con;
procedure efl_net_ssl_context_verify_mode_set(obj: PEo; verify_mode: TEfl_Net_Ssl_Verify_Mode); cdecl; external libecore_con;
function efl_net_ssl_context_verify_mode_get(obj: PEo): TEfl_Net_Ssl_Verify_Mode; cdecl; external libecore_con;
procedure efl_net_ssl_context_hostname_verify_set(obj: PEo; hostname_verify: TEina_Bool); cdecl; external libecore_con;
function efl_net_ssl_context_hostname_verify_get(obj: PEo): TEina_Bool; cdecl; external libecore_con;
procedure efl_net_ssl_context_hostname_set(obj: PEo; hostname: pchar); cdecl; external libecore_con;
function efl_net_ssl_context_hostname_get(obj: PEo): pchar; cdecl; external libecore_con;
{$endif}

// === Konventiert am: 9-6-25 17:21:05 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


{$ifdef EFL_BETA_API_SUPPORT}
function EFL_NET_SSL_CONTEXT_CLASS: PEfl_Class;
begin
  EFL_NET_SSL_CONTEXT_CLASS := efl_net_ssl_context_class_get;
end;
{$endif}


{$ENDIF read_implementation}
