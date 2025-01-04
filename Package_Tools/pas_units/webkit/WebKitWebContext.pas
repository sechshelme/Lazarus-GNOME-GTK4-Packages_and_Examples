unit WebKitWebContext;

interface

uses
  fp_glib2, fp_GTK4, WebKit, WebKitURISchemeRequest, WebKitNetworkSession, WebKitGeolocationManager, WebKitSecurityManager, WebKitUserMessage;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


  {WEBKIT_DECLARE_FINAL_TYPE (WebKitWebContext, webkit_web_context, WEBKIT, WEB_CONTEXT, GObject) }
type
  PWebKitCacheModel = ^TWebKitCacheModel;
  TWebKitCacheModel = longint;

const
  WEBKIT_CACHE_MODEL_DOCUMENT_VIEWER = 0;
  WEBKIT_CACHE_MODEL_WEB_BROWSER = 1;
  WEBKIT_CACHE_MODEL_DOCUMENT_BROWSER = 2;

type
  TWebKitURISchemeRequestCallback = procedure(request: PWebKitURISchemeRequest; user_data: Tgpointer); cdecl;

type
  TWebKitWebContext = record
  end;
  PWebKitWebContext = ^TWebKitWebContext;

  TWebKitWebContextClass = record
    parent_class: TGObjectClass;
  end;
  PWebKitWebContextClass = ^TWebKitWebContextClass;

function webkit_web_context_get_type: TGType; cdecl; external libwebkit;
function webkit_web_context_get_default: PWebKitWebContext; cdecl; external libwebkit;
function webkit_web_context_new: PWebKitWebContext; cdecl; external libwebkit;
function webkit_web_context_is_automation_allowed(context: PWebKitWebContext): Tgboolean; cdecl; external libwebkit;
procedure webkit_web_context_set_automation_allowed(context: PWebKitWebContext; allowed: Tgboolean); cdecl; external libwebkit;
function webkit_web_context_get_network_session_for_automation(context: PWebKitWebContext): PWebKitNetworkSession; cdecl; external libwebkit;
procedure webkit_web_context_set_cache_model(context: PWebKitWebContext; cache_model: TWebKitCacheModel); cdecl; external libwebkit;
function webkit_web_context_get_cache_model(context: PWebKitWebContext): TWebKitCacheModel; cdecl; external libwebkit;
function webkit_web_context_get_geolocation_manager(context: PWebKitWebContext): PWebKitGeolocationManager; cdecl; external libwebkit;
function webkit_web_context_get_security_manager(context: PWebKitWebContext): PWebKitSecurityManager; cdecl; external libwebkit;
procedure webkit_web_context_register_uri_scheme(context: PWebKitWebContext; scheme: Pgchar; callback: TWebKitURISchemeRequestCallback; user_data: Tgpointer; user_data_destroy_func: TGDestroyNotify); cdecl; external libwebkit;
procedure webkit_web_context_add_path_to_sandbox(context: PWebKitWebContext; path: pchar; read_only: Tgboolean); cdecl; external libwebkit;
function webkit_web_context_get_spell_checking_enabled(context: PWebKitWebContext): Tgboolean; cdecl; external libwebkit;
procedure webkit_web_context_set_spell_checking_enabled(context: PWebKitWebContext; Enabled: Tgboolean); cdecl; external libwebkit;
function webkit_web_context_get_spell_checking_languages(context: PWebKitWebContext): PPgchar; cdecl; external libwebkit;
procedure webkit_web_context_set_spell_checking_languages(context: PWebKitWebContext; languages: PPgchar); cdecl; external libwebkit;
procedure webkit_web_context_set_preferred_languages(context: PWebKitWebContext; languages: PPgchar); cdecl; external libwebkit;
procedure webkit_web_context_set_web_process_extensions_directory(context: PWebKitWebContext; directory: Pgchar); cdecl; external libwebkit;
procedure webkit_web_context_set_web_process_extensions_initialization_user_data(context: PWebKitWebContext; user_data: PGVariant); cdecl; external libwebkit;
procedure webkit_web_context_initialize_notification_permissions(context: PWebKitWebContext; allowed_origins: PGList; disallowed_origins: PGList); cdecl; external libwebkit;
procedure webkit_web_context_send_message_to_all_extensions(context: PWebKitWebContext; message: PWebKitUserMessage); cdecl; external libwebkit;
function webkit_web_context_get_time_zone_override(context: PWebKitWebContext): Pgchar; cdecl; external libwebkit;

// === Konventiert am: 3-1-25 19:27:33 ===

function WEBKIT_TYPE_WEB_CONTEXT: TGType;
function WEBKIT_WEB_CONTEXT(obj: Pointer): PWebKitWebContext;
function WEBKIT_IS_WEB_CONTEXT(obj: Pointer): Tgboolean;

implementation

function WEBKIT_TYPE_WEB_CONTEXT: TGType;
begin
  Result := webkit_web_context_get_type;
end;

function WEBKIT_WEB_CONTEXT(obj: Pointer): PWebKitWebContext;
begin
  Result := PWebKitWebContext(g_type_check_instance_cast(obj, WEBKIT_TYPE_WEB_CONTEXT));
end;

function WEBKIT_IS_WEB_CONTEXT(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, WEBKIT_TYPE_WEB_CONTEXT);
end;


end.
