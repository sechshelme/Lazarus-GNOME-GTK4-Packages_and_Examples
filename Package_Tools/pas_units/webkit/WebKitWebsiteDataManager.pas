unit WebKitWebsiteDataManager;

interface

uses
  fp_glib2, fp_GTK4, WebKit, WebKitFaviconDatabase, WebKitWebsiteData;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

  {WEBKIT_DECLARE_FINAL_TYPE (WebKitWebsiteDataManager, webkit_website_data_manager, WEBKIT, WEBSITE_DATA_MANAGER, GObject) }
type
  PWebKitTLSErrorsPolicy = ^TWebKitTLSErrorsPolicy;
  TWebKitTLSErrorsPolicy = longint;

const
  WEBKIT_TLS_ERRORS_POLICY_IGNORE = 0;
  WEBKIT_TLS_ERRORS_POLICY_FAIL = 1;

type
  TWebKitWebsiteDataManager = record
  end;
  PWebKitWebsiteDataManager = ^TWebKitWebsiteDataManager;

  TWebKitWebsiteDataManagerClass = record
    parent_class: TGObjectClass;
  end;
  PWebKitWebsiteDataManagerClass = ^TWebKitWebsiteDataManagerClass;

function webkit_website_data_manager_get_type: TGType; cdecl; external libwebkit;
function webkit_website_data_manager_is_ephemeral(manager: PWebKitWebsiteDataManager): Tgboolean; cdecl; external libwebkit;
function webkit_website_data_manager_get_base_data_directory(manager: PWebKitWebsiteDataManager): Pgchar; cdecl; external libwebkit;
function webkit_website_data_manager_get_base_cache_directory(manager: PWebKitWebsiteDataManager): Pgchar; cdecl; external libwebkit;
procedure webkit_website_data_manager_set_favicons_enabled(manager: PWebKitWebsiteDataManager; Enabled: Tgboolean); cdecl; external libwebkit;
function webkit_website_data_manager_get_favicons_enabled(manager: PWebKitWebsiteDataManager): Tgboolean; cdecl; external libwebkit;
function webkit_website_data_manager_get_favicon_database(manager: PWebKitWebsiteDataManager): PWebKitFaviconDatabase; cdecl; external libwebkit;
procedure webkit_website_data_manager_fetch(manager: PWebKitWebsiteDataManager; types: TWebKitWebsiteDataTypes; cancellable: PGCancellable; callback: TGAsyncReadyCallback; user_data: Tgpointer); cdecl; external libwebkit;
function webkit_website_data_manager_fetch_finish(manager: PWebKitWebsiteDataManager; Result: PGAsyncResult; error: PPGError): PGList; cdecl; external libwebkit;
procedure webkit_website_data_manager_remove(manager: PWebKitWebsiteDataManager; types: TWebKitWebsiteDataTypes; website_data: PGList; cancellable: PGCancellable; callback: TGAsyncReadyCallback;
  user_data: Tgpointer); cdecl; external libwebkit;
function webkit_website_data_manager_remove_finish(manager: PWebKitWebsiteDataManager; Result: PGAsyncResult; error: PPGError): Tgboolean; cdecl; external libwebkit;
procedure webkit_website_data_manager_clear(manager: PWebKitWebsiteDataManager; types: TWebKitWebsiteDataTypes; timespan: TGTimeSpan; cancellable: PGCancellable; callback: TGAsyncReadyCallback;
  user_data: Tgpointer); cdecl; external libwebkit;
function webkit_website_data_manager_clear_finish(manager: PWebKitWebsiteDataManager; Result: PGAsyncResult; error: PPGError): Tgboolean; cdecl; external libwebkit;

type
  TWebKitITPFirstParty = record
  end;
  PWebKitITPFirstParty = ^TWebKitITPFirstParty;

function webkit_itp_first_party_get_type: TGType; cdecl; external libwebkit;
function webkit_itp_first_party_ref(itp_first_party: PWebKitITPFirstParty): PWebKitITPFirstParty; cdecl; external libwebkit;
procedure webkit_itp_first_party_unref(itp_first_party: PWebKitITPFirstParty); cdecl; external libwebkit;
function webkit_itp_first_party_get_domain(itp_first_party: PWebKitITPFirstParty): pchar; cdecl; external libwebkit;
function webkit_itp_first_party_get_website_data_access_allowed(itp_first_party: PWebKitITPFirstParty): Tgboolean; cdecl; external libwebkit;
function webkit_itp_first_party_get_last_update_time(itp_first_party: PWebKitITPFirstParty): PGDateTime; cdecl; external libwebkit;

type
  TWebKitITPThirdParty = record
  end;
  PWebKitITPThirdParty = ^TWebKitITPThirdParty;

function webkit_itp_third_party_get_type: TGType; cdecl; external libwebkit;
function webkit_itp_third_party_ref(itp_third_party: PWebKitITPThirdParty): PWebKitITPThirdParty; cdecl; external libwebkit;
procedure webkit_itp_third_party_unref(itp_third_party: PWebKitITPThirdParty); cdecl; external libwebkit;
function webkit_itp_third_party_get_domain(itp_third_party: PWebKitITPThirdParty): pchar; cdecl; external libwebkit;
function webkit_itp_third_party_get_first_parties(itp_third_party: PWebKitITPThirdParty): PGList; cdecl; external libwebkit;
procedure webkit_website_data_manager_get_itp_summary(manager: PWebKitWebsiteDataManager; cancellable: PGCancellable; callback: TGAsyncReadyCallback; user_data: Tgpointer); cdecl; external libwebkit;
function webkit_website_data_manager_get_itp_summary_finish(manager: PWebKitWebsiteDataManager; Result: PGAsyncResult; error: PPGError): PGList; cdecl; external libwebkit;

function WEBKIT_TYPE_ITP_FIRST_PARTY: TGType;
function WEBKIT_TYPE_ITP_THIRD_PARTY: TGType;

// === Konventiert am: 3-1-25 17:33:42 ===

function WEBKIT_TYPE_WEBSITE_DATA_MANAGER: TGType;
function WEBKIT_WEBSITE_DATA_MANAGER(obj: Pointer): PWebKitWebsiteDataManager;
function WEBKIT_IS_WEBSITE_DATA_MANAGER(obj: Pointer): Tgboolean;

implementation

function WEBKIT_TYPE_WEBSITE_DATA_MANAGER: TGType;
begin
  Result := webkit_website_data_manager_get_type;
end;

function WEBKIT_WEBSITE_DATA_MANAGER(obj: Pointer): PWebKitWebsiteDataManager;
begin
  Result := PWebKitWebsiteDataManager(g_type_check_instance_cast(obj, WEBKIT_TYPE_WEBSITE_DATA_MANAGER));
end;

function WEBKIT_IS_WEBSITE_DATA_MANAGER(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, WEBKIT_TYPE_WEBSITE_DATA_MANAGER);
end;

// ====

function WEBKIT_TYPE_ITP_FIRST_PARTY: TGType;
begin
  WEBKIT_TYPE_ITP_FIRST_PARTY := webkit_itp_first_party_get_type;
end;

function WEBKIT_TYPE_ITP_THIRD_PARTY: TGType;
begin
  WEBKIT_TYPE_ITP_THIRD_PARTY := webkit_itp_third_party_get_type;
end;


end.
