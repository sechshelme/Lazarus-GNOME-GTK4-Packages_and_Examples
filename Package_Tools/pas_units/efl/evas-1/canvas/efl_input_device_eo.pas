unit efl_input_device_eo;

interface

uses
  ctypes, efl, eina_types;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PEfl_Input_Device = ^TEfl_Input_Device;
  TEfl_Input_Device = TEo;

type
  PEfl_Input_Device_Type = ^TEfl_Input_Device_Type;
  TEfl_Input_Device_Type = longint;

const
  EFL_INPUT_DEVICE_TYPE_NONE = 0;
  EFL_INPUT_DEVICE_TYPE_SEAT = 1;
  EFL_INPUT_DEVICE_TYPE_KEYBOARD = 2;
  EFL_INPUT_DEVICE_TYPE_MOUSE = 3;
  EFL_INPUT_DEVICE_TYPE_TOUCH = 4;
  EFL_INPUT_DEVICE_TYPE_PEN = 5;
  EFL_INPUT_DEVICE_TYPE_WAND = 6;
  EFL_INPUT_DEVICE_TYPE_GAMEPAD = 7;

function EFL_INPUT_DEVICE_CLASS: PEfl_Class;

function efl_input_device_class_get: PEfl_Class; cdecl; external libevas;
procedure efl_input_device_type_set(obj: PEo; klass: TEfl_Input_Device_Type); cdecl; external libevas;
function efl_input_device_type_get(obj: PEo): TEfl_Input_Device_Type; cdecl; external libevas;
procedure efl_input_device_source_set(obj: PEo; src: PEfl_Input_Device); cdecl; external libevas;
function efl_input_device_source_get(obj: PEo): PEfl_Input_Device; cdecl; external libevas;
function efl_input_device_seat_get(obj: PEo): PEfl_Input_Device; cdecl; external libevas;
procedure efl_input_device_seat_id_set(obj: PEo; id: dword); cdecl; external libevas;
function efl_input_device_seat_id_get(obj: PEo): dword; cdecl; external libevas;
function efl_input_device_children_iterate(obj: PEo): PEina_Iterator; cdecl; external libevas;
function efl_input_device_pointer_device_count_get(obj: PEo): longint; cdecl; external libevas;
function efl_input_device_is_pointer_type_get(obj: PEo): TEina_Bool; cdecl; external libevas;

// === Konventiert am: 13-5-25 19:44:07 ===


implementation


function EFL_INPUT_DEVICE_CLASS: PEfl_Class;
begin
  EFL_INPUT_DEVICE_CLASS := efl_input_device_class_get;
end;


end.
