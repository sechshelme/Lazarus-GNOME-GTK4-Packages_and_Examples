{$IFDEF read_interface}


type
  PElm_Multibuttonentry = ^TElm_Multibuttonentry;
  TElm_Multibuttonentry = TEo;

procedure elm_multibuttonentry_editable_set(obj: PElm_Multibuttonentry; editable: TEina_Bool); cdecl; external libelementary;
function elm_multibuttonentry_editable_get(obj: PElm_Multibuttonentry): TEina_Bool; cdecl; external libelementary;
procedure elm_multibuttonentry_expanded_set(obj: PElm_Multibuttonentry; expanded: TEina_Bool); cdecl; external libelementary;
function elm_multibuttonentry_expanded_get(obj: PElm_Multibuttonentry): TEina_Bool; cdecl; external libelementary;
procedure elm_multibuttonentry_format_function_set(obj: PElm_Multibuttonentry; format_function: TElm_Multibuttonentry_Format_Cb; data: pointer); cdecl; external libelementary;
function elm_multibuttonentry_items_get(obj: PElm_Multibuttonentry): PEina_List; cdecl; external libelementary;
function elm_multibuttonentry_first_item_get(obj: PElm_Multibuttonentry): PElm_Widget_Item; cdecl; external libelementary;
function elm_multibuttonentry_last_item_get(obj: PElm_Multibuttonentry): PElm_Widget_Item; cdecl; external libelementary;
function elm_multibuttonentry_entry_get(obj: PElm_Multibuttonentry): PEfl_Canvas_Object; cdecl; external libelementary;
function elm_multibuttonentry_selected_item_get(obj: PElm_Multibuttonentry): PElm_Widget_Item; cdecl; external libelementary;
function elm_multibuttonentry_item_prepend(obj: PElm_Multibuttonentry; _label: pchar; func: TEvas_Smart_Cb; data: pointer): PElm_Widget_Item; cdecl; external libelementary;
procedure elm_multibuttonentry_clear(obj: PElm_Multibuttonentry); cdecl; external libelementary;
procedure elm_multibuttonentry_item_filter_remove(obj: PElm_Multibuttonentry; func: TElm_Multibuttonentry_Item_Filter_Cb; data: pointer); cdecl; external libelementary;
function elm_multibuttonentry_item_insert_before(obj: PElm_Multibuttonentry; before: PElm_Widget_Item; _label: pchar; func: TEvas_Smart_Cb; data: pointer): PElm_Widget_Item; cdecl; external libelementary;
function elm_multibuttonentry_item_append(obj: PElm_Multibuttonentry; _label: pchar; func: TEvas_Smart_Cb; data: pointer): PElm_Widget_Item; cdecl; external libelementary;
procedure elm_multibuttonentry_item_filter_prepend(obj: PElm_Multibuttonentry; func: TElm_Multibuttonentry_Item_Filter_Cb; data: pointer); cdecl; external libelementary;
procedure elm_multibuttonentry_item_filter_append(obj: PElm_Multibuttonentry; func: TElm_Multibuttonentry_Item_Filter_Cb; data: pointer); cdecl; external libelementary;
function elm_multibuttonentry_item_insert_after(obj: PElm_Multibuttonentry; after: PElm_Widget_Item; _label: pchar; func: TEvas_Smart_Cb; data: pointer): PElm_Widget_Item; cdecl; external libelementary;

// === Konventiert am: 28-5-25 15:57:14 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
