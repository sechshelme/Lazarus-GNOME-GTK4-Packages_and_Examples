{$IFDEF read_interface}

const
  SWIPE_MOVES = 12;

type
  PElm_Genlist_Item_Move_Effect_Mode = ^TElm_Genlist_Item_Move_Effect_Mode;
  TElm_Genlist_Item_Move_Effect_Mode = longint;

const
  ELM_GENLIST_TREE_EFFECT_NONE = 0;
  ELM_GENLIST_TREE_EFFECT_EXPAND = 1;
  ELM_GENLIST_TREE_EFFECT_CONTRACT = 2;

type
  TElm_Genlist_Data = bitpacked record
  end;
  PElm_Genlist_Data = ^TElm_Genlist_Data;

type
  TElm_Gen_Item_Type = record
  end;
  PElm_Gen_Item_Type = ^TElm_Gen_Item_Type;

  TItem_Block = record
  end;
  PItem_Block = ^TItem_Block;

type
  TItem_Cache = record
  end;
  PItem_Cache = ^TItem_Cache;

type
  TItem_Size = record
    itc: PElm_Genlist_Item_Class;
    minw: TEvas_Coord;
    minh: TEvas_Coord;
    expanded_depth: longint;
  end;
  PItem_Size = ^TItem_Size;

  TElm_Genlist_Pan_Data = record
    wobj: PEvas_Object;
    wsd: PElm_Genlist_Data;
    resize_job: PEcore_Job;
  end;
  PElm_Genlist_Pan_Data = ^TElm_Genlist_Pan_Data;

  TElm_Genlist_Filter = record
    iterator: TEina_Iterator;
    head: PEina_Inlist;
    current: PEina_Inlist;
    obj: PEvas_Object;
  end;
  PElm_Genlist_Filter = ^TElm_Genlist_Filter;


  // === Konventiert am: 26-5-25 17:32:00 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


{$ENDIF read_implementation}
