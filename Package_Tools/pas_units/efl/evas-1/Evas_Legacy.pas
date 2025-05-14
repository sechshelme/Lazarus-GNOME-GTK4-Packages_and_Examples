unit Evas_Legacy;

interface

uses
  efl, eina_types, Evas_Common, Evas_Loader, efl_canvas_vg_container_eo_legacy, efl_canvas_vg_shape_eo_legacy, efl_canvas_vg_node_eo_legacy, efl_canvas_vg_gradient_eo_legacy;


  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


function evas_new: PEvas; cdecl; external libevas;
procedure evas_free(e: PEvas); cdecl; external libevas;

type
  TEvas_Engine_Info = record
    magic: longint;
  end;
  PEvas_Engine_Info = ^TEvas_Engine_Info;

function evas_engine_info_set(obj: PEvas; info: PEvas_Engine_Info): TEina_Bool; cdecl; external libevas;
function evas_engine_info_get(obj: PEvas): PEvas_Engine_Info; cdecl; external libevas;
function evas_image_max_size_get(eo_e: PEo; w: Plongint; h: Plongint): TEina_Bool; cdecl; external libevas;

type
  TEvas_Lock = record
  end;
  PEvas_Lock = ^TEvas_Lock;

  TEvas_Modifier = record
  end;
  PEvas_Modifier = ^TEvas_Modifier;

  TEvas_Modifier_Mask = uint64;
  PEvas_Modifier_Mask = ^TEvas_Modifier_Mask;

  TEvas_Event_Mouse_Down = record
    button: longint;
    output: TEvas_Point;
    canvas: TEvas_Coord_Point;
    data: pointer;
    modifiers: PEvas_Modifier;
    locks: PEvas_Lock;
    flags: TEvas_Button_Flags;
    timestamp: dword;
    event_flags: TEvas_Event_Flags;
    dev: PEvas_Device;
    event_src: PEvas_Object;
  end;
  PEvas_Event_Mouse_Down = ^TEvas_Event_Mouse_Down;

  TEvas_Event_Mouse_Up = record
    button: longint;
    output: TEvas_Point;
    canvas: TEvas_Coord_Point;
    data: pointer;
    modifiers: PEvas_Modifier;
    locks: PEvas_Lock;
    flags: TEvas_Button_Flags;
    timestamp: dword;
    event_flags: TEvas_Event_Flags;
    dev: PEvas_Device;
    event_src: PEvas_Object;
  end;
  PEvas_Event_Mouse_Up = ^TEvas_Event_Mouse_Up;

  TEvas_Event_Mouse_In = record
    buttons: longint;
    output: TEvas_Point;
    canvas: TEvas_Coord_Point;
    data: pointer;
    modifiers: PEvas_Modifier;
    locks: PEvas_Lock;
    timestamp: dword;
    event_flags: TEvas_Event_Flags;
    dev: PEvas_Device;
    event_src: PEvas_Object;
  end;
  PEvas_Event_Mouse_In = ^TEvas_Event_Mouse_In;

  TEvas_Event_Mouse_Out = record
    buttons: longint;
    output: TEvas_Point;
    canvas: TEvas_Coord_Point;
    data: pointer;
    modifiers: PEvas_Modifier;
    locks: PEvas_Lock;
    timestamp: dword;
    event_flags: TEvas_Event_Flags;
    dev: PEvas_Device;
    event_src: PEvas_Object;
  end;
  PEvas_Event_Mouse_Out = ^TEvas_Event_Mouse_Out;

  TEvas_Event_Mouse_Move = record
    buttons: longint;
    cur: TEvas_Position;
    prev: TEvas_Position;
    data: pointer;
    modifiers: PEvas_Modifier;
    locks: PEvas_Lock;
    timestamp: dword;
    event_flags: TEvas_Event_Flags;
    dev: PEvas_Device;
    event_src: PEvas_Object;
  end;
  PEvas_Event_Mouse_Move = ^TEvas_Event_Mouse_Move;

  TEvas_Event_Mouse_Wheel = record
    direction: longint;
    z: longint;
    output: TEvas_Point;
    canvas: TEvas_Coord_Point;
    data: pointer;
    modifiers: PEvas_Modifier;
    locks: PEvas_Lock;
    timestamp: dword;
    event_flags: TEvas_Event_Flags;
    dev: PEvas_Device;
  end;
  PEvas_Event_Mouse_Wheel = ^TEvas_Event_Mouse_Wheel;

  TEvas_Event_Multi_Down = record
    device: longint;
    radius: double;
    radius_x: double;
    radius_y: double;
    pressure: double;
    angle: double;
    output: TEvas_Point;
    canvas: TEvas_Coord_Precision_Point;
    data: pointer;
    modifiers: PEvas_Modifier;
    locks: PEvas_Lock;
    flags: TEvas_Button_Flags;
    timestamp: dword;
    event_flags: TEvas_Event_Flags;
    dev: PEvas_Device;
  end;
  PEvas_Event_Multi_Down = ^TEvas_Event_Multi_Down;

  TEvas_Event_Multi_Up = record
    device: longint;
    radius: double;
    radius_x: double;
    radius_y: double;
    pressure: double;
    angle: double;
    output: TEvas_Point;
    canvas: TEvas_Coord_Precision_Point;
    data: pointer;
    modifiers: PEvas_Modifier;
    locks: PEvas_Lock;
    flags: TEvas_Button_Flags;
    timestamp: dword;
    event_flags: TEvas_Event_Flags;
    dev: PEvas_Device;
  end;
  PEvas_Event_Multi_Up = ^TEvas_Event_Multi_Up;

  TEvas_Event_Multi_Move = record
    device: longint;
    radius: double;
    radius_x: double;
    radius_y: double;
    pressure: double;
    angle: double;
    cur: TEvas_Precision_Position;
    data: pointer;
    modifiers: PEvas_Modifier;
    locks: PEvas_Lock;
    timestamp: dword;
    event_flags: TEvas_Event_Flags;
    dev: PEvas_Device;
  end;
  PEvas_Event_Multi_Move = ^TEvas_Event_Multi_Move;

  TEvas_Event_Key_Down = record
    keyname: pchar;
    data: pointer;
    modifiers: PEvas_Modifier;
    locks: PEvas_Lock;
    key: pchar;
    _string: pchar;
    compose: pchar;
    timestamp: dword;
    event_flags: TEvas_Event_Flags;
    dev: PEvas_Device;
    keycode: dword;
  end;
  PEvas_Event_Key_Down = ^TEvas_Event_Key_Down;

  TEvas_Event_Key_Up = record
    keyname: pchar;
    data: pointer;
    modifiers: PEvas_Modifier;
    locks: PEvas_Lock;
    key: pchar;
    _string: pchar;
    compose: pchar;
    timestamp: dword;
    event_flags: TEvas_Event_Flags;
    dev: PEvas_Device;
    keycode: dword;
  end;
  PEvas_Event_Key_Up = ^TEvas_Event_Key_Up;

  TEvas_Event_Hold = record
    hold: longint;
    data: pointer;
    timestamp: dword;
    event_flags: TEvas_Event_Flags;
    dev: PEvas_Device;
  end;
  PEvas_Event_Hold = ^TEvas_Event_Hold;

  PEvas_Axis_Label = ^TEvas_Axis_Label;
  TEvas_Axis_Label = longint;

const
  EVAS_AXIS_LABEL_UNKNOWN = 0;
  EVAS_AXIS_LABEL_X = 1;
  EVAS_AXIS_LABEL_Y = 2;
  EVAS_AXIS_LABEL_PRESSURE = 3;
  EVAS_AXIS_LABEL_DISTANCE = 4;
  EVAS_AXIS_LABEL_AZIMUTH = 5;
  EVAS_AXIS_LABEL_TILT = 6;
  EVAS_AXIS_LABEL_TWIST = 7;
  EVAS_AXIS_LABEL_TOUCH_WIDTH_MAJOR = 8;
  EVAS_AXIS_LABEL_TOUCH_WIDTH_MINOR = 9;
  EVAS_AXIS_LABEL_TOOL_WIDTH_MAJOR = 10;
  EVAS_AXIS_LABEL_TOOL_WIDTH_MINOR = 11;
  EVAS_AXIS_LABEL_WINDOW_X = 12;
  EVAS_AXIS_LABEL_WINDOW_Y = 13;
  EVAS_AXIS_LABEL_NORMAL_X = 14;
  EVAS_AXIS_LABEL_NORMAL_Y = 15;

type
  TEvas_Axis = record
    _label: TEvas_Axis_Label;
    value: double;
  end;
  PEvas_Axis = ^TEvas_Axis;

  TEvas_Event_Axis_Update = record
    data: pointer;
    timestamp: dword;
    device: longint;
    toolid: longint;
    naxis: longint;
    axis: PEvas_Axis;
    dev: PEvas_Device;
  end;
  PEvas_Event_Axis_Update = ^TEvas_Event_Axis_Update;

procedure evas_event_callback_add(e: PEvas; _type: TEvas_Callback_Type; func: TEvas_Event_Cb; data: pointer); cdecl; external libevas;
procedure evas_event_callback_priority_add(e: PEvas; _type: TEvas_Callback_Type; priority: TEvas_Callback_Priority; func: TEvas_Event_Cb; data: pointer); cdecl; external libevas;
function evas_event_callback_del(e: PEvas; _type: TEvas_Callback_Type; func: TEvas_Event_Cb): pointer; cdecl; external libevas;
function evas_event_callback_del_full(e: PEvas; _type: TEvas_Callback_Type; func: TEvas_Event_Cb; data: pointer): pointer; cdecl; external libevas;
procedure evas_post_event_callback_push(e: PEvas; func: TEvas_Object_Event_Post_Cb; data: pointer); cdecl; external libevas;
procedure evas_post_event_callback_remove(e: PEvas; func: TEvas_Object_Event_Post_Cb); cdecl; external libevas;
procedure evas_post_event_callback_remove_full(e: PEvas; func: TEvas_Object_Event_Post_Cb; data: pointer); cdecl; external libevas;
procedure evas_event_freeze(e: PEvas); cdecl; external libevas;
procedure evas_event_thaw(e: PEvas); cdecl; external libevas;
function evas_event_freeze_get(e: PEvas): longint; cdecl; external libevas;
procedure evas_event_thaw_eval(e: PEvas); cdecl; external libevas;
procedure evas_event_feed_mouse_move(obj: PEvas; x: longint; y: longint; timestamp: dword; data: pointer); cdecl; external libevas;
procedure evas_event_input_mouse_move(obj: PEvas; x: longint; y: longint; timestamp: dword; data: pointer); cdecl; external libevas;
procedure evas_event_feed_mouse_up(obj: PEvas; b: longint; flags: TEvas_Button_Flags; timestamp: dword; data: pointer); cdecl; external libevas;
procedure evas_event_feed_mouse_down(obj: PEvas; b: longint; flags: TEvas_Button_Flags; timestamp: dword; data: pointer); cdecl; external libevas;
procedure evas_event_feed_mouse_wheel(obj: PEvas; direction: longint; z: longint; timestamp: dword; data: pointer); cdecl; external libevas;
procedure evas_event_feed_mouse_in(obj: PEvas; timestamp: dword; data: pointer); cdecl; external libevas;
procedure evas_event_feed_mouse_out(obj: PEvas; timestamp: dword; data: pointer); cdecl; external libevas;
procedure evas_event_feed_mouse_cancel(obj: PEvas; timestamp: dword; data: pointer); cdecl; external libevas;
procedure evas_event_input_multi_down(obj: PEvas; d: longint; x: longint; y: longint; rad: double;
  radx: double; rady: double; pres: double; ang: double; fx: double;
  fy: double; flags: TEvas_Button_Flags; timestamp: dword; data: pointer); cdecl; external libevas;
procedure evas_event_input_multi_move(obj: PEvas; d: longint; x: longint; y: longint; rad: double;
  radx: double; rady: double; pres: double; ang: double; fx: double;
  fy: double; timestamp: dword; data: pointer); cdecl; external libevas;
procedure evas_event_input_multi_up(obj: PEvas; d: longint; x: longint; y: longint; rad: double;
  radx: double; rady: double; pres: double; ang: double; fx: double;
  fy: double; flags: TEvas_Button_Flags; timestamp: dword; data: pointer); cdecl; external libevas;
procedure evas_event_feed_multi_down(obj: PEvas; d: longint; x: longint; y: longint; rad: double;
  radx: double; rady: double; pres: double; ang: double; fx: double;
  fy: double; flags: TEvas_Button_Flags; timestamp: dword; data: pointer); cdecl; external libevas;
procedure evas_event_feed_multi_move(obj: PEvas; d: longint; x: longint; y: longint; rad: double;
  radx: double; rady: double; pres: double; ang: double; fx: double;
  fy: double; timestamp: dword; data: pointer); cdecl; external libevas;
procedure evas_event_feed_multi_up(obj: PEvas; d: longint; x: longint; y: longint; rad: double;
  radx: double; rady: double; pres: double; ang: double; fx: double;
  fy: double; flags: TEvas_Button_Flags; timestamp: dword; data: pointer); cdecl; external libevas;
procedure evas_event_feed_key_down(obj: PEvas; keyname: pchar; key: pchar; _string: pchar; compose: pchar;
  timestamp: dword; data: pointer); cdecl; external libevas;
procedure evas_event_feed_key_up(obj: PEvas; keyname: pchar; key: pchar; _string: pchar; compose: pchar;
  timestamp: dword; data: pointer); cdecl; external libevas;
procedure evas_event_feed_key_down_with_keycode(obj: PEvas; keyname: pchar; key: pchar; _string: pchar; compose: pchar;
  timestamp: dword; data: pointer; keycode: dword); cdecl; external libevas;
procedure evas_event_feed_key_up_with_keycode(obj: PEvas; keyname: pchar; key: pchar; _string: pchar; compose: pchar;
  timestamp: dword; data: pointer; keycode: dword); cdecl; external libevas;
procedure evas_event_feed_axis_update(obj: PEvas; timestamp: dword; device: longint; toolid: longint; naxes: longint;
  axis: PEvas_Axis; data: pointer); cdecl; external libevas;
procedure evas_event_feed_hold(obj: PEvas; hold: longint; timestamp: dword; data: pointer); cdecl; external libevas;
procedure evas_event_refeed_event(obj: PEvas; event_copy: pointer; event_type: TEvas_Callback_Type); cdecl; external libevas;
function evas_key_modifier_get(obj: PEvas): PEvas_Modifier; cdecl; external libevas;
function evas_key_modifier_mask_get(evas: PEvas; keyname: pchar): TEvas_Modifier_Mask; cdecl; external libevas;
function evas_key_modifier_is_set(m: PEvas_Modifier; keyname: pchar): TEina_Bool; cdecl; external libevas;
function evas_seat_key_modifier_is_set(m: PEvas_Modifier; keyname: pchar; seat: PEvas_Device): TEina_Bool; cdecl; external libevas;
function evas_key_lock_is_set(l: PEvas_Lock; keyname: pchar): TEina_Bool; cdecl; external libevas;
function evas_seat_key_lock_is_set(l: PEvas_Lock; keyname: pchar; seat: PEvas_Device): TEina_Bool; cdecl; external libevas;
function evas_key_lock_get(obj: PEvas): PEvas_Lock; cdecl; external libevas;
function evas_pointer_inside_by_device_get(obj: PEvas; dev: PEfl_Input_Device): TEina_Bool; cdecl; external libevas;
function evas_pointer_inside_get(obj: PEvas): TEina_Bool; cdecl; external libevas;

type
  PEvas_Touch_Point_State = ^TEvas_Touch_Point_State;
  TEvas_Touch_Point_State = longint;

const
  EVAS_TOUCH_POINT_DOWN = 0;
  EVAS_TOUCH_POINT_UP = 1;
  EVAS_TOUCH_POINT_MOVE = 2;
  EVAS_TOUCH_POINT_STILL = 3;
  EVAS_TOUCH_POINT_CANCEL = 4;

function evas_touch_point_list_count(obj: PEvas): dword; cdecl; external libevas;
function evas_touch_point_list_nth_id_get(obj: PEvas; n: dword): longint; cdecl; external libevas;
function evas_touch_point_list_nth_state_get(obj: PEvas; n: dword): TEvas_Touch_Point_State; cdecl; external libevas;
procedure evas_touch_point_list_nth_xy_get(eo_e: PEvas; n: dword; x: PEvas_Coord; y: PEvas_Coord); cdecl; external libevas;
procedure evas_font_available_list_free(e: PEvas; available: PEina_List); cdecl; external libevas;

type
  PEvas_Font_Hinting_Flags = ^TEvas_Font_Hinting_Flags;
  TEvas_Font_Hinting_Flags = longint;

const
  EVAS_FONT_HINTING_NONE = 0;
  EVAS_FONT_HINTING_AUTO = 1;
  EVAS_FONT_HINTING_BYTECODE = 2;

procedure evas_font_hinting_set(e: PEvas; hinting: TEvas_Font_Hinting_Flags); cdecl; external libevas;
function evas_font_hinting_get(e: PEvas): TEvas_Font_Hinting_Flags; cdecl; external libevas;
function evas_font_hinting_can_hint(e: PEvas; hinting: TEvas_Font_Hinting_Flags): TEina_Bool; cdecl; external libevas;
procedure evas_object_ref(obj: PEvas_Object); cdecl; external libevas;
procedure evas_object_unref(obj: PEvas_Object); cdecl; external libevas;
function evas_object_ref_get(obj: PEvas_Object): longint; cdecl; external libevas;
procedure evas_object_del(obj: PEvas_Object); cdecl; external libevas;
function evas_object_type_get(obj: PEvas_Object): pchar; cdecl; external libevas;
procedure evas_object_name_set(obj: PEvas_Object; name: pchar); cdecl; external libevas;
function evas_object_name_get(obj: PEvas_Object): pchar; cdecl; external libevas;
function evas_object_name_child_find(obj: PEvas_Object; name: pchar; recurse: longint): PEvas_Object; cdecl; external libevas;
procedure evas_object_geometry_get(obj: PEvas_Object; x: PEvas_Coord; y: PEvas_Coord; w: PEvas_Coord; h: PEvas_Coord); cdecl; external libevas;
procedure evas_object_geometry_set(obj: PEvas_Object; x: TEvas_Coord; y: TEvas_Coord; w: TEvas_Coord; h: TEvas_Coord); cdecl; external libevas;
procedure evas_object_show(obj: PEvas_Object); cdecl; external libevas;
procedure evas_object_hide(obj: PEvas_Object); cdecl; external libevas;
procedure evas_object_color_set(obj: PEvas_Object; r: longint; g: longint; b: longint; a: longint); cdecl; external libevas;
procedure evas_object_color_get(obj: PEvas_Object; r: Plongint; g: Plongint; b: Plongint; a: Plongint); cdecl; external libevas;
procedure evas_object_move(obj: PEvas_Object; x: TEvas_Coord; y: TEvas_Coord); cdecl; external libevas;
procedure evas_object_resize(obj: PEvas_Object; w: TEvas_Coord; h: TEvas_Coord); cdecl; external libevas;
function evas_object_visible_get(obj: PEvas_Object): TEina_Bool; cdecl; external libevas;
procedure evas_object_size_hint_max_set(obj: PEvas_Object; w: TEvas_Coord; h: TEvas_Coord); cdecl; external libevas;
procedure evas_object_size_hint_max_get(obj: PEvas_Object; w: PEvas_Coord; h: PEvas_Coord); cdecl; external libevas;
procedure evas_object_size_hint_request_set(obj: PEvas_Object; w: TEvas_Coord; h: TEvas_Coord); cdecl; external libevas;
procedure evas_object_size_hint_request_get(obj: PEvas_Object; w: PEvas_Coord; h: PEvas_Coord); cdecl; external libevas;
procedure evas_object_size_hint_min_set(obj: PEvas_Object; w: TEvas_Coord; h: TEvas_Coord); cdecl; external libevas;
procedure evas_object_clip_unset(obj: PEvas_Object); cdecl; external libevas;
procedure evas_object_size_hint_min_get(obj: PEvas_Object; w: PEvas_Coord; h: PEvas_Coord); cdecl; external libevas;
procedure evas_object_size_hint_padding_set(obj: PEvas_Object; l: TEvas_Coord; r: TEvas_Coord; t: TEvas_Coord; b: TEvas_Coord); cdecl; external libevas;
procedure evas_object_size_hint_padding_get(obj: PEvas_Object; l: PEvas_Coord; r: PEvas_Coord; t: PEvas_Coord; b: PEvas_Coord); cdecl; external libevas;
procedure evas_object_size_hint_weight_set(obj: PEvas_Object; x: double; y: double); cdecl; external libevas;
procedure evas_object_size_hint_weight_get(obj: PEvas_Object; x: Pdouble; y: Pdouble); cdecl; external libevas;
procedure evas_object_size_hint_align_set(obj: PEvas_Object; x: double; y: double); cdecl; external libevas;
procedure evas_object_size_hint_align_get(obj: PEvas_Object; x: Pdouble; y: Pdouble); cdecl; external libevas;
procedure evas_object_size_hint_aspect_set(obj: PEvas_Object; aspect: TEvas_Aspect_Control; w: TEvas_Coord; h: TEvas_Coord); cdecl; external libevas;
procedure evas_object_size_hint_aspect_get(obj: PEvas_Object; aspect: PEvas_Aspect_Control; w: PEvas_Coord; h: PEvas_Coord); cdecl; external libevas;

type
  PEfl_Gfx_Hint_Mode = ^TEfl_Gfx_Hint_Mode;
  TEfl_Gfx_Hint_Mode = longint;

const
  EFL_GFX_HINT_MODE_NONE = 0;
  EFL_GFX_HINT_MODE_COMPRESS = 1;
  EFL_GFX_HINT_MODE_EXPAND = 2;
  EFL_GFX_HINT_MODE_DONT_CHANGE = 3;

type
  PEvas_Display_Mode = ^TEvas_Display_Mode;
  TEvas_Display_Mode = TEfl_Gfx_Hint_Mode;

const
  EVAS_DISPLAY_MODE_NONE = EFL_GFX_HINT_MODE_NONE;
  EVAS_DISPLAY_MODE_COMPRESS = EFL_GFX_HINT_MODE_COMPRESS;
  EVAS_DISPLAY_MODE_EXPAND = EFL_GFX_HINT_MODE_EXPAND;
  EVAS_DISPLAY_MODE_DONT_CHANGE = EFL_GFX_HINT_MODE_DONT_CHANGE;

procedure evas_object_size_hint_display_mode_set(obj: PEvas_Object; dispmode: TEvas_Display_Mode); cdecl; external libevas;
function evas_object_size_hint_display_mode_get(obj: PEvas_Object): TEvas_Display_Mode; cdecl; external libevas;
procedure evas_object_layer_set(obj: PEvas_Object; l: smallint); cdecl; external libevas;
function evas_object_layer_get(obj: PEvas_Object): smallint; cdecl; external libevas;
function evas_object_below_get(obj: PEvas_Object): PEvas_Object; cdecl; external libevas;
function evas_object_above_get(obj: PEvas_Object): PEvas_Object; cdecl; external libevas;
procedure evas_object_stack_below(obj: PEvas_Object; below: PEvas_Object); cdecl; external libevas;
procedure evas_object_raise(obj: PEvas_Object); cdecl; external libevas;
procedure evas_object_stack_above(obj: PEvas_Object; above: PEvas_Object); cdecl; external libevas;
procedure evas_object_lower(obj: PEvas_Object); cdecl; external libevas;
procedure evas_object_static_clip_set(obj: PEvas_Object; is_static_clip: TEina_Bool); cdecl; external libevas;
function evas_object_clipees_get(obj: PEvas_Object): PEina_List; cdecl; external libevas;
function evas_object_clipees_has(obj: PEvas_Object): TEina_Bool; cdecl; external libevas;

type
  PEvas_Render_Op = ^TEvas_Render_Op;
  TEvas_Render_Op = longint;

const
  EVAS_RENDER_BLEND = 0;
  EVAS_RENDER_BLEND_REL = 1;
  EVAS_RENDER_COPY = 2;
  EVAS_RENDER_COPY_REL = 3;
  EVAS_RENDER_ADD = 4;
  EVAS_RENDER_ADD_REL = 5;
  EVAS_RENDER_SUB = 6;
  EVAS_RENDER_SUB_REL = 7;
  EVAS_RENDER_TINT = 8;
  EVAS_RENDER_TINT_REL = 9;
  EVAS_RENDER_MASK = 10;
  EVAS_RENDER_MUL = 11;

procedure evas_object_render_op_set(obj: PEvas_Object; render_op: TEvas_Render_Op); cdecl; external libevas;
function evas_object_render_op_get(obj: PEvas_Object): TEvas_Render_Op; cdecl; external libevas;
function evas_object_static_clip_get(obj: PEvas_Object): TEina_Bool; cdecl; external libevas;
procedure evas_object_scale_set(obj: PEvas_Object; scale: double); cdecl; external libevas;
function evas_object_scale_get(obj: PEvas_Object): double; cdecl; external libevas;
function evas_object_pointer_inside_by_device_get(obj: PEvas_Object; dev: PEfl_Input_Device): TEina_Bool; cdecl; external libevas;
function evas_object_pointer_inside_get(obj: PEvas_Object): TEina_Bool; cdecl; external libevas;
function evas_object_pointer_coords_inside_get(eo_obj: PEvas_Object; x: longint; y: longint): TEina_Bool; cdecl; external libevas;
function evas_object_evas_get(obj: PEo): PEvas; cdecl; external libevas;
function evas_objects_at_xy_get(eo_e: PEo; x: longint; y: longint; include_pass_events_objects: TEina_Bool; include_hidden_objects: TEina_Bool): PEina_List; cdecl; external libevas;
function evas_object_top_at_xy_get(eo_e: PEo; x: TEvas_Coord; y: TEvas_Coord; include_pass_events_objects: TEina_Bool; include_hidden_objects: TEina_Bool): PEvas_Object; cdecl; external libevas;
function evas_objects_in_rectangle_get(obj: PEo; x: longint; y: longint; w: longint; h: longint;
  include_pass_events_objects: TEina_Bool; include_hidden_objects: TEina_Bool): PEina_List; cdecl; external libevas;
function evas_object_top_in_rectangle_get(obj: PEo; x: longint; y: longint; w: longint; h: longint;
  include_pass_events_objects: TEina_Bool; include_hidden_objects: TEina_Bool): PEvas_Object; cdecl; external libevas;
procedure evas_object_event_callback_add(obj: PEvas_Object; _type: TEvas_Callback_Type; func: TEvas_Object_Event_Cb; data: pointer); cdecl; external libevas;
procedure evas_object_event_callback_priority_add(obj: PEvas_Object; _type: TEvas_Callback_Type; priority: TEvas_Callback_Priority; func: TEvas_Object_Event_Cb; data: pointer); cdecl; external libevas;
function evas_object_event_callback_del(obj: PEvas_Object; _type: TEvas_Callback_Type; func: TEvas_Object_Event_Cb): pointer; cdecl; external libevas;
function evas_object_event_callback_del_full(obj: PEvas_Object; _type: TEvas_Callback_Type; func: TEvas_Object_Event_Cb; data: pointer): pointer; cdecl; external libevas;
function evas_object_key_grab(obj: PEvas_Object; keyname: pchar; modifiers: TEvas_Modifier_Mask; not_modifiers: TEvas_Modifier_Mask; exclusive: TEina_Bool): TEina_Bool; cdecl; external libevas;
procedure evas_object_key_ungrab(obj: PEvas_Object; keyname: pchar; modifiers: TEvas_Modifier_Mask; not_modifiers: TEvas_Modifier_Mask); cdecl; external libevas;
procedure evas_object_data_set(obj: PEvas_Object; key: pchar; data: pointer); cdecl; external libevas;
function evas_object_data_get(obj: PEvas_Object; key: pchar): pointer; cdecl; external libevas;
function evas_object_data_del(obj: PEvas_Object; key: pchar): pointer; cdecl; external libevas;
function evas_object_top_at_pointer_get(e: PEvas): PEvas_Object; cdecl; external libevas;

type
  TEvas_Object_Intercept_Show_Cb = procedure(data: pointer; obj: PEvas_Object); cdecl;
  TEvas_Object_Intercept_Hide_Cb = procedure(data: pointer; obj: PEvas_Object); cdecl;
  TEvas_Object_Intercept_Move_Cb = procedure(data: pointer; obj: PEvas_Object; x: TEvas_Coord; y: TEvas_Coord); cdecl;
  TEvas_Object_Intercept_Resize_Cb = procedure(data: pointer; obj: PEvas_Object; w: TEvas_Coord; h: TEvas_Coord); cdecl;
  TEvas_Object_Intercept_Raise_Cb = procedure(data: pointer; obj: PEvas_Object); cdecl;
  TEvas_Object_Intercept_Lower_Cb = procedure(data: pointer; obj: PEvas_Object); cdecl;
  TEvas_Object_Intercept_Stack_Above_Cb = procedure(data: pointer; obj: PEvas_Object; above: PEvas_Object); cdecl;
  TEvas_Object_Intercept_Stack_Below_Cb = procedure(data: pointer; obj: PEvas_Object; above: PEvas_Object); cdecl;
  TEvas_Object_Intercept_Layer_Set_Cb = procedure(data: pointer; obj: PEvas_Object; l: longint); cdecl;
  TEvas_Object_Intercept_Focus_Set_Cb = procedure(data: pointer; obj: PEvas_Object; focus: TEina_Bool); cdecl;
  TEvas_Object_Intercept_Device_Focus_Set_Cb = procedure(data: pointer; obj: PEvas_Object; focus: TEina_Bool; seat: PEo); cdecl;
  TEvas_Object_Intercept_Color_Set_Cb = procedure(data: pointer; obj: PEvas_Object; r: longint; g: longint; b: longint; a: longint); cdecl;
  TEvas_Object_Intercept_Clip_Set_Cb = procedure(data: pointer; obj: PEvas_Object; clip: PEvas_Object); cdecl;
  TEvas_Object_Intercept_Clip_Unset_Cb = procedure(data: pointer; obj: PEvas_Object); cdecl;

procedure evas_object_intercept_show_callback_add(obj: PEvas_Object; func: TEvas_Object_Intercept_Show_Cb; data: pointer); cdecl; external libevas;
function evas_object_intercept_show_callback_del(obj: PEvas_Object; func: TEvas_Object_Intercept_Show_Cb): pointer; cdecl; external libevas;
procedure evas_object_intercept_hide_callback_add(obj: PEvas_Object; func: TEvas_Object_Intercept_Hide_Cb; data: pointer); cdecl; external libevas;
function evas_object_intercept_hide_callback_del(obj: PEvas_Object; func: TEvas_Object_Intercept_Hide_Cb): pointer; cdecl; external libevas;
procedure evas_object_intercept_move_callback_add(obj: PEvas_Object; func: TEvas_Object_Intercept_Move_Cb; data: pointer); cdecl; external libevas;
function evas_object_intercept_move_callback_del(obj: PEvas_Object; func: TEvas_Object_Intercept_Move_Cb): pointer; cdecl; external libevas;
procedure evas_object_intercept_resize_callback_add(obj: PEvas_Object; func: TEvas_Object_Intercept_Resize_Cb; data: pointer); cdecl; external libevas;
function evas_object_intercept_resize_callback_del(obj: PEvas_Object; func: TEvas_Object_Intercept_Resize_Cb): pointer; cdecl; external libevas;
procedure evas_object_intercept_raise_callback_add(obj: PEvas_Object; func: TEvas_Object_Intercept_Raise_Cb; data: pointer); cdecl; external libevas;
function evas_object_intercept_raise_callback_del(obj: PEvas_Object; func: TEvas_Object_Intercept_Raise_Cb): pointer; cdecl; external libevas;
procedure evas_object_intercept_lower_callback_add(obj: PEvas_Object; func: TEvas_Object_Intercept_Lower_Cb; data: pointer); cdecl; external libevas;
function evas_object_intercept_lower_callback_del(obj: PEvas_Object; func: TEvas_Object_Intercept_Lower_Cb): pointer; cdecl; external libevas;
procedure evas_object_intercept_stack_above_callback_add(obj: PEvas_Object; func: TEvas_Object_Intercept_Stack_Above_Cb; data: pointer); cdecl; external libevas;
function evas_object_intercept_stack_above_callback_del(obj: PEvas_Object; func: TEvas_Object_Intercept_Stack_Above_Cb): pointer; cdecl; external libevas;
procedure evas_object_intercept_stack_below_callback_add(obj: PEvas_Object; func: TEvas_Object_Intercept_Stack_Below_Cb; data: pointer); cdecl; external libevas;
function evas_object_intercept_stack_below_callback_del(obj: PEvas_Object; func: TEvas_Object_Intercept_Stack_Below_Cb): pointer; cdecl; external libevas;
procedure evas_object_intercept_layer_set_callback_add(obj: PEvas_Object; func: TEvas_Object_Intercept_Layer_Set_Cb; data: pointer); cdecl; external libevas;
function evas_object_intercept_layer_set_callback_del(obj: PEvas_Object; func: TEvas_Object_Intercept_Layer_Set_Cb): pointer; cdecl; external libevas;
procedure evas_object_intercept_color_set_callback_add(obj: PEvas_Object; func: TEvas_Object_Intercept_Color_Set_Cb; data: pointer); cdecl; external libevas;
function evas_object_intercept_color_set_callback_del(obj: PEvas_Object; func: TEvas_Object_Intercept_Color_Set_Cb): pointer; cdecl; external libevas;
procedure evas_object_intercept_clip_set_callback_add(obj: PEvas_Object; func: TEvas_Object_Intercept_Clip_Set_Cb; data: pointer); cdecl; external libevas;
function evas_object_intercept_clip_set_callback_del(obj: PEvas_Object; func: TEvas_Object_Intercept_Clip_Set_Cb): pointer; cdecl; external libevas;
procedure evas_object_intercept_clip_unset_callback_add(obj: PEvas_Object; func: TEvas_Object_Intercept_Clip_Unset_Cb; data: pointer); cdecl; external libevas;
function evas_object_intercept_clip_unset_callback_del(obj: PEvas_Object; func: TEvas_Object_Intercept_Clip_Unset_Cb): pointer; cdecl; external libevas;
procedure evas_object_intercept_focus_set_callback_add(obj: PEvas_Object; func: TEvas_Object_Intercept_Focus_Set_Cb; data: pointer); cdecl; external libevas;
function evas_object_intercept_focus_set_callback_del(obj: PEvas_Object; func: TEvas_Object_Intercept_Focus_Set_Cb): pointer; cdecl; external libevas;
procedure evas_object_intercept_device_focus_set_callback_add(obj: PEvas_Object; func: TEvas_Object_Intercept_Device_Focus_Set_Cb; data: pointer); cdecl; external libevas;
function evas_object_intercept_device_focus_set_callback_del(obj: PEvas_Object; func: TEvas_Object_Intercept_Device_Focus_Set_Cb): pointer; cdecl; external libevas;

type
  TEvas_Object_Intercept_Cb_Type = longint;

const
  EVAS_OBJECT_INTERCEPT_CB_VISIBLE = 0;
  EVAS_OBJECT_INTERCEPT_CB_MOVE = 1;
  EVAS_OBJECT_INTERCEPT_CB_RESIZE = 2;
  EVAS_OBJECT_INTERCEPT_CB_RAISE = 3;
  EVAS_OBJECT_INTERCEPT_CB_LOWER = 4;
  EVAS_OBJECT_INTERCEPT_CB_STACK_ABOVE = 5;
  EVAS_OBJECT_INTERCEPT_CB_STACK_BELOW = 6;
  EVAS_OBJECT_INTERCEPT_CB_LAYER_SET = 7;
  EVAS_OBJECT_INTERCEPT_CB_FOCUS_SET = 8;
  EVAS_OBJECT_INTERCEPT_CB_COLOR_SET = 9;
  EVAS_OBJECT_INTERCEPT_CB_CLIP_SET = 10;
  EVAS_OBJECT_INTERCEPT_CB_DEVICE_FOCUS_SET = 11;

type
  PEvas_Object_Intercept_Cb_Type = ^TEvas_Object_Intercept_Cb_Type;

function _evas_object_intercept_call(obj: PEvas_Object; _type: TEvas_Object_Intercept_Cb_Type; internal: longint; args: array of const): TEina_Bool; cdecl; external libevas;
function _evas_object_intercept_call(obj: PEvas_Object; _type: TEvas_Object_Intercept_Cb_Type; internal: longint): TEina_Bool; cdecl; external libevas;
function evas_object_rectangle_add(e: PEvas): PEvas_Object; cdecl; external libevas;
function evas_object_vg_add(e: PEvas): PEvas_Object; cdecl; external libevas;
function evas_object_vg_animated_frame_count_get(obj: PEvas_Object): longint; cdecl; external libevas;
function evas_object_vg_animated_frame_duration_get(obj: PEvas_Object; start_frame: longint; frame_num: longint): double; cdecl; external libevas;
function evas_object_vg_file_set(obj: PEvas_Object; file_: pchar; key: pchar): TEina_Bool; cdecl; external libevas;
function evas_object_vg_animated_frame_set(obj: PEvas_Object; frame_index: longint): TEina_Bool; cdecl; external libevas;
function evas_object_vg_animated_frame_get(obj: PEvas_Object): longint; cdecl; external libevas;

type
  PEvas_Vg_Cap_Type = ^TEvas_Vg_Cap_Type;
  TEvas_Vg_Cap_Type = longint;

const
  EVAS_VG_CAP_BUTT = 0;
  EVAS_VG_CAP_ROUND = 1;
  EVAS_VG_CAP_SQUARE = 2;
  EVAS_VG_CAP_LAST = 3;

type
  TEvas_Vg_Cap = TEvas_Vg_Cap_Type;
  PEvas_Vg_Cap = ^TEvas_Vg_Cap;

type
  PEvas_Vg_Join_Type = ^TEvas_Vg_Join_Type;
  TEvas_Vg_Join_Type = longint;

const
  EVAS_VG_JOIN_MITER = 0;
  EVAS_VG_JOIN_ROUND = 1;
  EVAS_VG_JOIN_BEVEL = 2;
  EVAS_VG_JOIN_LAST = 3;

type
  TEvas_Vg_Join = TEvas_Vg_Join_Type;
  PEvas_Vg_Join = ^TEvas_Vg_Join;

type
  PEvas_Vg_Path_Command_Type = ^TEvas_Vg_Path_Command_Type;
  TEvas_Vg_Path_Command_Type = longint;

const
  EVAS_VG_PATH_COMMAND_END = 0;
  EVAS_VG_PATH_COMMAND_MOVE_TO = 1;
  EVAS_VG_PATH_COMMAND_LINE_TO = 2;
  EVAS_VG_PATH_COMMAND_CUBIC_TO = 3;
  EVAS_VG_PATH_COMMAND_CLOSE = 4;
  EVAS_VG_PATH_COMMAND_LAST = 5;

type
  TEvas_Vg_Path_Command = TEvas_Vg_Path_Command_Type;
  PEvas_Vg_Path_Command = ^TEvas_Vg_Path_Command;
  PPEvas_Vg_Path_Command = ^PEvas_Vg_Path_Command;

type
  TEvas_Vg_Gradient_Stop = record
    offset: double;
    r: longint;
    g: longint;
    b: longint;
    a: longint;
  end;
  PEvas_Vg_Gradient_Stop = ^TEvas_Vg_Gradient_Stop;
  PPEvas_Vg_Gradient_Stop = ^PEvas_Vg_Gradient_Stop;

  PEvas_Vg_Gradient_Spread_Type = ^TEvas_Vg_Gradient_Spread_Type;
  TEvas_Vg_Gradient_Spread_Type = longint;

const
  EVAS_VG_GRADIENT_SPREAD_PAD = 0;
  EVAS_VG_GRADIENT_SPREAD_REFLECT = 1;
  EVAS_VG_GRADIENT_SPREAD_REPEAT = 2;
  EVAS_VG_GRADIENT_SPREAD_LAST = 3;

type
  TEvas_Vg_Gradient_Spread = TEvas_Vg_Gradient_Spread_Type;
  PEvas_Vg_Gradient_Spread = ^TEvas_Vg_Gradient_Spread;

type
  TEvas_Vg_Dash = record
    length: double;
    gap: double;
  end;
  PEvas_Vg_Dash = ^TEvas_Vg_Dash;
  PPEvas_Vg_Dash = ^pEvas_Vg_Dash;

function evas_vg_shape_add(parent: PEvas_Vg_Container): PEvas_Vg_Shape; cdecl; external libevas;
function evas_vg_container_add(parent: PEvas_Object): PEvas_Vg_Container; cdecl; external libevas;
function evas_vg_node_visible_get(obj: PEvas_Vg_Node): TEina_Bool; cdecl; external libevas;
procedure evas_vg_node_visible_set(obj: PEvas_Vg_Node; v: TEina_Bool); cdecl; external libevas;
procedure evas_vg_node_color_get(obj: PEvas_Vg_Node; r: Plongint; g: Plongint; b: Plongint; a: Plongint); cdecl; external libevas;
procedure evas_vg_node_color_set(obj: PEvas_Vg_Node; r: longint; g: longint; b: longint; a: longint); cdecl; external libevas;
procedure evas_vg_node_geometry_get(obj: PEvas_Vg_Node; x: Plongint; y: Plongint; w: Plongint; h: Plongint); cdecl; external libevas;
procedure evas_vg_node_geometry_set(obj: PEvas_Vg_Node; x: longint; y: longint; w: longint; h: longint); cdecl; external libevas; deprecated;
procedure evas_vg_node_stack_below(obj: PEvas_Vg_Node; below: PEvas_Vg_Node); cdecl; external libevas;
procedure evas_vg_node_stack_above(obj: PEvas_Vg_Node; above: PEvas_Vg_Node); cdecl; external libevas;
procedure evas_vg_node_raise(obj: PEvas_Vg_Node); cdecl; external libevas;
procedure evas_vg_node_lower(obj: PEvas_Vg_Node); cdecl; external libevas;
function evas_vg_shape_stroke_scale_get(obj: PEvas_Vg_Shape): double; cdecl; external libevas;
procedure evas_vg_shape_stroke_scale_set(obj: PEvas_Vg_Shape; s: double); cdecl; external libevas;
procedure evas_vg_shape_stroke_color_get(obj: PEvas_Vg_Shape; r: Plongint; g: Plongint; b: Plongint; a: Plongint); cdecl; external libevas;
procedure evas_vg_shape_stroke_color_set(obj: PEvas_Vg_Shape; r: longint; g: longint; b: longint; a: longint); cdecl; external libevas;
function evas_vg_shape_stroke_width_get(obj: PEvas_Vg_Shape): double; cdecl; external libevas;
procedure evas_vg_shape_stroke_width_set(obj: PEvas_Vg_Shape; w: double); cdecl; external libevas;
function evas_vg_shape_stroke_location_get(obj: PEvas_Vg_Shape): double; cdecl; external libevas;
procedure evas_vg_shape_stroke_location_set(obj: PEvas_Vg_Shape; centered: double); cdecl; external libevas;
procedure evas_vg_shape_stroke_dash_get(obj: PEvas_Vg_Shape; dash: PPEvas_Vg_Dash; length: Pdword); cdecl; external libevas;
procedure evas_vg_shape_stroke_dash_set(obj: PEvas_Vg_Shape; dash: PEvas_Vg_Dash; length: dword); cdecl; external libevas;
function evas_vg_shape_stroke_cap_get(obj: PEvas_Vg_Shape): TEvas_Vg_Cap; cdecl; external libevas;
procedure evas_vg_shape_stroke_cap_set(obj: PEvas_Vg_Shape; c: TEvas_Vg_Cap); cdecl; external libevas;
function evas_vg_shape_stroke_join_get(obj: PEvas_Vg_Shape): TEvas_Vg_Join; cdecl; external libevas;
procedure evas_vg_shape_stroke_join_set(obj: PEvas_Vg_Shape; j: TEvas_Vg_Join); cdecl; external libevas;
procedure evas_vg_shape_path_set(obj: PEvas_Vg_Shape; op: PEvas_Vg_Path_Command; points: Pdouble); cdecl; external libevas;
procedure evas_vg_shape_path_get(obj: PEvas_Vg_Shape; op: PPEvas_Vg_Path_Command; points: PPdouble); cdecl; external libevas;
procedure evas_vg_shape_path_length_get(obj: PEvas_Vg_Shape; commands: Pdword; points: Pdword); cdecl; external libevas;
procedure evas_vg_shape_current_get(obj: PEvas_Vg_Shape; x: Pdouble; y: Pdouble); cdecl; external libevas;
procedure evas_vg_shape_current_ctrl_get(obj: PEvas_Vg_Shape; x: Pdouble; y: Pdouble); cdecl; external libevas;
procedure evas_vg_shape_dup(obj: PEvas_Vg_Shape; dup_from: PEvas_Vg_Shape); cdecl; external libevas;
procedure evas_vg_shape_reset(obj: PEvas_Vg_Shape); cdecl; external libevas;
procedure evas_vg_shape_append_move_to(obj: PEvas_Vg_Shape; x: double; y: double); cdecl; external libevas;
procedure evas_vg_shape_append_line_to(obj: PEvas_Vg_Shape; x: double; y: double); cdecl; external libevas;
procedure evas_vg_shape_append_quadratic_to(obj: PEvas_Vg_Shape; x: double; y: double; ctrl_x: double; ctrl_y: double); cdecl; external libevas;
procedure evas_vg_shape_append_squadratic_to(obj: PEvas_Vg_Shape; x: double; y: double); cdecl; external libevas;
procedure evas_vg_shape_append_cubic_to(obj: PEvas_Vg_Shape; x: double; y: double; ctrl_x0: double; ctrl_y0: double; ctrl_x1: double; ctrl_y1: double); cdecl; external libevas;
procedure evas_vg_shape_append_scubic_to(obj: PEvas_Vg_Shape; x: double; y: double; ctrl_x: double; ctrl_y: double); cdecl; external libevas;
procedure evas_vg_shape_append_arc_to(obj: PEvas_Vg_Shape; x: double; y: double; rx: double; ry: double; angle: double; large_arc: TEina_Bool; sweep: TEina_Bool); cdecl; external libevas;
procedure evas_vg_shape_append_arc(obj: PEvas_Vg_Shape; x: double; y: double; w: double; h: double; start_angle: double; sweep_length: double); cdecl; external libevas;
procedure evas_vg_shape_append_close(obj: PEvas_Vg_Shape); cdecl; external libevas;
procedure evas_vg_shape_append_circle(obj: PEvas_Vg_Shape; x: double; y: double; radius: double); cdecl; external libevas;
procedure evas_vg_shape_append_rect(obj: PEvas_Vg_Shape; x: double; y: double; w: double; h: double; rx: double; ry: double); cdecl; external libevas;
procedure evas_vg_shape_append_svg_path(obj: PEvas_Vg_Shape; svg_path_data: pchar); cdecl; external libevas;
function evas_vg_shape_interpolate(obj: PEvas_Vg_Shape; from: PEo; to_: PEo; pos_map: double): TEina_Bool; cdecl; external libevas;
function evas_vg_shape_equal_commands(obj: PEvas_Vg_Shape; with_: PEo): TEina_Bool; cdecl; external libevas;
procedure evas_vg_shape_fill_set(obj: PEvas_Vg_Shape; f: PEvas_Vg_Node); cdecl; external libevas;
function evas_vg_shape_fill_get(obj: PEvas_Vg_Shape): PEvas_Vg_Node; cdecl; external libevas;
procedure evas_vg_shape_stroke_fill_set(obj: PEvas_Vg_Shape; f: PEvas_Vg_Node); cdecl; external libevas;
function evas_vg_shape_stroke_fill_get(obj: PEvas_Vg_Shape): PEvas_Vg_Node; cdecl; external libevas;
procedure evas_vg_gradient_stop_set(obj: PEvas_Vg_Gradient; colors: PEvas_Vg_Gradient_Stop; length: dword); cdecl; external libevas;
procedure evas_vg_gradient_stop_get(obj: PEvas_Vg_Gradient; colors: PPEvas_Vg_Gradient_Stop; length: Pdword); cdecl; external libevas;
procedure evas_vg_gradient_spread_set(obj: PEvas_Vg_Gradient; s: TEvas_Vg_Gradient_Spread); cdecl; external libevas;
function evas_vg_gradient_spread_get(obj: PEvas_Vg_Gradient): TEvas_Vg_Gradient_Spread; cdecl; external libevas;
function evas_vg_gradient_linear_add(parent: PEvas_Vg_Container): PEvas_Vg_Gradient_Linear; cdecl; external libevas;
procedure evas_vg_gradient_linear_start_set(obj: PEvas_Vg_Gradient_Linear; x: double; y: double); cdecl; external libevas;
procedure evas_vg_gradient_linear_start_get(obj: PEvas_Vg_Gradient_Linear; x: Pdouble; y: Pdouble); cdecl; external libevas;
procedure evas_vg_gradient_linear_end_set(obj: PEvas_Vg_Gradient_Linear; x: double; y: double); cdecl; external libevas;
procedure evas_vg_gradient_linear_end_get(obj: PEvas_Vg_Gradient_Linear; x: Pdouble; y: Pdouble); cdecl; external libevas;
function evas_vg_gradient_radial_add(parent: PEvas_Vg_Container): PEvas_Vg_Gradient_Radial; cdecl; external libevas;
procedure evas_vg_gradient_radial_center_set(obj: PEvas_Vg_Gradient_Radial; x: double; y: double); cdecl; external libevas;
procedure evas_vg_gradient_radial_center_get(obj: PEvas_Vg_Gradient_Radial; x: Pdouble; y: Pdouble); cdecl; external libevas;
procedure evas_vg_gradient_radial_radius_set(obj: PEvas_Vg_Gradient_Radial; r: double); cdecl; external libevas;
function evas_vg_gradient_radial_radius_get(obj: PEvas_Vg_Gradient_Radial): double; cdecl; external libevas;
procedure evas_vg_gradient_radial_focal_set(obj: PEvas_Vg_Gradient_Radial; x: double; y: double); cdecl; external libevas;
procedure evas_vg_gradient_radial_focal_get(obj: PEvas_Vg_Gradient_Radial; x: Pdouble; y: Pdouble); cdecl; external libevas;
function evas_object_image_add(e: PEvas): PEvas_Object; cdecl; external libevas;
function evas_object_image_filled_add(e: PEvas): PEvas_Object; cdecl; external libevas;
procedure evas_object_image_memfile_set(obj: PEvas_Object; data: pointer; size: longint; format: pchar; key: pchar); cdecl; external libevas;

const
  EVAS_NATIVE_SURFACE_VERSION = 5;

type
  PEvas_Native_Surface_Type = ^TEvas_Native_Surface_Type;
  TEvas_Native_Surface_Type = longint;

const
  EVAS_NATIVE_SURFACE_NONE = 0;
  EVAS_NATIVE_SURFACE_X11 = 1;
  EVAS_NATIVE_SURFACE_OPENGL = 2;
  EVAS_NATIVE_SURFACE_WL = 3;
  EVAS_NATIVE_SURFACE_TBM = 4;
  EVAS_NATIVE_SURFACE_EVASGL = 5;
  EVAS_NATIVE_SURFACE_WL_DMABUF = 6;

type
  PEvas_Native_Surface_Status = ^TEvas_Native_Surface_Status;
  TEvas_Native_Surface_Status = longint;

const
  EVAS_NATIVE_SURFACE_STATUS_SCANOUT_ON = 0;
  EVAS_NATIVE_SURFACE_STATUS_SCANOUT_OFF = 1;
  EVAS_NATIVE_SURFACE_STATUS_PLANE_ASSIGN = 2;
  EVAS_NATIVE_SURFACE_STATUS_PLANE_RELEASE = 3;

type
  TEvas_Native_Scanout_Handler = procedure(scanout_data: pointer; status: TEvas_Native_Surface_Status); cdecl;

  TEvas_Native_Scanout = record
    handler: TEvas_Native_Scanout_Handler;
    data: pointer;
  end;
  PEvas_Native_Scanout = ^TEvas_Native_Scanout;

  TEvas_Native_Surface = record
    version: longint;
    _type: TEvas_Native_Surface_Type;
    data: record
      case longint of
        0: (x11: record
            visual: pointer;
            pixmap: dword;
            multiple_buffer: dword;
            end);
        1: (opengl: record
            texture_id: dword;
            framebuffer_id: dword;
            internal_format: dword;
            format: dword;
            x: dword;
            y: dword;
            w: dword;
            h: dword;
            end);
        2: (wl: record
            legacy_buffer: pointer;
            end);
        3: (wl_dmabuf: record
            attr: pointer;
            resource: pointer;
            scanout: TEvas_Native_Scanout;
            end);
        4: (tbm: record
            buffer: pointer;
            end);
        5: (evasgl: record
            surface: pointer;
            end);
      end;
  end;
  PEvas_Native_Surface = ^TEvas_Native_Surface;

procedure evas_object_image_native_surface_set(obj: PEvas_Object; surf: PEvas_Native_Surface); cdecl; external libevas;
function evas_object_image_native_surface_get(obj: PEvas_Object): PEvas_Native_Surface; cdecl; external libevas;

type
  PEvas_Image_Orient = ^TEvas_Image_Orient;
  TEvas_Image_Orient = longint;

const
  EVAS_IMAGE_ORIENT_NONE = 0;
  EVAS_IMAGE_ORIENT_0 = 0;
  EVAS_IMAGE_ORIENT_90 = 1;
  EVAS_IMAGE_ORIENT_180 = 2;
  EVAS_IMAGE_ORIENT_270 = 3;
  EVAS_IMAGE_FLIP_HORIZONTAL = 4;
  EVAS_IMAGE_FLIP_VERTICAL = 5;
  EVAS_IMAGE_FLIP_TRANSPOSE = 6;
  EVAS_IMAGE_FLIP_TRANSVERSE = 7;

procedure evas_object_image_preload(obj: PEvas_Object; cancel: TEina_Bool); cdecl; external libevas;
function evas_object_image_source_unset(obj: PEvas_Object): TEina_Bool; cdecl; external libevas;
procedure evas_object_image_file_set(obj: PEo; file_: pchar; key: pchar); cdecl; external libevas;
procedure evas_object_image_file_get(obj: PEo; file_: PPchar; key: PPchar); cdecl; external libevas;
procedure evas_object_image_mmap_set(obj: PEo; f: PEina_File; key: pchar); cdecl; external libevas;
procedure evas_object_image_mmap_get(obj: PEo; f: PPEina_File; key: PPchar); cdecl; external libevas;
function evas_object_image_save(obj: PEo; file_: pchar; key: pchar; flags: pchar): TEina_Bool; cdecl; external libevas;
function evas_object_image_animated_get(obj: PEo): TEina_Bool; cdecl; external libevas;
procedure evas_object_image_animated_frame_set(obj: PEvas_Object; frame_index: longint); cdecl; external libevas;
function evas_object_image_animated_frame_get(obj: PEvas_Object): longint; cdecl; external libevas;
function evas_object_image_animated_frame_count_get(obj: PEvas_Object): longint; cdecl; external libevas;
function evas_object_image_animated_loop_type_get(obj: PEvas_Object): TEvas_Image_Animated_Loop_Hint; cdecl; external libevas;
function evas_object_image_animated_loop_count_get(obj: PEvas_Object): longint; cdecl; external libevas;
function evas_object_image_animated_frame_duration_get(obj: PEvas_Object; start_frame: longint; frame_num: longint): double; cdecl; external libevas;
procedure evas_object_image_load_dpi_set(obj: PEvas_Object; dpi: double); cdecl; external libevas;
function evas_object_image_load_dpi_get(obj: PEvas_Object): double; cdecl; external libevas;
procedure evas_object_image_load_size_set(obj: PEo; w: longint; h: longint); cdecl; external libevas;
procedure evas_object_image_load_size_get(obj: PEo; w: Plongint; h: Plongint); cdecl; external libevas;
procedure evas_object_image_load_region_set(obj: PEvas_Object; x: longint; y: longint; w: longint; h: longint); cdecl; external libevas;
procedure evas_object_image_load_region_get(obj: PEvas_Object; x: Plongint; y: Plongint; w: Plongint; h: Plongint); cdecl; external libevas;
function evas_object_image_region_support_get(obj: PEvas_Object): TEina_Bool; cdecl; external libevas;
procedure evas_object_image_load_orientation_set(obj: PEvas_Object; enable: TEina_Bool); cdecl; external libevas;
function evas_object_image_load_orientation_get(obj: PEvas_Object): TEina_Bool; cdecl; external libevas;
procedure evas_object_image_load_scale_down_set(obj: PEvas_Object; scale_down: longint); cdecl; external libevas;
function evas_object_image_load_scale_down_get(obj: PEvas_Object): longint; cdecl; external libevas;
procedure evas_object_image_load_head_skip_set(obj: PEvas_Object; skip: TEina_Bool); cdecl; external libevas;
function evas_object_image_load_head_skip_get(obj: PEvas_Object): TEina_Bool; cdecl; external libevas;
function evas_object_image_load_error_get(obj: PEvas_Object): TEvas_Load_Error; cdecl; external libevas;
procedure evas_object_image_smooth_scale_set(obj: PEo; smooth_scale: TEina_Bool); cdecl; external libevas;
function evas_object_image_smooth_scale_get(obj: PEo): TEina_Bool; cdecl; external libevas;

type
  PEfl_Gfx_Fill_Spread = ^TEfl_Gfx_Fill_Spread;
  TEfl_Gfx_Fill_Spread = longint;

const
  EFL_GFX_FILL_REFLECT = 0;
  EFL_GFX_FILL_REPEAT = 1;
  EFL_GFX_FILL_RESTRICT = 2;
  EFL_GFX_FILL_RESTRICT_REFLECT = 3;
  EFL_GFX_FILL_RESTRICT_REPEAT = 4;
  EFL_GFX_FILL_PAD = 5;

type
  PEvas_Fill_Spread = ^TEvas_Fill_Spread;
  TEvas_Fill_Spread = TEfl_Gfx_Fill_Spread;

const
  EVAS_TEXTURE_REFLECT = EFL_GFX_FILL_REFLECT;
  EVAS_TEXTURE_REPEAT = EFL_GFX_FILL_REPEAT;
  EVAS_TEXTURE_RESTRICT = EFL_GFX_FILL_RESTRICT;
  EVAS_TEXTURE_RESTRICT_REFLECT = EFL_GFX_FILL_RESTRICT_REFLECT;
  EVAS_TEXTURE_RESTRICT_REPEAT = EFL_GFX_FILL_RESTRICT_REPEAT;
  EVAS_TEXTURE_PAD = EFL_GFX_FILL_PAD;

procedure evas_object_image_fill_spread_set(obj: PEvas_Object; spread: TEvas_Fill_Spread); cdecl; external libevas; deprecated;
function evas_object_image_fill_spread_get(obj: PEvas_Object): TEvas_Fill_Spread; cdecl; external libevas; deprecated;
procedure evas_object_image_fill_set(obj: PEvas_Object; x: TEvas_Coord; y: TEvas_Coord; w: TEvas_Coord; h: TEvas_Coord); cdecl; external libevas;
procedure evas_object_image_fill_get(obj: PEvas_Object; x: PEvas_Coord; y: PEvas_Coord; w: PEvas_Coord; h: PEvas_Coord); cdecl; external libevas;
procedure evas_object_image_filled_set(obj: PEvas_Object; filled: TEina_Bool); cdecl; external libevas;
function evas_object_image_filled_get(obj: PEvas_Object): TEina_Bool; cdecl; external libevas;
function evas_object_image_alpha_get(obj: PEvas_Object): TEina_Bool; cdecl; external libevas;
procedure evas_object_image_alpha_set(obj: PEvas_Object; alpha: TEina_Bool); cdecl; external libevas;
procedure evas_object_image_border_set(obj: PEvas_Object; l: longint; r: longint; t: longint; b: longint); cdecl; external libevas;
procedure evas_object_image_border_get(obj: PEvas_Object; l: Plongint; r: Plongint; t: Plongint; b: Plongint); cdecl; external libevas;
procedure evas_object_image_border_scale_set(obj: PEvas_Object; scale: double); cdecl; external libevas;
function evas_object_image_border_scale_get(obj: PEvas_Object): double; cdecl; external libevas;

type
  PEvas_Border_Fill_Mode = ^TEvas_Border_Fill_Mode;
  TEvas_Border_Fill_Mode = longint;

const
  EVAS_BORDER_FILL_NONE = 0;
  EVAS_BORDER_FILL_DEFAULT = 1;
  EVAS_BORDER_FILL_SOLID = 2;

procedure evas_object_image_border_center_fill_set(obj: PEvas_Object; fill: TEvas_Border_Fill_Mode); cdecl; external libevas;
function evas_object_image_border_center_fill_get(obj: PEvas_Object): TEvas_Border_Fill_Mode; cdecl; external libevas;
procedure evas_object_image_orient_set(obj: PEvas_Object; orient: TEvas_Image_Orient); cdecl; external libevas;
function evas_object_image_orient_get(obj: PEvas_Object): TEvas_Image_Orient; cdecl; external libevas;
procedure evas_object_image_content_hint_set(obj: PEvas_Object; hint: TEvas_Image_Content_Hint); cdecl; external libevas;
function evas_object_image_content_hint_get(obj: PEvas_Object): TEvas_Image_Content_Hint; cdecl; external libevas;
procedure evas_object_image_scale_hint_set(obj: PEvas_Object; hint: TEvas_Image_Scale_Hint); cdecl; external libevas;
function evas_object_image_scale_hint_get(obj: PEvas_Object): TEvas_Image_Scale_Hint; cdecl; external libevas;
procedure evas_object_image_size_set(obj: PEvas_Object; w: longint; h: longint); cdecl; external libevas;
procedure evas_object_image_size_get(obj: PEvas_Object; w: Plongint; h: Plongint); cdecl; external libevas;
procedure evas_object_image_colorspace_set(obj: PEvas_Object; cspace: TEvas_Colorspace); cdecl; external libevas;
function evas_object_image_colorspace_get(obj: PEvas_Object): TEvas_Colorspace; cdecl; external libevas;
function evas_object_image_stride_get(obj: PEvas_Object): longint; cdecl; external libevas;
procedure evas_object_image_data_copy_set(obj: PEvas_Object; data: pointer); cdecl; external libevas;
procedure evas_object_image_data_set(obj: PEvas_Object; data: pointer); cdecl; external libevas;
function evas_object_image_data_get(obj: PEvas_Object; for_writing: TEina_Bool): pointer; cdecl; external libevas;
procedure evas_object_image_data_update_add(obj: PEvas_Object; x: longint; y: longint; w: longint; h: longint); cdecl; external libevas;
procedure evas_object_image_snapshot_set(obj: PEvas_Object; s: TEina_Bool); cdecl; external libevas;
function evas_object_image_snapshot_get(obj: PEvas_Object): TEina_Bool; cdecl; external libevas;
function evas_object_image_source_set(obj: PEvas_Object; src: PEvas_Object): TEina_Bool; cdecl; external libevas;
function evas_object_image_source_get(obj: PEvas_Object): PEvas_Object; cdecl; external libevas;
procedure evas_object_image_source_clip_set(obj: PEvas_Object; source_clip: TEina_Bool); cdecl; external libevas;
function evas_object_image_source_clip_get(obj: PEvas_Object): TEina_Bool; cdecl; external libevas;
procedure evas_object_image_source_events_set(obj: PEvas_Object; _repeat: TEina_Bool); cdecl; external libevas;
function evas_object_image_source_events_get(obj: PEvas_Object): TEina_Bool; cdecl; external libevas;
procedure evas_object_image_source_visible_set(obj: PEvas_Object; visible: TEina_Bool); cdecl; external libevas;
function evas_object_image_source_visible_get(obj: PEvas_Object): TEina_Bool; cdecl; external libevas;
procedure evas_object_image_pixels_dirty_set(obj: PEvas_Object; dirty: TEina_Bool); cdecl; external libevas;
function evas_object_image_pixels_dirty_get(obj: PEvas_Object): TEina_Bool; cdecl; external libevas;
procedure evas_object_image_pixels_get_callback_set(obj: PEvas_Object; func: TEvas_Object_Image_Pixels_Get_Cb; data: pointer); cdecl; external libevas;

const
  EVAS_VIDEO_SURFACE_VERSION = 1;

type
  PEvas_Video_Surface = ^TEvas_Video_Surface;
  TEvas_Video_Cb = procedure(data: pointer; obj: PEvas_Object; surface: PEvas_Video_Surface); cdecl;
  TEvas_Video_Coord_Cb = procedure(data: pointer; obj: PEvas_Object; surface: PEvas_Video_Surface; a: TEvas_Coord; b: TEvas_Coord); cdecl;

  TEvas_Video_Surface = record
    version: longint;
    move: TEvas_Video_Coord_Cb;
    resize: TEvas_Video_Coord_Cb;
    show: TEvas_Video_Cb;
    hide: TEvas_Video_Cb;
    update_pixels: TEvas_Video_Cb;
    parent: PEvas_Object;
    data: pointer;
  end;

  PEvas_Video_Surface_Caps = ^TEvas_Video_Surface_Caps;
  TEvas_Video_Surface_Caps = longint;

const
  EVAS_VIDEO_SURFACE_MOVE = 1;
  EVAS_VIDEO_SURFACE_RESIZE = 2;
  EVAS_VIDEO_SURFACE_CLIP = 4;
  EVAS_VIDEO_SURFACE_BELOW = 8;
  EVAS_VIDEO_SURFACE_STACKING_CHECK = 16;
  EVAS_VIDEO_SURFACE_IGNORE_WINDOW = 32;

procedure evas_object_image_video_surface_set(obj: PEvas_Object; surf: PEvas_Video_Surface); cdecl; external libevas;
function evas_object_image_video_surface_get(obj: PEvas_Object): PEvas_Video_Surface; cdecl; external libevas;
procedure evas_object_image_video_surface_caps_set(obj: PEvas_Object; caps: dword); cdecl; external libevas;
function evas_object_image_video_surface_caps_get(obj: PEvas_Object): dword; cdecl; external libevas;
function evas_object_image_data_convert(obj: PEvas_Object; to_cspace: TEvas_Colorspace): pointer; cdecl; external libevas; deprecated;
function evas_object_image_pixels_import(obj: PEvas_Object; pixels: PEvas_Pixel_Import_Source): TEina_Bool; cdecl; external libevas; deprecated;
procedure evas_object_image_reload(obj: PEvas_Object); cdecl; external libevas; deprecated;
procedure evas_object_image_alpha_mask_set(obj: PEvas_Object; ismask: TEina_Bool); cdecl; external libevas; deprecated;
function evas_object_text_add(e: PEvas): PEvas_Object; cdecl; external libevas;
procedure evas_object_text_text_set(obj: PEo; text: pchar); cdecl; external libevas;
function evas_object_text_text_get(obj: PEo): pchar; cdecl; external libevas;

type
  PEvas_Text_Style_Type = ^TEvas_Text_Style_Type;
  TEvas_Text_Style_Type = longint;

const
  EVAS_TEXT_STYLE_PLAIN = 0;
  EVAS_TEXT_STYLE_SHADOW = 1;
  EVAS_TEXT_STYLE_OUTLINE = 2;
  EVAS_TEXT_STYLE_SOFT_OUTLINE = 3;
  EVAS_TEXT_STYLE_GLOW = 4;
  EVAS_TEXT_STYLE_OUTLINE_SHADOW = 5;
  EVAS_TEXT_STYLE_FAR_SHADOW = 6;
  EVAS_TEXT_STYLE_OUTLINE_SOFT_SHADOW = 7;
  EVAS_TEXT_STYLE_SOFT_SHADOW = 8;
  EVAS_TEXT_STYLE_FAR_SOFT_SHADOW = 9;
  EVAS_TEXT_STYLE_SHADOW_DIRECTION_BOTTOM_RIGHT = 0;
  EVAS_TEXT_STYLE_SHADOW_DIRECTION_BOTTOM = 16;
  EVAS_TEXT_STYLE_SHADOW_DIRECTION_BOTTOM_LEFT = 32;
  EVAS_TEXT_STYLE_SHADOW_DIRECTION_LEFT = 48;
  EVAS_TEXT_STYLE_SHADOW_DIRECTION_TOP_LEFT = 64;
  EVAS_TEXT_STYLE_SHADOW_DIRECTION_TOP = 80;
  EVAS_TEXT_STYLE_SHADOW_DIRECTION_TOP_RIGHT = 96;
  EVAS_TEXT_STYLE_SHADOW_DIRECTION_RIGHT = 112;

procedure evas_object_text_font_source_set(obj: PEo; font_source: pchar); cdecl; external libevas;
function evas_object_text_font_source_get(obj: PEo): pchar; cdecl; external libevas;
procedure evas_object_text_font_set(obj: PEo; font: pchar; size: TEvas_Font_Size); cdecl; external libevas;
procedure evas_object_text_font_get(obj: PEo; font: PPchar; size: PEvas_Font_Size); cdecl; external libevas;
function evas_object_textgrid_add(e: PEvas): PEvas_Object; cdecl; external libevas;
procedure evas_object_textgrid_font_source_set(obj: PEo; font_source: pchar); cdecl; external libevas;
function evas_object_textgrid_font_source_get(obj: PEo): pchar; cdecl; external libevas;
procedure evas_object_textgrid_font_set(obj: PEo; font_name: pchar; font_size: TEvas_Font_Size); cdecl; external libevas;
procedure evas_object_textgrid_font_get(obj: PEo; font_name: PPchar; font_size: PEvas_Font_Size); cdecl; external libevas;
function evas_object_line_add(e: PEvas): PEvas_Object; cdecl; external libevas;
function evas_object_polygon_add(e: PEvas): PEvas_Object; cdecl; external libevas;
procedure evas_object_polygon_point_add(obj: PEvas_Object; x: TEvas_Coord; y: TEvas_Coord); cdecl; external libevas;
procedure evas_object_polygon_points_clear(obj: PEvas_Object); cdecl; external libevas;
procedure evas_smart_objects_calculate(obj: PEo); cdecl; external libevas;
function evas_smart_objects_calculating_get(obj: PEo): TEina_Bool; cdecl; external libevas;
function evas_object_smart_add(e: PEvas; s: PEvas_Smart): PEvas_Object; cdecl; external libevas;
procedure evas_object_smart_member_add(obj: PEvas_Object; smart_obj: PEvas_Object); cdecl; external libevas;
procedure evas_object_smart_member_del(obj: PEvas_Object); cdecl; external libevas;
procedure evas_object_smart_callback_add(obj: PEvas_Object; event: pchar; func: TEvas_Smart_Cb; data: pointer); cdecl; external libevas;
procedure evas_object_smart_callback_priority_add(obj: PEvas_Object; event: pchar; priority: TEvas_Callback_Priority; func: TEvas_Smart_Cb; data: pointer); cdecl; external libevas;
function evas_object_smart_callback_del(obj: PEvas_Object; event: pchar; func: TEvas_Smart_Cb): pointer; cdecl; external libevas;
function evas_object_smart_callback_del_full(obj: PEvas_Object; event: pchar; func: TEvas_Smart_Cb; data: pointer): pointer; cdecl; external libevas;
procedure evas_object_smart_callback_call(obj: PEvas_Object; event: pchar; event_info: pointer); cdecl; external libevas;
function evas_object_smart_interface_get(obj: PEvas_Object; name: pchar): pointer; cdecl; external libevas;
function evas_object_smart_interface_data_get(obj: PEvas_Object; iface: PEvas_Smart_Interface): pointer; cdecl; external libevas;
function evas_object_smart_type_check(obj: PEvas_Object; _type: pchar): TEina_Bool; cdecl; external libevas;
function evas_object_smart_type_check_ptr(obj: PEvas_Object; _type: pchar): TEina_Bool; cdecl; external libevas;
function evas_object_smart_callbacks_descriptions_set(obj: PEvas_Object; descriptions: PEvas_Smart_Cb_Description): TEina_Bool; cdecl; external libevas;
procedure evas_object_smart_callbacks_descriptions_get(obj: PEvas_Object; class_descriptions: PPPEvas_Smart_Cb_Description; class_count: Pdword; instance_descriptions: PPPEvas_Smart_Cb_Description; instance_count: Pdword); cdecl; external libevas;
procedure evas_object_smart_callback_description_find(obj: PEvas_Object; name: pchar; class_description: PPEvas_Smart_Cb_Description; instance_description: PPEvas_Smart_Cb_Description); cdecl; external libevas;
function evas_object_smart_smart_get(obj: PEvas_Object): PEvas_Smart; cdecl; external libevas;
procedure evas_object_smart_data_set(obj: PEvas_Object; data: pointer); cdecl; external libevas;
function evas_object_smart_data_get(obj: PEvas_Object): pointer; cdecl; external libevas;
function evas_object_smart_clipped_clipper_get(obj: PEvas_Object): PEvas_Object; cdecl; external libevas;
function evas_object_smart_members_get(obj: PEvas_Object): PEina_List; cdecl; external libevas;
procedure evas_object_smart_need_recalculate_set(obj: PEvas_Object; value: TEina_Bool); cdecl; external libevas;
function evas_object_smart_need_recalculate_get(obj: PEvas_Object): TEina_Bool; cdecl; external libevas;
function evas_object_smart_iterator_new(obj: PEvas_Object): PEina_Iterator; cdecl; external libevas;
procedure evas_object_smart_calculate(obj: PEvas_Object); cdecl; external libevas;
procedure evas_object_smart_changed(obj: PEvas_Object); cdecl; external libevas;
procedure evas_object_smart_move_children_relative(obj: PEvas_Object; dx: TEvas_Coord; dy: TEvas_Coord); cdecl; external libevas;
function evas_object_box_add(evas: PEvas): PEvas_Object; cdecl; external libevas;
function evas_object_box_option_property_vget(o: PEvas_Object; opt: PEvas_Object_Box_Option; _property: longint; args: Tva_list): TEina_Bool; cdecl; external libevas;
function evas_object_box_option_property_vset(o: PEvas_Object; opt: PEvas_Object_Box_Option; _property: longint; args: Tva_list): TEina_Bool; cdecl; external libevas;
function evas_object_box_option_property_set(o: PEvas_Object; opt: PEvas_Object_Box_Option; _property: longint; args: array of const): TEina_Bool; cdecl; external libevas;
function evas_object_box_option_property_set(o: PEvas_Object; opt: PEvas_Object_Box_Option; _property: longint): TEina_Bool; cdecl; external libevas;
function evas_object_box_option_property_get(o: PEvas_Object; opt: PEvas_Object_Box_Option; _property: longint; args: array of const): TEina_Bool; cdecl; external libevas;
function evas_object_box_option_property_get(o: PEvas_Object; opt: PEvas_Object_Box_Option; _property: longint): TEina_Bool; cdecl; external libevas;
function evas_object_box_children_get(o: PEvas_Object): PEina_List; cdecl; external libevas;
function evas_object_table_add(evas: PEvas): PEvas_Object; cdecl; external libevas;
procedure evas_object_table_mirrored_set(obj: PEo; mirrored: TEina_Bool); cdecl; external libevas;
function evas_object_table_mirrored_get(obj: PEo): TEina_Bool; cdecl; external libevas;
function evas_object_grid_add(evas: PEvas): PEvas_Object; cdecl; external libevas;
procedure evas_object_grid_mirrored_set(obj: PEo; mirrored: TEina_Bool); cdecl; external libevas;
function evas_object_grid_mirrored_get(obj: PEo): TEina_Bool; cdecl; external libevas;
procedure evas_output_framespace_set(e: PEvas; x: TEvas_Coord; y: TEvas_Coord; w: TEvas_Coord; h: TEvas_Coord); cdecl; external libevas;
procedure evas_output_framespace_get(e: PEvas; x: PEvas_Coord; y: PEvas_Coord; w: PEvas_Coord; h: PEvas_Coord); cdecl; external libevas;
procedure evas_output_viewport_set(e: PEvas; x: TEvas_Coord; y: TEvas_Coord; w: TEvas_Coord; h: TEvas_Coord); cdecl; external libevas;
procedure evas_output_viewport_get(e: PEvas; x: PEvas_Coord; y: PEvas_Coord; w: PEvas_Coord; h: PEvas_Coord); cdecl; external libevas;
procedure evas_output_method_set(e: PEvas; render_method: longint); cdecl; external libevas;
function evas_output_method_get(e: PEvas): longint; cdecl; external libevas;
procedure evas_output_size_set(e: PEvas; w: longint; h: longint); cdecl; external libevas;
procedure evas_output_size_get(e: PEvas; w: Plongint; h: Plongint); cdecl; external libevas;

type
  TEvas_Map = record
  end;
  PEvas_Map = ^TEvas_Map;

procedure evas_map_util_points_populate_from_object_full(m: PEvas_Map; obj: PEvas_Object; z: TEvas_Coord); cdecl; external libevas;
procedure evas_map_util_points_populate_from_object(m: PEvas_Map; obj: PEvas_Object); cdecl; external libevas;
procedure evas_map_util_points_populate_from_geometry(m: PEvas_Map; x: TEvas_Coord; y: TEvas_Coord; w: TEvas_Coord; h: TEvas_Coord; z: TEvas_Coord); cdecl; external libevas;
procedure evas_map_util_points_color_set(m: PEvas_Map; r: longint; g: longint; b: longint; a: longint); cdecl; external libevas;
procedure evas_map_util_rotate(m: PEvas_Map; degrees: double; cx: TEvas_Coord; cy: TEvas_Coord); cdecl; external libevas;
procedure evas_map_util_zoom(m: PEvas_Map; zoomx: double; zoomy: double; cx: TEvas_Coord; cy: TEvas_Coord); cdecl; external libevas;
procedure evas_map_util_3d_rotate(m: PEvas_Map; dx: double; dy: double; dz: double; cx: TEvas_Coord; cy: TEvas_Coord; cz: TEvas_Coord); cdecl; external libevas;
procedure evas_map_util_quat_rotate(m: PEvas_Map; qx: double; qy: double; qz: double; qw: double; cx: double; cy: double; cz: double); cdecl; external libevas;
procedure evas_map_util_3d_lighting(m: PEvas_Map; lx: TEvas_Coord; ly: TEvas_Coord; lz: TEvas_Coord; lr: longint; lg: longint; lb: longint; ar: longint; ag: longint; ab: longint); cdecl; external libevas;
procedure evas_map_util_3d_perspective(m: PEvas_Map; px: TEvas_Coord; py: TEvas_Coord; z0: TEvas_Coord; foc: TEvas_Coord); cdecl; external libevas;
function evas_map_util_clockwise_get(m: PEvas_Map): TEina_Bool; cdecl; external libevas;
function evas_map_new(count: longint): PEvas_Map; cdecl; external libevas;
procedure evas_map_smooth_set(m: PEvas_Map; enabled: TEina_Bool); cdecl; external libevas;
function evas_map_smooth_get(m: PEvas_Map): TEina_Bool; cdecl; external libevas;
procedure evas_map_alpha_set(m: PEvas_Map; enabled: TEina_Bool); cdecl; external libevas;
function evas_map_alpha_get(m: PEvas_Map): TEina_Bool; cdecl; external libevas;
procedure evas_map_util_object_move_sync_set(m: PEvas_Map; enabled: TEina_Bool); cdecl; external libevas;
function evas_map_util_object_move_sync_get(m: PEvas_Map): TEina_Bool; cdecl; external libevas;
function evas_map_dup(m: PEvas_Map): PEvas_Map; cdecl; external libevas;
procedure evas_map_free(m: PEvas_Map); cdecl; external libevas;
function evas_map_count_get(m: PEvas_Map): longint; cdecl; external libevas;
function evas_map_coords_get(m: PEvas_Map; x: double; y: double; mx: Pdouble; my: Pdouble; grab: longint): TEina_Bool; cdecl; external libevas;
procedure evas_map_point_coord_set(m: PEvas_Map; idx: longint; x: TEvas_Coord; y: TEvas_Coord; z: TEvas_Coord); cdecl; external libevas;
procedure evas_map_point_coord_get(m: PEvas_Map; idx: longint; x: PEvas_Coord; y: PEvas_Coord; z: PEvas_Coord); cdecl; external libevas;
procedure evas_map_point_image_uv_set(m: PEvas_Map; idx: longint; u: double; v: double); cdecl; external libevas;
procedure evas_map_point_image_uv_get(m: PEvas_Map; idx: longint; u: Pdouble; v: Pdouble); cdecl; external libevas;
procedure evas_map_point_color_set(m: PEvas_Map; idx: longint; r: longint; g: longint; b: longint; a: longint); cdecl; external libevas;
procedure evas_map_point_color_get(m: PEvas_Map; idx: longint; r: Plongint; g: Plongint; b: Plongint; a: Plongint); cdecl; external libevas;
procedure evas_object_map_set(obj: PEvas_Object; map: PEvas_Map); cdecl; external libevas;
function evas_object_map_get(obj: PEvas_Object): PEvas_Map; cdecl; external libevas;
procedure evas_object_map_enable_set(obj: PEvas_Object; enabled: TEina_Bool); cdecl; external libevas;
function evas_object_map_enable_get(obj: PEvas_Object): TEina_Bool; cdecl; external libevas;
procedure evas_object_text_filter_program_set(obj: PEvas_Object; code: pchar); cdecl; external libevas; deprecated;
procedure evas_object_text_filter_source_set(obj: PEvas_Object; name: pchar; source: PEvas_Object); cdecl; external libevas; deprecated;
function evas_object_event_grabber_add(e: PEvas): PEvas_Object; cdecl; external libevas;
procedure evas_object_is_frame_object_set(obj: PEfl_Canvas_Object; is_frame: TEina_Bool); cdecl; external libevas;
function evas_object_is_frame_object_get(obj: PEfl_Canvas_Object): TEina_Bool; cdecl; external libevas;
procedure evas_object_freeze_events_set(obj: PEfl_Canvas_Object; freeze: TEina_Bool); cdecl; external libevas;
function evas_object_freeze_events_get(obj: PEfl_Canvas_Object): TEina_Bool; cdecl; external libevas;

// === Konventiert am: 10-5-25 19:19:44 ===


implementation



end.
