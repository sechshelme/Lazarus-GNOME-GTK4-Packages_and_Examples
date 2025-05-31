unit efl_ui_slider_eo;

interface

uses
  efl, fp_eo, fp_eina, fp_efl, fp_evas, fp_ecore, fp_edje, fp_elementary;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PEfl_Ui_Slider = ^TEfl_Ui_Slider;
  TEfl_Ui_Slider = TEo;

function EFL_UI_SLIDER_CLASS: PEfl_Class;

function efl_ui_slider_class_get: PEfl_Class; cdecl; external libelementary;

var
  _EFL_UI_SLIDER_EVENT_SLIDER_DRAG_START: TEfl_Event_Description; cvar;external libelementary;
  _EFL_UI_SLIDER_EVENT_SLIDER_DRAG_STOP: TEfl_Event_Description; cvar;external libelementary;

function EFL_UI_SLIDER_EVENT_SLIDER_DRAG_START: PEfl_Event_Description;
function EFL_UI_SLIDER_EVENT_SLIDER_DRAG_STOP: PEfl_Event_Description;

// === Konventiert am: 31-5-25 17:22:18 ===


implementation


function EFL_UI_SLIDER_CLASS: PEfl_Class;
begin
  EFL_UI_SLIDER_CLASS := efl_ui_slider_class_get;
end;

function EFL_UI_SLIDER_EVENT_SLIDER_DRAG_START: PEfl_Event_Description;
begin
  EFL_UI_SLIDER_EVENT_SLIDER_DRAG_START := @(_EFL_UI_SLIDER_EVENT_SLIDER_DRAG_START);
end;

function EFL_UI_SLIDER_EVENT_SLIDER_DRAG_STOP: PEfl_Event_Description;
begin
  EFL_UI_SLIDER_EVENT_SLIDER_DRAG_STOP := @(_EFL_UI_SLIDER_EVENT_SLIDER_DRAG_STOP);
end;


end.
