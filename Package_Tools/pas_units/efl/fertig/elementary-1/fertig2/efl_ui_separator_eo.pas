unit efl_ui_separator_eo;

interface

uses
  efl, fp_eo, fp_eina, fp_efl, fp_evas, fp_ecore, fp_edje, fp_elementary;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PEfl_Ui_Separator = ^TEfl_Ui_Separator;
  TEfl_Ui_Separator = TEo;

function EFL_UI_SEPARATOR_CLASS: PEfl_Config;

function efl_ui_separator_class_get: PEfl_Class; cdecl; external libelementary;

// === Konventiert am: 30-5-25 15:42:28 ===


implementation


function EFL_UI_SEPARATOR_CLASS: PEfl_Config;
begin
  EFL_UI_SEPARATOR_CLASS := efl_ui_separator_class_get;
end;


end.
