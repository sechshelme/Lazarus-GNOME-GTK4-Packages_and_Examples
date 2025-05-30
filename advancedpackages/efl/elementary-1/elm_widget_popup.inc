{$IFDEF read_interface}


const
  ELM_POPUP_ACTION_BUTTON_MAX = 3;

type
  PElm_Popup_Data = ^TElm_Popup_Data;
  TElm_Popup_Data = record
  end;

type
  PElm_Popup_Item_Data = ^TElm_Popup_Item_Data;
  TElm_Popup_Item_Data = record
  end;

type
  TAction_Area_Data = record
    obj: PEvas_Object;
    btn: PEvas_Object;
    delete_me: TEina_Bool;
  end;
  PAction_Area_Data = ^TAction_Area_Data;

  // === Konventiert am: 30-5-25 14:00:44 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


{$ENDIF read_implementation}
