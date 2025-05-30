{$IFDEF read_interface}


type
  PMultibuttonentry_Pos = ^TMultibuttonentry_Pos;
  TMultibuttonentry_Pos = longint;

const
  MULTIBUTTONENTRY_POS_START = 0;
  MULTIBUTTONENTRY_POS_END = 1;
  MULTIBUTTONENTRY_POS_BEFORE = 2;
  MULTIBUTTONENTRY_POS_AFTER = 3;

type
  PMultibuttonentry_Button_State = ^TMultibuttonentry_Button_State;
  TMultibuttonentry_Button_State = longint;

const
  MULTIBUTTONENTRY_BUTTON_STATE_DEFAULT = 0;
  MULTIBUTTONENTRY_BUTTON_STATE_SELECTED = 1;

type
  PMultiButtonEntry_Closed_Button_Type = ^TMultiButtonEntry_Closed_Button_Type;
  TMultiButtonEntry_Closed_Button_Type = longint;

const
  MULTIBUTTONENTRY_CLOSED_IMAGE = 0;
  MULTIBUTTONENTRY_CLOSED_LABEL = 1;

type
  PMultibuttonentry_View_State = ^TMultibuttonentry_View_State;
  TMultibuttonentry_View_State = longint;

const
  MULTIBUTTONENTRY_VIEW_NONE = 0;
  MULTIBUTTONENTRY_VIEW_GUIDETEXT = 1;
  MULTIBUTTONENTRY_VIEW_ENTRY = 2;
  MULTIBUTTONENTRY_VIEW_SHRINK = 3;

type
  TMultibuttonentry_Item = record
  end;
  PMultibuttonentry_Item = ^TMultibuttonentry_Item;

  TElm_Multibuttonentry_Item_Data = TMultibuttonentry_Item;
  PElm_Multibuttonentry_Item_Data = ^TElm_Multibuttonentry_Item_Data;

type
  TElm_Multibuttonentry_Item_Filter = record
    callback_func: TElm_Multibuttonentry_Item_Filter_Cb;
    data: pointer;
  end;
  PElm_Multibuttonentry_Item_Filter = ^TElm_Multibuttonentry_Item_Filter;

  PElm_Multibuttonentry_Data = ^TElm_Multibuttonentry_Data;
  TElm_Multibuttonentry_Data = record
  end;


  // === Konventiert am: 28-5-25 19:48:50 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


{$ENDIF read_implementation}
