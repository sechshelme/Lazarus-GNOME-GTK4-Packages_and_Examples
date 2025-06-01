{$IFDEF read_interface}


type
  PEfl_Ui_List_Placeholder_Item = ^TEfl_Ui_List_Placeholder_Item;
  TEfl_Ui_List_Placeholder_Item = TEo;

{$ifdef EFL_BETA_API_SUPPORT}
function EFL_UI_LIST_PLACEHOLDER_ITEM_CLASS: PEfl_Class;

function efl_ui_list_placeholder_item_class_get: PEfl_Class; cdecl; external libelementary;
{$endif}

// === Konventiert am: 31-5-25 15:50:11 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


{$ifdef EFL_BETA_API_SUPPORT}
function EFL_UI_LIST_PLACEHOLDER_ITEM_CLASS: PEfl_Class;
begin
  EFL_UI_LIST_PLACEHOLDER_ITEM_CLASS := efl_ui_list_placeholder_item_class_get;
end;
{$endif}


{$ENDIF read_implementation}
