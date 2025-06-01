{$IFDEF read_interface}


type
  PEfl_Ui_Layout = ^TEfl_Ui_Layout;
  TEfl_Ui_Layout = TEo;

function EFL_UI_LAYOUT_CLASS: PEfl_Class;

function efl_ui_layout_class_get: PEfl_Class; cdecl; external libelementary;

// === Konventiert am: 31-5-25 15:36:46 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


function EFL_UI_LAYOUT_CLASS: PEfl_Class;
begin
  EFL_UI_LAYOUT_CLASS := efl_ui_layout_class_get;
end;


{$ENDIF read_implementation}
