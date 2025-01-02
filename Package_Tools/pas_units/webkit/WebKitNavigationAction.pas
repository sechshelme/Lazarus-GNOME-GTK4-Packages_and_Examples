unit WebKitNavigationAction;

interface

uses
  fp_glib2, fp_GTK4, WebKitURIRequest;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PWebKitNavigationType = ^TWebKitNavigationType;
  TWebKitNavigationType = longint;

const
  WEBKIT_NAVIGATION_TYPE_LINK_CLICKED = 0;
  WEBKIT_NAVIGATION_TYPE_FORM_SUBMITTED = 1;
  WEBKIT_NAVIGATION_TYPE_BACK_FORWARD = 2;
  WEBKIT_NAVIGATION_TYPE_RELOAD = 3;
  WEBKIT_NAVIGATION_TYPE_FORM_RESUBMITTED = 4;
  WEBKIT_NAVIGATION_TYPE_OTHER = 5;

type
  TWebKitNavigationAction = record
  end;
  PWebKitNavigationAction = ^TWebKitNavigationAction;

function webkit_navigation_action_get_type: TGType; cdecl; external libwebkit;
function webkit_navigation_action_copy(navigation: PWebKitNavigationAction): PWebKitNavigationAction; cdecl; external libwebkit;
procedure webkit_navigation_action_free(navigation: PWebKitNavigationAction); cdecl; external libwebkit;
function webkit_navigation_action_get_navigation_type(navigation: PWebKitNavigationAction): TWebKitNavigationType; cdecl; external libwebkit;
function webkit_navigation_action_get_mouse_button(navigation: PWebKitNavigationAction): Tguint; cdecl; external libwebkit;
function webkit_navigation_action_get_modifiers(navigation: PWebKitNavigationAction): Tguint; cdecl; external libwebkit;
function webkit_navigation_action_get_request(navigation: PWebKitNavigationAction): PWebKitURIRequest; cdecl; external libwebkit;
function webkit_navigation_action_is_user_gesture(navigation: PWebKitNavigationAction): Tgboolean; cdecl; external libwebkit;
function webkit_navigation_action_is_redirect(navigation: PWebKitNavigationAction): Tgboolean; cdecl; external libwebkit;
function webkit_navigation_action_get_frame_name(navigation: PWebKitNavigationAction): pchar; cdecl; external libwebkit;
{$endif}

// === Konventiert am: 2-1-25 19:23:30 ===


implementation

function WEBKIT_TYPE_NAVIGATION_ACTION: TGType;
begin
  WEBKIT_TYPE_NAVIGATION_ACTION := webkit_navigation_action_get_type;
end;



end.
