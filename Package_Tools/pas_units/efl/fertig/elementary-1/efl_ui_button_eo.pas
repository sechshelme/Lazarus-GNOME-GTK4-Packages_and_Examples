unit efl_ui_button_eo;

interface

uses
  efl, fp_eo, fp_eina, fp_efl, fp_evas, fp_ecore, fp_edje, fp_elementary;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PEfl_Ui_Button = ^TEfl_Ui_Button;
  TEfl_Ui_Button = TEo;

function EFL_UI_BUTTON_CLASS: PEfl_Class;

function efl_ui_button_class_get: PEfl_Class; cdecl; external libelementary;

// === Konventiert am: 31-5-25 13:24:42 ===


implementation


function EFL_UI_BUTTON_CLASS: PEfl_Class;
begin
  EFL_UI_BUTTON_CLASS := efl_ui_button_class_get;
end;


end.
