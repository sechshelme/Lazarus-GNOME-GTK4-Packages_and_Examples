unit elm_widget_naviframe;

interface

uses
  efl, fp_eo, fp_eina, fp_efl, fp_evas, fp_ecore, fp_edje, fp_elementary;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PElm_Naviframe_Data = ^TElm_Naviframe_Data;
  TElm_Naviframe_Data = record
  end;

  PElm_Naviframe_Item_Data = ^TElm_Naviframe_Item_Data;
  TElm_Naviframe_Item_Data = record
  end;

type
  PElm_Naviframe_Op = ^TElm_Naviframe_Op;
  TElm_Naviframe_Op = record
  end;

type
  TElm_Naviframe_Content_Item_Pair = record
    __in_list: TEina_Inlist;
    part: pchar;
    content: PEvas_Object;
    it: PElm_Naviframe_Item_Data;
  end;
  PElm_Naviframe_Content_Item_Pair = ^TElm_Naviframe_Content_Item_Pair;

  TElm_Naviframe_Text_Item_Pair = record
    __in_list: TEina_Inlist;
    part: pchar;
  end;
  PElm_Naviframe_Text_Item_Pair = ^TElm_Naviframe_Text_Item_Pair;



implementation


end.
