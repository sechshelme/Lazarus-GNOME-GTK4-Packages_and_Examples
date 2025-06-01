{$IFDEF read_interface}


type
  PEfl_Ui_Check = ^TEfl_Ui_Check;
  TEfl_Ui_Check = TEo;

function EFL_UI_CHECK_CLASS: PEfl_Class;

function efl_ui_check_class_get: PEfl_Class; cdecl; external libelementary;

// === Konventiert am: 31-5-25 13:59:23 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


function EFL_UI_CHECK_CLASS: PEfl_Class;
begin
  EFL_UI_CHECK_CLASS := efl_ui_check_class_get;
end;


{$ENDIF read_implementation}
