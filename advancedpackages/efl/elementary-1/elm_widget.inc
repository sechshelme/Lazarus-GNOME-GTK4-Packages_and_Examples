{$IFDEF read_interface}


type
  TElm_Widget_Del_Pre_Cb = function(data: pointer): TEina_Bool; cdecl;
  TElm_Widget_Item_Signal_Cb = procedure(data: pointer; item: PElm_Object_Item; emission: pchar; source: pchar); cdecl;
  TElm_Access_On_Highlight_Cb = procedure(data: pointer); cdecl;

  TElm_Widget_On_Show_Region_Cb = procedure(data: pointer; obj: PEvas_Object; region: TEina_Rect); cdecl;

type
  TElm_Widget_Smart_Data = record
  end;
  PElm_Widget_Smart_Data = ^TElm_Widget_Smart_Data;

  TElm_Widget_Item_Data = record
  end;
  PElm_Widget_Item_Data = ^TElm_Widget_Item_Data;

type
  PEfl_Ui_Widget_Data = ^TEfl_Ui_Widget_Data;
  TEfl_Ui_Widget_Data = TElm_Widget_Smart_Data;

  TElm_Cursor = record
  end;
  PElm_Cursor = ^TElm_Cursor;

  TElm_Tooltip = record
  end;
  PElm_Tooltip = ^TElm_Tooltip;

const
  ELM_ACCESS_DONE = -(1);
  ELM_ACCESS_CANCEL = -(2);

type
  PElm_Access_Item = ^TElm_Access_Item;

  TElm_Access_Item = record
    _type: longint;
    data: pointer;
    func: TElm_Access_Info_Cb;
  end;

  PElm_Access_Info = ^TElm_Access_Info;

  TElm_Access_Info = record
    hoverobj: PEvas_Object;
    items: PEina_List;
    delay_timer: PEcore_Timer;
    on_highlight_data: pointer;
    on_highlight: TElm_Access_On_Highlight_Cb;
    activate_data: pointer;
    activate: TElm_Access_Activate_Cb;
    widget_item: PElm_Widget_Item_Data;
    part_object: PEvas_Object;
    next: PEvas_Object;
    prev: PEvas_Object;
  end;

  PElm_Action = ^TElm_Action;

  TElm_Action = record
    name: pchar;
    func: function(obj: PEvas_Object; params: pchar): TEina_Bool; cdecl;
  end;


procedure _elm_access_shutdown; cdecl; external libelementary;
procedure _elm_access_mouse_event_enabled_set(enabled: TEina_Bool); cdecl; external libelementary;
procedure _elm_access_auto_highlight_set(enabled: TEina_Bool); cdecl; external libelementary;
function _elm_access_auto_highlight_get: TEina_Bool; cdecl; external libelementary;
procedure _elm_access_widget_item_access_order_set(item: PElm_Widget_Item_Data; objs: PEina_List); cdecl; external libelementary;
function _elm_access_widget_item_access_order_get(item: PElm_Widget_Item_Data): PEina_List; cdecl; external libelementary;
procedure _elm_access_widget_item_access_order_unset(item: PElm_Widget_Item_Data); cdecl; external libelementary;
procedure _elm_widget_focus_highlight_start(obj: PEvas_Object); cdecl; external libelementary;
procedure _elm_widget_highlight_in_theme_update(obj: PEo); cdecl; external libelementary;
procedure _elm_win_focus_highlight_start(obj: PEvas_Object); cdecl; external libelementary;
procedure _elm_win_focus_highlight_in_theme_update(obj: PEvas_Object; in_theme: TEina_Bool); cdecl; external libelementary;
function _elm_win_focus_highlight_object_get(obj: PEvas_Object): PEvas_Object; cdecl; external libelementary;
procedure _elm_win_focus_auto_show(obj: PEvas_Object); cdecl; external libelementary;
procedure _elm_win_focus_auto_hide(obj: PEvas_Object); cdecl; external libelementary;
procedure _elm_access_clear(ac: PElm_Access_Info); cdecl; external libelementary;
procedure _elm_access_text_set(ac: PElm_Access_Info; _type: longint; text: pchar); cdecl; external libelementary;
procedure _elm_access_callback_set(ac: PElm_Access_Info; _type: longint; func: TElm_Access_Info_Cb; data: pointer); cdecl; external libelementary;
function _elm_access_text_get(ac: PElm_Access_Info; _type: longint; obj: PEvas_Object): pchar; cdecl; external libelementary;
procedure _elm_access_read(ac: PElm_Access_Info; _type: longint; obj: PEvas_Object); cdecl; external libelementary;
procedure _elm_access_say(txt: pchar); cdecl; external libelementary;
function _elm_access_info_get(obj: PEvas_Object): PElm_Access_Info; cdecl; external libelementary;
procedure _elm_access_object_highlight(obj: PEvas_Object); cdecl; external libelementary;
procedure _elm_access_object_unhighlight(obj: PEvas_Object); cdecl; external libelementary;
procedure _elm_access_object_highlight_disable(e: PEvas); cdecl; external libelementary;
procedure _elm_access_object_register(obj: PEvas_Object; hoverobj: PEvas_Object); cdecl; external libelementary;
procedure _elm_access_object_unregister(obj: PEvas_Object; hoverobj: PEvas_Object); cdecl; external libelementary;
function _elm_access_2nd_click_timeout(obj: PEvas_Object): TEina_Bool; cdecl; external libelementary;
procedure _elm_access_highlight_set(obj: PEvas_Object); cdecl; external libelementary;
function _elm_access_edje_object_part_object_register(obj: PEvas_Object; partobj: PEvas_Object; part: pchar): PEvas_Object; cdecl; external libelementary;
procedure _elm_access_edje_object_part_object_unregister(obj: PEvas_Object; eobj: PEvas_Object; part: pchar); cdecl; external libelementary;
procedure _elm_access_widget_item_register(item: PElm_Widget_Item_Data); cdecl; external libelementary;
procedure _elm_access_widget_item_unregister(item: PElm_Widget_Item_Data); cdecl; external libelementary;
procedure _elm_access_on_highlight_hook_set(ac: PElm_Access_Info; func: TElm_Access_On_Highlight_Cb; data: pointer); cdecl; external libelementary;
procedure _elm_access_activate_callback_set(ac: PElm_Access_Info; func: TElm_Access_Activate_Cb; data: pointer); cdecl; external libelementary;
procedure _elm_access_highlight_object_activate(obj: PEvas_Object; act: TEfl_Ui_Activate); cdecl; external libelementary;
procedure _elm_access_highlight_cycle(obj: PEvas_Object; dir: TElm_Focus_Direction); cdecl; external libelementary;
function _elm_access_object_get(obj: PEvas_Object): PElm_Access_Info; cdecl; external libelementary; deprecated;

const
  ELM_PREFS_DATA_MAGIC = $e1f5da7a;

type
  TElm_Widget_Item_Signal_Data = record
    item: PElm_Object_Item;
    func: TElm_Widget_Item_Signal_Cb;
    emission: pchar;
    source: pchar;
    data: pointer;
  end;
  PElm_Widget_Item_Signal_Data = ^TElm_Widget_Item_Signal_Data;

function elm_widget_api_check(ver: longint): TEina_Bool; cdecl; external libelementary;
function elm_widget_access(obj: PEvas_Object; is_access: TEina_Bool): TEina_Bool; cdecl; external libelementary;
function elm_widget_theme(obj: PEvas_Object): TEina_Error; cdecl; external libelementary;
procedure elm_widget_theme_specific(obj: PEvas_Object; th: PElm_Theme; force: TEina_Bool); cdecl; external libelementary;
procedure elm_widget_on_show_region_hook_set(obj: PEvas_Object; data: pointer; func: TElm_Widget_On_Show_Region_Cb; data_free: TEina_Free_Cb); cdecl; external libelementary;
function elm_widget_sub_object_parent_add(sobj: PEvas_Object): TEina_Bool; cdecl; external libelementary;
function elm_widget_sub_object_add(obj: PEvas_Object; sobj: PEvas_Object): TEina_Bool; cdecl; external libelementary;
function elm_widget_sub_object_del(obj: PEvas_Object; sobj: PEvas_Object): TEina_Bool; cdecl; external libelementary;
procedure elm_widget_resize_object_set(obj: PEvas_Object; sobj: PEvas_Object); cdecl; external libelementary;
procedure elm_widget_hover_object_set(obj: PEvas_Object; sobj: PEvas_Object); cdecl; external libelementary;
procedure elm_widget_signal_emit(obj: PEvas_Object; emission: pchar; source: pchar); cdecl; external libelementary;
procedure elm_widget_signal_callback_add(obj: PEvas_Object; emission: pchar; source: pchar; func: TEdje_Signal_Cb; data: pointer); cdecl; external libelementary;
function elm_widget_signal_callback_del(obj: PEvas_Object; emission: pchar; source: pchar; func: TEdje_Signal_Cb): pointer; cdecl; external libelementary;
procedure elm_widget_can_focus_set(obj: PEvas_Object; can_focus: TEina_Bool); cdecl; external libelementary;
function elm_widget_can_focus_get(obj: PEvas_Object): TEina_Bool; cdecl; external libelementary;
function elm_widget_child_can_focus_get(obj: PEvas_Object): TEina_Bool; cdecl; external libelementary;
function elm_widget_can_focus_child_list_get(obj: PEvas_Object): PEina_List; cdecl; external libelementary;
procedure elm_widget_tree_unfocusable_set(obj: PEvas_Object; tree_unfocusable: TEina_Bool); cdecl; external libelementary;
function elm_widget_tree_unfocusable_get(obj: PEvas_Object): TEina_Bool; cdecl; external libelementary;
procedure elm_widget_highlight_ignore_set(obj: PEvas_Object; ignore: TEina_Bool); cdecl; external libelementary;
function elm_widget_highlight_ignore_get(obj: PEvas_Object): TEina_Bool; cdecl; external libelementary;
procedure elm_widget_highlight_in_theme_set(obj: PEvas_Object; highlight: TEina_Bool); cdecl; external libelementary;
function elm_widget_highlight_in_theme_get(obj: PEvas_Object): TEina_Bool; cdecl; external libelementary;
procedure elm_widget_access_highlight_in_theme_set(obj: PEvas_Object; highlight: TEina_Bool); cdecl; external libelementary;
function elm_widget_access_highlight_in_theme_get(obj: PEvas_Object): TEina_Bool; cdecl; external libelementary;
function elm_widget_highlight_get(obj: PEvas_Object): TEina_Bool; cdecl; external libelementary;
function elm_widget_top_get(obj: PEo): PEo; cdecl; external libelementary;
function elm_widget_is(obj: PEvas_Object): TEina_Bool; cdecl; external libelementary;
function elm_widget_parent_widget_get(obj: PEvas_Object): PEvas_Object; cdecl; external libelementary;
procedure elm_widget_event_callback_add(obj: PEvas_Object; func: TElm_Event_Cb; data: pointer); cdecl; external libelementary;
function elm_widget_event_callback_del(obj: PEvas_Object; func: TElm_Event_Cb; data: pointer): pointer; cdecl; external libelementary;
function elm_widget_focus_highlight_style_set(obj: PEvas_Object; style: pchar): TEina_Bool; cdecl; external libelementary;
function elm_widget_focus_highlight_style_get(obj: PEvas_Object): pchar; cdecl; external libelementary;
procedure elm_widget_parent_highlight_set(obj: PEvas_Object; highlighted: TEina_Bool); cdecl; external libelementary;
procedure elm_widget_focus_set(obj: PEvas_Object; focus: TEina_Bool); cdecl; external libelementary;
function elm_widget_parent_get(obj: PEvas_Object): PEvas_Object; cdecl; external libelementary;
procedure elm_widget_display_mode_set(obj: PEvas_Object; dispmode: TEvas_Display_Mode); cdecl; external libelementary;
function elm_widget_focus_highlight_enabled_get(obj: PEvas_Object): TEina_Bool; cdecl; external libelementary;
procedure elm_widget_focus_highlight_focus_part_geometry_get(obj: PEvas_Object; x: PEvas_Coord; y: PEvas_Coord; w: PEvas_Coord; h: PEvas_Coord); cdecl; external libelementary;
function _elm_widget_focus_highlight_object_get(obj: PEvas_Object): PEvas_Object; cdecl; external libelementary;
procedure elm_widget_disabled_set(obj: PEvas_Object; disabled: TEina_Bool); cdecl; external libelementary;
function elm_widget_disabled_get(obj: PEvas_Object): TEina_Bool; cdecl; external libelementary;
procedure elm_widget_show_region_set(obj: PEvas_Object; sr: TEina_Rect; forceshow: TEina_Bool); cdecl; external libelementary;
function elm_widget_show_region_get(obj: PEvas_Object): TEina_Rect; cdecl; external libelementary;
function elm_widget_focus_region_get(obj: PEvas_Object): TEina_Rect; cdecl; external libelementary;
procedure elm_widget_focus_region_show(obj: PEvas_Object); cdecl; external libelementary;
procedure elm_widget_scroll_hold_push(obj: PEvas_Object); cdecl; external libelementary;
procedure elm_widget_scroll_hold_pop(obj: PEvas_Object); cdecl; external libelementary;
function elm_widget_scroll_hold_get(obj: PEvas_Object): longint; cdecl; external libelementary;
procedure elm_widget_scroll_freeze_push(obj: PEvas_Object); cdecl; external libelementary;
procedure elm_widget_scroll_freeze_pop(obj: PEvas_Object); cdecl; external libelementary;
function elm_widget_scroll_freeze_get(obj: PEvas_Object): longint; cdecl; external libelementary;
procedure elm_widget_theme_set(obj: PEvas_Object; th: PElm_Theme); cdecl; external libelementary;
function elm_widget_theme_get(obj: PEvas_Object): PElm_Theme; cdecl; external libelementary;
function elm_widget_style_set(obj: PEvas_Object; style: pchar): TEina_Error; cdecl; external libelementary;
function elm_widget_style_get(obj: PEvas_Object): pchar; cdecl; external libelementary;
procedure elm_widget_type_set(obj: PEvas_Object; _type: pchar); cdecl; external libelementary;
function elm_widget_type_get(obj: PEvas_Object): pchar; cdecl; external libelementary;
procedure elm_widget_tooltip_add(obj: PEvas_Object; tt: PElm_Tooltip); cdecl; external libelementary;
procedure elm_widget_tooltip_del(obj: PEvas_Object; tt: PElm_Tooltip); cdecl; external libelementary;
procedure elm_widget_cursor_add(obj: PEvas_Object; cur: PElm_Cursor); cdecl; external libelementary;
procedure elm_widget_cursor_del(obj: PEvas_Object; cur: PElm_Cursor); cdecl; external libelementary;
procedure elm_widget_scroll_lock_set(obj: PEvas_Object; block: TEfl_Ui_Layout_Orientation); cdecl; external libelementary;
function elm_widget_scroll_lock_get(obj: PEvas_Object): TEfl_Ui_Layout_Orientation; cdecl; external libelementary;
function elm_widget_scroll_child_locked_x_get(obj: PEvas_Object): longint; cdecl; external libelementary;
function elm_widget_scroll_child_locked_y_get(obj: PEvas_Object): longint; cdecl; external libelementary;
function elm_widget_theme_object_set(obj: PEvas_Object; edj: PEvas_Object; wname: pchar; welement: pchar; wstyle: pchar): TEina_Error; cdecl; external libelementary;
function elm_widget_type_check(obj: PEvas_Object; _type: pchar; func: pchar): TEina_Bool; cdecl; external libelementary;
function elm_widget_name_find(obj: PEvas_Object; name: pchar; recurse: longint): PEvas_Object; cdecl; external libelementary;
function elm_widget_stringlist_get(str: pchar): PEina_List; cdecl; external libelementary;
procedure elm_widget_stringlist_free(list: PEina_List); cdecl; external libelementary;
procedure elm_widget_focus_mouse_up_handle(obj: PEvas_Object); cdecl; external libelementary;
procedure elm_widget_activate(obj: PEvas_Object; act: TEfl_Ui_Activate); cdecl; external libelementary;
procedure elm_widget_part_text_set(obj: PEvas_Object; part: pchar; _label: pchar); cdecl; external libelementary;
function elm_widget_part_text_get(obj: PEvas_Object; part: pchar): pchar; cdecl; external libelementary;
function elm_widget_translatable_part_text_get(obj: PEvas_Object; part: pchar): pchar; cdecl; external libelementary;
procedure elm_widget_domain_part_text_translatable_set(obj: PEvas_Object; part: pchar; domain: pchar; translatable: TEina_Bool); cdecl; external libelementary;
procedure elm_widget_content_part_set(obj: PEvas_Object; part: pchar; content: PEvas_Object); cdecl; external libelementary;
function elm_widget_content_part_get(obj: PEvas_Object; part: pchar): PEvas_Object; cdecl; external libelementary;
function elm_widget_content_part_unset(obj: PEvas_Object; part: pchar): PEvas_Object; cdecl; external libelementary;
procedure elm_widget_access_info_set(obj: PEvas_Object; txt: pchar); cdecl; external libelementary;
function elm_widget_access_info_get(obj: PEvas_Object): pchar; cdecl; external libelementary;
function elm_widget_focus_highlight_geometry_get(obj: PEvas_Object): TEina_Rect; cdecl; external libelementary;
procedure _elm_widget_item_highlight_in_theme(obj: PEvas_Object; it: PElm_Object_Item); cdecl; external libelementary;
procedure elm_widget_focus_region_show_mode_set(obj: PEvas_Object; mode: TElm_Focus_Region_Show_Mode); cdecl; external libelementary;
function elm_widget_focus_region_show_mode_get(obj: PEvas_Object): TElm_Focus_Region_Show_Mode; cdecl; external libelementary;
function elm_widget_part_translatable_text_get(obj: PEo; part: pchar; domain: PPchar): pchar; cdecl; external libelementary;
procedure elm_widget_part_translatable_text_set(obj: PEo; part: pchar; _label: pchar; domain: pchar); cdecl; external libelementary;
function elm_widget_theme_klass_set(obj: PEvas_Object; name: pchar): TEina_Bool; cdecl; external libelementary;
function elm_widget_theme_klass_get(obj: PEvas_Object): pchar; cdecl; external libelementary;
function elm_widget_theme_element_set(obj: PEvas_Object; name: pchar): TEina_Bool; cdecl; external libelementary;
function elm_widget_theme_element_get(obj: PEvas_Object): pchar; cdecl; external libelementary;
function elm_widget_theme_style_set(obj: PEvas_Object; name: pchar): TEina_Bool; cdecl; external libelementary;
function elm_widget_theme_style_get(obj: PEvas_Object): pchar; cdecl; external libelementary;
function elm_widget_element_update(obj: PEvas_Object; component: PEvas_Object; name: pchar): TEina_Error; cdecl; external libelementary;
procedure elm_widget_tree_dump(top: PEvas_Object); cdecl; external libelementary;
procedure elm_widget_tree_dot_dump(top: PEvas_Object; output: PFILE); cdecl; external libelementary;
function _elm_widget_onscreen_is(widget: PEvas_Object): TEina_Bool; cdecl; external libelementary;
function _elm_widget_item_onscreen_is(item: PElm_Object_Item): TEina_Bool; cdecl; external libelementary;
function _elm_widget_accessible_plain_name_get(obj: PEvas_Object; name: pchar): pchar; cdecl; external libelementary;
function _elm_widget_item_accessible_plain_name_get(item: PElm_Object_Item; name: pchar): pchar; cdecl; external libelementary;
function _efl_ui_widget_bg_get(obj: PEfl_Ui_Widget): PEfl_Canvas_Object; cdecl; external libelementary;

function elm_selection_selection_has_owner(obj: PEvas_Object): TEina_Bool; cdecl; external libelementary;
function _elm_layout_part_aliasing_eval(obj: PEvas_Object; part: PPchar; is_text: TEina_Bool): TEina_Bool; cdecl; external libelementary;
function efl_ui_widget_default_content_part_get(obj: PEo): pchar; cdecl; external libelementary;
function efl_ui_widget_default_text_part_get(obj: PEo): pchar; cdecl; external libelementary;

function WIDGET_ITEM_DATA_GET(eo_obj: Pointer): Pointer;
procedure WIDGET_ITEM_DATA_SET(eo_obj, data: Pointer);


// === Konventiert am: 25-5-25 18:43:54 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



function WIDGET_ITEM_DATA_GET(eo_obj: Pointer): Pointer;
begin
  WIDGET_ITEM_DATA_GET := efl_key_data_get(PEo(eo_obj), '__elm_widget_item_data');
end;

procedure WIDGET_ITEM_DATA_SET(eo_obj, data: Pointer);
begin
  efl_key_data_set(PEo(eo_obj), '__elm_widget_item_data', data);
end;


{$ENDIF read_implementation}
