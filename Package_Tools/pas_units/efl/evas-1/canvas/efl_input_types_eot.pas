unit efl_input_types_eot;

interface

uses
  ctypes, elf;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

type
  PEfl_Pointer_Action = ^TEfl_Pointer_Action;
  TEfl_Pointer_Action = longint;

const
  EFL_POINTER_ACTION_NONE = 0;
  EFL_POINTER_ACTION_MOVE = 1;
  EFL_POINTER_ACTION_DOWN = 2;
  EFL_POINTER_ACTION_UP = 3;
  EFL_POINTER_ACTION_CANCEL = 4;
  EFL_POINTER_ACTION_IN = 5;
  EFL_POINTER_ACTION_OUT = 6;
  EFL_POINTER_ACTION_WHEEL = 7;
  EFL_POINTER_ACTION_AXIS = 8;

type
  PEfl_Pointer_Flags = ^TEfl_Pointer_Flags;
  TEfl_Pointer_Flags = longint;

const
  EFL_POINTER_FLAGS_NONE = 0;
  EFL_POINTER_FLAGS_DOUBLE_CLICK = 1;
  EFL_POINTER_FLAGS_TRIPLE_CLICK = 2;

type
  PEfl_Input_Flags = ^TEfl_Input_Flags;
  TEfl_Input_Flags = longint;

const
  EFL_INPUT_FLAGS_NONE = 0;
  EFL_INPUT_FLAGS_PROCESSED = 1;
  EFL_INPUT_FLAGS_SCROLLING = 2;
  {$ifdef EFL_BETA_API_SUPPORT}
type                                                                                                               // Muss aufgelöst werden

  PEfl_Input_Object_Pointer_Mode = ^TEfl_Input_Object_Pointer_Mode;
  TEfl_Input_Object_Pointer_Mode = longint;

const
  EFL_INPUT_OBJECT_POINTER_MODE_AUTO_GRAB = 0;
  EFL_INPUT_OBJECT_POINTER_MODE_NO_GRAB = 1;
  EFL_INPUT_OBJECT_POINTER_MODE_NO_GRAB_NO_REPEAT_UPDOWN = 2;
  {$endif}

  {$ifdef EFL_BETA_API_SUPPORT}
type
  PEfl_Input_Value = ^TEfl_Input_Value;
  TEfl_Input_Value = longint;

const
  EFL_INPUT_VALUE_NONE = 0;
  EFL_INPUT_VALUE_TIMESTAMP = 1;
  EFL_INPUT_VALUE_BUTTON = 2;
  EFL_INPUT_VALUE_BUTTONS_PRESSED = 3;
  EFL_INPUT_VALUE_TOUCH_ID = 4;
  EFL_INPUT_VALUE_X = 5;
  EFL_INPUT_VALUE_Y = 6;
  EFL_INPUT_VALUE_DX = 7;
  EFL_INPUT_VALUE_DY = 8;
  EFL_INPUT_VALUE_PREVIOUS_X = 9;
  EFL_INPUT_VALUE_PREVIOUS_Y = 10;
  EFL_INPUT_VALUE_RAW_X = 11;
  EFL_INPUT_VALUE_RAW_Y = 12;
  EFL_INPUT_VALUE_RADIUS = 13;
  EFL_INPUT_VALUE_RADIUS_X = 14;                                         // Muss aufgelöst werden

  EFL_INPUT_VALUE_RADIUS_Y = 15;
  EFL_INPUT_VALUE_PRESSURE = 16;
  EFL_INPUT_VALUE_DISTANCE = 17;
  EFL_INPUT_VALUE_AZIMUTH = 18;
  EFL_INPUT_VALUE_TILT = 19;
  EFL_INPUT_VALUE_TILT_X = 20;
  EFL_INPUT_VALUE_TILT_Y = 21;
  EFL_INPUT_VALUE_TWIST = 22;
  EFL_INPUT_VALUE_WHEEL_DELTA = 23;
  EFL_INPUT_VALUE_WHEEL_ANGLE = 24;
  EFL_INPUT_VALUE_WHEEL_HORIZONTAL = 25;
  EFL_INPUT_VALUE_SLIDER = 26;
  {$endif}
type
  PEfl_Input_Modifier = ^TEfl_Input_Modifier;
  TEfl_Input_Modifier = longint;

const
  EFL_INPUT_MODIFIER_NONE = 0;
  EFL_INPUT_MODIFIER_ALT = 1;
  EFL_INPUT_MODIFIER_CONTROL = 2;
  EFL_INPUT_MODIFIER_SHIFT = 4;
  EFL_INPUT_MODIFIER_META = 8;
  EFL_INPUT_MODIFIER_ALTGR = 16;
  EFL_INPUT_MODIFIER_HYPER = 32;
  EFL_INPUT_MODIFIER_SUPER = 64;

type
  PEfl_Input_Lock = ^TEfl_Input_Lock;
  TEfl_Input_Lock = longint;

const
  EFL_INPUT_LOCK_NONE = 0;
  EFL_INPUT_LOCK_NUM = 1;
  EFL_INPUT_LOCK_CAPS = 2;
  EFL_INPUT_LOCK_SCROLL = 4;
  EFL_INPUT_LOCK_SHIFT = 8;

  // === Konventiert am: 12-5-25 19:54:09 ===


implementation



end.
