{$IFDEF read_interface}


type
  PEfl_Loop_Message_Future = ^TEfl_Loop_Message_Future;
  TEfl_Loop_Message_Future = TEo;

{$ifdef EFL_BETA_API_SUPPORT}
function EFL_LOOP_MESSAGE_FUTURE_CLASS: PEfl_Class;

function efl_loop_message_future_class_get: PEfl_Class; cdecl; external libecore;
procedure efl_loop_message_future_data_set(obj: PEo; data: pointer); cdecl; external libecore;
function efl_loop_message_future_data_get(obj: PEo): pointer; cdecl; external libecore;
{$endif}

// === Konventiert am: 21-5-25 17:03:04 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


{$ifdef EFL_BETA_API_SUPPORT}
function EFL_LOOP_MESSAGE_FUTURE_CLASS: PEfl_Class;
begin
  EFL_LOOP_MESSAGE_FUTURE_CLASS := efl_loop_message_future_class_get;
end;
{$endif}


{$ENDIF read_implementation}
