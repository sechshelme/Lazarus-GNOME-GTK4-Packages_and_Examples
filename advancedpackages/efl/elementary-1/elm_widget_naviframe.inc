{$IFDEF read_interface}


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



{$ENDIF read_interface}


{$IFDEF read_implementation}


{$ENDIF read_implementation}
