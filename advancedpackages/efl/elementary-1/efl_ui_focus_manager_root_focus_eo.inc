{$IFDEF read_interface}


type
  PEfl_Ui_Focus_Manager_Root_Focus = ^TEfl_Ui_Focus_Manager_Root_Focus;
  TEfl_Ui_Focus_Manager_Root_Focus = TEo;

{$ifdef EFL_BETA_API_SUPPORT}
function EFL_UI_FOCUS_MANAGER_ROOT_FOCUS_CLASS: PEfl_Class;

function efl_ui_focus_manager_root_focus_class_get: PEfl_Class; cdecl; external libelementary;
procedure efl_ui_focus_manager_root_focus_canvas_object_set(obj: PEo; canvas_object: PEfl_Canvas_Object); cdecl; external libelementary;
function efl_ui_focus_manager_root_focus_canvas_object_get(obj: PEo): PEfl_Canvas_Object; cdecl; external libelementary;
{$endif}

// === Konventiert am: 27-5-25 17:16:25 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


{$ifdef EFL_BETA_API_SUPPORT}
function EFL_UI_FOCUS_MANAGER_ROOT_FOCUS_CLASS: PEfl_Class;
begin
  EFL_UI_FOCUS_MANAGER_ROOT_FOCUS_CLASS := efl_ui_focus_manager_root_focus_class_get;
end;
{$endif}


{$ENDIF read_implementation}
