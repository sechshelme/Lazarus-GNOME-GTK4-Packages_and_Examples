{$IFDEF read_interface}


type
  PTags_View_State = ^TTags_View_State;
  TTags_View_State = longint;

const
  TAGS_VIEW_NONE = 0;
  TAGS_VIEW_GUIDETEXT = 1;
  TAGS_VIEW_ENTRY = 2;
  TAGS_VIEW_SHRINK = 3;

type
  PTags_It_State = ^TTags_It_State;
  TTags_It_State = longint;

const
  TAGS_IT_STATE_DEFAULT = 0;
  TAGS_IT_STATE_SELECTED = 1;

type
  PEfl_Ui_Tags_Data = ^TEfl_Ui_Tags_Data;
  TEfl_Ui_Tags_Data = record
  end;


  // === Konventiert am: 31-5-25 19:14:03 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


{$ENDIF read_implementation}
