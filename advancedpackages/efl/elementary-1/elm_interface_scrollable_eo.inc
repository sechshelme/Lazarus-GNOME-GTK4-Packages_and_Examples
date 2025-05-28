{$IFDEF read_interface}


type
  PElm_Interface_Scrollable = ^TElm_Interface_Scrollable;
  TElm_Interface_Scrollable = TEo;

{$ifdef EFL_BETA_API_SUPPORT}
function ELM_INTERFACE_SCROLLABLE_MIXIN: PEfl_Class;

function elm_interface_scrollable_mixin_get: PEfl_Class; cdecl; external libelementary;
procedure elm_interface_scrollable_gravity_set(obj: PEo; x: double; y: double); cdecl; external libelementary;
procedure elm_interface_scrollable_gravity_get(obj: PEo; x: Pdouble; y: Pdouble); cdecl; external libelementary;
procedure elm_interface_scrollable_bounce_allow_set(obj: PEo; horiz: TEina_Bool; vert: TEina_Bool); cdecl; external libelementary;
procedure elm_interface_scrollable_bounce_allow_get(obj: PEo; horiz: PEina_Bool; vert: PEina_Bool); cdecl; external libelementary;
procedure elm_interface_scrollable_wheel_disabled_set(obj: PEo; disabled: TEina_Bool); cdecl; external libelementary;
function elm_interface_scrollable_wheel_disabled_get(obj: PEo): TEina_Bool; cdecl; external libelementary;
procedure elm_interface_scrollable_movement_block_set(obj: PEo; block: TEfl_Ui_Layout_Orientation); cdecl; external libelementary;
function elm_interface_scrollable_movement_block_get(obj: PEo): TEfl_Ui_Layout_Orientation; cdecl; external libelementary;
procedure elm_interface_scrollable_momentum_animator_disabled_set(obj: PEo; disabled: TEina_Bool); cdecl; external libelementary;
function elm_interface_scrollable_momentum_animator_disabled_get(obj: PEo): TEina_Bool; cdecl; external libelementary;
procedure elm_interface_scrollable_policy_set(obj: PEo; hbar: TElm_Scroller_Policy; vbar: TElm_Scroller_Policy); cdecl; external libelementary;
procedure elm_interface_scrollable_policy_get(obj: PEo; hbar: PElm_Scroller_Policy; vbar: PElm_Scroller_Policy); cdecl; external libelementary;
procedure elm_interface_scrollable_content_region_set(obj: PEo; x: longint; y: longint; w: longint; h: longint); cdecl; external libelementary;
procedure elm_interface_scrollable_content_region_get(obj: PEo; x: Plongint; y: Plongint; w: Plongint; h: Plongint); cdecl; external libelementary;
procedure elm_interface_scrollable_content_events_set(obj: PEo; repeat_events: TEina_Bool); cdecl; external libelementary;
function elm_interface_scrollable_content_events_get(obj: PEo): TEina_Bool; cdecl; external libelementary;
procedure elm_interface_scrollable_page_size_set(obj: PEo; x: longint; y: longint); cdecl; external libelementary;
procedure elm_interface_scrollable_page_size_get(obj: PEo; x: Plongint; y: Plongint); cdecl; external libelementary;
procedure elm_interface_scrollable_bounce_animator_disabled_set(obj: PEo; disabled: TEina_Bool); cdecl; external libelementary;
function elm_interface_scrollable_bounce_animator_disabled_get(obj: PEo): TEina_Bool; cdecl; external libelementary;
procedure elm_interface_scrollable_page_scroll_limit_set(obj: PEo; page_limit_h: longint; page_limit_v: longint); cdecl; external libelementary;
procedure elm_interface_scrollable_page_scroll_limit_get(obj: PEo; page_limit_h: Plongint; page_limit_v: Plongint); cdecl; external libelementary;
procedure elm_interface_scrollable_page_snap_allow_set(obj: PEo; horiz: TEina_Bool; vert: TEina_Bool); cdecl; external libelementary;
procedure elm_interface_scrollable_page_snap_allow_get(obj: PEo; horiz: PEina_Bool; vert: PEina_Bool); cdecl; external libelementary;
procedure elm_interface_scrollable_paging_set(obj: PEo; pagerel_h: double; pagerel_v: double; pagesize_h: longint; pagesize_v: longint); cdecl; external libelementary;
procedure elm_interface_scrollable_paging_get(obj: PEo; pagerel_h: Pdouble; pagerel_v: Pdouble; pagesize_h: Plongint; pagesize_v: Plongint); cdecl; external libelementary;
procedure elm_interface_scrollable_single_direction_set(obj: PEo; single_dir: TElm_Scroller_Single_Direction); cdecl; external libelementary;
function elm_interface_scrollable_single_direction_get(obj: PEo): TElm_Scroller_Single_Direction; cdecl; external libelementary;
procedure elm_interface_scrollable_step_size_set(obj: PEo; x: longint; y: longint); cdecl; external libelementary;
procedure elm_interface_scrollable_step_size_get(obj: PEo; x: Plongint; y: Plongint); cdecl; external libelementary;
procedure elm_interface_scrollable_content_loop_set(obj: PEo; loop_h: TEina_Bool; loop_v: TEina_Bool); cdecl; external libelementary;
procedure elm_interface_scrollable_content_loop_get(obj: PEo; loop_h: PEina_Bool; loop_v: PEina_Bool); cdecl; external libelementary;
procedure elm_interface_scrollable_scroll_up_cb_set(obj: PEo; scroll_up_cb: TElm_Interface_Scrollable_Cb); cdecl; external libelementary;
procedure elm_interface_scrollable_hbar_drag_cb_set(obj: PEo; hbar_drag_cb: TElm_Interface_Scrollable_Cb); cdecl; external libelementary;
procedure elm_interface_scrollable_drag_start_cb_set(obj: PEo; drag_start_cb: TElm_Interface_Scrollable_Cb); cdecl; external libelementary;
procedure elm_interface_scrollable_freeze_set(obj: PEo; freeze: TEina_Bool); cdecl; external libelementary;
procedure elm_interface_scrollable_content_viewport_resize_cb_set(obj: PEo; viewport_resize_cb: TElm_Interface_Scrollable_Resize_Cb); cdecl; external libelementary;
procedure elm_interface_scrollable_scroll_left_cb_set(obj: PEo; scroll_left_cb: TElm_Interface_Scrollable_Cb); cdecl; external libelementary;
procedure elm_interface_scrollable_vbar_press_cb_set(obj: PEo; vbar_press_cb: TElm_Interface_Scrollable_Cb); cdecl; external libelementary;
procedure elm_interface_scrollable_hbar_press_cb_set(obj: PEo; hbar_press_cb: TElm_Interface_Scrollable_Cb); cdecl; external libelementary;
procedure elm_interface_scrollable_hbar_unpress_cb_set(obj: PEo; hbar_unpress_cb: TElm_Interface_Scrollable_Cb); cdecl; external libelementary;
procedure elm_interface_scrollable_drag_stop_cb_set(obj: PEo; drag_stop_cb: TElm_Interface_Scrollable_Cb); cdecl; external libelementary;
procedure elm_interface_scrollable_extern_pan_set(obj: PEo; pan: PEfl_Canvas_Object); cdecl; external libelementary;
procedure elm_interface_scrollable_page_change_cb_set(obj: PEo; page_change_cb: TElm_Interface_Scrollable_Cb); cdecl; external libelementary;
procedure elm_interface_scrollable_hold_set(obj: PEo; hold: TEina_Bool); cdecl; external libelementary;
procedure elm_interface_scrollable_animate_start_cb_set(obj: PEo; animate_start_cb: TElm_Interface_Scrollable_Cb); cdecl; external libelementary;
procedure elm_interface_scrollable_scroll_down_cb_set(obj: PEo; scroll_down_cb: TElm_Interface_Scrollable_Cb); cdecl; external libelementary;
procedure elm_interface_scrollable_page_relative_set(obj: PEo; h_pagerel: double; v_pagerel: double); cdecl; external libelementary;
procedure elm_interface_scrollable_scroll_cb_set(obj: PEo; scroll_cb: TElm_Interface_Scrollable_Cb); cdecl; external libelementary;
procedure elm_interface_scrollable_animate_stop_cb_set(obj: PEo; animate_stop_cb: TElm_Interface_Scrollable_Cb); cdecl; external libelementary;
procedure elm_interface_scrollable_content_min_limit_cb_set(obj: PEo; min_limit_cb: TElm_Interface_Scrollable_Min_Limit_Cb); cdecl; external libelementary;
procedure elm_interface_scrollable_scroll_right_cb_set(obj: PEo; scroll_right_cb: TElm_Interface_Scrollable_Cb); cdecl; external libelementary;
procedure elm_interface_scrollable_content_set(obj: PEo; content: PEfl_Canvas_Object); cdecl; external libelementary;
procedure elm_interface_scrollable_edge_left_cb_set(obj: PEo; edge_left_cb: TElm_Interface_Scrollable_Cb); cdecl; external libelementary;
procedure elm_interface_scrollable_vbar_drag_cb_set(obj: PEo; vbar_drag_cb: TElm_Interface_Scrollable_Cb); cdecl; external libelementary;
procedure elm_interface_scrollable_vbar_unpress_cb_set(obj: PEo; vbar_unpress_cb: TElm_Interface_Scrollable_Cb); cdecl; external libelementary;
procedure elm_interface_scrollable_edge_bottom_cb_set(obj: PEo; edge_bottom_cb: TElm_Interface_Scrollable_Cb); cdecl; external libelementary;
procedure elm_interface_scrollable_edge_right_cb_set(obj: PEo; edge_right_cb: TElm_Interface_Scrollable_Cb); cdecl; external libelementary;
procedure elm_interface_scrollable_edge_top_cb_set(obj: PEo; edge_top_cb: TElm_Interface_Scrollable_Cb); cdecl; external libelementary;
procedure elm_interface_scrollable_objects_set(obj: PEo; edje_object: PEfl_Canvas_Object; hit_rectangle: PEfl_Canvas_Object); cdecl; external libelementary;
procedure elm_interface_scrollable_last_page_get(obj: PEo; pagenumber_h: Plongint; pagenumber_v: Plongint); cdecl; external libelementary;
procedure elm_interface_scrollable_current_page_get(obj: PEo; pagenumber_h: Plongint; pagenumber_v: Plongint); cdecl; external libelementary;
procedure elm_interface_scrollable_content_viewport_geometry_get(obj: PEo; x: Plongint; y: Plongint; w: Plongint; h: Plongint); cdecl; external libelementary;
procedure elm_interface_scrollable_content_size_get(obj: PEo; w: Plongint; h: Plongint); cdecl; external libelementary;
procedure elm_interface_scrollable_content_pos_set(obj: PEo; x: longint; y: longint; sig: TEina_Bool); cdecl; external libelementary;
procedure elm_interface_scrollable_content_pos_get(obj: PEo; x: Plongint; y: Plongint); cdecl; external libelementary;
procedure elm_interface_scrollable_page_show(obj: PEo; pagenumber_h: longint; pagenumber_v: longint); cdecl; external libelementary;
procedure elm_interface_scrollable_region_bring_in(obj: PEo; x: longint; y: longint; w: longint; h: longint); cdecl; external libelementary;
procedure elm_interface_scrollable_page_bring_in(obj: PEo; pagenumber_h: longint; pagenumber_v: longint); cdecl; external libelementary;
procedure elm_interface_scrollable_content_region_show(obj: PEo; x: longint; y: longint; w: longint; h: longint); cdecl; external libelementary;
procedure elm_interface_scrollable_content_min_limit(obj: PEo; w: TEina_Bool; h: TEina_Bool); cdecl; external libelementary;
procedure elm_interface_scrollable_item_loop_enabled_set(obj: PEo; enable: TEina_Bool); cdecl; external libelementary;
function elm_interface_scrollable_item_loop_enabled_get(obj: PEo): TEina_Bool; cdecl; external libelementary;

procedure elm_interface_scrollable_reset_signals(obj: PEo); cdecl; external libelementary;

var
  _ELM_INTERFACE_SCROLLABLE_EVENT_CHANGED: TEfl_Event_Description; cvar;external libelementary;

function ELM_INTERFACE_SCROLLABLE_EVENT_CHANGED: PEfl_Event_Description;
{$endif}

// === Konventiert am: 25-5-25 18:43:48 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


function ELM_INTERFACE_SCROLLABLE_MIXIN: PEfl_Class;
begin
  ELM_INTERFACE_SCROLLABLE_MIXIN := elm_interface_scrollable_mixin_get;
end;

function ELM_INTERFACE_SCROLLABLE_EVENT_CHANGED: PEfl_Event_Description;
begin
  ELM_INTERFACE_SCROLLABLE_EVENT_CHANGED := @(_ELM_INTERFACE_SCROLLABLE_EVENT_CHANGED);
end;


{$ENDIF read_implementation}
