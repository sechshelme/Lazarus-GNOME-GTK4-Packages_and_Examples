unit efl_ui_widget_focus_manager_eo;

interface

uses
  efl, fp_eo, fp_eina, fp_efl, fp_evas, fp_ecore, fp_edje, fp_elementary;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PEfl_Ui_Widget_Focus_Manager = ^TEfl_Ui_Widget_Focus_Manager;
  TEfl_Ui_Widget_Focus_Manager = TEo;

function EFL_UI_WIDGET_FOCUS_MANAGER_MIXIN: PEfl_Class;

function efl_ui_widget_focus_manager_mixin_get: PEfl_Class; cdecl; external libelementary;
function efl_ui_widget_focus_manager_create(obj: PEo; root: PEfl_Ui_Focus_Object): PEfl_Ui_Focus_Manager; cdecl; external libelementary;

// === Konventiert am: 31-5-25 19:32:44 ===


implementation


function EFL_UI_WIDGET_FOCUS_MANAGER_MIXIN: PEfl_Class;
begin
  EFL_UI_WIDGET_FOCUS_MANAGER_MIXIN := efl_ui_widget_focus_manager_mixin_get;
end;


end.
