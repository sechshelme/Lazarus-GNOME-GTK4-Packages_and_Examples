unit efl_loop_message_handler_eo;

interface

uses
  efl, fp_eo, fp_eina, fp_efl, efl_loop_message_eo;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PEfl_Loop_Message_Handler = ^TEfl_Loop_Message_Handler;
  TEfl_Loop_Message_Handler = TEo;

{$ifdef EFL_BETA_API_SUPPORT}
function EFL_LOOP_MESSAGE_HANDLER_CLASS: PEfl_Class;

function efl_loop_message_handler_class_get: PEfl_Class; cdecl; external libecore;
function efl_loop_message_handler_message_add(obj: PEo): PEfl_Loop_Message; cdecl; external libecore;
procedure efl_loop_message_handler_message_send(obj: PEo; message: PEfl_Loop_Message); cdecl; external libecore;
procedure efl_loop_message_handler_message_call(obj: PEo; message: PEfl_Loop_Message); cdecl; external libecore;
function efl_loop_message_handler_message_clear(obj: PEo): TEina_Bool; cdecl; external libecore;

var
  _EFL_LOOP_MESSAGE_HANDLER_EVENT_MESSAGE: TEfl_Event_Description; cvar;external libecore;

function EFL_LOOP_MESSAGE_HANDLER_EVENT_MESSAGE: PEfl_Event_Description;
{$endif}

// === Konventiert am: 21-5-25 15:44:02 ===


implementation


{$ifdef EFL_BETA_API_SUPPORT}
function EFL_LOOP_MESSAGE_HANDLER_CLASS: PEfl_Class;
begin
  EFL_LOOP_MESSAGE_HANDLER_CLASS := efl_loop_message_handler_class_get;
end;

function EFL_LOOP_MESSAGE_HANDLER_EVENT_MESSAGE: PEfl_Event_Description;
begin
  EFL_LOOP_MESSAGE_HANDLER_EVENT_MESSAGE := @(_EFL_LOOP_MESSAGE_HANDLER_EVENT_MESSAGE);
end;
{$endif}


end.
