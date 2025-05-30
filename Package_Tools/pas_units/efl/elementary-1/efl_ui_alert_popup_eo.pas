unit efl_ui_alert_popup_eo;

interface

uses
  efl, fp_eo, fp_eina, fp_efl, fp_evas, fp_ecore, fp_edje, fp_elementary;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PEfl_Ui_Alert_Popup = ^TEfl_Ui_Alert_Popup;
  TEfl_Ui_Alert_Popup = TEo;

type
  PEfl_Ui_Alert_Popup_Button = ^TEfl_Ui_Alert_Popup_Button;
  TEfl_Ui_Alert_Popup_Button = longint;

const
  EFL_UI_ALERT_POPUP_BUTTON_POSITIVE = 0;
  EFL_UI_ALERT_POPUP_BUTTON_NEGATIVE = 1;
  EFL_UI_ALERT_POPUP_BUTTON_USER = 2;

type
  TEfl_Ui_Alert_Popup_Button_Clicked_Event = record
    button_type: TEfl_Ui_Alert_Popup_Button;
  end;
  PEfl_Ui_Alert_Popup_Button_Clicked_Event = ^TEfl_Ui_Alert_Popup_Button_Clicked_Event;

function EFL_UI_ALERT_POPUP_CLASS: PEfl_Config;

function efl_ui_alert_popup_class_get: PEfl_Class; cdecl; external libelementary;
procedure efl_ui_alert_popup_button_set(obj: PEo; _type: TEfl_Ui_Alert_Popup_Button; text: pchar; icon: PEfl_Canvas_Object); cdecl; external libelementary;

var
  _EFL_UI_ALERT_POPUP_EVENT_BUTTON_CLICKED: TEfl_Event_Description; cvar;external libelementary;

function EFL_UI_ALERT_POPUP_EVENT_BUTTON_CLICKED: PEfl_Event_Description;

// === Konventiert am: 30-5-25 17:16:35 ===


implementation


function EFL_UI_ALERT_POPUP_CLASS: PEfl_Config;
begin
  EFL_UI_ALERT_POPUP_CLASS := efl_ui_alert_popup_class_get;
end;

function EFL_UI_ALERT_POPUP_EVENT_BUTTON_CLICKED: PEfl_Event_Description;
begin
  EFL_UI_ALERT_POPUP_EVENT_BUTTON_CLICKED := @(_EFL_UI_ALERT_POPUP_EVENT_BUTTON_CLICKED);
end;


end.
