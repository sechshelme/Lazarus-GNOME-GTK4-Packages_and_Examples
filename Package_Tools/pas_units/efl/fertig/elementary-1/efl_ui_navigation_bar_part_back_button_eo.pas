unit efl_ui_navigation_bar_part_back_button_eo;

interface

uses
  efl, fp_eo, fp_eina, fp_efl, fp_evas, fp_ecore, fp_edje, fp_elementary;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PEfl_Ui_Navigation_Bar_Part_Back_Button = ^TEfl_Ui_Navigation_Bar_Part_Back_Button;
  TEfl_Ui_Navigation_Bar_Part_Back_Button = TEo;

{$ifdef EFL_BETA_API_SUPPORT}
function EFL_UI_NAVIGATION_BAR_PART_BACK_BUTTON_CLASS: PEfl_Class;

function efl_ui_navigation_bar_part_back_button_class_get: PEfl_Class; cdecl; external libelementary;
{$endif}

// === Konventiert am: 31-5-25 15:50:21 ===


implementation


{$ifdef EFL_BETA_API_SUPPORT}
function EFL_UI_NAVIGATION_BAR_PART_BACK_BUTTON_CLASS: PEfl_Class;
begin
  EFL_UI_NAVIGATION_BAR_PART_BACK_BUTTON_CLASS := efl_ui_navigation_bar_part_back_button_class_get;
end;
{$endif}


end.
