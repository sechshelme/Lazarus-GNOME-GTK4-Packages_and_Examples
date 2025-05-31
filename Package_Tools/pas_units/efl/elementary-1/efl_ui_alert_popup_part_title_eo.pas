unit efl_ui_alert_popup_part_title_eo;

interface

uses
  efl, fp_eo, fp_eina, fp_efl, fp_evas, fp_ecore, fp_edje, fp_elementary;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PEfl_Ui_Alert_Popup_Part_Title = ^TEfl_Ui_Alert_Popup_Part_Title;
  TEfl_Ui_Alert_Popup_Part_Title = TEo;

function EFL_UI_ALERT_POPUP_PART_TITLE_CLASS: PEfl_Class;

function efl_ui_alert_popup_part_title_class_get: PEfl_Class; cdecl; external libelementary;

// === Konventiert am: 31-5-25 13:09:01 ===


implementation


function EFL_UI_ALERT_POPUP_PART_TITLE_CLASS: PEfl_Class;
begin
  EFL_UI_ALERT_POPUP_PART_TITLE_CLASS := efl_ui_alert_popup_part_title_class_get;
end;


end.
