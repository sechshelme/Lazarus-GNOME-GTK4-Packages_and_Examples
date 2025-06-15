unit fp_ecore_input;

interface

uses
  efl, fp_eo, fp_eina;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


var
  ECORE_EVENT_KEY_DOWN: longint; cvar;external libecore_input;
  ECORE_EVENT_KEY_UP: longint; cvar;external libecore_input;
  ECORE_EVENT_MOUSE_BUTTON_DOWN: longint; cvar;external libecore_input;
  ECORE_EVENT_MOUSE_BUTTON_UP: longint; cvar;external libecore_input;
  ECORE_EVENT_MOUSE_MOVE: longint; cvar;external libecore_input;
  ECORE_EVENT_MOUSE_WHEEL: longint; cvar;external libecore_input;
  ECORE_EVENT_MOUSE_IN: longint; cvar;external libecore_input;
  ECORE_EVENT_MOUSE_OUT: longint; cvar;external libecore_input;
  ECORE_EVENT_AXIS_UPDATE: longint; cvar;external libecore_input;
  ECORE_EVENT_MOUSE_BUTTON_CANCEL: longint; cvar;external libecore_input;
  ECORE_EVENT_JOYSTICK: longint; cvar;external libecore_input;

const
  ECORE_EVENT_MODIFIER_SHIFT = $0001;
  ECORE_EVENT_MODIFIER_CTRL = $0002;
  ECORE_EVENT_MODIFIER_ALT = $0004;
  ECORE_EVENT_MODIFIER_WIN = $0008;
  ECORE_EVENT_MODIFIER_SCROLL = $0010;
  ECORE_EVENT_MODIFIER_NUM = $0020;
  ECORE_EVENT_MODIFIER_CAPS = $0040;
  ECORE_EVENT_LOCK_SCROLL = $0080;
  ECORE_EVENT_LOCK_NUM = $0100;
  ECORE_EVENT_LOCK_CAPS = $0200;
  ECORE_EVENT_LOCK_SHIFT = $0300;
  ECORE_EVENT_MODIFIER_ALTGR = $0400;

type
  PEcore_Window = ^TEcore_Window;
  TEcore_Window = Tuintptr_t;

const
  _ECORE_WINDOW_PREDEF = 1;

type
  PEcore_Event_Modifier = ^TEcore_Event_Modifier;
  TEcore_Event_Modifier = longint;

const
  ECORE_NONE = 0;
  ECORE_SHIFT = 1;
  ECORE_CTRL = 2;
  ECORE_ALT = 3;
  ECORE_WIN = 4;
  ECORE_SCROLL = 5;
  ECORE_CAPS = 6;
  ECORE_MODE = 7;
  ECORE_LAST = 8;

type
  PEcore_Event_Press = ^TEcore_Event_Press;
  TEcore_Event_Press = longint;

const
  ECORE_DOWN = 0;
  ECORE_UP = 1;
  ECORE_CANCEL = 2;

type
  PEcore_Event_IO = ^TEcore_Event_IO;
  TEcore_Event_IO = longint;

const
  ECORE_IN = 0;
  ECORE_OUT = 1;

type
  PEcore_Compose_State = ^TEcore_Compose_State;
  TEcore_Compose_State = longint;

const
  ECORE_COMPOSE_NONE = 0;
  ECORE_COMPOSE_MIDDLE = 1;
  ECORE_COMPOSE_DONE = 2;

type
  PEcore_Event_Joystick_Button = ^TEcore_Event_Joystick_Button;
  TEcore_Event_Joystick_Button = longint;

const
  ECORE_EVENT_JOYSTICK_BUTTON_NONE = 0;
  ECORE_EVENT_JOYSTICK_BUTTON_FACE_0 = 1;
  ECORE_EVENT_JOYSTICK_BUTTON_FACE_1 = 2;
  ECORE_EVENT_JOYSTICK_BUTTON_FACE_2 = 3;
  ECORE_EVENT_JOYSTICK_BUTTON_FACE_3 = 4;
  ECORE_EVENT_JOYSTICK_BUTTON_LEFT_SHOULDER = 5;
  ECORE_EVENT_JOYSTICK_BUTTON_RIGHT_SHOULDER = 6;
  ECORE_EVENT_JOYSTICK_BUTTON_SELECT = 7;
  ECORE_EVENT_JOYSTICK_BUTTON_START = 8;
  ECORE_EVENT_JOYSTICK_BUTTON_LEFT_ANALOG_STICK = 9;
  ECORE_EVENT_JOYSTICK_BUTTON_RIGHT_ANALOG_STICK = 10;
  ECORE_EVENT_JOYSTICK_BUTTON_META = 11;
  ECORE_EVENT_JOYSTICK_BUTTON_LAST = 12;

type
  PEcore_Event_Joystick_Axis = ^TEcore_Event_Joystick_Axis;
  TEcore_Event_Joystick_Axis = longint;

const
  ECORE_EVENT_JOYSTICK_AXIS_NONE = 0;
  ECORE_EVENT_JOYSTICK_AXIS_HAT_X = 1;
  ECORE_EVENT_JOYSTICK_AXIS_HAT_Y = 2;
  ECORE_EVENT_JOYSTICK_AXIS_LEFT_SHOULDER = 3;
  ECORE_EVENT_JOYSTICK_AXIS_RIGHT_SHOULDER = 4;
  ECORE_EVENT_JOYSTICK_AXIS_LEFT_ANALOG_HOR = 5;
  ECORE_EVENT_JOYSTICK_AXIS_LEFT_ANALOG_VER = 6;
  ECORE_EVENT_JOYSTICK_AXIS_RIGHT_ANALOG_HOR = 7;
  ECORE_EVENT_JOYSTICK_AXIS_RIGHT_ANALOG_VER = 8;
  ECORE_EVENT_JOYSTICK_AXIS_LAST = 9;

type
  PEcore_Event_Joystick_Event = ^TEcore_Event_Joystick_Event;
  TEcore_Event_Joystick_Event = longint;

const
  ECORE_EVENT_JOYSTICK_EVENT_TYPE_NONE = 0;
  ECORE_EVENT_JOYSTICK_EVENT_TYPE_CONNECTED = 1;
  ECORE_EVENT_JOYSTICK_EVENT_TYPE_DISCONNECTED = 2;
  ECORE_EVENT_JOYSTICK_EVENT_TYPE_BUTTON = 3;
  ECORE_EVENT_JOYSTICK_EVENT_TYPE_AXIS = 4;
  ECORE_EVENT_JOYSTICK_EVENT_TYPE_LAST = 5;

type
  TEcore_Event_Joystick_Event_Type = TEcore_Event_Joystick_Event;

  PEcore_Event_Joystick_Event_Type = ^TEcore_Event_Joystick_Event_Type;
  PEcore_Event_Key = ^TEcore_Event_Key;

  TEcore_Event_Key = record
    keyname: pchar;
    key: pchar;
    _string: pchar;
    compose: pchar;
    window: TEcore_Window;
    root_window: TEcore_Window;
    event_window: TEcore_Window;
    timestamp: dword;
    modifiers: dword;
    same_screen: longint;
    keycode: dword;
    data: pointer;
    dev: PEo;
  end;

type
  TEcore_Event_Mouse_Button = record
    window: TEcore_Window;
    root_window: TEcore_Window;
    event_window: TEcore_Window;
    timestamp: dword;
    modifiers: dword;
    buttons: dword;
    double_click: dword;
    triple_click: dword;
    same_screen: longint;
    x: longint;
    y: longint;
    root: record
      x: longint;
      y: longint;
      end;
    multi: record
      device: longint;
      radius: double;
      radius_x: double;
      radius_y: double;
      pressure: double;
      angle: double;
      x: double;
      y: double;
      root: record
        x: double;
        y: double;
        end;
      end;
    dev: PEo;
  end;
  PEcore_Event_Mouse_Button = ^TEcore_Event_Mouse_Button;

  TEcore_Event_Mouse_Wheel = record
    window: TEcore_Window;
    root_window: TEcore_Window;
    event_window: TEcore_Window;
    timestamp: dword;
    modifiers: dword;
    same_screen: longint;
    direction: longint;
    z: longint;
    x: longint;
    y: longint;
    root: record
      x: longint;
      y: longint;
      end;
    dev: PEo;
  end;
  PEcore_Event_Mouse_Wheel = ^TEcore_Event_Mouse_Wheel;

  TEcore_Event_Mouse_Move = record
    window: TEcore_Window;
    root_window: TEcore_Window;
    event_window: TEcore_Window;
    timestamp: dword;
    modifiers: dword;
    same_screen: longint;
    x: longint;
    y: longint;
    root: record
      x: longint;
      y: longint;
      end;
    multi: record
      device: longint;
      radius: double;
      radius_x: double;
      radius_y: double;
      pressure: double;
      angle: double;
      x: double;
      y: double;
      root: record
        x: double;
        y: double;
        end;
      end;
    dev: PEo;
  end;
  PEcore_Event_Mouse_Move = ^TEcore_Event_Mouse_Move;

type
  PEcore_Axis_Label = ^TEcore_Axis_Label;
  TEcore_Axis_Label = longint;

const
  ECORE_AXIS_LABEL_UNKNOWN = 0;
  ECORE_AXIS_LABEL_X = 1;
  ECORE_AXIS_LABEL_Y = 2;
  ECORE_AXIS_LABEL_PRESSURE = 3;
  ECORE_AXIS_LABEL_DISTANCE = 4;
  ECORE_AXIS_LABEL_AZIMUTH = 5;
  ECORE_AXIS_LABEL_TILT = 6;
  ECORE_AXIS_LABEL_TWIST = 7;
  ECORE_AXIS_LABEL_TOUCH_WIDTH_MAJOR = 8;
  ECORE_AXIS_LABEL_TOUCH_WIDTH_MINOR = 9;
  ECORE_AXIS_LABEL_TOOL_WIDTH_MAJOR = 10;
  ECORE_AXIS_LABEL_TOOL_WIDTH_MINOR = 11;
  ECORE_AXIS_LABEL_WINDOW_X = 12;
  ECORE_AXIS_LABEL_WINDOW_Y = 13;
  ECORE_AXIS_LABEL_NORMAL_X = 14;
  ECORE_AXIS_LABEL_NORMAL_Y = 15;
  ECORE_AXIS_LABEL_TOUCH_PALM = 16;

type
  TEcore_Axis = record
    _label: TEcore_Axis_Label;
    value: double;
  end;
  PEcore_Axis = ^TEcore_Axis;

  TEcore_Event_Axis_Update = record
    window: TEcore_Window;
    root_window: TEcore_Window;
    event_window: TEcore_Window;
    timestamp: dword;
    device: longint;
    toolid: longint;
    naxis: longint;
    axis: PEcore_Axis;
    dev: PEo;
  end;
  PEcore_Event_Axis_Update = ^TEcore_Event_Axis_Update;

  TEcore_Event_Mouse_IO = record
    window: TEcore_Window;
    event_window: TEcore_Window;
    timestamp: dword;
    modifiers: dword;
    x: longint;
    y: longint;
    dev: PEo;
  end;
  PEcore_Event_Mouse_IO = ^TEcore_Event_Mouse_IO;

  TEcore_Event_Modifiers = record
    size: dword;
    arr: array[0..(ECORE_LAST) - 1] of dword;
  end;
  PEcore_Event_Modifiers = ^TEcore_Event_Modifiers;

  TEcore_Event_Joystick = record
    _type: TEcore_Event_Joystick_Event_Type;
    index: dword;
    timestamp: dword;
    uni: record
      case longint of
        0: (axis: record
            index: TEcore_Event_Joystick_Axis;
            value: double;
            end);
        1: (button: record
            index: TEcore_Event_Joystick_Button;
            value: double;
            end);
      end;
    dev: PEo;
  end;
  PEcore_Event_Joystick = ^TEcore_Event_Joystick;

function ecore_event_init: longint; cdecl; external libecore_input;
function ecore_event_shutdown: longint; cdecl; external libecore_input;
function ecore_event_modifier_mask(modifier: TEcore_Event_Modifier): dword; cdecl; external libecore_input;
function ecore_event_update_modifier(key: pchar; modifiers: PEcore_Event_Modifiers; inc: longint): TEcore_Event_Modifier; cdecl; external libecore_input;
function ecore_compose_get(seq: PEina_List; seqstr_ret: PPchar): TEcore_Compose_State; cdecl; external libecore_input;
procedure ecore_input_joystick_event_axis_deadzone_set(event_axis_deadzone: longint); cdecl; external libecore_input;
function ecore_input_joystick_event_axis_deadzone_get: longint; cdecl; external libecore_input;
function ecore_input_joystick_name_get(index: longint): pchar; cdecl; external libecore_input;

// === Konventiert am: 15-6-25 13:20:13 ===


implementation



end.
