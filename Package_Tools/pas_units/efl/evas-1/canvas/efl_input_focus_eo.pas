unit efl_input_focus_eo;

interface

uses
  ctypes, elf;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PEfl_Input_Focus = ^TEfl_Input_Focus;
  TEfl_Input_Focus = TEo;

function EFL_INPUT_FOCUS_CLASS: PEfl_Class;

function efl_input_focus_class_get: PEfl_Class; cdecl; external libevas;
procedure efl_input_focus_object_set(obj: PEo; object_: PEfl_Object); cdecl; external libevas;
function efl_input_focus_object_get(obj: PEo): PEfl_Object; cdecl; external libevas;

// === Konventiert am: 14-5-25 14:53:18 ===


implementation


function EFL_INPUT_FOCUS_CLASS: PEfl_Class;
begin
  EFL_INPUT_FOCUS_CLASS := efl_input_focus_class_get;
end;


end.
