unit efl_ui_scroller_eo;

interface

uses
  efl, fp_eo, fp_eina, fp_efl, fp_evas, fp_ecore, fp_edje, fp_elementary;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PEfl_Ui_Scroller = ^TEfl_Ui_Scroller;
  TEfl_Ui_Scroller = TEo;

function EFL_UI_SCROLLER_CLASS: PEfl_Class;

function efl_ui_scroller_class_get: PEfl_Class; cdecl; external libelementary;

// === Konventiert am: 31-5-25 17:22:13 ===


implementation


function EFL_UI_SCROLLER_CLASS: PEfl_Class;
begin
  EFL_UI_SCROLLER_CLASS := efl_ui_scroller_class_get;
end;


end.
