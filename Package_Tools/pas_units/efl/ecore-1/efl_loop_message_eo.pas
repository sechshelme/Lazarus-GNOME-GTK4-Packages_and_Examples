unit efl_loop_message_eo;

interface

uses
  efl, fp_eo, fp_eina, fp_efl;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PEfl_Loop_Message = ^TEfl_Loop_Message;
  TEfl_Loop_Message = TEo;

{$ifdef EFL_BETA_API_SUPPORT}
function EFL_LOOP_MESSAGE_CLASS: PEfl_Class;

function efl_loop_message_class_get: PEfl_Class; cdecl; external libecore;

var
  _EFL_LOOP_MESSAGE_EVENT_MESSAGE: TEfl_Event_Description; cvar;external libecore;

function EFL_LOOP_MESSAGE_EVENT_MESSAGE: PEfl_Event_Description;
{$endif}

// === Konventiert am: 21-5-25 15:50:23 ===


implementation


{$ifdef EFL_BETA_API_SUPPORT}
function EFL_LOOP_MESSAGE_CLASS: PEfl_Class;
begin
  EFL_LOOP_MESSAGE_CLASS := efl_loop_message_class_get;
end;

function EFL_LOOP_MESSAGE_EVENT_MESSAGE: PEfl_Event_Description;
begin
  EFL_LOOP_MESSAGE_EVENT_MESSAGE := @(_EFL_LOOP_MESSAGE_EVENT_MESSAGE);
end;
{$endif}


end.
