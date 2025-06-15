unit fp_elput;

interface

uses
  efl, fp_eina;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PElput_Device_Caps = ^TElput_Device_Caps;
  TElput_Device_Caps = longint;

const
  ELPUT_DEVICE_CAPS_POINTER = 1 shl 0;
  ELPUT_DEVICE_CAPS_KEYBOARD = 1 shl 1;
  ELPUT_DEVICE_CAPS_TOUCH = 1 shl 2;
  ELPUT_DEVICE_CAPS_TABLET_TOOL = 1 shl 3;
  ELPUT_DEVICE_CAPS_TABLET_PAD = 1 shl 4;
  ELPUT_DEVICE_CAPS_GESTURE = 1 shl 5;
  ELPUT_DEVICE_CAPS_SWITCH = 1 shl 6;

type
  TElput_Manager = record
  end;
  PElput_Manager = ^TElput_Manager;

  TElput_Seat = record
  end;
  PElput_Seat = ^TElput_Seat;

  TElput_Device = record
  end;
  PElput_Device = ^TElput_Device;

  TElput_Swipe_Gesture = record
  end;
  PElput_Swipe_Gesture = ^TElput_Swipe_Gesture;

  TElput_Event_Seat_Caps = record
    pointer_count: longint;
    keyboard_count: longint;
    touch_count: longint;
    seat: PElput_Seat;
  end;
  PElput_Event_Seat_Caps = ^TElput_Event_Seat_Caps;

  TElput_Event_Seat_Frame = record
    seat: PElput_Seat;
  end;
  PElput_Event_Seat_Frame = ^TElput_Event_Seat_Frame;

  TElput_Event_Modifiers_Send = record
    depressed: dword;
    latched: dword;
    locked: dword;
    group: dword;
  end;
  PElput_Event_Modifiers_Send = ^TElput_Event_Modifiers_Send;

  PElput_Device_Change_Type = ^TElput_Device_Change_Type;
  TElput_Device_Change_Type = longint;

const
  ELPUT_DEVICE_ADDED = 0;
  ELPUT_DEVICE_REMOVED = 1;

type
  TElput_Event_Device_Change = record
    device: PElput_Device;
    _type: TElput_Device_Change_Type;
  end;
  PElput_Event_Device_Change = ^TElput_Event_Device_Change;

  TElput_Event_Session_Active = record
  end;
  PElput_Event_Session_Active = ^TElput_Event_Session_Active;

  TElput_Event_Pointer_Motion = record
    time_usec: uint64;
    dx: double;
    dy: double;
    dx_unaccel: double;
    dy_unaccel: double;
  end;
  PElput_Event_Pointer_Motion = ^TElput_Event_Pointer_Motion;

type
  PElput_Switch_Type = ^TElput_Switch_Type;
  TElput_Switch_Type = longint;

const
  ELPUT_SWITCH_TYPE_LID = 1;
  ELPUT_SWITCH_TYPE_TABLET_MODE = 2;

type
  PElput_Switch_State = ^TElput_Switch_State;
  TElput_Switch_State = longint;

const
  ELPUT_SWITCH_STATE_OFF = 0;
  ELPUT_SWITCH_STATE_ON = 1;

type
  TElput_Event_Switch = record
    device: PElput_Device;
    time_usec: uint64;
    _type: TElput_Switch_Type;
    state: TElput_Switch_State;
  end;
  PElput_Event_Switch = ^TElput_Event_Switch;

var
  ELPUT_EVENT_SEAT_CAPS: longint; cvar;external libelput;
  ELPUT_EVENT_SEAT_FRAME: longint; cvar;external libelput;
  ELPUT_EVENT_MODIFIERS_SEND: longint; cvar;external libelput;
  ELPUT_EVENT_DEVICE_CHANGE: longint; cvar;external libelput;
  ELPUT_EVENT_SESSION_ACTIVE: longint; cvar;external libelput;
  ELPUT_EVENT_POINTER_MOTION: longint; cvar;external libelput;
  ELPUT_EVENT_SWITCH: longint; cvar;external libelput;

function elput_init: longint; cdecl; external libelput;
function elput_shutdown: longint; cdecl; external libelput;
function elput_manager_connect(seat: pchar; tty: dword): PElput_Manager; cdecl; external libelput;
function elput_manager_connect_gestures(seat: pchar; tty: dword): PElput_Manager; cdecl; external libelput;
procedure elput_manager_disconnect(manager: PElput_Manager); cdecl; external libelput;
function elput_manager_open(manager: PElput_Manager; path: pchar; flags: longint): longint; cdecl; external libelput;
procedure elput_manager_close(manager: PElput_Manager; fd: longint); cdecl; external libelput;
function elput_manager_vt_set(manager: PElput_Manager; vt: longint): TEina_Bool; cdecl; external libelput;
function elput_manager_seats_get(manager: PElput_Manager): PEina_List; cdecl; external libelput;
procedure elput_manager_window_set(manager: PElput_Manager; window: dword); cdecl; external libelput;
function elput_input_init(manager: PElput_Manager): TEina_Bool; cdecl; external libelput;
procedure elput_input_shutdown(manager: PElput_Manager); cdecl; external libelput;
procedure elput_input_pointer_xy_get(manager: PElput_Manager; seat: pchar; x: Plongint; y: Plongint); cdecl; external libelput;
procedure elput_input_pointer_xy_set(manager: PElput_Manager; seat: pchar; x: longint; y: longint); cdecl; external libelput;
function elput_input_pointer_left_handed_set(manager: PElput_Manager; seat: pchar; left: TEina_Bool): TEina_Bool; cdecl; external libelput;
procedure elput_input_pointer_max_set(manager: PElput_Manager; maxw: longint; maxh: longint); cdecl; external libelput;
function elput_input_pointer_rotation_set(manager: PElput_Manager; rotation: longint): TEina_Bool; cdecl; external libelput;
procedure elput_input_touch_tap_to_click_enabled_set(manager: PElput_Manager; seat: pchar; enabled: TEina_Bool); cdecl; external libelput;
procedure elput_input_devices_calibrate(manager: PElput_Manager; w: longint; h: longint); cdecl; external libelput;
function elput_input_key_remap_enable(manager: PElput_Manager; enable: TEina_Bool): TEina_Bool; cdecl; external libelput;
function elput_input_key_remap_set(manager: PElput_Manager; from_keys: Plongint; to_keys: Plongint; num: longint): TEina_Bool; cdecl; external libelput;
procedure elput_input_keyboard_info_set(manager: PElput_Manager; context: pointer; keymap: pointer; group: longint); cdecl; external libelput;
procedure elput_input_keyboard_group_set(manager: PElput_Manager; group: longint); cdecl; external libelput;
procedure elput_input_pointer_accel_profile_set(manager: PElput_Manager; seat: pchar; profile: uint32); cdecl; external libelput;
procedure elput_input_pointer_accel_speed_set(manager: PElput_Manager; seat: pchar; speed: double); cdecl; external libelput;
function elput_touch_drag_enabled_set(device: PElput_Device; enabled: TEina_Bool): TEina_Bool; cdecl; external libelput;
function elput_touch_drag_enabled_get(device: PElput_Device): TEina_Bool; cdecl; external libelput;
function elput_touch_drag_lock_enabled_set(device: PElput_Device; enabled: TEina_Bool): TEina_Bool; cdecl; external libelput;
function elput_touch_drag_lock_enabled_get(device: PElput_Device): TEina_Bool; cdecl; external libelput;
function elput_touch_dwt_enabled_set(device: PElput_Device; enabled: TEina_Bool): TEina_Bool; cdecl; external libelput;
function elput_touch_dwt_enabled_get(device: PElput_Device): TEina_Bool; cdecl; external libelput;
function elput_touch_scroll_method_set(device: PElput_Device; method: longint): TEina_Bool; cdecl; external libelput;
function elput_touch_scroll_method_get(device: PElput_Device): longint; cdecl; external libelput;
function elput_touch_click_method_set(device: PElput_Device; method: longint): TEina_Bool; cdecl; external libelput;
function elput_touch_click_method_get(device: PElput_Device): longint; cdecl; external libelput;
function elput_touch_tap_enabled_set(device: PElput_Device; enabled: TEina_Bool): TEina_Bool; cdecl; external libelput;
function elput_touch_tap_enabled_get(device: PElput_Device): TEina_Bool; cdecl; external libelput;
function elput_device_seat_get(dev: PElput_Device): PElput_Seat; cdecl; external libelput;
function elput_device_caps_get(dev: PElput_Device): TElput_Device_Caps; cdecl; external libelput;
function elput_device_output_name_get(device: PElput_Device): PEina_Stringshare; cdecl; external libelput;
function elput_seat_devices_get(seat: PElput_Seat): PEina_List; cdecl; external libelput;
function elput_seat_name_get(seat: PElput_Seat): PEina_Stringshare; cdecl; external libelput;
function elput_seat_manager_get(seat: PElput_Seat): PElput_Manager; cdecl; external libelput;

var
  ELPUT_EVENT_SWIPE_BEGIN: longint; cvar;external libelput;
  ELPUT_EVENT_SWIPE_UPDATE: longint; cvar;external libelput;
  ELPUT_EVENT_SWIPE_END: longint; cvar;external libelput;

function elput_swipe_dx_get(gesture: PElput_Swipe_Gesture): double; cdecl; external libelput;
function elput_swipe_dy_get(gesture: PElput_Swipe_Gesture): double; cdecl; external libelput;
function elput_swipe_finger_count_get(gesture: PElput_Swipe_Gesture): longint; cdecl; external libelput;
function elput_swipe_window_get(gesture: PElput_Swipe_Gesture): longint; cdecl; external libelput;
function elput_swipe_device_get(gesture: PElput_Swipe_Gesture): PElput_Device; cdecl; external libelput;

// === Konventiert am: 15-6-25 13:23:29 ===


implementation


end.
