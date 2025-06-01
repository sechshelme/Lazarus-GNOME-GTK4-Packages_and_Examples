{$IFDEF read_interface}


type
  PEfl_Ui_Button = ^TEfl_Ui_Button;
  TEfl_Ui_Button = TEo;

function EFL_UI_BUTTON_CLASS: PEfl_Class;

function efl_ui_button_class_get: PEfl_Class; cdecl; external libelementary;

// === Konventiert am: 31-5-25 13:24:42 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


function EFL_UI_BUTTON_CLASS: PEfl_Class;
begin
  EFL_UI_BUTTON_CLASS := efl_ui_button_class_get;
end;


{$ENDIF read_implementation}
