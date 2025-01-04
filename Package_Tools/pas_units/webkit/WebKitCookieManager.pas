unit WebKitCookieManager;

interface

uses
  fp_glib2, fp_GTK4, WebKit;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


  {WEBKIT_DECLARE_FINAL_TYPE (WebKitCookieManager, webkit_cookie_manager, WEBKIT, COOKIE_MANAGER, GObject) }
type
  PWebKitCookiePersistentStorage = ^TWebKitCookiePersistentStorage;
  TWebKitCookiePersistentStorage = longint;

const
  WEBKIT_COOKIE_PERSISTENT_STORAGE_TEXT = 0;
  WEBKIT_COOKIE_PERSISTENT_STORAGE_SQLITE = 1;

type
  PWebKitCookieAcceptPolicy = ^TWebKitCookieAcceptPolicy;
  TWebKitCookieAcceptPolicy = longint;

const
  WEBKIT_COOKIE_POLICY_ACCEPT_ALWAYS = 0;
  WEBKIT_COOKIE_POLICY_ACCEPT_NEVER = 1;
  WEBKIT_COOKIE_POLICY_ACCEPT_NO_THIRD_PARTY = 2;

type
  TWebKitCookieManager = record
  end;
  PWebKitCookieManager = ^TWebKitCookieManager;

  TWebKitCookieManagerClass = record
    parent_class: TGObjectClass;
  end;
  PWebKitCookieManagerClass = ^TWebKitCookieManagerClass;

function webkit_cookie_manager_get_type: TGType; cdecl; external libwebkit;
procedure webkit_cookie_manager_set_persistent_storage(cookie_manager: PWebKitCookieManager; filename: Pgchar; storage: TWebKitCookiePersistentStorage); cdecl; external libwebkit;
procedure webkit_cookie_manager_set_accept_policy(cookie_manager: PWebKitCookieManager; policy: TWebKitCookieAcceptPolicy); cdecl; external libwebkit;
procedure webkit_cookie_manager_get_accept_policy(cookie_manager: PWebKitCookieManager; cancellable: PGCancellable; callback: TGAsyncReadyCallback; user_data: Tgpointer); cdecl; external libwebkit;
function webkit_cookie_manager_get_accept_policy_finish(cookie_manager: PWebKitCookieManager; Result: PGAsyncResult; error: PPGError): TWebKitCookieAcceptPolicy; cdecl; external libwebkit;
procedure webkit_cookie_manager_add_cookie(cookie_manager: PWebKitCookieManager; cookie: PSoupCookie; cancellable: PGCancellable; callback: TGAsyncReadyCallback; user_data: Tgpointer); cdecl; external libwebkit;
function webkit_cookie_manager_add_cookie_finish(cookie_manager: PWebKitCookieManager; Result: PGAsyncResult; error: PPGError): Tgboolean; cdecl; external libwebkit;
procedure webkit_cookie_manager_get_cookies(cookie_manager: PWebKitCookieManager; uri: Pgchar; cancellable: PGCancellable; callback: TGAsyncReadyCallback; user_data: Tgpointer); cdecl; external libwebkit;
function webkit_cookie_manager_get_cookies_finish(cookie_manager: PWebKitCookieManager; Result: PGAsyncResult; error: PPGError): PGList; cdecl; external libwebkit;
procedure webkit_cookie_manager_delete_cookie(cookie_manager: PWebKitCookieManager; cookie: PSoupCookie; cancellable: PGCancellable; callback: TGAsyncReadyCallback; user_data: Tgpointer); cdecl; external libwebkit;
function webkit_cookie_manager_delete_cookie_finish(cookie_manager: PWebKitCookieManager; Result: PGAsyncResult; error: PPGError): Tgboolean; cdecl; external libwebkit;
procedure webkit_cookie_manager_replace_cookies(cookie_manager: PWebKitCookieManager; cookies: PGList; cancellable: PGCancellable; callback: TGAsyncReadyCallback; user_data: Tgpointer); cdecl; external libwebkit;
function webkit_cookie_manager_replace_cookies_finish(cookie_manager: PWebKitCookieManager; Result: PGAsyncResult; error: PPGError): Tgboolean; cdecl; external libwebkit;
procedure webkit_cookie_manager_get_all_cookies(cookie_manager: PWebKitCookieManager; cancellable: PGCancellable; callback: TGAsyncReadyCallback; user_data: Tgpointer); cdecl; external libwebkit;
function webkit_cookie_manager_get_all_cookies_finish(cookie_manager: PWebKitCookieManager; Result: PGAsyncResult; error: PPGError): PGList; cdecl; external libwebkit;

// === Konventiert am: 3-1-25 17:42:30 ===

function WEBKIT_TYPE_COOKIE_MANAGER: TGType;
function WEBKIT_COOKIE_MANAGER(obj: Pointer): PWebKitCookieManager;
function WEBKIT_IS_COOKIE_MANAGER(obj: Pointer): Tgboolean;

implementation

function WEBKIT_TYPE_COOKIE_MANAGER: TGType;
begin
  Result := webkit_cookie_manager_get_type;
end;

function WEBKIT_COOKIE_MANAGER(obj: Pointer): PWebKitCookieManager;
begin
  Result := PWebKitCookieManager(g_type_check_instance_cast(obj, WEBKIT_TYPE_COOKIE_MANAGER));
end;

function WEBKIT_IS_COOKIE_MANAGER(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, WEBKIT_TYPE_COOKIE_MANAGER);
end;




end.
