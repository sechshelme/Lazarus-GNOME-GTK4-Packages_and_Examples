unit WebKitNetworkSession;

interface

uses
  fp_glib2, fp_GTK4, web_common, WebKitWebsiteDataManager, WebKitCookieManager, WebKitNetworkProxySettings, WebKitMemoryPressureSettings, WebKitDownload;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

  {WEBKIT_DECLARE_FINAL_TYPE (WebKitNetworkSession, webkit_network_session, WEBKIT, NETWORK_SESSION, GObject) }
type
  TWebKitNetworkSession = record
  end;
  PWebKitNetworkSession = ^TWebKitNetworkSession;

  TWebKitNetworkSessionClass = record
    parent_class: TGObjectClass;
  end;
  PWebKitNetworkSessionClass = ^TWebKitNetworkSessionClass;

function webkit_network_session_get_type: TGType; cdecl; external libwebkit;
function webkit_network_session_get_default: PWebKitNetworkSession; cdecl; external libwebkit;
function webkit_network_session_new(data_directory: pchar; cache_directory: pchar): PWebKitNetworkSession; cdecl; external libwebkit;
function webkit_network_session_new_ephemeral: PWebKitNetworkSession; cdecl; external libwebkit;
function webkit_network_session_is_ephemeral(session: PWebKitNetworkSession): Tgboolean; cdecl; external libwebkit;
function webkit_network_session_get_website_data_manager(session: PWebKitNetworkSession): PWebKitWebsiteDataManager; cdecl; external libwebkit;
function webkit_network_session_get_cookie_manager(session: PWebKitNetworkSession): PWebKitCookieManager; cdecl; external libwebkit;
procedure webkit_network_session_set_itp_enabled(session: PWebKitNetworkSession; Enabled: Tgboolean); cdecl; external libwebkit;
function webkit_network_session_get_itp_enabled(session: PWebKitNetworkSession): Tgboolean; cdecl; external libwebkit;
procedure webkit_network_session_set_persistent_credential_storage_enabled(session: PWebKitNetworkSession; Enabled: Tgboolean); cdecl; external libwebkit;
function webkit_network_session_get_persistent_credential_storage_enabled(session: PWebKitNetworkSession): Tgboolean; cdecl; external libwebkit;
procedure webkit_network_session_set_tls_errors_policy(session: PWebKitNetworkSession; policy: TWebKitTLSErrorsPolicy); cdecl; external libwebkit;
function webkit_network_session_get_tls_errors_policy(session: PWebKitNetworkSession): TWebKitTLSErrorsPolicy; cdecl; external libwebkit;
procedure webkit_network_session_allow_tls_certificate_for_host(session: PWebKitNetworkSession; certificate: PGTlsCertificate; host: pchar); cdecl; external libwebkit;
procedure webkit_network_session_set_proxy_settings(session: PWebKitNetworkSession; proxy_mode: TWebKitNetworkProxyMode; proxy_settings: PWebKitNetworkProxySettings); cdecl; external libwebkit;
procedure webkit_network_session_set_memory_pressure_settings(settings: PWebKitMemoryPressureSettings); cdecl; external libwebkit;
procedure webkit_network_session_get_itp_summary(session: PWebKitNetworkSession; cancellable: PGCancellable; callback: TGAsyncReadyCallback; user_data: Tgpointer); cdecl; external libwebkit;
function webkit_network_session_get_itp_summary_finish(session: PWebKitNetworkSession; Result: PGAsyncResult; error: PPGError): PGList; cdecl; external libwebkit;
procedure webkit_network_session_prefetch_dns(session: PWebKitNetworkSession; hostname: pchar); cdecl; external libwebkit;
function webkit_network_session_download_uri(session: PWebKitNetworkSession; uri: pchar): PWebKitDownload; cdecl; external libwebkit;

// === Konventiert am: 3-1-25 17:31:44 ===

function WEBKIT_TYPE_NETWORK_SESSION: TGType;
function WEBKIT_NETWORK_SESSION(obj: Pointer): PWebKitNetworkSession;
function WEBKIT_IS_NETWORK_SESSION(obj: Pointer): Tgboolean;

implementation

function WEBKIT_TYPE_NETWORK_SESSION: TGType;
begin
  Result := webkit_network_session_get_type;
end;

function WEBKIT_NETWORK_SESSION(obj: Pointer): PWebKitNetworkSession;
begin
  Result := PWebKitNetworkSession(g_type_check_instance_cast(obj, WEBKIT_TYPE_NETWORK_SESSION));
end;

function WEBKIT_IS_NETWORK_SESSION(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, WEBKIT_TYPE_NETWORK_SESSION);
end;


end.
