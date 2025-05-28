{$IFDEF read_interface}



const
  ELM_GENLIST_ITEM_CLASS_VERSION = ELM_GEN_ITEM_CLASS_VERSION;

type
  PElm_Genlist_Item_Text_Get_Cb = ^TElm_Genlist_Item_Text_Get_Cb;
  TElm_Genlist_Item_Text_Get_Cb = TElm_Gen_Item_Text_Get_Cb;

  PElm_Genlist_Item_Content_Get_Cb = ^TElm_Genlist_Item_Content_Get_Cb;
  TElm_Genlist_Item_Content_Get_Cb = TElm_Gen_Item_Content_Get_Cb;

  PElm_Genlist_Item_State_Get_Cb = ^TElm_Genlist_Item_State_Get_Cb;
  TElm_Genlist_Item_State_Get_Cb = TElm_Gen_Item_State_Get_Cb;

  PElm_Genlist_Item_Del_Cb = ^TElm_Genlist_Item_Del_Cb;
  TElm_Genlist_Item_Del_Cb = TElm_Gen_Item_Del_Cb;

  PElm_Genlist_Item_Filter_Get_Cb = ^TElm_Genlist_Item_Filter_Get_Cb;
  TElm_Genlist_Item_Filter_Get_Cb = TElm_Gen_Item_Filter_Get_Cb;

  PElm_Genlist_Reusable_Content_Get_Cb = ^TElm_Genlist_Reusable_Content_Get_Cb;
  TElm_Genlist_Reusable_Content_Get_Cb = TElm_Gen_Item_Reusable_Content_Get_Cb;

function elm_genlist_item_class_new: PElm_Genlist_Item_Class; cdecl; external libelementary;
procedure elm_genlist_item_class_free(itc: PElm_Genlist_Item_Class); cdecl; external libelementary;
procedure elm_genlist_item_class_ref(itc: PElm_Genlist_Item_Class); cdecl; external libelementary;
procedure elm_genlist_item_class_unref(itc: PElm_Genlist_Item_Class); cdecl; external libelementary;
procedure elm_genlist_item_tooltip_text_set(it: PElm_Object_Item; text: pchar); cdecl; external libelementary;
procedure elm_genlist_item_tooltip_content_cb_set(it: PElm_Object_Item; func: TElm_Tooltip_Item_Content_Cb; data: pointer; del_cb: TEvas_Smart_Cb); cdecl; external libelementary;
procedure elm_genlist_item_tooltip_unset(it: PElm_Object_Item); cdecl; external libelementary;
procedure elm_genlist_item_tooltip_style_set(it: PElm_Object_Item; style: pchar); cdecl; external libelementary;
function elm_genlist_item_tooltip_style_get(it: PElm_Object_Item): pchar; cdecl; external libelementary;
function elm_genlist_item_tooltip_window_mode_set(it: PElm_Object_Item; disable: TEina_Bool): TEina_Bool; cdecl; external libelementary;
function elm_genlist_item_tooltip_window_mode_get(it: PElm_Object_Item): TEina_Bool; cdecl; external libelementary;
procedure elm_genlist_item_cursor_set(it: PElm_Object_Item; cursor: pchar); cdecl; external libelementary;
function elm_genlist_item_cursor_get(it: PElm_Object_Item): pchar; cdecl; external libelementary;
procedure elm_genlist_item_cursor_unset(it: PElm_Object_Item); cdecl; external libelementary;
procedure elm_genlist_item_cursor_style_set(it: PElm_Object_Item; style: pchar); cdecl; external libelementary;
function elm_genlist_item_cursor_style_get(it: PElm_Object_Item): pchar; cdecl; external libelementary;
procedure elm_genlist_item_cursor_engine_only_set(it: PElm_Object_Item; engine_only: TEina_Bool); cdecl; external libelementary;
function elm_genlist_item_cursor_engine_only_get(it: PElm_Object_Item): TEina_Bool; cdecl; external libelementary;

// === Konventiert am: 27-5-25 17:44:27 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
