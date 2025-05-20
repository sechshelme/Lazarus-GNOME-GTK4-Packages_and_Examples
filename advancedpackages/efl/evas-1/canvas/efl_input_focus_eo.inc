{$IFDEF read_interface}


type
  PEfl_Input_Focus = ^TEfl_Input_Focus;
  TEfl_Input_Focus = TEo;

function EFL_INPUT_FOCUS_CLASS: PEfl_Class;

function efl_input_focus_class_get: PEfl_Class; cdecl; external libevas;
procedure efl_input_focus_object_set(obj: PEo; object_: PEfl_Object); cdecl; external libevas;
function efl_input_focus_object_get(obj: PEo): PEfl_Object; cdecl; external libevas;

// === Konventiert am: 14-5-25 14:53:18 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


function EFL_INPUT_FOCUS_CLASS: PEfl_Class;
begin
  EFL_INPUT_FOCUS_CLASS := efl_input_focus_class_get;
end;


{$ENDIF read_implementation}
