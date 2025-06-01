{$IFDEF read_interface}


type
  PEfl_Ui_List = ^TEfl_Ui_List;
  TEfl_Ui_List = TEo;

function EFL_UI_LIST_CLASS: PEfl_Class;

function efl_ui_list_class_get: PEfl_Class; cdecl; external libelementary;

// === Konventiert am: 31-5-25 15:50:08 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


function EFL_UI_LIST_CLASS: PEfl_Class;
begin
  EFL_UI_LIST_CLASS := efl_ui_list_class_get;
end;


{$ENDIF read_implementation}
