unit efl_ui_spotlight_util_eo;

interface

uses
  efl, fp_eo, fp_eina, fp_efl, fp_evas, fp_ecore, fp_edje, efl_ui_widget_eo, efl_ui_spotlight_manager_eo;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PEfl_Ui_Spotlight_Util = ^TEfl_Ui_Spotlight_Util;
  TEfl_Ui_Spotlight_Util = TEo;

{$ifdef EFL_BETA_API_SUPPORT}
function EFL_UI_SPOTLIGHT_UTIL_CLASS: PEfl_Class;

function efl_ui_spotlight_util_class_get: PEfl_Class; cdecl; external libelementary;
function efl_ui_spotlight_util_stack_gen(parent: PEfl_Ui_Widget): PEfl_Ui_Spotlight_Container; cdecl; external libelementary;
{$endif}

// === Konventiert am: 27-5-25 19:41:35 ===


implementation


{$ifdef EFL_BETA_API_SUPPORT}
function EFL_UI_SPOTLIGHT_UTIL_CLASS: PEfl_Class;
begin
  EFL_UI_SPOTLIGHT_UTIL_CLASS := efl_ui_spotlight_util_class_get;
end;
{$endif}


end.
