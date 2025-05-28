{$IFDEF read_interface}



const
  ELM_GENGRID_ITEM_CLASS_VERSION = ELM_GEN_ITEM_CLASS_VERSION;

type
  PElm_Gengrid_Item_Text_Get_Cb = ^TElm_Gengrid_Item_Text_Get_Cb;
  TElm_Gengrid_Item_Text_Get_Cb = TElm_Gen_Item_Text_Get_Cb;

  PElm_Gengrid_Item_Content_Get_Cb = ^TElm_Gengrid_Item_Content_Get_Cb;
  TElm_Gengrid_Item_Content_Get_Cb = TElm_Gen_Item_Content_Get_Cb;

  PElm_Gengrid_Item_State_Get_Cb = ^TElm_Gengrid_Item_State_Get_Cb;
  TElm_Gengrid_Item_State_Get_Cb = TElm_Gen_Item_State_Get_Cb;

  PElm_Gengrid_Item_Del_Cb = ^TElm_Gengrid_Item_Del_Cb;
  TElm_Gengrid_Item_Del_Cb = TElm_Gen_Item_Del_Cb;

function elm_gengrid_item_class_new: PElm_Gengrid_Item_Class; cdecl; external libelementary;
procedure elm_gengrid_item_class_free(itc: PElm_Gengrid_Item_Class); cdecl; external libelementary;
procedure elm_gengrid_item_class_ref(itc: PElm_Gengrid_Item_Class); cdecl; external libelementary;
procedure elm_gengrid_item_class_unref(itc: PElm_Gengrid_Item_Class); cdecl; external libelementary;
procedure elm_gengrid_item_tooltip_text_set(it: PElm_Object_Item; text: pchar); cdecl; external libelementary;
procedure elm_gengrid_item_tooltip_content_cb_set(it: PElm_Object_Item; func: TElm_Tooltip_Item_Content_Cb; data: pointer; del_cb: TEvas_Smart_Cb); cdecl; external libelementary;
procedure elm_gengrid_item_tooltip_unset(it: PElm_Object_Item); cdecl; external libelementary;
procedure elm_gengrid_item_tooltip_style_set(it: PElm_Object_Item; style: pchar); cdecl; external libelementary;
function elm_gengrid_item_tooltip_style_get(it: PElm_Object_Item): pchar; cdecl; external libelementary;
function elm_gengrid_item_tooltip_window_mode_set(it: PElm_Object_Item; disable: TEina_Bool): TEina_Bool; cdecl; external libelementary;
function elm_gengrid_item_tooltip_window_mode_get(it: PElm_Object_Item): TEina_Bool; cdecl; external libelementary;
procedure elm_gengrid_item_cursor_set(it: PElm_Object_Item; cursor: pchar); cdecl; external libelementary;
function elm_gengrid_item_cursor_get(it: PElm_Object_Item): pchar; cdecl; external libelementary;
procedure elm_gengrid_item_cursor_unset(it: PElm_Object_Item); cdecl; external libelementary;
procedure elm_gengrid_item_cursor_style_set(it: PElm_Object_Item; style: pchar); cdecl; external libelementary;
function elm_gengrid_item_cursor_style_get(it: PElm_Object_Item): pchar; cdecl; external libelementary;
procedure elm_gengrid_item_cursor_engine_only_set(it: PElm_Object_Item; engine_only: TEina_Bool); cdecl; external libelementary;
function elm_gengrid_item_cursor_engine_only_get(it: PElm_Object_Item): TEina_Bool; cdecl; external libelementary;
procedure elm_gengrid_item_pos_get(it: PElm_Object_Item; x: Pdword; y: Pdword); cdecl; external libelementary;
procedure elm_gengrid_item_select_mode_set(it: PElm_Object_Item; mode: TElm_Object_Select_Mode); cdecl; external libelementary;
function elm_gengrid_item_select_mode_get(it: PElm_Object_Item): TElm_Object_Select_Mode; cdecl; external libelementary;

// === Konventiert am: 27-5-25 16:50:28 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
