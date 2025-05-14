unit efl_input_pointer_eo;

interface

uses
  ctypes, efl, eina_rectangle, eina_types, efl_input_types_eot;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

type
  PEfl_Input_Pointer = ^TEfl_Input_Pointer;
  TEfl_Input_Pointer = TEo;

function EFL_INPUT_POINTER_CLASS: PEfl_Class;

function efl_input_pointer_class_get: PEfl_Class; cdecl; external libevas;
procedure efl_input_pointer_action_set(obj: PEo; act: TEfl_Pointer_Action); cdecl; external libevas;
function efl_input_pointer_action_get(obj: PEo): TEfl_Pointer_Action; cdecl; external libevas;
{$ifdef EFL_BETA_API_SUPPORT}
function efl_input_pointer_value_has_get(obj: PEo; key: TEfl_Input_Value): TEina_Bool; cdecl; external libevas;
{$endif}
{$ifdef EFL_BETA_API_SUPPORT}
function efl_input_pointer_value_set(obj: PEo; key: TEfl_Input_Value; val: double): TEina_Bool; cdecl; external libevas;
{$endif}
{$ifdef EFL_BETA_API_SUPPORT}
function efl_input_pointer_value_get(obj: PEo; key: TEfl_Input_Value): double; cdecl; external libevas;
{$endif}
procedure efl_input_pointer_button_set(obj: PEo; but: longint); cdecl; external libevas;
function efl_input_pointer_button_get(obj: PEo): longint; cdecl; external libevas;
procedure efl_input_pointer_button_pressed_set(obj: PEo; button: longint; pressed: TEina_Bool); cdecl; external libevas;
function efl_input_pointer_button_pressed_get(obj: PEo; button: longint): TEina_Bool; cdecl; external libevas;
procedure efl_input_pointer_position_set(obj: PEo; pos: TEina_Position2D); cdecl; external libevas;
function efl_input_pointer_position_get(obj: PEo): TEina_Position2D; cdecl; external libevas;
procedure efl_input_pointer_precise_position_set(obj: PEo; pos: TEina_Vector2); cdecl; external libevas;
function efl_input_pointer_precise_position_get(obj: PEo): TEina_Vector2; cdecl; external libevas;
procedure efl_input_pointer_previous_position_set(obj: PEo; pos: TEina_Position2D); cdecl; external libevas;
function efl_input_pointer_previous_position_get(obj: PEo): TEina_Position2D; cdecl; external libevas;
procedure efl_input_pointer_touch_id_set(obj: PEo; id: longint); cdecl; external libevas;
function efl_input_pointer_touch_id_get(obj: PEo): longint; cdecl; external libevas;
procedure efl_input_pointer_source_set(obj: PEo; src: PEfl_Object); cdecl; external libevas;
function efl_input_pointer_source_get(obj: PEo): PEfl_Object; cdecl; external libevas;
procedure efl_input_pointer_button_flags_set(obj: PEo; flags: TEfl_Pointer_Flags); cdecl; external libevas;
function efl_input_pointer_button_flags_get(obj: PEo): TEfl_Pointer_Flags; cdecl; external libevas;
procedure efl_input_pointer_double_click_set(obj: PEo; val: TEina_Bool); cdecl; external libevas;
function efl_input_pointer_double_click_get(obj: PEo): TEina_Bool; cdecl; external libevas;
procedure efl_input_pointer_triple_click_set(obj: PEo; val: TEina_Bool); cdecl; external libevas;
function efl_input_pointer_triple_click_get(obj: PEo): TEina_Bool; cdecl; external libevas;
procedure efl_input_pointer_wheel_horizontal_set(obj: PEo; horizontal: TEina_Bool); cdecl; external libevas;
function efl_input_pointer_wheel_horizontal_get(obj: PEo): TEina_Bool; cdecl; external libevas;
procedure efl_input_pointer_wheel_delta_set(obj: PEo; dist: longint); cdecl; external libevas;
function efl_input_pointer_wheel_delta_get(obj: PEo): longint; cdecl; external libevas;

// === Konventiert am: 13-5-25 15:13:48 ===


implementation


function EFL_INPUT_POINTER_CLASS: PEfl_Class;
begin
  EFL_INPUT_POINTER_CLASS := efl_input_pointer_class_get;
end;


end.
