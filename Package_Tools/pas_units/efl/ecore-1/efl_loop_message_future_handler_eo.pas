unit efl_loop_message_future_handler_eo;

interface

uses
  efl, fp_eo, fp_eina, fp_efl, efl_loop_message_future_eo;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PEfl_Loop_Message_Future_Handler = ^TEfl_Loop_Message_Future_Handler;
  TEfl_Loop_Message_Future_Handler = TEo;

{$ifdef EFL_BETA_API_SUPPORT}
function EFL_LOOP_MESSAGE_FUTURE_HANDLER_CLASS: PEfl_Class;

function efl_loop_message_future_handler_class_get: PEfl_Class; cdecl; external libecore;
function efl_loop_message_future_handler_message_type_add(obj: PEo): PEfl_Loop_Message_Future; cdecl; external libecore;

var
  _EFL_LOOP_MESSAGE_FUTURE_HANDLER_EVENT_MESSAGE_FUTURE: TEfl_Event_Description; cvar;external libecore;

function EFL_LOOP_MESSAGE_FUTURE_HANDLER_EVENT_MESSAGE_FUTURE: PEfl_Event_Description;
{$endif}

// === Konventiert am: 21-5-25 17:03:07 ===


implementation


{$ifdef EFL_BETA_API_SUPPORT}
function EFL_LOOP_MESSAGE_FUTURE_HANDLER_CLASS: PEfl_Class;
begin
  EFL_LOOP_MESSAGE_FUTURE_HANDLER_CLASS := efl_loop_message_future_handler_class_get;
end;

function EFL_LOOP_MESSAGE_FUTURE_HANDLER_EVENT_MESSAGE_FUTURE: PEfl_Event_Description;
begin
  EFL_LOOP_MESSAGE_FUTURE_HANDLER_EVENT_MESSAGE_FUTURE := @(_EFL_LOOP_MESSAGE_FUTURE_HANDLER_EVENT_MESSAGE_FUTURE);
end;
{$endif}


end.
