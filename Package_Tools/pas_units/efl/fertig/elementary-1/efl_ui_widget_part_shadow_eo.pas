unit efl_ui_widget_part_shadow_eo;

interface

uses
  efl, fp_eo, fp_eina, fp_efl, fp_evas, fp_ecore, fp_edje, fp_elementary;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PEfl_Ui_Widget_Part_Shadow = ^TEfl_Ui_Widget_Part_Shadow;
  TEfl_Ui_Widget_Part_Shadow = TEo;

function EFL_UI_WIDGET_PART_SHADOW_CLASS: PEfl_Class;

function efl_ui_widget_part_shadow_class_get: PEfl_Class; cdecl; external libelementary;

// === Konventiert am: 31-5-25 19:32:55 ===


implementation


function EFL_UI_WIDGET_PART_SHADOW_CLASS: PEfl_Class;
begin
  EFL_UI_WIDGET_PART_SHADOW_CLASS := efl_ui_widget_part_shadow_class_get;
end;


end.
