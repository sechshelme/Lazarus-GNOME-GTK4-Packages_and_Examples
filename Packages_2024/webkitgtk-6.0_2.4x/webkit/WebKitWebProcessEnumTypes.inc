{$IFDEF read_interface}

function WEBKIT_TYPE_CONSOLE_MESSAGE_SOURCE: TGType;
function webkit_console_message_source_get_type: TGType; cdecl; external libwebkit;

function WEBKIT_TYPE_CONSOLE_MESSAGE_LEVEL: TGType;
function webkit_console_message_level_get_type: TGType; cdecl; external libwebkit;

// === Konventiert am: 4-1-25 15:39:58 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


function WEBKIT_TYPE_CONSOLE_MESSAGE_SOURCE: TGType;
begin
  WEBKIT_TYPE_CONSOLE_MESSAGE_SOURCE := webkit_console_message_source_get_type;
end;

function WEBKIT_TYPE_CONSOLE_MESSAGE_LEVEL: TGType;
begin
  WEBKIT_TYPE_CONSOLE_MESSAGE_LEVEL := webkit_console_message_level_get_type;
end;


{$ENDIF read_implementation}
