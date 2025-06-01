unit efl_ui_popup_part_backwall_eo;

interface

uses
  efl, fp_eo, fp_eina, fp_efl, fp_evas, fp_ecore, fp_edje, fp_elementary;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PEfl_Ui_Popup_Part_Backwall = ^TEfl_Ui_Popup_Part_Backwall;
  TEfl_Ui_Popup_Part_Backwall = TEo;

function EFL_UI_POPUP_PART_BACKWALL_CLASS: PEfl_Class;

function efl_ui_popup_part_backwall_class_get: PEfl_Class; cdecl; external libelementary;
procedure efl_ui_popup_part_backwall_repeat_events_set(obj: PEo; _repeat: TEina_Bool); cdecl; external libelementary;
function efl_ui_popup_part_backwall_repeat_events_get(obj: PEo): TEina_Bool; cdecl; external libelementary;

// === Konventiert am: 31-5-25 17:09:41 ===


implementation


function EFL_UI_POPUP_PART_BACKWALL_CLASS: PEfl_Class;
begin
  EFL_UI_POPUP_PART_BACKWALL_CLASS := efl_ui_popup_part_backwall_class_get;
end;


end.
