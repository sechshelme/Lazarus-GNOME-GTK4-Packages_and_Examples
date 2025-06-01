{$IFDEF read_interface}


type
  PEfl_Ui_Pager = ^TEfl_Ui_Pager;
  TEfl_Ui_Pager = TEo;

function EFL_UI_PAGER_CLASS: PEfl_Class;

function efl_ui_pager_class_get: PEfl_Class; cdecl; external libelementary;

// === Konventiert am: 31-5-25 17:09:27 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


function EFL_UI_PAGER_CLASS: PEfl_Class;
begin
  EFL_UI_PAGER_CLASS := efl_ui_pager_class_get;
end;


{$ENDIF read_implementation}
