{$IFDEF read_interface}


type
  PEfl_Ui_Stack = ^TEfl_Ui_Stack;
  TEfl_Ui_Stack = TEo;

function EFL_UI_STACK_CLASS: PEfl_Class;

function efl_ui_stack_class_get: PEfl_Class; cdecl; external libelementary;

// === Konventiert am: 31-5-25 17:37:51 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


function EFL_UI_STACK_CLASS: PEfl_Class;
begin
  EFL_UI_STACK_CLASS := efl_ui_stack_class_get;
end;


{$ENDIF read_implementation}
