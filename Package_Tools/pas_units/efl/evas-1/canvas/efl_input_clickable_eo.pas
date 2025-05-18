unit efl_input_clickable_eo;

interface

uses
  ctypes, efl, fp_eina;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

type
  PEfl_Input_Clickable = ^TEfl_Input_Clickable;
  TEfl_Input_Clickable = TEo;

type
  TEfl_Input_Clickable_Clicked = record
    repeated: dword;
    button: dword;
  end;
  PEfl_Input_Clickable_Clicked = ^TEfl_Input_Clickable_Clicked;

function EFL_INPUT_CLICKABLE_MIXIN: PEfl_Class;

function efl_input_clickable_mixin_get: PEfl_Class; cdecl; external libevas;
procedure efl_input_clickable_press(obj: PEo; button: dword); cdecl; external libevas;
procedure efl_input_clickable_unpress(obj: PEo; button: dword); cdecl; external libevas;
procedure efl_input_clickable_button_state_reset(obj: PEo; button: dword); cdecl; external libevas;
procedure efl_input_clickable_longpress_abort(obj: PEo; button: dword); cdecl; external libevas;
function efl_input_clickable_interaction_get(obj: PEo): TEina_Bool; cdecl; external libevas;

var
  _EFL_INPUT_EVENT_CLICKED: TEfl_Event_Description; cvar;external libevas;
  _EFL_INPUT_EVENT_CLICKED_ANY: TEfl_Event_Description; cvar;external libevas;
  _EFL_INPUT_EVENT_PRESSED: TEfl_Event_Description; cvar;external libevas;
  _EFL_INPUT_EVENT_UNPRESSED: TEfl_Event_Description; cvar;external libevas;
  _EFL_INPUT_EVENT_LONGPRESSED: TEfl_Event_Description; cvar;external libevas;

function EFL_INPUT_EVENT_CLICKED: PEfl_Event_Description;
function EFL_INPUT_EVENT_CLICKED_ANY: PEfl_Event_Description;
function EFL_INPUT_EVENT_PRESSED: PEfl_Event_Description;
function EFL_INPUT_EVENT_UNPRESSED: PEfl_Event_Description;
function EFL_INPUT_EVENT_LONGPRESSED: PEfl_Event_Description;


// === Konventiert am: 13-5-25 19:44:04 ===


implementation



function EFL_INPUT_CLICKABLE_MIXIN: PEfl_Class;
begin
  EFL_INPUT_CLICKABLE_MIXIN := efl_input_clickable_mixin_get;
end;


function EFL_INPUT_EVENT_CLICKED: PEfl_Event_Description;
begin
  EFL_INPUT_EVENT_CLICKED := @(_EFL_INPUT_EVENT_CLICKED);
end;


function EFL_INPUT_EVENT_CLICKED_ANY: PEfl_Event_Description;
begin
  EFL_INPUT_EVENT_CLICKED_ANY := @(_EFL_INPUT_EVENT_CLICKED_ANY);
end;


function EFL_INPUT_EVENT_PRESSED: PEfl_Event_Description;
begin
  EFL_INPUT_EVENT_PRESSED := @(_EFL_INPUT_EVENT_PRESSED);
end;


function EFL_INPUT_EVENT_UNPRESSED: PEfl_Event_Description;
begin
  EFL_INPUT_EVENT_UNPRESSED := @(_EFL_INPUT_EVENT_UNPRESSED);
end;


function EFL_INPUT_EVENT_LONGPRESSED: PEfl_Event_Description;
begin
  EFL_INPUT_EVENT_LONGPRESSED := @(_EFL_INPUT_EVENT_LONGPRESSED);
end;


end.
