unit efl_net_dialer_http_eo;

interface

uses
  efl, fp_eo, fp_eina, fp_efl, fp_ecore, efl_net_http_types_eot;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PEfl_Net_Dialer_Http = ^TEfl_Net_Dialer_Http;
  TEfl_Net_Dialer_Http = TEo;

  {$ifdef EFL_BETA_API_SUPPORT}
type
  PEfl_Net_Dialer_Http_Primary_Mode = ^TEfl_Net_Dialer_Http_Primary_Mode;
  TEfl_Net_Dialer_Http_Primary_Mode = longint;

const
  EFL_NET_DIALER_HTTP_PRIMARY_MODE_AUTO = 0;
  EFL_NET_DIALER_HTTP_PRIMARY_MODE_DOWNLOAD = 1;
  EFL_NET_DIALER_HTTP_PRIMARY_MODE_UPLOAD = 2;
  {$endif}

{$ifdef EFL_BETA_API_SUPPORT}
function EFL_NET_DIALER_HTTP_CLASS: PEfl_Class;

function efl_net_dialer_http_class_get: PEfl_Class; cdecl; external libecore_con;
procedure efl_net_dialer_http_method_set(obj: PEo; method: pchar); cdecl; external libecore_con;
function efl_net_dialer_http_method_get(obj: PEo): pchar; cdecl; external libecore_con;
procedure efl_net_dialer_http_primary_mode_set(obj: PEo; primary_mode: TEfl_Net_Dialer_Http_Primary_Mode); cdecl; external libecore_con;
function efl_net_dialer_http_primary_mode_get(obj: PEo): TEfl_Net_Dialer_Http_Primary_Mode; cdecl; external libecore_con;
procedure efl_net_dialer_http_user_agent_set(obj: PEo; ser_agent: pchar); cdecl; external libecore_con;
function efl_net_dialer_http_user_agent_get(obj: PEo): pchar; cdecl; external libecore_con;
procedure efl_net_dialer_http_version_set(obj: PEo; http_version: TEfl_Net_Http_Version); cdecl; external libecore_con;
function efl_net_dialer_http_version_get(obj: PEo): TEfl_Net_Http_Version; cdecl; external libecore_con;
procedure efl_net_dialer_http_authentication_set(obj: PEo; username: pchar; password: pchar; method: TEfl_Net_Http_Authentication_Method; restricted: TEina_Bool); cdecl; external libecore_con;
procedure efl_net_dialer_http_authentication_get(obj: PEo; username: PPchar; password: PPchar; method: PEfl_Net_Http_Authentication_Method; restricted: PEina_Bool); cdecl; external libecore_con;
procedure efl_net_dialer_http_allow_redirects_set(obj: PEo; allow_redirects: TEina_Bool); cdecl; external libecore_con;
function efl_net_dialer_http_allow_redirects_get(obj: PEo): TEina_Bool; cdecl; external libecore_con;
procedure efl_net_dialer_http_request_header_add(obj: PEo; key: pchar; value: pchar); cdecl; external libecore_con;
procedure efl_net_dialer_http_request_headers_clear(obj: PEo); cdecl; external libecore_con;
function efl_net_dialer_http_request_headers_get(obj: PEo): PEina_Iterator; cdecl; external libecore_con;
procedure efl_net_dialer_http_request_content_length_set(obj: PEo; length: int64); cdecl; external libecore_con;
function efl_net_dialer_http_request_content_length_get(obj: PEo): int64; cdecl; external libecore_con;
procedure efl_net_dialer_http_response_content_length_set(obj: PEo; length: int64); cdecl; external libecore_con;
function efl_net_dialer_http_response_content_length_get(obj: PEo): int64; cdecl; external libecore_con;
procedure efl_net_dialer_http_response_content_type_set(obj: PEo; content_type: pchar); cdecl; external libecore_con;
function efl_net_dialer_http_response_content_type_get(obj: PEo): pchar; cdecl; external libecore_con;
function efl_net_dialer_http_response_status_get(obj: PEo): TEfl_Net_Http_Status; cdecl; external libecore_con;
function efl_net_dialer_http_response_headers_get(obj: PEo): PEina_Iterator; cdecl; external libecore_con;
function efl_net_dialer_http_response_headers_all_get(obj: PEo): PEina_Iterator; cdecl; external libecore_con;
procedure efl_net_dialer_http_response_headers_clear(obj: PEo); cdecl; external libecore_con;
procedure efl_net_dialer_http_progress_download_get(obj: PEo; downloaded: Puint64; total: Puint64); cdecl; external libecore_con;
procedure efl_net_dialer_http_progress_upload_get(obj: PEo; uploaded: Puint64; total: Puint64); cdecl; external libecore_con;
procedure efl_net_dialer_http_cookie_jar_set(obj: PEo; path: pchar); cdecl; external libecore_con;
function efl_net_dialer_http_cookie_jar_get(obj: PEo): pchar; cdecl; external libecore_con;
procedure efl_net_dialer_http_ssl_verify_set(obj: PEo; peer: TEina_Bool; hostname: TEina_Bool); cdecl; external libecore_con;
procedure efl_net_dialer_http_ssl_verify_get(obj: PEo; peer: PEina_Bool; hostname: PEina_Bool); cdecl; external libecore_con;
procedure efl_net_dialer_http_ssl_certificate_authority_set(obj: PEo; path: pchar); cdecl; external libecore_con;
function efl_net_dialer_http_ssl_certificate_authority_get(obj: PEo): pchar; cdecl; external libecore_con;
procedure efl_net_dialer_http_ssl_certificate_revocation_list_set(obj: PEo; file_: pchar); cdecl; external libecore_con;
function efl_net_dialer_http_ssl_certificate_revocation_list_get(obj: PEo): pchar; cdecl; external libecore_con;
function efl_net_dialer_http_date_parse(str: pchar): int64; cdecl; external libecore_con;
function efl_net_dialer_http_date_serialize(epochtime: int64): pchar; cdecl; external libecore_con;

var
  _EFL_NET_DIALER_HTTP_EVENT_HEADERS_DONE: TEfl_Event_Description; cvar;external libecore_con;

function EFL_NET_DIALER_HTTP_EVENT_HEADERS_DONE: PEfl_Event_Description;
{$endif}

// === Konventiert am: 8-6-25 19:32:34 ===


implementation


{$ifdef EFL_BETA_API_SUPPORT}
function EFL_NET_DIALER_HTTP_CLASS: PEfl_Class;
begin
  EFL_NET_DIALER_HTTP_CLASS := efl_net_dialer_http_class_get;
end;

function EFL_NET_DIALER_HTTP_EVENT_HEADERS_DONE: PEfl_Event_Description;
begin
  EFL_NET_DIALER_HTTP_EVENT_HEADERS_DONE := @(_EFL_NET_DIALER_HTTP_EVENT_HEADERS_DONE);
end;
{$endif}


end.
