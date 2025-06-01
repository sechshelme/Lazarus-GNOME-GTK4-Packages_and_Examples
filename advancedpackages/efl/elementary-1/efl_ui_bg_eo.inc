{$IFDEF read_interface}


type
  PEfl_Ui_Bg = ^TEfl_Ui_Bg;
  TEfl_Ui_Bg = TEo;

function EFL_UI_BG_CLASS: PEfl_Class;

function efl_ui_bg_class_get: PEfl_Class; cdecl; external libelementary;

// === Konventiert am: 31-5-25 13:09:08 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


function EFL_UI_BG_CLASS: PEfl_Class;
begin
  EFL_UI_BG_CLASS := efl_ui_bg_class_get;
end;


{$ENDIF read_implementation}
