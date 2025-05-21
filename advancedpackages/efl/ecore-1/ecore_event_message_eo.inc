{$IFDEF read_interface}


type
  PEcore_Event_Message = ^TEcore_Event_Message;
  TEcore_Event_Message = TEo;

{$ifdef EFL_BETA_API_SUPPORT}
function ECORE_EVENT_MESSAGE_CLASS: PEfl_Class;

function ecore_event_message_class_get: PEfl_Class; cdecl; external libecore;
procedure ecore_event_message_data_set(obj: PEo; _type: longint; data: pointer; free_func: pointer; free_data: pointer); cdecl; external libecore;
procedure ecore_event_message_data_get(obj: PEo; _type: Plongint; data: Ppointer; free_func: Ppointer; free_data: Ppointer); cdecl; external libecore;
procedure ecore_event_message_data_steal(obj: PEo; _type: Plongint; data: Ppointer; free_func: Ppointer; free_data: Ppointer); cdecl; external libecore;
{$endif}

// === Konventiert am: 21-5-25 16:01:42 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


{$ifdef EFL_BETA_API_SUPPORT}
function ECORE_EVENT_MESSAGE_CLASS: PEfl_Class; unimplemented;
begin
//  ECORE_EVENT_MESSAGE_CLASS := ecore_event_message_class_get;
end;
{$endif}


{$ENDIF read_implementation}
