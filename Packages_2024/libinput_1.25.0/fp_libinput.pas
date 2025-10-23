unit fp_libinput;

interface

uses
  fp_libudev;

const
  {$IFDEF linux}
  libinput = 'libinput';
  {$ENDIF}

  {$IFDEF windows}
  {$ENDIF}

type
  Tuint8_t = uint8;
  Puint8_t = ^Tuint8_t;
  PPuint8_t = ^Puint8_t;
  Tuint16_t = uint16;
  Puint16_t = ^Tuint16_t;
  PPuint16_t = ^Puint16_t;
  Tuint32_t = uint32;
  Puint32_t = ^Tuint32_t;
  PPuint32_t = ^Puint32_t;
  Tuint64_t = uint64;
  Puint64_t = ^Tuint64_t;
  PPuint64_t = ^Puint64_t;

  Tint8_t = int8;
  Pint8_t = ^Tint8_t;
  PPint8_t = ^Pint8_t;
  Tint16_t = int16;
  Pint16_t = ^Tint16_t;
  PPint16_t = ^Pint16_t;
  Tint32_t = int32;
  Pint32_t = ^Tint32_t;
  PPint32_t = ^Pint32_t;
  Tint64_t = int64;
  Pint64_t = ^Tint64_t;
  PPint64_t = ^Pint64_t;

type
  Plibinput_event_gesture = type Pointer; // Fehlt im original Header

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  Plibinput = type Pointer;
  Plibinput_device = type Pointer;
  Plibinput_device_group = type Pointer;
  Plibinput_seat = type Pointer;
  Plibinput_tablet_tool = type Pointer;
  Plibinput_event = type Pointer;
  Plibinput_event_device_notify = type Pointer;
  Plibinput_event_keyboard = type Pointer;
  Plibinput_event_pointer = type Pointer;
  Plibinput_event_touch = type Pointer;
  Plibinput_event_tablet_tool = type Pointer;
  Plibinput_event_tablet_pad = type Pointer;

type
  Tlibinput_log_priority = longint;

const
  LIBINPUT_LOG_PRIORITY_DEBUG = 10;
  LIBINPUT_LOG_PRIORITY_INFO = 20;
  LIBINPUT_LOG_PRIORITY_ERROR = 30;

type
  Tlibinput_device_capability = longint;

const
  LIBINPUT_DEVICE_CAP_KEYBOARD = 0;
  LIBINPUT_DEVICE_CAP_POINTER = 1;
  LIBINPUT_DEVICE_CAP_TOUCH = 2;
  LIBINPUT_DEVICE_CAP_TABLET_TOOL = 3;
  LIBINPUT_DEVICE_CAP_TABLET_PAD = 4;
  LIBINPUT_DEVICE_CAP_GESTURE = 5;
  LIBINPUT_DEVICE_CAP_SWITCH = 6;

type
  Tlibinput_key_state = longint;

const
  LIBINPUT_KEY_STATE_RELEASED = 0;
  LIBINPUT_KEY_STATE_PRESSED = 1;

type
  Tlibinput_led = longint;

const
  LIBINPUT_LED_NUM_LOCK = 1 shl 0;
  LIBINPUT_LED_CAPS_LOCK = 1 shl 1;
  LIBINPUT_LED_SCROLL_LOCK = 1 shl 2;

type
  Tlibinput_button_state = longint;

const
  LIBINPUT_BUTTON_STATE_RELEASED = 0;
  LIBINPUT_BUTTON_STATE_PRESSED = 1;

type
  Tlibinput_pointer_axis = longint;

const
  LIBINPUT_POINTER_AXIS_SCROLL_VERTICAL = 0;
  LIBINPUT_POINTER_AXIS_SCROLL_HORIZONTAL = 1;

type
  Tlibinput_pointer_axis_source = longint;

const
  LIBINPUT_POINTER_AXIS_SOURCE_WHEEL = 1;
  LIBINPUT_POINTER_AXIS_SOURCE_FINGER = 2;
  LIBINPUT_POINTER_AXIS_SOURCE_CONTINUOUS = 3;
  LIBINPUT_POINTER_AXIS_SOURCE_WHEEL_TILT = 4;

type
  Tlibinput_tablet_pad_ring_axis_source = longint;

const
  LIBINPUT_TABLET_PAD_RING_SOURCE_UNKNOWN = 1;
  LIBINPUT_TABLET_PAD_RING_SOURCE_FINGER = 2;

type
  Tlibinput_tablet_pad_strip_axis_source = longint;

const
  LIBINPUT_TABLET_PAD_STRIP_SOURCE_UNKNOWN = 1;
  LIBINPUT_TABLET_PAD_STRIP_SOURCE_FINGER = 2;

type
  Tlibinput_tablet_tool_type = longint;

const
  LIBINPUT_TABLET_TOOL_TYPE_PEN = 1;
  LIBINPUT_TABLET_TOOL_TYPE_ERASER = 2;
  LIBINPUT_TABLET_TOOL_TYPE_BRUSH = 3;
  LIBINPUT_TABLET_TOOL_TYPE_PENCIL = 4;
  LIBINPUT_TABLET_TOOL_TYPE_AIRBRUSH = 5;
  LIBINPUT_TABLET_TOOL_TYPE_MOUSE = 6;
  LIBINPUT_TABLET_TOOL_TYPE_LENS = 7;
  LIBINPUT_TABLET_TOOL_TYPE_TOTEM = 8;

type
  Tlibinput_tablet_tool_proximity_state = longint;

const
  LIBINPUT_TABLET_TOOL_PROXIMITY_STATE_OUT = 0;
  LIBINPUT_TABLET_TOOL_PROXIMITY_STATE_IN = 1;

type
  Tlibinput_tablet_tool_tip_state = longint;

const
  LIBINPUT_TABLET_TOOL_TIP_UP = 0;
  LIBINPUT_TABLET_TOOL_TIP_DOWN = 1;

type
  Plibinput_tablet_pad_mode_group = type Pointer;

function libinput_device_tablet_pad_get_num_mode_groups(device: Plibinput_device): longint; cdecl; external libinput;
function libinput_device_tablet_pad_get_mode_group(device: Plibinput_device; index: dword): Plibinput_tablet_pad_mode_group; cdecl; external libinput;
function libinput_tablet_pad_mode_group_get_index(group: Plibinput_tablet_pad_mode_group): dword; cdecl; external libinput;
function libinput_tablet_pad_mode_group_get_num_modes(group: Plibinput_tablet_pad_mode_group): dword; cdecl; external libinput;
function libinput_tablet_pad_mode_group_get_mode(group: Plibinput_tablet_pad_mode_group): dword; cdecl; external libinput;
function libinput_tablet_pad_mode_group_has_button(group: Plibinput_tablet_pad_mode_group; button: dword): longint; cdecl; external libinput;
function libinput_tablet_pad_mode_group_has_ring(group: Plibinput_tablet_pad_mode_group; ring: dword): longint; cdecl; external libinput;
function libinput_tablet_pad_mode_group_has_strip(group: Plibinput_tablet_pad_mode_group; strip: dword): longint; cdecl; external libinput;
function libinput_tablet_pad_mode_group_button_is_toggle(group: Plibinput_tablet_pad_mode_group; button: dword): longint; cdecl; external libinput;
function libinput_tablet_pad_mode_group_ref(group: Plibinput_tablet_pad_mode_group): Plibinput_tablet_pad_mode_group; cdecl; external libinput;
function libinput_tablet_pad_mode_group_unref(group: Plibinput_tablet_pad_mode_group): Plibinput_tablet_pad_mode_group; cdecl; external libinput;
procedure libinput_tablet_pad_mode_group_set_user_data(group: Plibinput_tablet_pad_mode_group; user_data: pointer); cdecl; external libinput;
function libinput_tablet_pad_mode_group_get_user_data(group: Plibinput_tablet_pad_mode_group): pointer; cdecl; external libinput;

type
  Tlibinput_switch_state = longint;

const
  LIBINPUT_SWITCH_STATE_OFF = 0;
  LIBINPUT_SWITCH_STATE_ON = 1;

type
  Tlibinput_switch = longint;

const
  LIBINPUT_SWITCH_LID = 1;
  LIBINPUT_SWITCH_TABLET_MODE = 2;

type
  Plibinput_event_switch = type Pointer;
  Tlibinput_event_type = longint;

const
  LIBINPUT_EVENT_NONE = 0;
  LIBINPUT_EVENT_DEVICE_ADDED = 1;
  LIBINPUT_EVENT_DEVICE_REMOVED = 2;
  LIBINPUT_EVENT_KEYBOARD_KEY = 300;
  LIBINPUT_EVENT_POINTER_MOTION = 400;
  LIBINPUT_EVENT_POINTER_MOTION_ABSOLUTE = 401;
  LIBINPUT_EVENT_POINTER_BUTTON = 402;
  LIBINPUT_EVENT_POINTER_AXIS = 403;
  LIBINPUT_EVENT_POINTER_SCROLL_WHEEL = 404;
  LIBINPUT_EVENT_POINTER_SCROLL_FINGER = 405;
  LIBINPUT_EVENT_POINTER_SCROLL_CONTINUOUS = 406;
  LIBINPUT_EVENT_TOUCH_DOWN = 500;
  LIBINPUT_EVENT_TOUCH_UP = 501;
  LIBINPUT_EVENT_TOUCH_MOTION = 502;
  LIBINPUT_EVENT_TOUCH_CANCEL = 503;
  LIBINPUT_EVENT_TOUCH_FRAME = 504;
  LIBINPUT_EVENT_TABLET_TOOL_AXIS = 600;
  LIBINPUT_EVENT_TABLET_TOOL_PROXIMITY = 601;
  LIBINPUT_EVENT_TABLET_TOOL_TIP = 602;
  LIBINPUT_EVENT_TABLET_TOOL_BUTTON = 603;
  LIBINPUT_EVENT_TABLET_PAD_BUTTON = 700;
  LIBINPUT_EVENT_TABLET_PAD_RING = 701;
  LIBINPUT_EVENT_TABLET_PAD_STRIP = 702;
  LIBINPUT_EVENT_TABLET_PAD_KEY = 703;
  LIBINPUT_EVENT_GESTURE_SWIPE_BEGIN = 800;
  LIBINPUT_EVENT_GESTURE_SWIPE_UPDATE = 801;
  LIBINPUT_EVENT_GESTURE_SWIPE_END = 802;
  LIBINPUT_EVENT_GESTURE_PINCH_BEGIN = 803;
  LIBINPUT_EVENT_GESTURE_PINCH_UPDATE = 804;
  LIBINPUT_EVENT_GESTURE_PINCH_END = 805;
  LIBINPUT_EVENT_GESTURE_HOLD_BEGIN = 806;
  LIBINPUT_EVENT_GESTURE_HOLD_END = 807;
  LIBINPUT_EVENT_SWITCH_TOGGLE = 900;

procedure libinput_event_destroy(event: Plibinput_event); cdecl; external libinput;
function libinput_event_get_type(event: Plibinput_event): Tlibinput_event_type; cdecl; external libinput;
function libinput_event_get_context(event: Plibinput_event): Plibinput; cdecl; external libinput;
function libinput_event_get_device(event: Plibinput_event): Plibinput_device; cdecl; external libinput;
function libinput_event_get_pointer_event(event: Plibinput_event): Plibinput_event_pointer; cdecl; external libinput;
function libinput_event_get_keyboard_event(event: Plibinput_event): Plibinput_event_keyboard; cdecl; external libinput;
function libinput_event_get_touch_event(event: Plibinput_event): Plibinput_event_touch; cdecl; external libinput;
function libinput_event_get_gesture_event(event: Plibinput_event): Plibinput_event_gesture; cdecl; external libinput;
function libinput_event_get_tablet_tool_event(event: Plibinput_event): Plibinput_event_tablet_tool; cdecl; external libinput;
function libinput_event_get_tablet_pad_event(event: Plibinput_event): Plibinput_event_tablet_pad; cdecl; external libinput;
function libinput_event_get_switch_event(event: Plibinput_event): Plibinput_event_switch; cdecl; external libinput;
function libinput_event_get_device_notify_event(event: Plibinput_event): Plibinput_event_device_notify; cdecl; external libinput;
function libinput_event_device_notify_get_base_event(event: Plibinput_event_device_notify): Plibinput_event; cdecl; external libinput;
function libinput_event_keyboard_get_time(event: Plibinput_event_keyboard): Tuint32_t; cdecl; external libinput;
function libinput_event_keyboard_get_time_usec(event: Plibinput_event_keyboard): Tuint64_t; cdecl; external libinput;
function libinput_event_keyboard_get_key(event: Plibinput_event_keyboard): Tuint32_t; cdecl; external libinput;
function libinput_event_keyboard_get_key_state(event: Plibinput_event_keyboard): Tlibinput_key_state; cdecl; external libinput;
function libinput_event_keyboard_get_base_event(event: Plibinput_event_keyboard): Plibinput_event; cdecl; external libinput;
function libinput_event_keyboard_get_seat_key_count(event: Plibinput_event_keyboard): Tuint32_t; cdecl; external libinput;
function libinput_event_pointer_get_time(event: Plibinput_event_pointer): Tuint32_t; cdecl; external libinput;
function libinput_event_pointer_get_time_usec(event: Plibinput_event_pointer): Tuint64_t; cdecl; external libinput;
function libinput_event_pointer_get_dx(event: Plibinput_event_pointer): double; cdecl; external libinput;
function libinput_event_pointer_get_dy(event: Plibinput_event_pointer): double; cdecl; external libinput;
function libinput_event_pointer_get_dx_unaccelerated(event: Plibinput_event_pointer): double; cdecl; external libinput;
function libinput_event_pointer_get_dy_unaccelerated(event: Plibinput_event_pointer): double; cdecl; external libinput;
function libinput_event_pointer_get_absolute_x(event: Plibinput_event_pointer): double; cdecl; external libinput;
function libinput_event_pointer_get_absolute_y(event: Plibinput_event_pointer): double; cdecl; external libinput;
function libinput_event_pointer_get_absolute_x_transformed(event: Plibinput_event_pointer; width: Tuint32_t): double; cdecl; external libinput;
function libinput_event_pointer_get_absolute_y_transformed(event: Plibinput_event_pointer; height: Tuint32_t): double; cdecl; external libinput;
function libinput_event_pointer_get_button(event: Plibinput_event_pointer): Tuint32_t; cdecl; external libinput;
function libinput_event_pointer_get_button_state(event: Plibinput_event_pointer): Tlibinput_button_state; cdecl; external libinput;
function libinput_event_pointer_get_seat_button_count(event: Plibinput_event_pointer): Tuint32_t; cdecl; external libinput;
function libinput_event_pointer_has_axis(event: Plibinput_event_pointer; axis: Tlibinput_pointer_axis): longint; cdecl; external libinput;
function libinput_event_pointer_get_axis_value(event: Plibinput_event_pointer; axis: Tlibinput_pointer_axis): double; cdecl; external libinput;
function libinput_event_pointer_get_axis_source(event: Plibinput_event_pointer): Tlibinput_pointer_axis_source; cdecl; external libinput;
function libinput_event_pointer_get_axis_value_discrete(event: Plibinput_event_pointer; axis: Tlibinput_pointer_axis): double; cdecl; external libinput;
function libinput_event_pointer_get_scroll_value(event: Plibinput_event_pointer; axis: Tlibinput_pointer_axis): double; cdecl; external libinput;
function libinput_event_pointer_get_scroll_value_v120(event: Plibinput_event_pointer; axis: Tlibinput_pointer_axis): double; cdecl; external libinput;
function libinput_event_pointer_get_base_event(event: Plibinput_event_pointer): Plibinput_event; cdecl; external libinput;
function libinput_event_touch_get_time(event: Plibinput_event_touch): Tuint32_t; cdecl; external libinput;
function libinput_event_touch_get_time_usec(event: Plibinput_event_touch): Tuint64_t; cdecl; external libinput;
function libinput_event_touch_get_slot(event: Plibinput_event_touch): Tint32_t; cdecl; external libinput;
function libinput_event_touch_get_seat_slot(event: Plibinput_event_touch): Tint32_t; cdecl; external libinput;
function libinput_event_touch_get_x(event: Plibinput_event_touch): double; cdecl; external libinput;
function libinput_event_touch_get_y(event: Plibinput_event_touch): double; cdecl; external libinput;
function libinput_event_touch_get_x_transformed(event: Plibinput_event_touch; width: Tuint32_t): double; cdecl; external libinput;
function libinput_event_touch_get_y_transformed(event: Plibinput_event_touch; height: Tuint32_t): double; cdecl; external libinput;
function libinput_event_touch_get_base_event(event: Plibinput_event_touch): Plibinput_event; cdecl; external libinput;
function libinput_event_gesture_get_time(event: Plibinput_event_gesture): Tuint32_t; cdecl; external libinput;
function libinput_event_gesture_get_time_usec(event: Plibinput_event_gesture): Tuint64_t; cdecl; external libinput;
function libinput_event_gesture_get_base_event(event: Plibinput_event_gesture): Plibinput_event; cdecl; external libinput;
function libinput_event_gesture_get_finger_count(event: Plibinput_event_gesture): longint; cdecl; external libinput;
function libinput_event_gesture_get_cancelled(event: Plibinput_event_gesture): longint; cdecl; external libinput;
function libinput_event_gesture_get_dx(event: Plibinput_event_gesture): double; cdecl; external libinput;
function libinput_event_gesture_get_dy(event: Plibinput_event_gesture): double; cdecl; external libinput;
function libinput_event_gesture_get_dx_unaccelerated(event: Plibinput_event_gesture): double; cdecl; external libinput;
function libinput_event_gesture_get_dy_unaccelerated(event: Plibinput_event_gesture): double; cdecl; external libinput;
function libinput_event_gesture_get_scale(event: Plibinput_event_gesture): double; cdecl; external libinput;
function libinput_event_gesture_get_angle_delta(event: Plibinput_event_gesture): double; cdecl; external libinput;
function libinput_event_tablet_tool_get_base_event(event: Plibinput_event_tablet_tool): Plibinput_event; cdecl; external libinput;
function libinput_event_tablet_tool_x_has_changed(event: Plibinput_event_tablet_tool): longint; cdecl; external libinput;
function libinput_event_tablet_tool_y_has_changed(event: Plibinput_event_tablet_tool): longint; cdecl; external libinput;
function libinput_event_tablet_tool_pressure_has_changed(event: Plibinput_event_tablet_tool): longint; cdecl; external libinput;
function libinput_event_tablet_tool_distance_has_changed(event: Plibinput_event_tablet_tool): longint; cdecl; external libinput;
function libinput_event_tablet_tool_tilt_x_has_changed(event: Plibinput_event_tablet_tool): longint; cdecl; external libinput;
function libinput_event_tablet_tool_tilt_y_has_changed(event: Plibinput_event_tablet_tool): longint; cdecl; external libinput;
function libinput_event_tablet_tool_rotation_has_changed(event: Plibinput_event_tablet_tool): longint; cdecl; external libinput;
function libinput_event_tablet_tool_slider_has_changed(event: Plibinput_event_tablet_tool): longint; cdecl; external libinput;
function libinput_event_tablet_tool_size_major_has_changed(event: Plibinput_event_tablet_tool): longint; cdecl; external libinput;
function libinput_event_tablet_tool_size_minor_has_changed(event: Plibinput_event_tablet_tool): longint; cdecl; external libinput;
function libinput_event_tablet_tool_wheel_has_changed(event: Plibinput_event_tablet_tool): longint; cdecl; external libinput;
function libinput_event_tablet_tool_get_x(event: Plibinput_event_tablet_tool): double; cdecl; external libinput;
function libinput_event_tablet_tool_get_y(event: Plibinput_event_tablet_tool): double; cdecl; external libinput;
function libinput_event_tablet_tool_get_dx(event: Plibinput_event_tablet_tool): double; cdecl; external libinput;
function libinput_event_tablet_tool_get_dy(event: Plibinput_event_tablet_tool): double; cdecl; external libinput;
function libinput_event_tablet_tool_get_pressure(event: Plibinput_event_tablet_tool): double; cdecl; external libinput;
function libinput_event_tablet_tool_get_distance(event: Plibinput_event_tablet_tool): double; cdecl; external libinput;
function libinput_event_tablet_tool_get_tilt_x(event: Plibinput_event_tablet_tool): double; cdecl; external libinput;
function libinput_event_tablet_tool_get_tilt_y(event: Plibinput_event_tablet_tool): double; cdecl; external libinput;
function libinput_event_tablet_tool_get_rotation(event: Plibinput_event_tablet_tool): double; cdecl; external libinput;
function libinput_event_tablet_tool_get_slider_position(event: Plibinput_event_tablet_tool): double; cdecl; external libinput;
function libinput_event_tablet_tool_get_size_major(event: Plibinput_event_tablet_tool): double; cdecl; external libinput;
function libinput_event_tablet_tool_get_size_minor(event: Plibinput_event_tablet_tool): double; cdecl; external libinput;
function libinput_event_tablet_tool_get_wheel_delta(event: Plibinput_event_tablet_tool): double; cdecl; external libinput;
function libinput_event_tablet_tool_get_wheel_delta_discrete(event: Plibinput_event_tablet_tool): longint; cdecl; external libinput;
function libinput_event_tablet_tool_get_x_transformed(event: Plibinput_event_tablet_tool; width: Tuint32_t): double; cdecl; external libinput;
function libinput_event_tablet_tool_get_y_transformed(event: Plibinput_event_tablet_tool; height: Tuint32_t): double; cdecl; external libinput;
function libinput_event_tablet_tool_get_tool(event: Plibinput_event_tablet_tool): Plibinput_tablet_tool; cdecl; external libinput;
function libinput_event_tablet_tool_get_proximity_state(event: Plibinput_event_tablet_tool): Tlibinput_tablet_tool_proximity_state; cdecl; external libinput;
function libinput_event_tablet_tool_get_tip_state(event: Plibinput_event_tablet_tool): Tlibinput_tablet_tool_tip_state; cdecl; external libinput;
function libinput_event_tablet_tool_get_button(event: Plibinput_event_tablet_tool): Tuint32_t; cdecl; external libinput;
function libinput_event_tablet_tool_get_button_state(event: Plibinput_event_tablet_tool): Tlibinput_button_state; cdecl; external libinput;
function libinput_event_tablet_tool_get_seat_button_count(event: Plibinput_event_tablet_tool): Tuint32_t; cdecl; external libinput;
function libinput_event_tablet_tool_get_time(event: Plibinput_event_tablet_tool): Tuint32_t; cdecl; external libinput;
function libinput_event_tablet_tool_get_time_usec(event: Plibinput_event_tablet_tool): Tuint64_t; cdecl; external libinput;
function libinput_tablet_tool_get_type(tool: Plibinput_tablet_tool): Tlibinput_tablet_tool_type; cdecl; external libinput;
function libinput_tablet_tool_get_tool_id(tool: Plibinput_tablet_tool): Tuint64_t; cdecl; external libinput;
function libinput_tablet_tool_ref(tool: Plibinput_tablet_tool): Plibinput_tablet_tool; cdecl; external libinput;
function libinput_tablet_tool_unref(tool: Plibinput_tablet_tool): Plibinput_tablet_tool; cdecl; external libinput;
function libinput_tablet_tool_has_pressure(tool: Plibinput_tablet_tool): longint; cdecl; external libinput;
function libinput_tablet_tool_has_distance(tool: Plibinput_tablet_tool): longint; cdecl; external libinput;
function libinput_tablet_tool_has_tilt(tool: Plibinput_tablet_tool): longint; cdecl; external libinput;
function libinput_tablet_tool_has_rotation(tool: Plibinput_tablet_tool): longint; cdecl; external libinput;
function libinput_tablet_tool_has_slider(tool: Plibinput_tablet_tool): longint; cdecl; external libinput;
function libinput_tablet_tool_has_size(tool: Plibinput_tablet_tool): longint; cdecl; external libinput;
function libinput_tablet_tool_has_wheel(tool: Plibinput_tablet_tool): longint; cdecl; external libinput;
function libinput_tablet_tool_has_button(tool: Plibinput_tablet_tool; code: Tuint32_t): longint; cdecl; external libinput;
function libinput_tablet_tool_is_unique(tool: Plibinput_tablet_tool): longint; cdecl; external libinput;
function libinput_tablet_tool_get_serial(tool: Plibinput_tablet_tool): Tuint64_t; cdecl; external libinput;
function libinput_tablet_tool_get_user_data(tool: Plibinput_tablet_tool): pointer; cdecl; external libinput;
procedure libinput_tablet_tool_set_user_data(tool: Plibinput_tablet_tool; user_data: pointer); cdecl; external libinput;
function libinput_event_tablet_pad_get_base_event(event: Plibinput_event_tablet_pad): Plibinput_event; cdecl; external libinput;
function libinput_event_tablet_pad_get_ring_position(event: Plibinput_event_tablet_pad): double; cdecl; external libinput;
function libinput_event_tablet_pad_get_ring_number(event: Plibinput_event_tablet_pad): dword; cdecl; external libinput;
function libinput_event_tablet_pad_get_ring_source(event: Plibinput_event_tablet_pad): Tlibinput_tablet_pad_ring_axis_source; cdecl; external libinput;
function libinput_event_tablet_pad_get_strip_position(event: Plibinput_event_tablet_pad): double; cdecl; external libinput;
function libinput_event_tablet_pad_get_strip_number(event: Plibinput_event_tablet_pad): dword; cdecl; external libinput;
function libinput_event_tablet_pad_get_strip_source(event: Plibinput_event_tablet_pad): Tlibinput_tablet_pad_strip_axis_source; cdecl; external libinput;
function libinput_event_tablet_pad_get_button_number(event: Plibinput_event_tablet_pad): Tuint32_t; cdecl; external libinput;
function libinput_event_tablet_pad_get_button_state(event: Plibinput_event_tablet_pad): Tlibinput_button_state; cdecl; external libinput;
function libinput_event_tablet_pad_get_key(event: Plibinput_event_tablet_pad): Tuint32_t; cdecl; external libinput;
function libinput_event_tablet_pad_get_key_state(event: Plibinput_event_tablet_pad): Tlibinput_key_state; cdecl; external libinput;
function libinput_event_tablet_pad_get_mode(event: Plibinput_event_tablet_pad): dword; cdecl; external libinput;
function libinput_event_tablet_pad_get_mode_group(event: Plibinput_event_tablet_pad): Plibinput_tablet_pad_mode_group; cdecl; external libinput;
function libinput_event_tablet_pad_get_time(event: Plibinput_event_tablet_pad): Tuint32_t; cdecl; external libinput;
function libinput_event_tablet_pad_get_time_usec(event: Plibinput_event_tablet_pad): Tuint64_t; cdecl; external libinput;
function libinput_event_switch_get_switch(event: Plibinput_event_switch): Tlibinput_switch; cdecl; external libinput;
function libinput_event_switch_get_switch_state(event: Plibinput_event_switch): Tlibinput_switch_state; cdecl; external libinput;
function libinput_event_switch_get_base_event(event: Plibinput_event_switch): Plibinput_event; cdecl; external libinput;
function libinput_event_switch_get_time(event: Plibinput_event_switch): Tuint32_t; cdecl; external libinput;
function libinput_event_switch_get_time_usec(event: Plibinput_event_switch): Tuint64_t; cdecl; external libinput;

type
  Plibinput_interface = ^Tlibinput_interface;

  Tlibinput_interface = record
    open_restricted: function(path: pchar; flags: longint; user_data: pointer): longint; cdecl;
    close_restricted: procedure(fd: longint; user_data: pointer); cdecl;
  end;

function libinput_udev_create_context(iface: Plibinput_interface; user_data: pointer; udev: Pudev): Plibinput; cdecl; external libinput;
function libinput_udev_assign_seat(libinput: Plibinput; seat_id: pchar): longint; cdecl; external libinput;
function libinput_path_create_context(iface: Plibinput_interface; user_data: pointer): Plibinput; cdecl; external libinput;
function libinput_path_add_device(libinput: Plibinput; path: pchar): Plibinput_device; cdecl; external libinput;
procedure libinput_path_remove_device(device: Plibinput_device); cdecl; external libinput;
function libinput_get_fd(libinput: Plibinput): longint; cdecl; external libinput;
function libinput_dispatch(libinput: Plibinput): longint; cdecl; external libinput;
function libinput_get_event(libinput: Plibinput): Plibinput_event; cdecl; external libinput;
function libinput_next_event_type(libinput: Plibinput): Tlibinput_event_type; cdecl; external libinput;
procedure libinput_set_user_data(libinput: Plibinput; user_data: pointer); cdecl; external libinput;
function libinput_get_user_data(libinput: Plibinput): pointer; cdecl; external libinput;
function libinput_resume(libinput: Plibinput): longint; cdecl; external libinput;
procedure libinput_suspend(libinput: Plibinput); cdecl; external libinput;
function libinput_ref(libinput: Plibinput): Plibinput; cdecl; external libinput;
function libinput_unref(libinput: Plibinput): Plibinput; cdecl; external libinput;
procedure libinput_log_set_priority(libinput: Plibinput; priority: Tlibinput_log_priority); cdecl; external libinput;
function libinput_log_get_priority(libinput: Plibinput): Tlibinput_log_priority; cdecl; external libinput;

type
  Tlibinput_log_handler = procedure(libinput: Plibinput; priority: Tlibinput_log_priority; format: pchar; args: Tva_list); cdecl;

procedure libinput_log_set_handler(libinput: Plibinput; log_handler: Tlibinput_log_handler); cdecl; external libinput;
function libinput_seat_ref(seat: Plibinput_seat): Plibinput_seat; cdecl; external libinput;
function libinput_seat_unref(seat: Plibinput_seat): Plibinput_seat; cdecl; external libinput;
procedure libinput_seat_set_user_data(seat: Plibinput_seat; user_data: pointer); cdecl; external libinput;
function libinput_seat_get_user_data(seat: Plibinput_seat): pointer; cdecl; external libinput;
function libinput_seat_get_context(seat: Plibinput_seat): Plibinput; cdecl; external libinput;
function libinput_seat_get_physical_name(seat: Plibinput_seat): pchar; cdecl; external libinput;
function libinput_seat_get_logical_name(seat: Plibinput_seat): pchar; cdecl; external libinput;
function libinput_device_ref(device: Plibinput_device): Plibinput_device; cdecl; external libinput;
function libinput_device_unref(device: Plibinput_device): Plibinput_device; cdecl; external libinput;
procedure libinput_device_set_user_data(device: Plibinput_device; user_data: pointer); cdecl; external libinput;
function libinput_device_get_user_data(device: Plibinput_device): pointer; cdecl; external libinput;
function libinput_device_get_context(device: Plibinput_device): Plibinput; cdecl; external libinput;
function libinput_device_get_device_group(device: Plibinput_device): Plibinput_device_group; cdecl; external libinput;
function libinput_device_get_sysname(device: Plibinput_device): pchar; cdecl; external libinput;
function libinput_device_get_name(device: Plibinput_device): pchar; cdecl; external libinput;
function libinput_device_get_id_product(device: Plibinput_device): dword; cdecl; external libinput;
function libinput_device_get_id_vendor(device: Plibinput_device): dword; cdecl; external libinput;
function libinput_device_get_output_name(device: Plibinput_device): pchar; cdecl; external libinput;
function libinput_device_get_seat(device: Plibinput_device): Plibinput_seat; cdecl; external libinput;
function libinput_device_set_seat_logical_name(device: Plibinput_device; name: pchar): longint; cdecl; external libinput;
function libinput_device_get_udev_device(device: Plibinput_device): Pudev_device; cdecl; external libinput;
procedure libinput_device_led_update(device: Plibinput_device; leds: Tlibinput_led); cdecl; external libinput;
function libinput_device_has_capability(device: Plibinput_device; capability: Tlibinput_device_capability): longint; cdecl; external libinput;
function libinput_device_get_size(device: Plibinput_device; width: Pdouble; height: Pdouble): longint; cdecl; external libinput;
function libinput_device_pointer_has_button(device: Plibinput_device; code: Tuint32_t): longint; cdecl; external libinput;
function libinput_device_keyboard_has_key(device: Plibinput_device; code: Tuint32_t): longint; cdecl; external libinput;
function libinput_device_touch_get_touch_count(device: Plibinput_device): longint; cdecl; external libinput;
function libinput_device_switch_has_switch(device: Plibinput_device; sw: Tlibinput_switch): longint; cdecl; external libinput;
function libinput_device_tablet_pad_get_num_buttons(device: Plibinput_device): longint; cdecl; external libinput;
function libinput_device_tablet_pad_get_num_rings(device: Plibinput_device): longint; cdecl; external libinput;
function libinput_device_tablet_pad_get_num_strips(device: Plibinput_device): longint; cdecl; external libinput;
function libinput_device_tablet_pad_has_key(device: Plibinput_device; code: Tuint32_t): longint; cdecl; external libinput;
function libinput_device_group_ref(group: Plibinput_device_group): Plibinput_device_group; cdecl; external libinput;
function libinput_device_group_unref(group: Plibinput_device_group): Plibinput_device_group; cdecl; external libinput;
procedure libinput_device_group_set_user_data(group: Plibinput_device_group; user_data: pointer); cdecl; external libinput;
function libinput_device_group_get_user_data(group: Plibinput_device_group): pointer; cdecl; external libinput;

type
  Tlibinput_config_status = longint;

const
  LIBINPUT_CONFIG_STATUS_SUCCESS = 0;
  LIBINPUT_CONFIG_STATUS_UNSUPPORTED = 1;
  LIBINPUT_CONFIG_STATUS_INVALID = 2;

function libinput_config_status_to_str(status: Tlibinput_config_status): pchar; cdecl; external libinput;

type
  Tlibinput_config_tap_state = longint;

const
  LIBINPUT_CONFIG_TAP_DISABLED = 0;
  LIBINPUT_CONFIG_TAP_ENABLED = 1;

function libinput_device_config_tap_get_finger_count(device: Plibinput_device): longint; cdecl; external libinput;
function libinput_device_config_tap_set_enabled(device: Plibinput_device; enable: Tlibinput_config_tap_state): Tlibinput_config_status; cdecl; external libinput;
function libinput_device_config_tap_get_enabled(device: Plibinput_device): Tlibinput_config_tap_state; cdecl; external libinput;
function libinput_device_config_tap_get_default_enabled(device: Plibinput_device): Tlibinput_config_tap_state; cdecl; external libinput;

type
  Tlibinput_config_tap_button_map = longint;

const
  LIBINPUT_CONFIG_TAP_MAP_LRM = 0;
  LIBINPUT_CONFIG_TAP_MAP_LMR = 1;

function libinput_device_config_tap_set_button_map(device: Plibinput_device; map: Tlibinput_config_tap_button_map): Tlibinput_config_status; cdecl; external libinput;
function libinput_device_config_tap_get_button_map(device: Plibinput_device): Tlibinput_config_tap_button_map; cdecl; external libinput;
function libinput_device_config_tap_get_default_button_map(device: Plibinput_device): Tlibinput_config_tap_button_map; cdecl; external libinput;

type
  Tlibinput_config_drag_state = longint;

const
  LIBINPUT_CONFIG_DRAG_DISABLED = 0;
  LIBINPUT_CONFIG_DRAG_ENABLED = 1;

function libinput_device_config_tap_set_drag_enabled(device: Plibinput_device; enable: Tlibinput_config_drag_state): Tlibinput_config_status; cdecl; external libinput;
function libinput_device_config_tap_get_drag_enabled(device: Plibinput_device): Tlibinput_config_drag_state; cdecl; external libinput;
function libinput_device_config_tap_get_default_drag_enabled(device: Plibinput_device): Tlibinput_config_drag_state; cdecl; external libinput;

type
  Tlibinput_config_drag_lock_state = longint;

const
  LIBINPUT_CONFIG_DRAG_LOCK_DISABLED = 0;
  LIBINPUT_CONFIG_DRAG_LOCK_ENABLED = 1;

function libinput_device_config_tap_set_drag_lock_enabled(device: Plibinput_device; enable: Tlibinput_config_drag_lock_state): Tlibinput_config_status; cdecl; external libinput;
function libinput_device_config_tap_get_drag_lock_enabled(device: Plibinput_device): Tlibinput_config_drag_lock_state; cdecl; external libinput;
function libinput_device_config_tap_get_default_drag_lock_enabled(device: Plibinput_device): Tlibinput_config_drag_lock_state; cdecl; external libinput;
function libinput_device_config_calibration_has_matrix(device: Plibinput_device): longint; cdecl; external libinput;
function libinput_device_config_calibration_set_matrix(device: Plibinput_device; matrix: Psingle): Tlibinput_config_status; cdecl; external libinput;
function libinput_device_config_calibration_get_matrix(device: Plibinput_device; matrix: Psingle): longint; cdecl; external libinput;
function libinput_device_config_calibration_get_default_matrix(device: Plibinput_device; matrix: Psingle): longint; cdecl; external libinput;

type
  Tlibinput_config_send_events_mode = longint;

const
  LIBINPUT_CONFIG_SEND_EVENTS_ENABLED = 0;
  LIBINPUT_CONFIG_SEND_EVENTS_DISABLED = 1 shl 0;
  LIBINPUT_CONFIG_SEND_EVENTS_DISABLED_ON_EXTERNAL_MOUSE = 1 shl 1;

function libinput_device_config_send_events_get_modes(device: Plibinput_device): Tuint32_t; cdecl; external libinput;
function libinput_device_config_send_events_set_mode(device: Plibinput_device; mode: Tuint32_t): Tlibinput_config_status; cdecl; external libinput;
function libinput_device_config_send_events_get_mode(device: Plibinput_device): Tuint32_t; cdecl; external libinput;
function libinput_device_config_send_events_get_default_mode(device: Plibinput_device): Tuint32_t; cdecl; external libinput;
function libinput_device_config_accel_is_available(device: Plibinput_device): longint; cdecl; external libinput;
function libinput_device_config_accel_set_speed(device: Plibinput_device; speed: double): Tlibinput_config_status; cdecl; external libinput;
function libinput_device_config_accel_get_speed(device: Plibinput_device): double; cdecl; external libinput;
function libinput_device_config_accel_get_default_speed(device: Plibinput_device): double; cdecl; external libinput;

type
  Tlibinput_config_accel_profile = longint;

const
  LIBINPUT_CONFIG_ACCEL_PROFILE_NONE = 0;
  LIBINPUT_CONFIG_ACCEL_PROFILE_FLAT = 1 shl 0;
  LIBINPUT_CONFIG_ACCEL_PROFILE_ADAPTIVE = 1 shl 1;
  LIBINPUT_CONFIG_ACCEL_PROFILE_CUSTOM = 1 shl 2;

type
  Plibinput_config_accel = type Pointer;

function libinput_config_accel_create(profile: Tlibinput_config_accel_profile): Plibinput_config_accel; cdecl; external libinput;
procedure libinput_config_accel_destroy(accel_config: Plibinput_config_accel); cdecl; external libinput;
function libinput_device_config_accel_apply(device: Plibinput_device; accel_config: Plibinput_config_accel): Tlibinput_config_status; cdecl; external libinput;

type
  Tlibinput_config_accel_type = longint;

const
  LIBINPUT_ACCEL_TYPE_FALLBACK = 0;
  LIBINPUT_ACCEL_TYPE_MOTION = 1;
  LIBINPUT_ACCEL_TYPE_SCROLL = 2;

function libinput_config_accel_set_points(accel_config: Plibinput_config_accel; accel_type: Tlibinput_config_accel_type; step: double; npoints: Tsize_t; points: Pdouble): Tlibinput_config_status; cdecl; external libinput;
function libinput_device_config_accel_get_profiles(device: Plibinput_device): Tuint32_t; cdecl; external libinput;
function libinput_device_config_accel_set_profile(device: Plibinput_device; profile: Tlibinput_config_accel_profile): Tlibinput_config_status; cdecl; external libinput;
function libinput_device_config_accel_get_profile(device: Plibinput_device): Tlibinput_config_accel_profile; cdecl; external libinput;
function libinput_device_config_accel_get_default_profile(device: Plibinput_device): Tlibinput_config_accel_profile; cdecl; external libinput;
function libinput_device_config_scroll_has_natural_scroll(device: Plibinput_device): longint; cdecl; external libinput;
function libinput_device_config_scroll_set_natural_scroll_enabled(device: Plibinput_device; enable: longint): Tlibinput_config_status; cdecl; external libinput;
function libinput_device_config_scroll_get_natural_scroll_enabled(device: Plibinput_device): longint; cdecl; external libinput;
function libinput_device_config_scroll_get_default_natural_scroll_enabled(device: Plibinput_device): longint; cdecl; external libinput;
function libinput_device_config_left_handed_is_available(device: Plibinput_device): longint; cdecl; external libinput;
function libinput_device_config_left_handed_set(device: Plibinput_device; left_handed: longint): Tlibinput_config_status; cdecl; external libinput;
function libinput_device_config_left_handed_get(device: Plibinput_device): longint; cdecl; external libinput;
function libinput_device_config_left_handed_get_default(device: Plibinput_device): longint; cdecl; external libinput;

type
  Tlibinput_config_click_method = longint;

const
  LIBINPUT_CONFIG_CLICK_METHOD_NONE = 0;
  LIBINPUT_CONFIG_CLICK_METHOD_BUTTON_AREAS = 1 shl 0;
  LIBINPUT_CONFIG_CLICK_METHOD_CLICKFINGER = 1 shl 1;

function libinput_device_config_click_get_methods(device: Plibinput_device): Tuint32_t; cdecl; external libinput;
function libinput_device_config_click_set_method(device: Plibinput_device; method: Tlibinput_config_click_method): Tlibinput_config_status; cdecl; external libinput;
function libinput_device_config_click_get_method(device: Plibinput_device): Tlibinput_config_click_method; cdecl; external libinput;
function libinput_device_config_click_get_default_method(device: Plibinput_device): Tlibinput_config_click_method; cdecl; external libinput;

type
  Tlibinput_config_middle_emulation_state = longint;

const
  LIBINPUT_CONFIG_MIDDLE_EMULATION_DISABLED = 0;
  LIBINPUT_CONFIG_MIDDLE_EMULATION_ENABLED = 1;

function libinput_device_config_middle_emulation_is_available(device: Plibinput_device): longint; cdecl; external libinput;
function libinput_device_config_middle_emulation_set_enabled(device: Plibinput_device; enable: Tlibinput_config_middle_emulation_state): Tlibinput_config_status; cdecl; external libinput;
function libinput_device_config_middle_emulation_get_enabled(device: Plibinput_device): Tlibinput_config_middle_emulation_state; cdecl; external libinput;
function libinput_device_config_middle_emulation_get_default_enabled(device: Plibinput_device): Tlibinput_config_middle_emulation_state; cdecl; external libinput;

type
  Tlibinput_config_scroll_method = longint;

const
  LIBINPUT_CONFIG_SCROLL_NO_SCROLL = 0;
  LIBINPUT_CONFIG_SCROLL_2FG = 1 shl 0;
  LIBINPUT_CONFIG_SCROLL_EDGE = 1 shl 1;
  LIBINPUT_CONFIG_SCROLL_ON_BUTTON_DOWN = 1 shl 2;

function libinput_device_config_scroll_get_methods(device: Plibinput_device): Tuint32_t; cdecl; external libinput;
function libinput_device_config_scroll_set_method(device: Plibinput_device; method: Tlibinput_config_scroll_method): Tlibinput_config_status; cdecl; external libinput;
function libinput_device_config_scroll_get_method(device: Plibinput_device): Tlibinput_config_scroll_method; cdecl; external libinput;
function libinput_device_config_scroll_get_default_method(device: Plibinput_device): Tlibinput_config_scroll_method; cdecl; external libinput;
function libinput_device_config_scroll_set_button(device: Plibinput_device; button: Tuint32_t): Tlibinput_config_status; cdecl; external libinput;
function libinput_device_config_scroll_get_button(device: Plibinput_device): Tuint32_t; cdecl; external libinput;
function libinput_device_config_scroll_get_default_button(device: Plibinput_device): Tuint32_t; cdecl; external libinput;

type
  Tlibinput_config_scroll_button_lock_state = longint;

const
  LIBINPUT_CONFIG_SCROLL_BUTTON_LOCK_DISABLED = 0;
  LIBINPUT_CONFIG_SCROLL_BUTTON_LOCK_ENABLED = 1;

function libinput_device_config_scroll_set_button_lock(device: Plibinput_device; state: Tlibinput_config_scroll_button_lock_state): Tlibinput_config_status; cdecl; external libinput;
function libinput_device_config_scroll_get_button_lock(device: Plibinput_device): Tlibinput_config_scroll_button_lock_state; cdecl; external libinput;
function libinput_device_config_scroll_get_default_button_lock(device: Plibinput_device): Tlibinput_config_scroll_button_lock_state; cdecl; external libinput;

type
  Tlibinput_config_dwt_state = longint;

const
  LIBINPUT_CONFIG_DWT_DISABLED = 0;
  LIBINPUT_CONFIG_DWT_ENABLED = 1;

function libinput_device_config_dwt_is_available(device: Plibinput_device): longint; cdecl; external libinput;
function libinput_device_config_dwt_set_enabled(device: Plibinput_device; enable: Tlibinput_config_dwt_state): Tlibinput_config_status; cdecl; external libinput;
function libinput_device_config_dwt_get_enabled(device: Plibinput_device): Tlibinput_config_dwt_state; cdecl; external libinput;
function libinput_device_config_dwt_get_default_enabled(device: Plibinput_device): Tlibinput_config_dwt_state; cdecl; external libinput;

type
  Tlibinput_config_dwtp_state = longint;

const
  LIBINPUT_CONFIG_DWTP_DISABLED = 0;
  LIBINPUT_CONFIG_DWTP_ENABLED = 1;

function libinput_device_config_dwtp_is_available(device: Plibinput_device): longint; cdecl; external libinput;
function libinput_device_config_dwtp_set_enabled(device: Plibinput_device; enable: Tlibinput_config_dwtp_state): Tlibinput_config_status; cdecl; external libinput;
function libinput_device_config_dwtp_get_enabled(device: Plibinput_device): Tlibinput_config_dwtp_state; cdecl; external libinput;
function libinput_device_config_dwtp_get_default_enabled(device: Plibinput_device): Tlibinput_config_dwtp_state; cdecl; external libinput;
function libinput_device_config_rotation_is_available(device: Plibinput_device): longint; cdecl; external libinput;
function libinput_device_config_rotation_set_angle(device: Plibinput_device; degrees_cw: dword): Tlibinput_config_status; cdecl; external libinput;
function libinput_device_config_rotation_get_angle(device: Plibinput_device): dword; cdecl; external libinput;
function libinput_device_config_rotation_get_default_angle(device: Plibinput_device): dword; cdecl; external libinput;

// === Konventiert am: 13-9-25 13:21:36 ===


implementation


end.
