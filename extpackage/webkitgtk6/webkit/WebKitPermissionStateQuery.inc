{$IFDEF read_interface}

type
  PWebKitPermissionState = ^TWebKitPermissionState;
  TWebKitPermissionState = longint;

const
  WEBKIT_PERMISSION_STATE_GRANTED = 0;
  WEBKIT_PERMISSION_STATE_DENIED = 1;
  WEBKIT_PERMISSION_STATE_PROMPT = 2;

type
  TWebKitPermissionStateQuery = record
  end;
  PWebKitPermissionStateQuery = ^TWebKitPermissionStateQuery;

function webkit_permission_state_query_get_type: TGType; cdecl; external libwebkit;
function webkit_permission_state_query_ref(query: PWebKitPermissionStateQuery): PWebKitPermissionStateQuery; cdecl; external libwebkit;
procedure webkit_permission_state_query_unref(query: PWebKitPermissionStateQuery); cdecl; external libwebkit;
function webkit_permission_state_query_get_name(query: PWebKitPermissionStateQuery): Pgchar; cdecl; external libwebkit;
function webkit_permission_state_query_get_security_origin(query: PWebKitPermissionStateQuery): PWebKitSecurityOrigin; cdecl; external libwebkit;
procedure webkit_permission_state_query_finish(query: PWebKitPermissionStateQuery; state: TWebKitPermissionState); cdecl; external libwebkit;

// === Konventiert am: 3-1-25 16:47:47 ===

function WEBKIT_TYPE_PERMISSION_STATE_QUERY: TGType;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function WEBKIT_TYPE_PERMISSION_STATE_QUERY: TGType;
begin
  WEBKIT_TYPE_PERMISSION_STATE_QUERY := webkit_permission_state_query_get_type;
end;



{$ENDIF read_implementation}
