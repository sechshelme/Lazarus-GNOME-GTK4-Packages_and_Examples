unit efl_ui_button_legacy_part_eo;

interface

uses
  efl, fp_eo, fp_eina, fp_efl, fp_evas, fp_ecore, fp_edje, fp_elementary;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PEfl_Ui_Button_Legacy_Part = ^TEfl_Ui_Button_Legacy_Part;
  TEfl_Ui_Button_Legacy_Part = TEo;

{$ifdef EFL_BETA_API_SUPPORT}
function EFL_UI_BUTTON_LEGACY_PART_CLASS: PEfl_Class;

function efl_ui_button_legacy_part_class_get: PEfl_Class; cdecl; external libelementary;
{$endif}

// === Konventiert am: 31-5-25 13:24:51 ===


implementation


{$ifdef EFL_BETA_API_SUPPORT}
function EFL_UI_BUTTON_LEGACY_PART_CLASS: PEfl_Class;
begin
  EFL_UI_BUTTON_LEGACY_PART_CLASS := efl_ui_button_legacy_part_class_get;
end;
{$endif}


end.
