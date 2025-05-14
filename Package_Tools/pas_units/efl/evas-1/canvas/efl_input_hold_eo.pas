unit efl_input_hold_eo;

interface

uses
  ctypes, elf;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

type
  PEfl_Input_Hold = ^TEfl_Input_Hold;
  TEfl_Input_Hold = TEo;

function EFL_INPUT_HOLD_CLASS: PEfl_Class;

function efl_input_hold_class_get: PEfl_Class; cdecl; external libevas;
procedure efl_input_hold_set(obj: PEo; val: TEina_Bool); cdecl; external libevas;
function efl_input_hold_get(obj: PEo): TEina_Bool; cdecl; external libevas;

// === Konventiert am: 14-5-25 14:53:21 ===


implementation


function EFL_INPUT_HOLD_CLASS: PEfl_Class;
begin
  EFL_INPUT_HOLD_CLASS := efl_input_hold_class_get;
end;


end.
