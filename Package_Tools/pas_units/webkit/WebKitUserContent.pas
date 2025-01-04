unit WebKitUserContent;

interface

uses
  fp_glib2, fp_GTK4, WebKit;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

type
  PWebKitUserContentInjectedFrames = ^TWebKitUserContentInjectedFrames;
  TWebKitUserContentInjectedFrames = longint;

const
  WEBKIT_USER_CONTENT_INJECT_ALL_FRAMES = 0;
  WEBKIT_USER_CONTENT_INJECT_TOP_FRAME = 1;

type
  PWebKitUserStyleLevel = ^TWebKitUserStyleLevel;
  TWebKitUserStyleLevel = longint;

const
  WEBKIT_USER_STYLE_LEVEL_USER = 0;
  WEBKIT_USER_STYLE_LEVEL_AUTHOR = 1;

type
  TWebKitUserStyleSheet = record
  end;
  PWebKitUserStyleSheet = ^TWebKitUserStyleSheet;

function webkit_user_style_sheet_get_type: TGType; cdecl; external libwebkit;
function webkit_user_style_sheet_ref(user_style_sheet: PWebKitUserStyleSheet): PWebKitUserStyleSheet; cdecl; external libwebkit;
procedure webkit_user_style_sheet_unref(user_style_sheet: PWebKitUserStyleSheet); cdecl; external libwebkit;
function webkit_user_style_sheet_new(Source: Pgchar; injected_frames: TWebKitUserContentInjectedFrames; level: TWebKitUserStyleLevel; allow_list: PPgchar; block_list: PPgchar): PWebKitUserStyleSheet; cdecl; external libwebkit;
function webkit_user_style_sheet_new_for_world(Source: Pgchar; injected_frames: TWebKitUserContentInjectedFrames; level: TWebKitUserStyleLevel; world_name: Pgchar; allow_list: PPgchar;
  block_list: PPgchar): PWebKitUserStyleSheet; cdecl; external libwebkit;

type
  PWebKitUserScriptInjectionTime = ^TWebKitUserScriptInjectionTime;
  TWebKitUserScriptInjectionTime = longint;

const
  WEBKIT_USER_SCRIPT_INJECT_AT_DOCUMENT_START = 0;
  WEBKIT_USER_SCRIPT_INJECT_AT_DOCUMENT_END = 1;

type
  TWebKitUserScript = record
  end;
  PWebKitUserScript = ^TWebKitUserScript;

function webkit_user_script_get_type: TGType; cdecl; external libwebkit;
function webkit_user_script_ref(user_script: PWebKitUserScript): PWebKitUserScript; cdecl; external libwebkit;
procedure webkit_user_script_unref(user_script: PWebKitUserScript); cdecl; external libwebkit;
function webkit_user_script_new(Source: Pgchar; injected_frames: TWebKitUserContentInjectedFrames; injection_time: TWebKitUserScriptInjectionTime; allow_list: PPgchar; block_list: PPgchar): PWebKitUserScript; cdecl; external libwebkit;
function webkit_user_script_new_for_world(Source: Pgchar; injected_frames: TWebKitUserContentInjectedFrames; injection_time: TWebKitUserScriptInjectionTime; world_name: Pgchar; allow_list: PPgchar;
  block_list: PPgchar): PWebKitUserScript; cdecl; external libwebkit;

type
  TWebKitUserContentFilter = record
  end;
  PWebKitUserContentFilter = ^TWebKitUserContentFilter;

function webkit_user_content_filter_get_type: TGType; cdecl; external libwebkit;
function webkit_user_content_filter_get_identifier(user_content_filter: PWebKitUserContentFilter): pchar; cdecl; external libwebkit;
function webkit_user_content_filter_ref(user_content_filter: PWebKitUserContentFilter): PWebKitUserContentFilter; cdecl; external libwebkit;
procedure webkit_user_content_filter_unref(user_content_filter: PWebKitUserContentFilter); cdecl; external libwebkit;

function WEBKIT_TYPE_USER_STYLE_SHEET: TGType;
function WEBKIT_TYPE_USER_SCRIPT: TGType;
function WEBKIT_TYPE_USER_CONTENT_FILTER: TGType;

// === Konventiert am: 3-1-25 20:02:36 ===


implementation

function WEBKIT_TYPE_USER_STYLE_SHEET: TGType;
begin
  WEBKIT_TYPE_USER_STYLE_SHEET := webkit_user_style_sheet_get_type;
end;

function WEBKIT_TYPE_USER_SCRIPT: TGType;
begin
  WEBKIT_TYPE_USER_SCRIPT := webkit_user_script_get_type;
end;

function WEBKIT_TYPE_USER_CONTENT_FILTER: TGType;
begin
  WEBKIT_TYPE_USER_CONTENT_FILTER := webkit_user_content_filter_get_type;
end;


end.
