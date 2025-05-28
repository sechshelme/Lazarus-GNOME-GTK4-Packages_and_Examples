{$IFDEF read_interface}

type
  PElm_Object_Item = ^TElm_Object_Item;
  TElm_Object_Item = TEo;

  TElm_Object_Item_Signal_Cb = procedure(data: pointer; it: PElm_Object_Item; emission: pchar; source: pchar); cdecl;

type
  PElm_Widget_Item = ^TElm_Widget_Item;
  TElm_Widget_Item = TEo;

function elm_object_item_tooltip_window_mode_set(obj: PElm_Widget_Item; disable: TEina_Bool): TEina_Bool; cdecl; external libelementary;
function elm_object_item_tooltip_window_mode_get(obj: PElm_Widget_Item): TEina_Bool; cdecl; external libelementary;
procedure elm_object_item_tooltip_style_set(obj: PElm_Widget_Item; style: pchar); cdecl; external libelementary;
function elm_object_item_tooltip_style_get(obj: PElm_Widget_Item): pchar; cdecl; external libelementary;
procedure elm_object_item_cursor_set(obj: PElm_Widget_Item; cursor: pchar); cdecl; external libelementary;
function elm_object_item_cursor_get(obj: PElm_Widget_Item): pchar; cdecl; external libelementary;
procedure elm_object_item_cursor_style_set(obj: PElm_Widget_Item; style: pchar); cdecl; external libelementary;
function elm_object_item_cursor_style_get(obj: PElm_Widget_Item): pchar; cdecl; external libelementary;
procedure elm_object_item_cursor_engine_only_set(obj: PElm_Widget_Item; engine_only: TEina_Bool); cdecl; external libelementary;
function elm_object_item_cursor_engine_only_get(obj: PElm_Widget_Item): TEina_Bool; cdecl; external libelementary;
procedure elm_object_item_part_content_set(obj: PElm_Widget_Item; part: pchar; content: PEfl_Canvas_Object); cdecl; external libelementary;
function elm_object_item_part_content_get(obj: PElm_Widget_Item; part: pchar): PEfl_Canvas_Object; cdecl; external libelementary;
procedure elm_object_item_part_text_set(obj: PElm_Widget_Item; part: pchar; _label: pchar); cdecl; external libelementary;
function elm_object_item_part_text_get(obj: PElm_Widget_Item; part: pchar): pchar; cdecl; external libelementary;
procedure elm_object_item_focus_set(obj: PElm_Widget_Item; focused: TEina_Bool); cdecl; external libelementary;
function elm_object_item_focus_get(obj: PElm_Widget_Item): TEina_Bool; cdecl; external libelementary;
procedure elm_object_item_style_set(obj: PElm_Widget_Item; style: pchar); cdecl; external libelementary;
function elm_object_item_style_get(obj: PElm_Widget_Item): pchar; cdecl; external libelementary;
procedure elm_object_item_disabled_set(obj: PElm_Widget_Item; disable: TEina_Bool); cdecl; external libelementary;
function elm_object_item_disabled_get(obj: PElm_Widget_Item): TEina_Bool; cdecl; external libelementary;
function elm_object_item_access_order_get(obj: PElm_Widget_Item): PEina_List; cdecl; external libelementary;
procedure elm_object_item_access_order_set(obj: PElm_Widget_Item; objs: PEina_List); cdecl; external libelementary;
function elm_object_item_widget_get(obj: PElm_Widget_Item): PEfl_Canvas_Object; cdecl; external libelementary;
procedure elm_object_item_tooltip_text_set(obj: PElm_Widget_Item; text: pchar); cdecl; external libelementary;
procedure elm_object_item_tooltip_unset(obj: PElm_Widget_Item); cdecl; external libelementary;
procedure elm_object_item_cursor_unset(obj: PElm_Widget_Item); cdecl; external libelementary;
function elm_object_item_part_content_unset(obj: PElm_Widget_Item; part: pchar): PEfl_Canvas_Object; cdecl; external libelementary;
procedure elm_object_item_signal_callback_add(obj: PElm_Widget_Item; emission: pchar; source: pchar; func: TElm_Object_Item_Signal_Cb; data: pointer); cdecl; external libelementary;
function elm_object_item_signal_callback_del(obj: PElm_Widget_Item; emission: pchar; source: pchar; func: TElm_Object_Item_Signal_Cb): pointer; cdecl; external libelementary;
procedure elm_object_item_signal_emit(obj: PElm_Widget_Item; emission: pchar; source: pchar); cdecl; external libelementary;
procedure elm_object_item_access_info_set(obj: PElm_Widget_Item; txt: pchar); cdecl; external libelementary;
function elm_object_item_access_object_get(obj: PElm_Widget_Item): PEfl_Canvas_Object; cdecl; external libelementary;
procedure elm_object_item_domain_translatable_part_text_set(obj: PElm_Widget_Item; part: pchar; domain: pchar; _label: pchar); cdecl; external libelementary;
function elm_object_item_translatable_part_text_get(obj: PElm_Widget_Item; part: pchar): pchar; cdecl; external libelementary;
procedure elm_object_item_domain_part_text_translatable_set(obj: PElm_Widget_Item; part: pchar; domain: pchar; translatable: TEina_Bool); cdecl; external libelementary;
function elm_object_item_track(obj: PElm_Widget_Item): PEfl_Canvas_Object; cdecl; external libelementary;
procedure elm_object_item_untrack(obj: PElm_Widget_Item); cdecl; external libelementary;
function elm_object_item_track_get(obj: PElm_Widget_Item): longint; cdecl; external libelementary;
procedure elm_object_item_del_cb_set(obj: PElm_Widget_Item; del_cb: TEvas_Smart_Cb); cdecl; external libelementary;
procedure elm_object_item_tooltip_content_cb_set(obj: PElm_Widget_Item; func: TElm_Tooltip_Item_Content_Cb; data: pointer; del_cb: TEvas_Smart_Cb); cdecl; external libelementary;
function elm_object_item_access_register(obj: PElm_Widget_Item): PEfl_Canvas_Object; cdecl; external libelementary;
procedure elm_object_item_access_unregister(obj: PElm_Widget_Item); cdecl; external libelementary;
procedure elm_object_item_access_order_unset(obj: PElm_Widget_Item); cdecl; external libelementary;
function elm_object_item_focus_next_object_get(obj: PElm_Widget_Item; dir: TElm_Focus_Direction): PEfl_Canvas_Object; cdecl; external libelementary;
procedure elm_object_item_focus_next_object_set(obj: PElm_Widget_Item; next: PEfl_Canvas_Object; dir: TElm_Focus_Direction); cdecl; external libelementary;
function elm_object_item_focus_next_item_get(obj: PElm_Widget_Item; dir: TElm_Focus_Direction): PElm_Widget_Item; cdecl; external libelementary;
procedure elm_object_item_focus_next_item_set(obj: PElm_Widget_Item; next_item: PElm_Widget_Item; dir: TElm_Focus_Direction); cdecl; external libelementary;

// === Konventiert am: 23-5-25 17:50:34 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
