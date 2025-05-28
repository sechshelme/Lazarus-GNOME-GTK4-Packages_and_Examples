{$IFDEF read_interface}


type
  PEfl_Ui_Focus_Manager_Calc = ^TEfl_Ui_Focus_Manager_Calc;
  TEfl_Ui_Focus_Manager_Calc = TEo;

{$ifdef EFL_BETA_API_SUPPORT}
function EFL_UI_FOCUS_MANAGER_CALC_CLASS: PEfl_Class;

function efl_ui_focus_manager_calc_class_get: PEfl_Class; cdecl; external libelementary;
function efl_ui_focus_manager_calc_register(obj: PEo; child: PEfl_Ui_Focus_Object; parent: PEfl_Ui_Focus_Object; redirect: PEfl_Ui_Focus_Manager): TEina_Bool; cdecl; external libelementary;
function efl_ui_focus_manager_calc_register_logical(obj: PEo; child: PEfl_Ui_Focus_Object; parent: PEfl_Ui_Focus_Object; redirect: PEfl_Ui_Focus_Manager): TEina_Bool; cdecl; external libelementary;
function efl_ui_focus_manager_calc_update_redirect(obj: PEo; child: PEfl_Ui_Focus_Object; redirect: PEfl_Ui_Focus_Manager): TEina_Bool; cdecl; external libelementary;
function efl_ui_focus_manager_calc_update_parent(obj: PEo; child: PEfl_Ui_Focus_Object; parent: PEfl_Ui_Focus_Object): TEina_Bool; cdecl; external libelementary;
procedure efl_ui_focus_manager_calc_unregister(obj: PEo; child: PEfl_Ui_Focus_Object); cdecl; external libelementary;
{$endif}

// === Konventiert am: 27-5-25 17:16:22 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


{$ifdef EFL_BETA_API_SUPPORT}
function EFL_UI_FOCUS_MANAGER_CALC_CLASS: PEfl_Class;
begin
  EFL_UI_FOCUS_MANAGER_CALC_CLASS := efl_ui_focus_manager_calc_class_get;
end;
{$endif}


{$ENDIF read_implementation}
