{$IFDEF read_interface}

type
  TWebKitWebViewSessionState = record
  end;
  PWebKitWebViewSessionState = ^TWebKitWebViewSessionState;

function webkit_web_view_session_state_get_type: TGType; cdecl; external libwebkit;
function webkit_web_view_session_state_new(Data: PGBytes): PWebKitWebViewSessionState; cdecl; external libwebkit;
function webkit_web_view_session_state_ref(state: PWebKitWebViewSessionState): PWebKitWebViewSessionState; cdecl; external libwebkit;
procedure webkit_web_view_session_state_unref(state: PWebKitWebViewSessionState); cdecl; external libwebkit;
function webkit_web_view_session_state_serialize(state: PWebKitWebViewSessionState): PGBytes; cdecl; external libwebkit;

// === Konventiert am: 3-1-25 20:07:42 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}

function WEBKIT_TYPE_WEB_VIEW_SESSION_STATE: TGType;
begin
  WEBKIT_TYPE_WEB_VIEW_SESSION_STATE := webkit_web_view_session_state_get_type;
end;



{$ENDIF read_implementation}
