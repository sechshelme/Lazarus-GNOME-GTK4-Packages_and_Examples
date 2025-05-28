{$IFDEF read_interface}



function elm_scrolled_entry_add(parent: PEvas_Object): PEvas_Object; cdecl; external libelementary; deprecated;
procedure elm_scrolled_entry_single_line_set(obj: PEvas_Object; single_line: TEina_Bool); cdecl; external libelementary; deprecated;
function elm_scrolled_entry_single_line_get(obj: PEvas_Object): TEina_Bool; cdecl; external libelementary; deprecated;
procedure elm_scrolled_entry_password_set(obj: PEvas_Object; password: TEina_Bool); cdecl; external libelementary; deprecated;
function elm_scrolled_entry_password_get(obj: PEvas_Object): TEina_Bool; cdecl; external libelementary; deprecated;
procedure elm_scrolled_entry_entry_set(obj: PEvas_Object; entry: pchar); cdecl; external libelementary; deprecated;
function elm_scrolled_entry_entry_get(obj: PEvas_Object): pchar; cdecl; external libelementary; deprecated;
procedure elm_scrolled_entry_entry_append(obj: PEvas_Object; entry: pchar); cdecl; external libelementary; deprecated;
function elm_scrolled_entry_is_empty(obj: PEvas_Object): TEina_Bool; cdecl; external libelementary; deprecated;
function elm_scrolled_entry_selection_get(obj: PEvas_Object): pchar; cdecl; external libelementary; deprecated;
procedure elm_scrolled_entry_entry_insert(obj: PEvas_Object; entry: pchar); cdecl; external libelementary; deprecated;
procedure elm_scrolled_entry_line_wrap_set(obj: PEvas_Object; wrap: TElm_Wrap_Type); cdecl; external libelementary; deprecated;
procedure elm_scrolled_entry_editable_set(obj: PEvas_Object; editable: TEina_Bool); cdecl; external libelementary; deprecated;
function elm_scrolled_entry_editable_get(obj: PEvas_Object): TEina_Bool; cdecl; external libelementary; deprecated;
procedure elm_scrolled_entry_select_none(obj: PEvas_Object); cdecl; external libelementary; deprecated;
procedure elm_scrolled_entry_select_all(obj: PEvas_Object); cdecl; external libelementary; deprecated;
function elm_scrolled_entry_cursor_next(obj: PEvas_Object): TEina_Bool; cdecl; external libelementary; deprecated;
function elm_scrolled_entry_cursor_prev(obj: PEvas_Object): TEina_Bool; cdecl; external libelementary; deprecated;
function elm_scrolled_entry_cursor_up(obj: PEvas_Object): TEina_Bool; cdecl; external libelementary; deprecated;
function elm_scrolled_entry_cursor_down(obj: PEvas_Object): TEina_Bool; cdecl; external libelementary; deprecated;
procedure elm_scrolled_entry_cursor_begin_set(obj: PEvas_Object); cdecl; external libelementary; deprecated;
procedure elm_scrolled_entry_cursor_end_set(obj: PEvas_Object); cdecl; external libelementary; deprecated;
procedure elm_scrolled_entry_cursor_line_begin_set(obj: PEvas_Object); cdecl; external libelementary; deprecated;
procedure elm_scrolled_entry_cursor_line_end_set(obj: PEvas_Object); cdecl; external libelementary; deprecated;
procedure elm_scrolled_entry_cursor_selection_begin(obj: PEvas_Object); cdecl; external libelementary; deprecated;
procedure elm_scrolled_entry_cursor_selection_end(obj: PEvas_Object); cdecl; external libelementary; deprecated;
function elm_scrolled_entry_cursor_is_format_get(obj: PEvas_Object): TEina_Bool; cdecl; external libelementary; deprecated;
function elm_scrolled_entry_cursor_is_visible_format_get(obj: PEvas_Object): TEina_Bool; cdecl; external libelementary; deprecated;
function elm_scrolled_entry_cursor_content_get(obj: PEvas_Object): pchar; cdecl; external libelementary; deprecated;
procedure elm_scrolled_entry_cursor_pos_set(obj: PEvas_Object; pos: longint); cdecl; external libelementary; deprecated;
function elm_scrolled_entry_cursor_pos_get(obj: PEvas_Object): longint; cdecl; external libelementary; deprecated;
procedure elm_scrolled_entry_selection_cut(obj: PEvas_Object); cdecl; external libelementary; deprecated;
procedure elm_scrolled_entry_selection_copy(obj: PEvas_Object); cdecl; external libelementary; deprecated;
procedure elm_scrolled_entry_selection_paste(obj: PEvas_Object); cdecl; external libelementary; deprecated;
procedure elm_scrolled_entry_context_menu_clear(obj: PEvas_Object); cdecl; external libelementary; deprecated;
procedure elm_scrolled_entry_context_menu_item_add(obj: PEvas_Object; _label: pchar; icon_file: pchar; icon_type: TElm_Icon_Type; func: TEvas_Smart_Cb;
  data: pointer); cdecl; external libelementary; deprecated;
procedure elm_scrolled_entry_context_menu_disabled_set(obj: PEvas_Object; disabled: TEina_Bool); cdecl; external libelementary; deprecated;
function elm_scrolled_entry_context_menu_disabled_get(obj: PEvas_Object): TEina_Bool; cdecl; external libelementary; deprecated;
procedure elm_scrolled_entry_scrollbar_policy_set(obj: PEvas_Object; h: TElm_Scroller_Policy; v: TElm_Scroller_Policy); cdecl; external libelementary; deprecated;
procedure elm_scrolled_entry_bounce_set(obj: PEvas_Object; h_bounce: TEina_Bool; v_bounce: TEina_Bool); cdecl; external libelementary; deprecated;
procedure elm_scrolled_entry_bounce_get(obj: PEvas_Object; h_bounce: PEina_Bool; v_bounce: PEina_Bool); cdecl; external libelementary; deprecated;
procedure elm_scrolled_entry_icon_set(obj: PEvas_Object; icon: PEvas_Object); cdecl; external libelementary; deprecated;
function elm_scrolled_entry_icon_get(obj: PEvas_Object): PEvas_Object; cdecl; external libelementary; deprecated;
function elm_scrolled_entry_icon_unset(obj: PEvas_Object): PEvas_Object; cdecl; external libelementary; deprecated;
procedure elm_scrolled_entry_icon_visible_set(obj: PEvas_Object; setting: TEina_Bool); cdecl; external libelementary; deprecated;
procedure elm_scrolled_entry_end_set(obj: PEvas_Object; end_: PEvas_Object); cdecl; external libelementary; deprecated;
function elm_scrolled_entry_end_get(obj: PEvas_Object): PEvas_Object; cdecl; external libelementary; deprecated;
function elm_scrolled_entry_end_unset(obj: PEvas_Object): PEvas_Object; cdecl; external libelementary; deprecated;
procedure elm_scrolled_entry_end_visible_set(obj: PEvas_Object; setting: TEina_Bool); cdecl; external libelementary; deprecated;

type
  TEntry_func = function(data: pointer; entry: PEvas_Object; item: pchar): PEvas_Object;
  TEntry_func2 = procedure(data: pointer; entry: PEvas_Object; text: PPchar);

procedure elm_scrolled_entry_item_provider_append(obj: PEvas_Object; func: TEntry_func; data: pointer); cdecl; external libelementary; deprecated;
procedure elm_scrolled_entry_item_provider_prepend(obj: PEvas_Object; func: TEntry_func; data: pointer); cdecl; external libelementary; deprecated;
procedure elm_scrolled_entry_item_provider_remove(obj: PEvas_Object; func: TEntry_func; data: pointer); cdecl; external libelementary; deprecated;
procedure elm_scrolled_entry_text_filter_append(obj: PEvas_Object; func: TEntry_func2; data: pointer); cdecl; external libelementary; deprecated;
procedure elm_scrolled_entry_text_filter_prepend(obj: PEvas_Object; func: TEntry_func2; data: pointer); cdecl; external libelementary; deprecated;
procedure elm_scrolled_entry_text_filter_remove(obj: PEvas_Object; func: TEntry_func2; data: pointer); cdecl; external libelementary; deprecated;
procedure elm_scrolled_entry_file_set(obj: PEvas_Object; file_: pchar; format: TElm_Text_Format); cdecl; external libelementary; deprecated;
procedure elm_scrolled_entry_file_get(obj: PEvas_Object; file_: PPchar; format: PElm_Text_Format); cdecl; external libelementary; deprecated;
procedure elm_scrolled_entry_file_save(obj: PEvas_Object); cdecl; external libelementary; deprecated;
procedure elm_scrolled_entry_autosave_set(obj: PEvas_Object; autosave: TEina_Bool); cdecl; external libelementary; deprecated;
function elm_scrolled_entry_autosave_get(obj: PEvas_Object): TEina_Bool; cdecl; external libelementary; deprecated;
procedure elm_scrolled_entry_cnp_textonly_set(obj: PEvas_Object; textonly: TEina_Bool); cdecl; external libelementary; deprecated;
function elm_scrolled_entry_cnp_textonly_get(obj: PEvas_Object): TEina_Bool; cdecl; external libelementary; deprecated;
procedure elm_map_utils_convert_coord_into_geo(obj: PEvas_Object; x: longint; y: longint; size: longint; lon: Pdouble;
  lat: Pdouble); cdecl; external libelementary; deprecated;
procedure elm_map_utils_convert_geo_into_coord(obj: PEvas_Object; lon: double; lat: double; size: longint; x: Plongint;
  y: Plongint); cdecl; external libelementary; deprecated;
procedure elm_map_utils_downloading_status_get(obj: PEvas_Object; try_num: Plongint; finish_num: Plongint); cdecl; external libelementary; deprecated;
function elm_map_utils_convert_coord_into_name(obj: PEvas_Object; lon: double; lat: double): PElm_Map_Name; cdecl; external libelementary; deprecated;
function elm_map_utils_convert_name_into_coord(obj: PEvas_Object; address: pchar): PElm_Map_Name; cdecl; external libelementary; deprecated;
function elm_map_marker_add(obj: PEvas_Object; lon: double; lat: double; clas: PElm_Map_Marker_Class; clas_group: PElm_Map_Group_Class;
  data: pointer): PElm_Map_Marker; cdecl; external libelementary; deprecated;
procedure elm_map_marker_remove(marker: PElm_Map_Marker); cdecl; external libelementary; deprecated;
procedure elm_map_marker_region_get(marker: PElm_Map_Marker; lon: Pdouble; lat: Pdouble); cdecl; external libelementary; deprecated;
procedure elm_map_marker_bring_in(marker: PElm_Map_Marker); cdecl; external libelementary; deprecated;
procedure elm_map_marker_show(marker: PElm_Map_Marker); cdecl; external libelementary; deprecated;
procedure elm_map_markers_list_show(markers: PEina_List); cdecl; external libelementary; deprecated;
function elm_map_marker_object_get(marker: PElm_Map_Marker): PEvas_Object; cdecl; external libelementary; deprecated;
procedure elm_map_marker_update(marker: PElm_Map_Marker); cdecl; external libelementary; deprecated;
function elm_map_group_class_new(obj: PEvas_Object): PElm_Map_Group_Class; cdecl; external libelementary; deprecated;
function elm_map_marker_class_new(obj: PEvas_Object): PElm_Map_Marker_Class; cdecl; external libelementary; deprecated;
procedure elm_map_route_remove(route: PElm_Map_Route); cdecl; external libelementary; deprecated;
function elm_multibuttonentry_item_data_get(it: PElm_Object_Item): pointer; cdecl; external libelementary; deprecated;
procedure elm_multibuttonentry_item_data_set(it: PElm_Object_Item; data: pointer); cdecl; external libelementary; deprecated;
procedure elm_calendar_day_selection_disabled_set(obj: PEvas_Object; disabled: TEina_Bool); cdecl; external libelementary; deprecated;
function elm_calendar_day_selection_disabled_get(obj: PEvas_Object): TEina_Bool; cdecl; external libelementary; deprecated;

type
  PElm_Notify_Orient = ^TElm_Notify_Orient;
  TElm_Notify_Orient = longint;

const
  ELM_NOTIFY_ORIENT_TOP = 0;
  ELM_NOTIFY_ORIENT_CENTER = 1;
  ELM_NOTIFY_ORIENT_BOTTOM = 2;
  ELM_NOTIFY_ORIENT_LEFT = 3;
  ELM_NOTIFY_ORIENT_RIGHT = 4;
  ELM_NOTIFY_ORIENT_TOP_LEFT = 5;
  ELM_NOTIFY_ORIENT_TOP_RIGHT = 6;
  ELM_NOTIFY_ORIENT_BOTTOM_LEFT = 7;
  ELM_NOTIFY_ORIENT_BOTTOM_RIGHT = 8;
  ELM_NOTIFY_ORIENT_LAST = 9;

procedure elm_notify_orient_set(obj: PEvas_Object; orient: TElm_Notify_Orient); cdecl; external libelementary; deprecated;
function elm_notify_orient_get(obj: PEvas_Object): TElm_Notify_Orient; cdecl; external libelementary; deprecated;
procedure elm_label_slide_set(obj: PEvas_Object; slide: TEina_Bool); cdecl; external libelementary; deprecated;
function elm_label_slide_get(obj: PEvas_Object): TEina_Bool; cdecl; external libelementary; deprecated;
procedure elm_object_domain_translatable_text_part_set(obj: PEvas_Object; part: pchar; domain: pchar; text: pchar); cdecl; external libelementary; deprecated;
function elm_object_translatable_text_part_get(obj: PEvas_Object; part: pchar): pchar; cdecl; external libelementary; deprecated;
procedure elm_naviframe_item_title_visible_set(it: PElm_Object_Item; visible: TEina_Bool); cdecl; external libelementary; deprecated;
function elm_naviframe_item_title_visible_get(it: PElm_Object_Item): TEina_Bool; cdecl; external libelementary; deprecated;
procedure elm_genlist_bounce_set(obj: PEvas_Object; h_bounce: TEina_Bool; v_bounce: TEina_Bool); cdecl; external libelementary; deprecated;
procedure elm_genlist_bounce_get(obj: PEvas_Object; h_bounce: PEina_Bool; v_bounce: PEina_Bool); cdecl; external libelementary; deprecated;
procedure elm_genlist_scroller_policy_set(obj: PEvas_Object; policy_h: TElm_Scroller_Policy; policy_v: TElm_Scroller_Policy); cdecl; external libelementary; deprecated;
procedure elm_genlist_scroller_policy_get(obj: PEvas_Object; policy_h: PElm_Scroller_Policy; policy_v: PElm_Scroller_Policy); cdecl; external libelementary; deprecated;
procedure elm_entry_scrollbar_policy_set(obj: PEvas_Object; h: TElm_Scroller_Policy; v: TElm_Scroller_Policy); cdecl; external libelementary; deprecated;
procedure elm_entry_bounce_set(obj: PEvas_Object; h_bounce: TEina_Bool; v_bounce: TEina_Bool); cdecl; external libelementary; deprecated;
procedure elm_entry_bounce_get(obj: PEvas_Object; h_bounce: PEina_Bool; v_bounce: PEina_Bool); cdecl; external libelementary; deprecated;
procedure elm_photocam_bounce_set(obj: PEvas_Object; h_bounce: TEina_Bool; v_bounce: TEina_Bool); cdecl; external libelementary; deprecated;
procedure elm_photocam_bounce_get(obj: PEvas_Object; h_bounce: PEina_Bool; v_bounce: PEina_Bool); cdecl; external libelementary; deprecated;
procedure elm_list_bounce_set(obj: PEvas_Object; h_bounce: TEina_Bool; v_bounce: TEina_Bool); cdecl; external libelementary; deprecated;
procedure elm_list_bounce_get(obj: PEvas_Object; h_bounce: PEina_Bool; v_bounce: PEina_Bool); cdecl; external libelementary; deprecated;
procedure elm_list_scroller_policy_set(obj: PEvas_Object; policy_h: TElm_Scroller_Policy; policy_v: TElm_Scroller_Policy); cdecl; external libelementary; deprecated;
procedure elm_list_scroller_policy_get(obj: PEvas_Object; policy_h: PElm_Scroller_Policy; policy_v: PElm_Scroller_Policy); cdecl; external libelementary; deprecated;
procedure elm_scroller_custom_widget_base_theme_set(obj: PEvas_Object; widget: pchar; base: pchar); cdecl; external libelementary; deprecated;
procedure elm_diskselector_bounce_set(obj: PEvas_Object; h_bounce: TEina_Bool; v_bounce: TEina_Bool); cdecl; external libelementary; deprecated;
procedure elm_diskselector_bounce_get(obj: PEvas_Object; h_bounce: PEina_Bool; v_bounce: PEina_Bool); cdecl; external libelementary; deprecated;
procedure elm_diskselector_scroller_policy_get(obj: PEvas_Object; policy_h: PElm_Scroller_Policy; policy_v: PElm_Scroller_Policy); cdecl; external libelementary; deprecated;
procedure elm_diskselector_scroller_policy_set(obj: PEvas_Object; policy_h: TElm_Scroller_Policy; policy_v: TElm_Scroller_Policy); cdecl; external libelementary; deprecated;
function elm_icon_file_set(obj: PEvas_Object; file_: pchar; group: pchar): TEina_Bool; cdecl; external libelementary; deprecated;
function elm_icon_memfile_set(obj: PEvas_Object; img: pointer; size: Tsize_t; format: pchar; key: pchar): TEina_Bool; cdecl; external libelementary; deprecated;
procedure elm_icon_file_get(obj: PEvas_Object; file_: PPchar; group: PPchar); cdecl; external libelementary; deprecated;
procedure elm_icon_smooth_set(obj: PEvas_Object; smooth: TEina_Bool); cdecl; external libelementary; deprecated;
function elm_icon_smooth_get(obj: PEvas_Object): TEina_Bool; cdecl; external libelementary; deprecated;
procedure elm_icon_no_scale_set(obj: PEvas_Object; no_scale: TEina_Bool); cdecl; external libelementary; deprecated;
function elm_icon_no_scale_get(obj: PEvas_Object): TEina_Bool; cdecl; external libelementary; deprecated;
procedure elm_icon_resizable_set(obj: PEvas_Object; size_up: TEina_Bool; size_down: TEina_Bool); cdecl; external libelementary; deprecated;
procedure elm_icon_resizable_get(obj: PEvas_Object; size_up: PEina_Bool; size_down: PEina_Bool); cdecl; external libelementary; deprecated;
procedure elm_icon_size_get(obj: PEvas_Object; w: Plongint; h: Plongint); cdecl; external libelementary; deprecated;
procedure elm_icon_fill_outside_set(obj: PEvas_Object; fill_outside: TEina_Bool); cdecl; external libelementary; deprecated;
function elm_icon_fill_outside_get(obj: PEvas_Object): TEina_Bool; cdecl; external libelementary; deprecated;
procedure elm_icon_prescale_set(obj: PEvas_Object; size: longint); cdecl; external libelementary; deprecated;
function elm_icon_prescale_get(obj: PEvas_Object): longint; cdecl; external libelementary; deprecated;
function elm_icon_object_get(obj: PEvas_Object): PEvas_Object; cdecl; external libelementary; deprecated;
procedure elm_icon_preload_disabled_set(obj: PEvas_Object; disabled: TEina_Bool); cdecl; external libelementary; deprecated;
function elm_icon_animated_available_get(obj: PEvas_Object): TEina_Bool; cdecl; external libelementary; deprecated;
procedure elm_icon_animated_set(obj: PEvas_Object; animated: TEina_Bool); cdecl; external libelementary; deprecated;
function elm_icon_animated_get(obj: PEvas_Object): TEina_Bool; cdecl; external libelementary; deprecated;
procedure elm_icon_animated_play_set(obj: PEvas_Object; play: TEina_Bool); cdecl; external libelementary; deprecated;
function elm_icon_animated_play_get(obj: PEvas_Object): TEina_Bool; cdecl; external libelementary; deprecated;
procedure elm_icon_aspect_fixed_set(obj: PEvas_Object; fixed: TEina_Bool); cdecl; external libelementary; deprecated;
function elm_icon_aspect_fixed_get(obj: PEvas_Object): TEina_Bool; cdecl; external libelementary; deprecated;
procedure elm_fileselector_button_path_set(obj: PEvas_Object; path: pchar); cdecl; external libelementary; deprecated;
function elm_fileselector_button_path_get(obj: PEvas_Object): pchar; cdecl; external libelementary; deprecated;
procedure elm_fileselector_button_expandable_set(obj: PEvas_Object; value: TEina_Bool); cdecl; external libelementary; deprecated;
function elm_fileselector_button_expandable_get(obj: PEvas_Object): TEina_Bool; cdecl; external libelementary; deprecated;
procedure elm_fileselector_button_folder_only_set(obj: PEvas_Object; value: TEina_Bool); cdecl; external libelementary; deprecated;
function elm_fileselector_button_folder_only_get(obj: PEvas_Object): TEina_Bool; cdecl; external libelementary; deprecated;
procedure elm_fileselector_button_is_save_set(obj: PEvas_Object; value: TEina_Bool); cdecl; external libelementary; deprecated;
function elm_fileselector_button_is_save_get(obj: PEvas_Object): TEina_Bool; cdecl; external libelementary; deprecated;
procedure elm_fileselector_entry_path_set(obj: PEvas_Object; path: pchar); cdecl; external libelementary; deprecated;
function elm_fileselector_entry_path_get(obj: PEvas_Object): pchar; cdecl; external libelementary; deprecated;
procedure elm_fileselector_entry_expandable_set(obj: PEvas_Object; value: TEina_Bool); cdecl; external libelementary; deprecated;
function elm_fileselector_entry_expandable_get(obj: PEvas_Object): TEina_Bool; cdecl; external libelementary; deprecated;
procedure elm_fileselector_entry_folder_only_set(obj: PEvas_Object; value: TEina_Bool); cdecl; external libelementary; deprecated;
function elm_fileselector_entry_folder_only_get(obj: PEvas_Object): TEina_Bool; cdecl; external libelementary; deprecated;
procedure elm_fileselector_entry_is_save_set(obj: PEvas_Object; value: TEina_Bool); cdecl; external libelementary; deprecated;
function elm_fileselector_entry_is_save_get(obj: PEvas_Object): TEina_Bool; cdecl; external libelementary; deprecated;
procedure elm_fileselector_entry_selected_set(obj: PEvas_Object; path: pchar); cdecl; external libelementary; deprecated;
function elm_fileselector_entry_selected_get(obj: PEvas_Object): pchar; cdecl; external libelementary; deprecated;
procedure elm_access_external_info_set(obj: PEvas_Object; text: pchar); cdecl; external libelementary; deprecated;
function elm_access_external_info_get(obj: PEvas_Object): pchar; cdecl; external libelementary; deprecated;
procedure elm_win_type_set(obj: PEvas_Object; _type: TElm_Win_Type); cdecl; external libelementary; deprecated;
procedure elm_win_name_set(obj: PEvas_Object; name: pchar); cdecl; external libelementary; deprecated;
procedure elm_textpath_circle_set(obj: PEfl_Ui_Textpath; x: double; y: double; radius: double; start_angle: double; direction: TEfl_Ui_Textpath_Direction); cdecl; external libelementary; deprecated;
function elm_need_elocation: TEina_Bool; cdecl; external libelementary; deprecated;

// === Konventiert am: 23-5-25 17:22:51 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
