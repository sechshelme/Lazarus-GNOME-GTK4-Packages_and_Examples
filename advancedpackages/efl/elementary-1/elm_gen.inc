{$IFDEF read_interface}

type
  TElm_Gen_Item = record
  end;
  PElm_Gen_Item = ^TElm_Gen_Item;

type
  PElm_Glob_Match_Flags = ^TElm_Glob_Match_Flags;
  TElm_Glob_Match_Flags = longint;

const
  ELM_GLOB_MATCH_NO_ESCAPE = 1;
  ELM_GLOB_MATCH_PATH = 2;
  ELM_GLOB_MATCH_PERIOD = 4;
  ELM_GLOB_MATCH_NOCASE = 8;

type
  PElm_Gen_Item_Text_Get_Cb = ^TElm_Gen_Item_Text_Get_Cb;
  TElm_Gen_Item_Text_Get_Cb = function(data: pointer; obj: PEvas_Object; part: pchar): pchar; cdecl;

  PElm_Gen_Item_Content_Get_Cb = ^TElm_Gen_Item_Content_Get_Cb;
  TElm_Gen_Item_Content_Get_Cb = function(data: pointer; obj: PEvas_Object; part: pchar): PEvas_Object; cdecl;

  TElm_Gen_Item_State_Get_Cb = function(data: pointer; obj: PEvas_Object; part: pchar): TEina_Bool; cdecl;
  TElm_Gen_Item_Del_Cb = procedure(data: pointer; obj: PEvas_Object); cdecl;
  TElm_Gen_Item_Filter_Get_Cb = function(data: pointer; obj: PEvas_Object; key: pointer): TEina_Bool; cdecl;

  PElm_Gen_Item_Reusable_Content_Get_Cb = ^TElm_Gen_Item_Reusable_Content_Get_Cb;
  TElm_Gen_Item_Reusable_Content_Get_Cb = function(data: pointer; obj: PEvas_Object; part: pchar; old: PEvas_Object): PEvas_Object; cdecl;

const
  ELM_GEN_ITEM_CLASS_VERSION = 4;

type
  TElm_Gen_Item_Class_Functions = record
    text_get: TElm_Gen_Item_Text_Get_Cb;
    content_get: TElm_Gen_Item_Content_Get_Cb;
    state_get: TElm_Gen_Item_State_Get_Cb;
    del: TElm_Gen_Item_Del_Cb;
    filter_get: TElm_Gen_Item_Filter_Get_Cb;
    reusable_content_get: TElm_Gen_Item_Reusable_Content_Get_Cb;
  end;
  PElm_Gen_Item_Class_Functions = ^TElm_Gen_Item_Class_Functions;

  TElm_Gen_Item_Class = record
    version: longint;
    refcount: dword;
    delete_me: TEina_Bool;
    item_style: pchar;
    decorate_item_style: pchar;
    decorate_all_item_style: pchar;
    func: TElm_Gen_Item_Class_Functions;
  end;
  PElm_Gen_Item_Class = ^TElm_Gen_Item_Class;

  PElm_Gengrid_Item_Class = ^TElm_Gengrid_Item_Class;
  TElm_Gengrid_Item_Class = TElm_Gen_Item_Class;

  PElm_Genlist_Item_Class = ^TElm_Genlist_Item_Class;
  TElm_Genlist_Item_Class = TElm_Gen_Item_Class;

  // === Konventiert am: 26-5-25 13:20:26 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
