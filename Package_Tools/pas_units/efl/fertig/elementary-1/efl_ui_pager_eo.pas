unit efl_ui_pager_eo;

interface

uses
  efl, fp_eo, fp_eina, fp_efl, fp_evas, fp_ecore, fp_edje, fp_elementary;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PEfl_Ui_Pager = ^TEfl_Ui_Pager;
  TEfl_Ui_Pager = TEo;

function EFL_UI_PAGER_CLASS: PEfl_Class;

function efl_ui_pager_class_get: PEfl_Class; cdecl; external libelementary;

// === Konventiert am: 31-5-25 17:09:27 ===


implementation


function EFL_UI_PAGER_CLASS: PEfl_Class;
begin
  EFL_UI_PAGER_CLASS := efl_ui_pager_class_get;
end;


end.
