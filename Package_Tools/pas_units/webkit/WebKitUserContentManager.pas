unit WebKitUserContentManager;

interface

uses
  fp_glib2, fp_GTK4, WebKit, WebKitUserContent;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

  {WEBKIT_DECLARE_FINAL_TYPE (WebKitUserContentManager, webkit_user_content_manager, WEBKIT, USER_CONTENT_MANAGER, GObject) }
type
  TWebKitUserContentManager = record
  end;
  PWebKitUserContentManager = ^TWebKitUserContentManager;

  TWebKitUserContentManagerClass = record
    parent_class: TGObjectClass;
  end;
  PWebKitUserContentManagerClass = ^TWebKitUserContentManagerClass;

function webkit_user_content_manager_get_type: TGType; cdecl; external libwebkit;
function webkit_user_content_manager_new: PWebKitUserContentManager; cdecl; external libwebkit;
procedure webkit_user_content_manager_add_style_sheet(manager: PWebKitUserContentManager; stylesheet: PWebKitUserStyleSheet); cdecl; external libwebkit;
procedure webkit_user_content_manager_remove_style_sheet(manager: PWebKitUserContentManager; stylesheet: PWebKitUserStyleSheet); cdecl; external libwebkit;
procedure webkit_user_content_manager_remove_all_style_sheets(manager: PWebKitUserContentManager); cdecl; external libwebkit;
function webkit_user_content_manager_register_script_message_handler(manager: PWebKitUserContentManager; Name: pchar; world_name: pchar): Tgboolean; cdecl; external libwebkit;
procedure webkit_user_content_manager_unregister_script_message_handler(manager: PWebKitUserContentManager; Name: Pgchar; world_name: Pgchar); cdecl; external libwebkit;
function webkit_user_content_manager_register_script_message_handler_with_reply(manager: PWebKitUserContentManager; Name: pchar; world_name: pchar): Tgboolean; cdecl; external libwebkit;
procedure webkit_user_content_manager_add_script(manager: PWebKitUserContentManager; script: PWebKitUserScript); cdecl; external libwebkit;
procedure webkit_user_content_manager_remove_script(manager: PWebKitUserContentManager; script: PWebKitUserScript); cdecl; external libwebkit;
procedure webkit_user_content_manager_remove_all_scripts(manager: PWebKitUserContentManager); cdecl; external libwebkit;
procedure webkit_user_content_manager_add_filter(manager: PWebKitUserContentManager; filter: PWebKitUserContentFilter); cdecl; external libwebkit;
procedure webkit_user_content_manager_remove_filter(manager: PWebKitUserContentManager; filter: PWebKitUserContentFilter); cdecl; external libwebkit;
procedure webkit_user_content_manager_remove_filter_by_id(manager: PWebKitUserContentManager; filter_id: pchar); cdecl; external libwebkit;
procedure webkit_user_content_manager_remove_all_filters(manager: PWebKitUserContentManager); cdecl; external libwebkit;

type
  TWebKitScriptMessageReply = record
  end;
  PWebKitScriptMessageReply = ^TWebKitScriptMessageReply;

function webkit_script_message_reply_get_type: TGType; cdecl; external libwebkit;
function webkit_script_message_reply_ref(script_message_reply: PWebKitScriptMessageReply): PWebKitScriptMessageReply; cdecl; external libwebkit;
procedure webkit_script_message_reply_unref(script_message_reply: PWebKitScriptMessageReply); cdecl; external libwebkit;
procedure webkit_script_message_reply_return_value(script_message_reply: PWebKitScriptMessageReply; reply_value: PJSCValue); cdecl; external libwebkit;
procedure webkit_script_message_reply_return_error_message(script_message_reply: PWebKitScriptMessageReply; error_message: pchar); cdecl; external libwebkit;

function WEBKIT_TYPE_SCRIPT_MESSAGE_REPLY: TGType;

// === Konventiert am: 3-1-25 19:59:23 ===

function WEBKIT_TYPE_USER_CONTENT_MANAGER: TGType;
function WEBKIT_USER_CONTENT_MANAGER(obj: Pointer): PWebKitUserContentManager;
function WEBKIT_IS_USER_CONTENT_MANAGER(obj: Pointer): Tgboolean;

implementation

function WEBKIT_TYPE_USER_CONTENT_MANAGER: TGType;
begin
  Result := webkit_user_content_manager_get_type;
end;

function WEBKIT_USER_CONTENT_MANAGER(obj: Pointer): PWebKitUserContentManager;
begin
  Result := PWebKitUserContentManager(g_type_check_instance_cast(obj, WEBKIT_TYPE_USER_CONTENT_MANAGER));
end;

function WEBKIT_IS_USER_CONTENT_MANAGER(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, WEBKIT_TYPE_USER_CONTENT_MANAGER);
end;

// ====

function WEBKIT_TYPE_SCRIPT_MESSAGE_REPLY: TGType;
begin
  WEBKIT_TYPE_SCRIPT_MESSAGE_REPLY := webkit_script_message_reply_get_type;
end;


end.
