unit efl_input_interface_eo;

interface

uses
  ctypes, efl,fp_eina,fp_eo, Evas_Common;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

type
  PEfl_Input_Interface = ^TEfl_Input_Interface;
  TEfl_Input_Interface = TEo;

function EFL_INPUT_INTERFACE_INTERFACE: PEfl_Class;

function efl_input_interface_interface_get: PEfl_Class; cdecl; external libevas;
{$ifdef EFL_BETA_API_SUPPORT}
procedure efl_input_seat_event_filter_set(obj: PEo; seat: PEfl_Input_Device; enable: TEina_Bool); cdecl; external libevas;
{$endif}
{$ifdef EFL_BETA_API_SUPPORT}
function efl_input_seat_event_filter_get(obj: PEo; seat: PEfl_Input_Device): TEina_Bool; cdecl; external libevas;
{$endif}
var
  _EFL_EVENT_POINTER_MOVE: TEfl_Event_Description; cvar;external libevas;
  _EFL_EVENT_POINTER_DOWN: TEfl_Event_Description; cvar;external libevas;
  _EFL_EVENT_POINTER_UP: TEfl_Event_Description; cvar;external libevas;
  _EFL_EVENT_POINTER_CANCEL: TEfl_Event_Description; cvar;external libevas;
  _EFL_EVENT_POINTER_IN: TEfl_Event_Description; cvar;external libevas;
  _EFL_EVENT_POINTER_OUT: TEfl_Event_Description; cvar;external libevas;
  _EFL_EVENT_POINTER_WHEEL: TEfl_Event_Description; cvar;external libevas;
  _EFL_EVENT_POINTER_AXIS: TEfl_Event_Description; cvar;external libevas;
  _EFL_EVENT_FINGER_MOVE: TEfl_Event_Description; cvar;external libevas;
  _EFL_EVENT_FINGER_DOWN: TEfl_Event_Description; cvar;external libevas;
  _EFL_EVENT_FINGER_UP: TEfl_Event_Description; cvar;external libevas;
  _EFL_EVENT_KEY_DOWN: TEfl_Event_Description; cvar;external libevas;
  _EFL_EVENT_KEY_UP: TEfl_Event_Description; cvar;external libevas;
  _EFL_EVENT_HOLD: TEfl_Event_Description; cvar;external libevas;
  _EFL_EVENT_FOCUS_IN: TEfl_Event_Description; cvar;external libevas;
  _EFL_EVENT_FOCUS_OUT: TEfl_Event_Description; cvar;external libevas;

function EFL_EVENT_POINTER_MOVE: PEfl_Event_Description;
function EFL_EVENT_POINTER_DOWN: PEfl_Event_Description;
function EFL_EVENT_POINTER_UP: PEfl_Event_Description;
function EFL_EVENT_POINTER_CANCEL: PEfl_Event_Description;
function EFL_EVENT_POINTER_IN: PEfl_Event_Description;
function EFL_EVENT_POINTER_OUT: PEfl_Event_Description;
function EFL_EVENT_POINTER_WHEEL: PEfl_Event_Description;
function EFL_EVENT_POINTER_AXIS: PEfl_Event_Description;
function EFL_EVENT_FINGER_MOVE: PEfl_Event_Description;
function EFL_EVENT_FINGER_DOWN: PEfl_Event_Description;
function EFL_EVENT_FINGER_UP: PEfl_Event_Description;
function EFL_EVENT_KEY_DOWN: PEfl_Event_Description;
function EFL_EVENT_KEY_UP: PEfl_Event_Description;
function EFL_EVENT_HOLD: PEfl_Event_Description;
function EFL_EVENT_FOCUS_IN: PEfl_Event_Description;
function EFL_EVENT_FOCUS_OUT: PEfl_Event_Description;


// === Konventiert am: 13-5-25 19:18:19 ===


implementation



function EFL_INPUT_INTERFACE_INTERFACE: PEfl_Class;
begin
  EFL_INPUT_INTERFACE_INTERFACE := efl_input_interface_interface_get;
end;


function EFL_EVENT_POINTER_MOVE: PEfl_Event_Description;
begin
  EFL_EVENT_POINTER_MOVE := @(_EFL_EVENT_POINTER_MOVE);
end;


function EFL_EVENT_POINTER_DOWN: PEfl_Event_Description;
begin
  EFL_EVENT_POINTER_DOWN := @(_EFL_EVENT_POINTER_DOWN);
end;


function EFL_EVENT_POINTER_UP: PEfl_Event_Description;
begin
  EFL_EVENT_POINTER_UP := @(_EFL_EVENT_POINTER_UP);
end;


function EFL_EVENT_POINTER_CANCEL: PEfl_Event_Description;
begin
  EFL_EVENT_POINTER_CANCEL := @(_EFL_EVENT_POINTER_CANCEL);
end;


function EFL_EVENT_POINTER_IN: PEfl_Event_Description;
begin
  EFL_EVENT_POINTER_IN := @(_EFL_EVENT_POINTER_IN);
end;


function EFL_EVENT_POINTER_OUT: PEfl_Event_Description;
begin
  EFL_EVENT_POINTER_OUT := @(_EFL_EVENT_POINTER_OUT);
end;


function EFL_EVENT_POINTER_WHEEL: PEfl_Event_Description;
begin
  EFL_EVENT_POINTER_WHEEL := @(_EFL_EVENT_POINTER_WHEEL);
end;


function EFL_EVENT_POINTER_AXIS: PEfl_Event_Description;
begin
  EFL_EVENT_POINTER_AXIS := @(_EFL_EVENT_POINTER_AXIS);
end;


function EFL_EVENT_FINGER_MOVE: PEfl_Event_Description;
begin
  EFL_EVENT_FINGER_MOVE := @(_EFL_EVENT_FINGER_MOVE);
end;


function EFL_EVENT_FINGER_DOWN: PEfl_Event_Description;
begin
  EFL_EVENT_FINGER_DOWN := @(_EFL_EVENT_FINGER_DOWN);
end;


function EFL_EVENT_FINGER_UP: PEfl_Event_Description;
begin
  EFL_EVENT_FINGER_UP := @(_EFL_EVENT_FINGER_UP);
end;


function EFL_EVENT_KEY_DOWN: PEfl_Event_Description;
begin
  EFL_EVENT_KEY_DOWN := @(_EFL_EVENT_KEY_DOWN);
end;


function EFL_EVENT_KEY_UP: PEfl_Event_Description;
begin
  EFL_EVENT_KEY_UP := @(_EFL_EVENT_KEY_UP);
end;


function EFL_EVENT_HOLD: PEfl_Event_Description;
begin
  EFL_EVENT_HOLD := @(_EFL_EVENT_HOLD);
end;


function EFL_EVENT_FOCUS_IN: PEfl_Event_Description;
begin
  EFL_EVENT_FOCUS_IN := @(_EFL_EVENT_FOCUS_IN);
end;


function EFL_EVENT_FOCUS_OUT: PEfl_Event_Description;
begin
  EFL_EVENT_FOCUS_OUT := @(_EFL_EVENT_FOCUS_OUT);
end;


end.
