unit WebKitSecurityManager;

interface

uses
  fp_glib2, fp_GTK4, WebKit;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


  {WEBKIT_DECLARE_FINAL_TYPE (WebKitSecurityManager, webkit_security_manager, WEBKIT, SECURITY_MANAGER, GObject) }
type
  TWebKitSecurityManager = record
  end;
  PWebKitSecurityManager = ^TWebKitSecurityManager;

  TWebKitSecurityManagerClass = record
    parent_class: TGObjectClass;
  end;
  PWebKitSecurityManagerClass = ^TWebKitSecurityManagerClass;

function webkit_security_manager_get_type: TGType; cdecl; external libwebkit;
procedure webkit_security_manager_register_uri_scheme_as_local(security_manager: PWebKitSecurityManager; scheme: Pgchar); cdecl; external libwebkit;
function webkit_security_manager_uri_scheme_is_local(security_manager: PWebKitSecurityManager; scheme: Pgchar): Tgboolean; cdecl; external libwebkit;
procedure webkit_security_manager_register_uri_scheme_as_no_access(security_manager: PWebKitSecurityManager; scheme: Pgchar); cdecl; external libwebkit;
function webkit_security_manager_uri_scheme_is_no_access(security_manager: PWebKitSecurityManager; scheme: Pgchar): Tgboolean; cdecl; external libwebkit;
procedure webkit_security_manager_register_uri_scheme_as_display_isolated(security_manager: PWebKitSecurityManager; scheme: Pgchar); cdecl; external libwebkit;
function webkit_security_manager_uri_scheme_is_display_isolated(security_manager: PWebKitSecurityManager; scheme: Pgchar): Tgboolean; cdecl; external libwebkit;
procedure webkit_security_manager_register_uri_scheme_as_secure(security_manager: PWebKitSecurityManager; scheme: Pgchar); cdecl; external libwebkit;
function webkit_security_manager_uri_scheme_is_secure(security_manager: PWebKitSecurityManager; scheme: Pgchar): Tgboolean; cdecl; external libwebkit;
procedure webkit_security_manager_register_uri_scheme_as_cors_enabled(security_manager: PWebKitSecurityManager; scheme: Pgchar); cdecl; external libwebkit;
function webkit_security_manager_uri_scheme_is_cors_enabled(security_manager: PWebKitSecurityManager; scheme: Pgchar): Tgboolean; cdecl; external libwebkit;
procedure webkit_security_manager_register_uri_scheme_as_empty_document(security_manager: PWebKitSecurityManager; scheme: Pgchar); cdecl; external libwebkit;
function webkit_security_manager_uri_scheme_is_empty_document(security_manager: PWebKitSecurityManager; scheme: Pgchar): Tgboolean; cdecl; external libwebkit;

// === Konventiert am: 3-1-25 19:36:45 ===

function WEBKIT_TYPE_SECURITY_MANAGER: TGType;
function WEBKIT_SECURITY_MANAGER(obj: Pointer): PWebKitSecurityManager;
function WEBKIT_IS_SECURITY_MANAGER(obj: Pointer): Tgboolean;

implementation

function WEBKIT_TYPE_SECURITY_MANAGER: TGType;
begin
  Result := webkit_security_manager_get_type;
end;

function WEBKIT_SECURITY_MANAGER(obj: Pointer): PWebKitSecurityManager;
begin
  Result := PWebKitSecurityManager(g_type_check_instance_cast(obj, WEBKIT_TYPE_SECURITY_MANAGER));
end;

function WEBKIT_IS_SECURITY_MANAGER(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, WEBKIT_TYPE_SECURITY_MANAGER);
end;


end.
