{$IFDEF read_interface}


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


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
