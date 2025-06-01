{$IFDEF read_interface}


type
  PEfl_Ui_Collection_View_Focus_Manager = ^TEfl_Ui_Collection_View_Focus_Manager;
  TEfl_Ui_Collection_View_Focus_Manager = TEo;

{$ifdef EFL_BETA_API_SUPPORT}
function EFL_UI_COLLECTION_VIEW_FOCUS_MANAGER_CLASS: PEfl_Class;

function efl_ui_collection_view_focus_manager_class_get: PEfl_Class; cdecl; external libelementary;
{$endif}

// === Konventiert am: 31-5-25 15:16:46 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


{$ifdef EFL_BETA_API_SUPPORT}
function EFL_UI_COLLECTION_VIEW_FOCUS_MANAGER_CLASS: PEfl_Class;
begin
  EFL_UI_COLLECTION_VIEW_FOCUS_MANAGER_CLASS := efl_ui_collection_view_focus_manager_class_get;
end;
{$endif}


{$ENDIF read_implementation}
