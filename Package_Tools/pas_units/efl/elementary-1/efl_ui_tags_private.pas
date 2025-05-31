unit efl_ui_tags_private;

interface

uses
  efl, fp_eo, fp_eina, fp_efl, fp_evas, fp_ecore, fp_edje, fp_elementary;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


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


implementation


end.
