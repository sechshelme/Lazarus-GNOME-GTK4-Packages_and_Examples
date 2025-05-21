{$IFDEF read_interface}


type
  PEcore_Event_Message_Handler = ^TEcore_Event_Message_Handler;
  TEcore_Event_Message_Handler = TEo;

{$ifdef EFL_BETA_API_SUPPORT}
function ECORE_EVENT_MESSAGE_HANDLER_CLASS: PEfl_Class;

function ecore_event_message_handler_class_get: PEfl_Class; cdecl; external libecore;
function ecore_event_message_handler_message_type_add(obj: PEo): PEcore_Event_Message; cdecl; external libecore;
function ecore_event_message_handler_type_new(obj: PEo): longint; cdecl; external libecore;
function ecore_event_message_handler_add(obj: PEo; _type: longint; func: pointer; data: pointer): pointer; cdecl; external libecore;
function ecore_event_message_handler_prepend(obj: PEo; _type: longint; func: pointer; data: pointer): pointer; cdecl; external libecore;
function ecore_event_message_handler_del(obj: PEo; handler: pointer): pointer; cdecl; external libecore;
function ecore_event_message_handler_data_get(obj: PEo; handler: pointer): pointer; cdecl; external libecore;
function ecore_event_message_handler_data_set(obj: PEo; handler: pointer; data: pointer): pointer; cdecl; external libecore;
function ecore_event_message_handler_filter_add(obj: PEo; func_start: pointer; func_filter: pointer; func_end: pointer; data: pointer): pointer; cdecl; external libecore;
function ecore_event_message_handler_filter_del(obj: PEo; filter: pointer): pointer; cdecl; external libecore;
function ecore_event_message_handler_current_type_get(obj: PEo): longint; cdecl; external libecore;
function ecore_event_message_handler_current_event_get(obj: PEo): pointer; cdecl; external libecore;
procedure ecore_event_message_handler_type_flush(obj: PEo; _type: longint); cdecl; external libecore;

var
  _ECORE_EVENT_MESSAGE_HANDLER_EVENT_MESSAGE_ECORE_EVENT: TEfl_Event_Description; cvar;external libecore;

function ECORE_EVENT_MESSAGE_HANDLER_EVENT_MESSAGE_ECORE_EVENT: PEfl_Event_Description;
{$endif}

// === Konventiert am: 21-5-25 15:43:44 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


{$ifdef EFL_BETA_API_SUPPORT}
function ECORE_EVENT_MESSAGE_HANDLER_CLASS: PEfl_Class; unimplemented;
begin
//  ECORE_EVENT_MESSAGE_HANDLER_CLASS := ecore_event_message_handler_class_get;
end;

function ECORE_EVENT_MESSAGE_HANDLER_EVENT_MESSAGE_ECORE_EVENT: PEfl_Event_Description; unimplemented;
begin
//  ECORE_EVENT_MESSAGE_HANDLER_EVENT_MESSAGE_ECORE_EVENT := @(_ECORE_EVENT_MESSAGE_HANDLER_EVENT_MESSAGE_ECORE_EVENT);
end;
{$endif}


{$ENDIF read_implementation}
