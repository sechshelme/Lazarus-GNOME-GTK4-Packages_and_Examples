{$IFDEF read_interface}

type
  TWebKitApplicationInfo = record
  end;
  PWebKitApplicationInfo = ^TWebKitApplicationInfo;

function webkit_application_info_get_type: TGType; cdecl; external libwebkit;
function webkit_application_info_new: PWebKitApplicationInfo; cdecl; external libwebkit;
function webkit_application_info_ref(info: PWebKitApplicationInfo): PWebKitApplicationInfo; cdecl; external libwebkit;
procedure webkit_application_info_unref(info: PWebKitApplicationInfo); cdecl; external libwebkit;
procedure webkit_application_info_set_name(info: PWebKitApplicationInfo; Name: Pgchar); cdecl; external libwebkit;
function webkit_application_info_get_name(info: PWebKitApplicationInfo): Pgchar; cdecl; external libwebkit;
procedure webkit_application_info_set_version(info: PWebKitApplicationInfo; major: Tguint64; minor: Tguint64; micro: Tguint64); cdecl; external libwebkit;
procedure webkit_application_info_get_version(info: PWebKitApplicationInfo; major: Pguint64; minor: Pguint64; micro: Pguint64); cdecl; external libwebkit;

// === Konventiert am: 3-1-25 16:58:59 ===

function WEBKIT_TYPE_APPLICATION_INFO: TGType;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function WEBKIT_TYPE_APPLICATION_INFO: TGType;
begin
  WEBKIT_TYPE_APPLICATION_INFO := webkit_application_info_get_type;
end;



{$ENDIF read_implementation}
