unit efl_input_event_eo;

interface

uses
  ctypes, efl, eina_types, Evas_Common, efl_input_types_eot;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

type
  PEfl_Input_Event = ^TEfl_Input_Event;
  TEfl_Input_Event = TEo;

function EFL_INPUT_EVENT_MIXIN: PEfl_Class;

function efl_input_event_mixin_get: PEfl_Class; cdecl; external libevas;
procedure efl_input_timestamp_set(obj: PEo; ms: double); cdecl; external libevas;
function efl_input_timestamp_get(obj: PEo): double; cdecl; external libevas;
procedure efl_input_reset(obj: PEo); cdecl; external libevas;
procedure efl_input_device_set(obj: PEo; dev: PEfl_Input_Device); cdecl; external libevas;
function efl_input_device_get(obj: PEo): PEfl_Input_Device; cdecl; external libevas;
procedure efl_input_event_flags_set(obj: PEo; flags: TEfl_Input_Flags); cdecl; external libevas;
function efl_input_event_flags_get(obj: PEo): TEfl_Input_Flags; cdecl; external libevas;
procedure efl_input_processed_set(obj: PEo; val: TEina_Bool); cdecl; external libevas;
function efl_input_processed_get(obj: PEo): TEina_Bool; cdecl; external libevas;
procedure efl_input_scrolling_set(obj: PEo; val: TEina_Bool); cdecl; external libevas;
function efl_input_scrolling_get(obj: PEo): TEina_Bool; cdecl; external libevas;
function efl_input_fake_get(obj: PEo): TEina_Bool; cdecl; external libevas;

// === Konventiert am: 14-5-25 14:53:14 ===


implementation


function EFL_INPUT_EVENT_MIXIN: PEfl_Class;
begin
  EFL_INPUT_EVENT_MIXIN := efl_input_event_mixin_get;
end;


end.
