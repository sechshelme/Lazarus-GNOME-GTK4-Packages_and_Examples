{$IFDEF read_interface}

  {WEBKIT_DECLARE_FINAL_TYPE (WebKitAutomationSession, webkit_automation_session, WEBKIT, AUTOMATION_SESSION, GObject) }
type
  PWebKitAutomationBrowsingContextPresentation = ^TWebKitAutomationBrowsingContextPresentation;
  TWebKitAutomationBrowsingContextPresentation = longint;

const
  WEBKIT_AUTOMATION_BROWSING_CONTEXT_PRESENTATION_WINDOW = 0;
  WEBKIT_AUTOMATION_BROWSING_CONTEXT_PRESENTATION_TAB = 1;

type
  TWebKitAutomationSession = record
  end;
  PWebKitAutomationSession = ^TWebKitAutomationSession;

  TWebKitAutomationSessionClass = record
    parent_class: TGObjectClass;
  end;
  PWebKitAutomationSessionClass = ^TWebKitAutomationSessionClass;

function webkit_automation_session_get_type: TGType; cdecl; external libwebkit;
function webkit_automation_session_get_id(session: PWebKitAutomationSession): pchar; cdecl; external libwebkit;
procedure webkit_automation_session_set_application_info(session: PWebKitAutomationSession; info: PWebKitApplicationInfo); cdecl; external libwebkit;
function webkit_automation_session_get_application_info(session: PWebKitAutomationSession): PWebKitApplicationInfo; cdecl; external libwebkit;

// === Konventiert am: 3-1-25 16:51:56 ===

function WEBKIT_TYPE_AUTOMATION_SESSION: TGType;
function WEBKIT_AUTOMATION_SESSION(obj: Pointer): PWebKitAutomationSession;
function WEBKIT_IS_AUTOMATION_SESSION(obj: Pointer): Tgboolean;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function WEBKIT_TYPE_AUTOMATION_SESSION: TGType;
begin
  Result := webkit_automation_session_get_type;
end;

function WEBKIT_AUTOMATION_SESSION(obj: Pointer): PWebKitAutomationSession;
begin
  Result := PWebKitAutomationSession(g_type_check_instance_cast(obj, WEBKIT_TYPE_AUTOMATION_SESSION));
end;

function WEBKIT_IS_AUTOMATION_SESSION(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, WEBKIT_TYPE_AUTOMATION_SESSION);
end;


{$ENDIF read_implementation}
