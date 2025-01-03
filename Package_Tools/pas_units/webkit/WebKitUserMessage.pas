unit WebKitUserMessage;

interface

uses
  fp_glib2, fp_GTK4, web_common;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


  {WEBKIT_DECLARE_FINAL_TYPE (WebKitUserMessage, webkit_user_message, WEBKIT, USER_MESSAGE, GInitiallyUnowned) }
  { was #define dname def_expr }
type
  PWebKitUserMessageError = ^TWebKitUserMessageError;
  TWebKitUserMessageError = longint;

const
  WEBKIT_USER_MESSAGE_UNHANDLED_MESSAGE = 0;

type
  TWebKitUserMessage = record
  end;
  PWebKitUserMessage = ^TWebKitUserMessage;

  TWebKitUserMessageClass = record
    parent_class: TGInitiallyUnownedClass;
  end;
  PWebKitUserMessageClass = ^TWebKitUserMessageClass;

function webkit_user_message_get_type: TGType; cdecl; external libwebkit;
function webkit_user_message_error_quark: TGQuark; cdecl; external libwebkit;
function webkit_user_message_new(Name: pchar; parameters: PGVariant): PWebKitUserMessage; cdecl; external libwebkit;
function webkit_user_message_new_with_fd_list(Name: pchar; parameters: PGVariant; fd_list: PGUnixFDList): PWebKitUserMessage; cdecl; external libwebkit;
function webkit_user_message_get_name(message: PWebKitUserMessage): pchar; cdecl; external libwebkit;
function webkit_user_message_get_parameters(message: PWebKitUserMessage): PGVariant; cdecl; external libwebkit;
function webkit_user_message_get_fd_list(message: PWebKitUserMessage): PGUnixFDList; cdecl; external libwebkit;
procedure webkit_user_message_send_reply(message: PWebKitUserMessage; reply: PWebKitUserMessage); cdecl; external libwebkit;

function WEBKIT_USER_MESSAGE_ERROR: TGQuark;

// === Konventiert am: 3-1-25 16:45:21 ===

function WEBKIT_TYPE_USER_MESSAGE: TGType;
function WEBKIT_USER_MESSAGE(obj: Pointer): PWebKitUserMessage;
function WEBKIT_IS_USER_MESSAGE(obj: Pointer): Tgboolean;

implementation

function WEBKIT_TYPE_USER_MESSAGE: TGType;
begin
  Result := webkit_user_message_get_type;
end;

function WEBKIT_USER_MESSAGE(obj: Pointer): PWebKitUserMessage;
begin
  Result := PWebKitUserMessage(g_type_check_instance_cast(obj, WEBKIT_TYPE_USER_MESSAGE));
end;

function WEBKIT_IS_USER_MESSAGE(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, WEBKIT_TYPE_USER_MESSAGE);
end;

// =====

function WEBKIT_USER_MESSAGE_ERROR: TGQuark;
begin
  WEBKIT_USER_MESSAGE_ERROR := webkit_user_message_error_quark;
end;


end.
