unit efl_ui_alert_popup_private;

interface

uses
  efl, fp_eo, fp_eina, fp_efl, fp_evas, fp_ecore, fp_edje, fp_elementary;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PEfl_Ui_Alert_Popup_Button_Type = ^TEfl_Ui_Alert_Popup_Button_Type;
  TEfl_Ui_Alert_Popup_Button_Type = longint;

const
  EFL_UI_ALERT_POPUP_BUTTON_1 = 0;
  EFL_UI_ALERT_POPUP_BUTTON_2 = 1;
  EFL_UI_ALERT_POPUP_BUTTON_3 = 2;
  EFL_UI_ALERT_POPUP_BUTTON_COUNT = 3;

type
  TEfl_Ui_Alert_Popup_Data = record
    title_text: pchar;
    button: array[0..(EFL_UI_ALERT_POPUP_BUTTON_COUNT) - 1] of PEvas_Object;
    button_layout: array[0..(EFL_UI_ALERT_POPUP_BUTTON_COUNT) - 1] of PEvas_Object;
  end;
  PEfl_Ui_Alert_Popup_Data = ^TEfl_Ui_Alert_Popup_Data;


  // === Konventiert am: 31-5-25 13:09:04 ===


implementation



end.
