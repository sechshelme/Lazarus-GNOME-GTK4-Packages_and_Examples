{$IFDEF read_interface}

type
  PWebKitConsoleMessageSource = ^TWebKitConsoleMessageSource;
  TWebKitConsoleMessageSource = longint;

const
  WEBKIT_CONSOLE_MESSAGE_SOURCE_JAVASCRIPT = 0;
  WEBKIT_CONSOLE_MESSAGE_SOURCE_NETWORK = 1;
  WEBKIT_CONSOLE_MESSAGE_SOURCE_CONSOLE_API = 2;
  WEBKIT_CONSOLE_MESSAGE_SOURCE_SECURITY = 3;
  WEBKIT_CONSOLE_MESSAGE_SOURCE_OTHER = 4;

type
  PWebKitConsoleMessageLevel = ^TWebKitConsoleMessageLevel;
  TWebKitConsoleMessageLevel = longint;

const
  WEBKIT_CONSOLE_MESSAGE_LEVEL_INFO = 0;
  WEBKIT_CONSOLE_MESSAGE_LEVEL_LOG = 1;
  WEBKIT_CONSOLE_MESSAGE_LEVEL_WARNING = 2;
  WEBKIT_CONSOLE_MESSAGE_LEVEL_ERROR = 3;
  WEBKIT_CONSOLE_MESSAGE_LEVEL_DEBUG = 4;

type
  TWebKitConsoleMessage = record
  end;
  PWebKitConsoleMessage = ^TWebKitConsoleMessage;

function webkit_console_message_get_type: TGType; cdecl; external libwebkit;
function webkit_console_message_copy(console_message: PWebKitConsoleMessage): PWebKitConsoleMessage; cdecl; external libwebkit;
procedure webkit_console_message_free(console_message: PWebKitConsoleMessage); cdecl; external libwebkit;
function webkit_console_message_get_source(console_message: PWebKitConsoleMessage): TWebKitConsoleMessageSource; cdecl; external libwebkit;
function webkit_console_message_get_level(console_message: PWebKitConsoleMessage): TWebKitConsoleMessageLevel; cdecl; external libwebkit;
function webkit_console_message_get_text(console_message: PWebKitConsoleMessage): Pgchar; cdecl; external libwebkit;
function webkit_console_message_get_line(console_message: PWebKitConsoleMessage): Tguint; cdecl; external libwebkit;
function webkit_console_message_get_source_id(console_message: PWebKitConsoleMessage): Pgchar; cdecl; external libwebkit;

// === Konventiert am: 4-1-25 15:31:37 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}

function WEBKIT_TYPE_CONSOLE_MESSAGE: TGType;
begin
  WEBKIT_TYPE_CONSOLE_MESSAGE := webkit_console_message_get_type;
end;



{$ENDIF read_implementation}
