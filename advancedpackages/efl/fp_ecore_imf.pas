unit fp_ecore_imf;

interface

uses
  efl, fp_eina;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


const
  ECORE_IMF_INPUT_HINT_AUTOFILL_MASK = $ff00;

type
  PEcore_IMF_Input_Panel_Event = ^TEcore_IMF_Input_Panel_Event;
  TEcore_IMF_Input_Panel_Event = longint;

const
  ECORE_IMF_INPUT_PANEL_STATE_EVENT = 0;
  ECORE_IMF_INPUT_PANEL_LANGUAGE_EVENT = 1;
  ECORE_IMF_INPUT_PANEL_SHIFT_MODE_EVENT = 2;
  ECORE_IMF_INPUT_PANEL_GEOMETRY_EVENT = 3;
  ECORE_IMF_CANDIDATE_PANEL_STATE_EVENT = 4;
  ECORE_IMF_CANDIDATE_PANEL_GEOMETRY_EVENT = 5;
  ECORE_IMF_INPUT_PANEL_KEYBOARD_MODE_EVENT = 6;

type
  PEcore_IMF_Input_Panel_State = ^TEcore_IMF_Input_Panel_State;
  TEcore_IMF_Input_Panel_State = longint;

const
  ECORE_IMF_INPUT_PANEL_STATE_SHOW = 0;
  ECORE_IMF_INPUT_PANEL_STATE_HIDE = 1;
  ECORE_IMF_INPUT_PANEL_STATE_WILL_SHOW = 2;

type
  PEcore_IMF_Input_Panel_Shift_Mode = ^TEcore_IMF_Input_Panel_Shift_Mode;
  TEcore_IMF_Input_Panel_Shift_Mode = longint;

const
  ECORE_IMF_INPUT_PANEL_SHIFT_MODE_OFF = 0;
  ECORE_IMF_INPUT_PANEL_SHIFT_MODE_ON = 1;

type
  PEcore_IMF_Candidate_Panel_State = ^TEcore_IMF_Candidate_Panel_State;
  TEcore_IMF_Candidate_Panel_State = longint;

const
  ECORE_IMF_CANDIDATE_PANEL_SHOW = 0;
  ECORE_IMF_CANDIDATE_PANEL_HIDE = 1;

type
  PEcore_IMF_Input_Panel_Keyboard_Mode = ^TEcore_IMF_Input_Panel_Keyboard_Mode;
  TEcore_IMF_Input_Panel_Keyboard_Mode = longint;

const
  ECORE_IMF_INPUT_PANEL_HW_KEYBOARD_MODE = 0;
  ECORE_IMF_INPUT_PANEL_SW_KEYBOARD_MODE = 1;

type
  TEcore_IMF_Context = record
  end;
  PEcore_IMF_Context = ^TEcore_IMF_Context;

var
  ECORE_IMF_EVENT_PREEDIT_START: longint; cvar;external libecore_imf;
  ECORE_IMF_EVENT_PREEDIT_END: longint; cvar;external libecore_imf;
  ECORE_IMF_EVENT_PREEDIT_CHANGED: longint; cvar;external libecore_imf;
  ECORE_IMF_EVENT_COMMIT: longint; cvar;external libecore_imf;
  ECORE_IMF_EVENT_DELETE_SURROUNDING: longint; cvar;external libecore_imf;

type
  TEcore_IMF_Event_Cb = procedure(data: pointer; ctx: PEcore_IMF_Context; event_info: pointer); cdecl;

type
  PEcore_IMF_Callback_Type = ^TEcore_IMF_Callback_Type;
  TEcore_IMF_Callback_Type = longint;

const
  ECORE_IMF_CALLBACK_PREEDIT_START = 0;
  ECORE_IMF_CALLBACK_PREEDIT_END = 1;
  ECORE_IMF_CALLBACK_PREEDIT_CHANGED = 2;
  ECORE_IMF_CALLBACK_COMMIT = 3;
  ECORE_IMF_CALLBACK_DELETE_SURROUNDING = 4;
  ECORE_IMF_CALLBACK_SELECTION_SET = 5;
  ECORE_IMF_CALLBACK_PRIVATE_COMMAND_SEND = 6;
  ECORE_IMF_CALLBACK_COMMIT_CONTENT = 7;
  ECORE_IMF_CALLBACK_TRANSACTION_START = 8;
  ECORE_IMF_CALLBACK_TRANSACTION_END = 9;

type
  PEcore_IMF_Event_Type = ^TEcore_IMF_Event_Type;
  TEcore_IMF_Event_Type = longint;

const
  ECORE_IMF_EVENT_MOUSE_DOWN = 0;
  ECORE_IMF_EVENT_MOUSE_UP = 1;
  ECORE_IMF_EVENT_MOUSE_IN = 2;
  ECORE_IMF_EVENT_MOUSE_OUT = 3;
  ECORE_IMF_EVENT_MOUSE_MOVE = 4;
  ECORE_IMF_EVENT_MOUSE_WHEEL = 5;
  ECORE_IMF_EVENT_KEY_DOWN = 6;
  ECORE_IMF_EVENT_KEY_UP = 7;

type
  PEcore_IMF_Keyboard_Modifiers = ^TEcore_IMF_Keyboard_Modifiers;
  TEcore_IMF_Keyboard_Modifiers = longint;

const
  ECORE_IMF_KEYBOARD_MODIFIER_NONE = 0;
  ECORE_IMF_KEYBOARD_MODIFIER_CTRL = 1 shl 0;
  ECORE_IMF_KEYBOARD_MODIFIER_ALT = 1 shl 1;
  ECORE_IMF_KEYBOARD_MODIFIER_SHIFT = 1 shl 2;
  ECORE_IMF_KEYBOARD_MODIFIER_WIN = 1 shl 3;
  ECORE_IMF_KEYBOARD_MODIFIER_ALTGR = 1 shl 4;

type
  PEcore_IMF_Keyboard_Locks = ^TEcore_IMF_Keyboard_Locks;
  TEcore_IMF_Keyboard_Locks = longint;

const
  ECORE_IMF_KEYBOARD_LOCK_NONE = 0;
  ECORE_IMF_KEYBOARD_LOCK_NUM = 1 shl 0;
  ECORE_IMF_KEYBOARD_LOCK_CAPS = 1 shl 1;
  ECORE_IMF_KEYBOARD_LOCK_SCROLL = 1 shl 2;

type
  PEcore_IMF_Mouse_Flags = ^TEcore_IMF_Mouse_Flags;
  TEcore_IMF_Mouse_Flags = longint;

const
  ECORE_IMF_MOUSE_NONE = 0;
  ECORE_IMF_MOUSE_DOUBLE_CLICK = 1 shl 0;
  ECORE_IMF_MOUSE_TRIPLE_CLICK = 1 shl 1;

type
  PEcore_IMF_Input_Mode = ^TEcore_IMF_Input_Mode;
  TEcore_IMF_Input_Mode = longint;

const
  ECORE_IMF_INPUT_MODE_ALPHA = 1 shl 0;
  ECORE_IMF_INPUT_MODE_NUMERIC = 1 shl 1;
  ECORE_IMF_INPUT_MODE_SPECIAL = 1 shl 2;
  ECORE_IMF_INPUT_MODE_HEXA = 1 shl 3;
  ECORE_IMF_INPUT_MODE_TELE = 1 shl 4;
  ECORE_IMF_INPUT_MODE_FULL = (ECORE_IMF_INPUT_MODE_ALPHA or ECORE_IMF_INPUT_MODE_NUMERIC) or ECORE_IMF_INPUT_MODE_SPECIAL;
  ECORE_IMF_INPUT_MODE_INVISIBLE = 1 shl 29;
  ECORE_IMF_INPUT_MODE_AUTOCAP = 1 shl 30;

type
  PEcore_IMF_Preedit_Type = ^TEcore_IMF_Preedit_Type;
  TEcore_IMF_Preedit_Type = longint;

const
  ECORE_IMF_PREEDIT_TYPE_NONE = 0;
  ECORE_IMF_PREEDIT_TYPE_SUB1 = 1;
  ECORE_IMF_PREEDIT_TYPE_SUB2 = 2;
  ECORE_IMF_PREEDIT_TYPE_SUB3 = 3;
  ECORE_IMF_PREEDIT_TYPE_SUB4 = 4;
  ECORE_IMF_PREEDIT_TYPE_SUB5 = 5;
  ECORE_IMF_PREEDIT_TYPE_SUB6 = 6;
  ECORE_IMF_PREEDIT_TYPE_SUB7 = 7;

type
  PEcore_IMF_Autocapital_Type = ^TEcore_IMF_Autocapital_Type;
  TEcore_IMF_Autocapital_Type = longint;

const
  ECORE_IMF_AUTOCAPITAL_TYPE_NONE = 0;
  ECORE_IMF_AUTOCAPITAL_TYPE_WORD = 1;
  ECORE_IMF_AUTOCAPITAL_TYPE_SENTENCE = 2;
  ECORE_IMF_AUTOCAPITAL_TYPE_ALLCHARACTER = 3;

type
  PEcore_IMF_Input_Panel_Layout = ^TEcore_IMF_Input_Panel_Layout;
  TEcore_IMF_Input_Panel_Layout = longint;

const
  ECORE_IMF_INPUT_PANEL_LAYOUT_NORMAL = 0;
  ECORE_IMF_INPUT_PANEL_LAYOUT_NUMBER = 1;
  ECORE_IMF_INPUT_PANEL_LAYOUT_EMAIL = 2;
  ECORE_IMF_INPUT_PANEL_LAYOUT_URL = 3;
  ECORE_IMF_INPUT_PANEL_LAYOUT_PHONENUMBER = 4;
  ECORE_IMF_INPUT_PANEL_LAYOUT_IP = 5;
  ECORE_IMF_INPUT_PANEL_LAYOUT_MONTH = 6;
  ECORE_IMF_INPUT_PANEL_LAYOUT_NUMBERONLY = 7;
  ECORE_IMF_INPUT_PANEL_LAYOUT_INVALID = 8;
  ECORE_IMF_INPUT_PANEL_LAYOUT_HEX = 9;
  ECORE_IMF_INPUT_PANEL_LAYOUT_TERMINAL = 10;
  ECORE_IMF_INPUT_PANEL_LAYOUT_PASSWORD = 11;
  ECORE_IMF_INPUT_PANEL_LAYOUT_DATETIME = 12;
  ECORE_IMF_INPUT_PANEL_LAYOUT_EMOTICON = 13;
  ECORE_IMF_INPUT_PANEL_LAYOUT_VOICE = 14;

type
  PEcore_IMF_Input_Panel_Lang = ^TEcore_IMF_Input_Panel_Lang;
  TEcore_IMF_Input_Panel_Lang = longint;

const
  ECORE_IMF_INPUT_PANEL_LANG_AUTOMATIC = 0;
  ECORE_IMF_INPUT_PANEL_LANG_ALPHABET = 1;

type
  PEcore_IMF_Input_Panel_Return_Key_Type = ^TEcore_IMF_Input_Panel_Return_Key_Type;
  TEcore_IMF_Input_Panel_Return_Key_Type = longint;

const
  ECORE_IMF_INPUT_PANEL_RETURN_KEY_TYPE_DEFAULT = 0;
  ECORE_IMF_INPUT_PANEL_RETURN_KEY_TYPE_DONE = 1;
  ECORE_IMF_INPUT_PANEL_RETURN_KEY_TYPE_GO = 2;
  ECORE_IMF_INPUT_PANEL_RETURN_KEY_TYPE_JOIN = 3;
  ECORE_IMF_INPUT_PANEL_RETURN_KEY_TYPE_LOGIN = 4;
  ECORE_IMF_INPUT_PANEL_RETURN_KEY_TYPE_NEXT = 5;
  ECORE_IMF_INPUT_PANEL_RETURN_KEY_TYPE_SEARCH = 6;
  ECORE_IMF_INPUT_PANEL_RETURN_KEY_TYPE_SEND = 7;
  ECORE_IMF_INPUT_PANEL_RETURN_KEY_TYPE_SIGNIN = 8;

type
  PEcore_IMF_Input_Hints = ^TEcore_IMF_Input_Hints;
  TEcore_IMF_Input_Hints = longint;

const
  ECORE_IMF_INPUT_HINT_NONE = 0;
  ECORE_IMF_INPUT_HINT_AUTO_COMPLETE = 1 shl 0;
  ECORE_IMF_INPUT_HINT_SENSITIVE_DATA = 1 shl 1;
  ECORE_IMF_INPUT_HINT_MULTILINE = 1 shl 2;
  ECORE_IMF_INPUT_HINT_AUTOFILL_CREDIT_CARD_EXPIRATION_DATE = $100;
  ECORE_IMF_INPUT_HINT_AUTOFILL_CREDIT_CARD_EXPIRATION_DAY = $200;
  ECORE_IMF_INPUT_HINT_AUTOFILL_CREDIT_CARD_EXPIRATION_MONTH = $300;
  ECORE_IMF_INPUT_HINT_AUTOFILL_CREDIT_CARD_EXPIRATION_YEAR = $400;
  ECORE_IMF_INPUT_HINT_AUTOFILL_CREDIT_CARD_NUMBER = $500;
  ECORE_IMF_INPUT_HINT_AUTOFILL_EMAIL_ADDRESS = $600;
  ECORE_IMF_INPUT_HINT_AUTOFILL_NAME = $700;
  ECORE_IMF_INPUT_HINT_AUTOFILL_PHONE = $800;
  ECORE_IMF_INPUT_HINT_AUTOFILL_POSTAL_ADDRESS = $900;
  ECORE_IMF_INPUT_HINT_AUTOFILL_POSTAL_CODE = $A00;
  ECORE_IMF_INPUT_HINT_AUTOFILL_ID = $B00;

type
  PEcore_IMF_Input_Panel_Layout_Normal_Variation = ^TEcore_IMF_Input_Panel_Layout_Normal_Variation;
  TEcore_IMF_Input_Panel_Layout_Normal_Variation = longint;

const
  ECORE_IMF_INPUT_PANEL_LAYOUT_NORMAL_VARIATION_NORMAL = 0;
  ECORE_IMF_INPUT_PANEL_LAYOUT_NORMAL_VARIATION_FILENAME = 1;
  ECORE_IMF_INPUT_PANEL_LAYOUT_NORMAL_VARIATION_PERSON_NAME = 2;

type
  PEcore_IMF_Input_Panel_Layout_Numberonly_Variation = ^TEcore_IMF_Input_Panel_Layout_Numberonly_Variation;
  TEcore_IMF_Input_Panel_Layout_Numberonly_Variation = longint;

const
  ECORE_IMF_INPUT_PANEL_LAYOUT_NUMBERONLY_VARIATION_NORMAL = 0;
  ECORE_IMF_INPUT_PANEL_LAYOUT_NUMBERONLY_VARIATION_SIGNED = 1;
  ECORE_IMF_INPUT_PANEL_LAYOUT_NUMBERONLY_VARIATION_DECIMAL = 2;
  ECORE_IMF_INPUT_PANEL_LAYOUT_NUMBERONLY_VARIATION_SIGNED_AND_DECIMAL = 3;

type
  PEcore_IMF_Input_Panel_Layout_Password_Variation = ^TEcore_IMF_Input_Panel_Layout_Password_Variation;
  TEcore_IMF_Input_Panel_Layout_Password_Variation = longint;

const
  ECORE_IMF_INPUT_PANEL_LAYOUT_PASSWORD_VARIATION_NORMAL = 0;
  ECORE_IMF_INPUT_PANEL_LAYOUT_PASSWORD_VARIATION_NUMBERONLY = 1;

type
  PEcore_IMF_BiDi_Direction = ^TEcore_IMF_BiDi_Direction;
  TEcore_IMF_BiDi_Direction = longint;

const
  ECORE_IMF_BIDI_DIRECTION_NEUTRAL = 0;
  ECORE_IMF_BIDI_DIRECTION_LTR = 1;
  ECORE_IMF_BIDI_DIRECTION_RTL = 2;

type
  PEcore_IMF_Device_Class = ^TEcore_IMF_Device_Class;
  TEcore_IMF_Device_Class = longint;

const
  ECORE_IMF_DEVICE_CLASS_NONE = 0;
  ECORE_IMF_DEVICE_CLASS_SEAT = 1;
  ECORE_IMF_DEVICE_CLASS_KEYBOARD = 2;
  ECORE_IMF_DEVICE_CLASS_MOUSE = 3;
  ECORE_IMF_DEVICE_CLASS_TOUCH = 4;
  ECORE_IMF_DEVICE_CLASS_PEN = 5;
  ECORE_IMF_DEVICE_CLASS_POINTER = 6;
  ECORE_IMF_DEVICE_CLASS_GAMEPAD = 7;

type
  PEcore_IMF_Device_Subclass = ^TEcore_IMF_Device_Subclass;
  TEcore_IMF_Device_Subclass = longint;

const
  ECORE_IMF_DEVICE_SUBCLASS_NONE = 0;
  ECORE_IMF_DEVICE_SUBCLASS_FINGER = 1;
  ECORE_IMF_DEVICE_SUBCLASS_FINGERNAIL = 2;
  ECORE_IMF_DEVICE_SUBCLASS_KNUCKLE = 3;
  ECORE_IMF_DEVICE_SUBCLASS_PALM = 4;
  ECORE_IMF_DEVICE_SUBCLASS_HAND_SIZE = 5;
  ECORE_IMF_DEVICE_SUBCLASS_HAND_FLAT = 6;
  ECORE_IMF_DEVICE_SUBCLASS_PEN_TIP = 7;
  ECORE_IMF_DEVICE_SUBCLASS_TRACKPAD = 8;
  ECORE_IMF_DEVICE_SUBCLASS_TRACKPOINT = 9;
  ECORE_IMF_DEVICE_SUBCLASS_TRACKBALL = 10;

type
  TEcore_IMF_Event_Preedit_Start = record
    ctx: PEcore_IMF_Context;
  end;
  PEcore_IMF_Event_Preedit_Start = ^TEcore_IMF_Event_Preedit_Start;

  TEcore_IMF_Event_Preedit_End = record
    ctx: PEcore_IMF_Context;
  end;
  PEcore_IMF_Event_Preedit_End = ^TEcore_IMF_Event_Preedit_End;

  TEcore_IMF_Event_Preedit_Changed = record
    ctx: PEcore_IMF_Context;
  end;
  PEcore_IMF_Event_Preedit_Changed = ^TEcore_IMF_Event_Preedit_Changed;

  TEcore_IMF_Event_Commit = record
    ctx: PEcore_IMF_Context;
    str: pchar;
  end;
  PEcore_IMF_Event_Commit = ^TEcore_IMF_Event_Commit;

  TEcore_IMF_Event_Delete_Surrounding = record
    ctx: PEcore_IMF_Context;
    offset: longint;
    n_chars: longint;
  end;
  PEcore_IMF_Event_Delete_Surrounding = ^TEcore_IMF_Event_Delete_Surrounding;

  TEcore_IMF_Event_Selection = record
    ctx: PEcore_IMF_Context;
    start: longint;
    end_: longint;
  end;
  PEcore_IMF_Event_Selection = ^TEcore_IMF_Event_Selection;

  TEcore_IMF_Event_Commit_Content = record
    ctx: PEcore_IMF_Context;
    content_uri: pchar;
    description: pchar;
    mime_types: pchar;
  end;
  PEcore_IMF_Event_Commit_Content = ^TEcore_IMF_Event_Commit_Content;

  TEcore_IMF_Event_Mouse_Down = record
    button: longint;
    output: record
      x: longint;
      y: longint;
      end;
    canvas: record
      x: longint;
      y: longint;
      end;
    modifiers: TEcore_IMF_Keyboard_Modifiers;
    locks: TEcore_IMF_Keyboard_Locks;
    flags: TEcore_IMF_Mouse_Flags;
    timestamp: dword;
  end;
  PEcore_IMF_Event_Mouse_Down = ^TEcore_IMF_Event_Mouse_Down;

  TEcore_IMF_Event_Mouse_Up = record
    button: longint;
    output: record
      x: longint;
      y: longint;
      end;
    canvas: record
      x: longint;
      y: longint;
      end;
    modifiers: TEcore_IMF_Keyboard_Modifiers;
    locks: TEcore_IMF_Keyboard_Locks;
    flags: TEcore_IMF_Mouse_Flags;
    timestamp: dword;
  end;
  PEcore_IMF_Event_Mouse_Up = ^TEcore_IMF_Event_Mouse_Up;

  TEcore_IMF_Event_Mouse_In = record
    buttons: longint;
    output: record
      x: longint;
      y: longint;
      end;
    canvas: record
      x: longint;
      y: longint;
      end;
    modifiers: TEcore_IMF_Keyboard_Modifiers;
    locks: TEcore_IMF_Keyboard_Locks;
    timestamp: dword;
  end;
  PEcore_IMF_Event_Mouse_In = ^TEcore_IMF_Event_Mouse_In;

  TEcore_IMF_Event_Mouse_Out = record
    buttons: longint;
    output: record
      x: longint;
      y: longint;
      end;
    canvas: record
      x: longint;
      y: longint;
      end;
    modifiers: TEcore_IMF_Keyboard_Modifiers;
    locks: TEcore_IMF_Keyboard_Locks;
    timestamp: dword;
  end;
  PEcore_IMF_Event_Mouse_Out = ^TEcore_IMF_Event_Mouse_Out;

  TEcore_IMF_Event_Mouse_Move = record
    buttons: longint;
    cur: record
      output: record
        x: longint;
        y: longint;
        end;
      canvas: record
        x: longint;
        y: longint;
        end;
      end;
    prev: record
      output: record
        x: longint;
        y: longint;
        end;
      canvas: record
        x: longint;
        y: longint;
        end;
      end;
    modifiers: TEcore_IMF_Keyboard_Modifiers;
    locks: TEcore_IMF_Keyboard_Locks;
    timestamp: dword;
  end;
  PEcore_IMF_Event_Mouse_Move = ^TEcore_IMF_Event_Mouse_Move;

  TEcore_IMF_Event_Mouse_Wheel = record
    direction: longint;
    z: longint;
    output: record
      x: longint;
      y: longint;
      end;
    canvas: record
      x: longint;
      y: longint;
      end;
    modifiers: TEcore_IMF_Keyboard_Modifiers;
    locks: TEcore_IMF_Keyboard_Locks;
    timestamp: dword;
  end;
  PEcore_IMF_Event_Mouse_Wheel = ^TEcore_IMF_Event_Mouse_Wheel;

  TEcore_IMF_Event_Key_Down = record
    keyname: pchar;
    modifiers: TEcore_IMF_Keyboard_Modifiers;
    locks: TEcore_IMF_Keyboard_Locks;
    key: pchar;
    _string: pchar;
    compose: pchar;
    timestamp: dword;
    dev_name: pchar;
    dev_class: TEcore_IMF_Device_Class;
    dev_subclass: TEcore_IMF_Device_Subclass;
    keycode: dword;
  end;
  PEcore_IMF_Event_Key_Down = ^TEcore_IMF_Event_Key_Down;

  TEcore_IMF_Event_Key_Up = record
    keyname: pchar;
    modifiers: TEcore_IMF_Keyboard_Modifiers;
    locks: TEcore_IMF_Keyboard_Locks;
    key: pchar;
    _string: pchar;
    compose: pchar;
    timestamp: dword;
    dev_name: pchar;
    dev_class: TEcore_IMF_Device_Class;
    dev_subclass: TEcore_IMF_Device_Subclass;
    keycode: dword;
  end;
  PEcore_IMF_Event_Key_Up = ^TEcore_IMF_Event_Key_Up;

  TEcore_IMF_Event = record
    case longint of
      0: (mouse_down: TEcore_IMF_Event_Mouse_Down);
      1: (mouse_up: TEcore_IMF_Event_Mouse_Up);
      2: (mouse_in: TEcore_IMF_Event_Mouse_In);
      3: (mouse_out: TEcore_IMF_Event_Mouse_Out);
      4: (mouse_move: TEcore_IMF_Event_Mouse_Move);
      5: (mouse_wheel: TEcore_IMF_Event_Mouse_Wheel);
      6: (key_down: TEcore_IMF_Event_Key_Down);
      7: (key_up: TEcore_IMF_Event_Key_Up);
  end;
  PEcore_IMF_Event = ^TEcore_IMF_Event;

  TEcore_IMF_Preedit_Attr = record
    preedit_type: TEcore_IMF_Preedit_Type;
    start_index: dword;
    end_index: dword;
  end;
  PEcore_IMF_Preedit_Attr = ^TEcore_IMF_Preedit_Attr;

  Tevent_callback_func = procedure(data: pointer; ctx: PEcore_IMF_Context; value: longint); cdecl;

  TEcore_IMF_Context_Class = record
    add: procedure(ctx: PEcore_IMF_Context); cdecl;
    del: procedure(ctx: PEcore_IMF_Context); cdecl;
    client_window_set: procedure(ctx: PEcore_IMF_Context; window: pointer); cdecl;
    client_canvas_set: procedure(ctx: PEcore_IMF_Context; canvas: pointer); cdecl;
    show: procedure(ctx: PEcore_IMF_Context); cdecl;
    hide: procedure(ctx: PEcore_IMF_Context); cdecl;
    preedit_string_get: procedure(ctx: PEcore_IMF_Context; str: PPchar; cursor_pos: Plongint); cdecl;
    focus_in: procedure(ctx: PEcore_IMF_Context); cdecl;
    focus_out: procedure(ctx: PEcore_IMF_Context); cdecl;
    reset: procedure(ctx: PEcore_IMF_Context); cdecl;
    cursor_position_set: procedure(ctx: PEcore_IMF_Context; cursor_pos: longint); cdecl;
    use_preedit_set: procedure(ctx: PEcore_IMF_Context; use_preedit: TEina_Bool); cdecl;
    input_mode_set: procedure(ctx: PEcore_IMF_Context; input_mode: TEcore_IMF_Input_Mode); cdecl;
    filter_event: function(ctx: PEcore_IMF_Context; _type: TEcore_IMF_Event_Type; event: PEcore_IMF_Event): TEina_Bool; cdecl;
    preedit_string_with_attributes_get: procedure(ctx: PEcore_IMF_Context; str: PPchar; attrs: PPEina_List; cursor_pos: Plongint); cdecl;
    prediction_allow_set: procedure(ctx: PEcore_IMF_Context; prediction: TEina_Bool); cdecl;
    autocapital_type_set: procedure(ctx: PEcore_IMF_Context; autocapital_type: TEcore_IMF_Autocapital_Type); cdecl;
    control_panel_show: procedure(ctx: PEcore_IMF_Context); cdecl;
    control_panel_hide: procedure(ctx: PEcore_IMF_Context); cdecl;
    input_panel_layout_set: procedure(ctx: PEcore_IMF_Context; layout: TEcore_IMF_Input_Panel_Layout); cdecl;
    input_panel_layout_get: function(ctx: PEcore_IMF_Context): TEcore_IMF_Input_Panel_Layout; cdecl;
    input_panel_language_set: procedure(ctx: PEcore_IMF_Context; lang: TEcore_IMF_Input_Panel_Lang); cdecl;
    input_panel_language_get: function(ctx: PEcore_IMF_Context): TEcore_IMF_Input_Panel_Lang; cdecl;
    cursor_location_set: procedure(ctx: PEcore_IMF_Context; x: longint; y: longint; w: longint; h: longint); cdecl;
    input_panel_imdata_set: procedure(ctx: PEcore_IMF_Context; data: pointer; len: longint); cdecl;
    input_panel_imdata_get: procedure(ctx: PEcore_IMF_Context; data: pointer; len: Plongint); cdecl;
    input_panel_return_key_type_set: procedure(ctx: PEcore_IMF_Context; return_key_type: TEcore_IMF_Input_Panel_Return_Key_Type); cdecl;
    input_panel_return_key_disabled_set: procedure(ctx: PEcore_IMF_Context; disabled: TEina_Bool); cdecl;
    input_panel_caps_lock_mode_set: procedure(ctx: PEcore_IMF_Context; mode: TEina_Bool); cdecl;
    input_panel_geometry_get: procedure(ctx: PEcore_IMF_Context; x: Plongint; y: Plongint; w: Plongint; h: Plongint); cdecl;
    input_panel_state_get: function(ctx: PEcore_IMF_Context): TEcore_IMF_Input_Panel_State; cdecl;
    input_panel_event_callback_add: procedure(ctx: PEcore_IMF_Context; _type: TEcore_IMF_Input_Panel_Event; func: Tevent_callback_func; data: pointer); cdecl;
    input_panel_event_callback_del: procedure(ctx: PEcore_IMF_Context; _type: TEcore_IMF_Input_Panel_Event; func: Tevent_callback_func); cdecl;
    input_panel_language_locale_get: procedure(ctx: PEcore_IMF_Context; lang: PPchar); cdecl;
    candidate_panel_geometry_get: procedure(ctx: PEcore_IMF_Context; x: Plongint; y: Plongint; w: Plongint; h: Plongint); cdecl;
    input_hint_set: procedure(ctx: PEcore_IMF_Context; input_hints: TEcore_IMF_Input_Hints); cdecl;
    bidi_direction_set: procedure(ctx: PEcore_IMF_Context; direction: TEcore_IMF_BiDi_Direction); cdecl;
    keyboard_mode_get: function(ctx: PEcore_IMF_Context): TEcore_IMF_Input_Panel_Keyboard_Mode; cdecl;
    prediction_hint_set: procedure(ctx: PEcore_IMF_Context; prediction_hint: pchar); cdecl;
    mime_type_accept_set: procedure(ctx: PEcore_IMF_Context; mime_type: pchar); cdecl;
    input_panel_position_set: procedure(ctx: PEcore_IMF_Context; x: longint; y: longint); cdecl;
  end;
  PEcore_IMF_Context_Class = ^TEcore_IMF_Context_Class;

  TEcore_IMF_Context_Info = record
    id: pchar;
    description: pchar;
    default_locales: pchar;
    canvas_type: pchar;
    canvas_required: longint;
  end;
  PEcore_IMF_Context_Info = ^TEcore_IMF_Context_Info;

  Tecore_imf_module_func = function: PEcore_IMF_Context; cdecl;

function ecore_imf_init: longint; cdecl; external libecore_imf;
function ecore_imf_shutdown: longint; cdecl; external libecore_imf;
procedure ecore_imf_module_register(info: PEcore_IMF_Context_Info; imf_module_create: Tecore_imf_module_func; imf_module_exit: Tecore_imf_module_func); cdecl; external libecore_imf;
function ecore_imf_input_panel_hide: TEina_Bool; cdecl; external libecore_imf;
function ecore_imf_context_available_ids_get: PEina_List; cdecl; external libecore_imf;
function ecore_imf_context_available_ids_by_canvas_type_get(canvas_type: pchar): PEina_List; cdecl; external libecore_imf;
function ecore_imf_context_default_id_get: pchar; cdecl; external libecore_imf;
function ecore_imf_context_default_id_by_canvas_type_get(canvas_type: pchar): pchar; cdecl; external libecore_imf;
function ecore_imf_context_info_by_id_get(id: pchar): PEcore_IMF_Context_Info; cdecl; external libecore_imf;
function ecore_imf_context_add(id: pchar): PEcore_IMF_Context; cdecl; external libecore_imf;
function ecore_imf_context_info_get(ctx: PEcore_IMF_Context): PEcore_IMF_Context_Info; cdecl; external libecore_imf;
procedure ecore_imf_context_del(ctx: PEcore_IMF_Context); cdecl; external libecore_imf;
procedure ecore_imf_context_client_window_set(ctx: PEcore_IMF_Context; window: pointer); cdecl; external libecore_imf;
function ecore_imf_context_client_window_get(ctx: PEcore_IMF_Context): pointer; cdecl; external libecore_imf;
procedure ecore_imf_context_client_canvas_set(ctx: PEcore_IMF_Context; canvas: pointer); cdecl; external libecore_imf;
function ecore_imf_context_client_canvas_get(ctx: PEcore_IMF_Context): pointer; cdecl; external libecore_imf;
procedure ecore_imf_context_show(ctx: PEcore_IMF_Context); cdecl; external libecore_imf; deprecated;
procedure ecore_imf_context_hide(ctx: PEcore_IMF_Context); cdecl; external libecore_imf; deprecated;
procedure ecore_imf_context_preedit_string_get(ctx: PEcore_IMF_Context; str: PPchar; cursor_pos: Plongint); cdecl; external libecore_imf;
procedure ecore_imf_context_preedit_string_with_attributes_get(ctx: PEcore_IMF_Context; str: PPchar; attrs: PPEina_List; cursor_pos: Plongint); cdecl; external libecore_imf;
procedure ecore_imf_context_focus_in(ctx: PEcore_IMF_Context); cdecl; external libecore_imf;
procedure ecore_imf_context_focus_out(ctx: PEcore_IMF_Context); cdecl; external libecore_imf;
procedure ecore_imf_context_reset(ctx: PEcore_IMF_Context); cdecl; external libecore_imf;
procedure ecore_imf_context_cursor_position_set(ctx: PEcore_IMF_Context; cursor_pos: longint); cdecl; external libecore_imf;
procedure ecore_imf_context_cursor_location_set(ctx: PEcore_IMF_Context; x: longint; y: longint; w: longint; h: longint); cdecl; external libecore_imf;
procedure ecore_imf_context_use_preedit_set(ctx: PEcore_IMF_Context; use_preedit: TEina_Bool); cdecl; external libecore_imf;

type
  Tecore_imf_context_func1 = function(data: pointer; ctx: PEcore_IMF_Context; text: PPchar; cursor_pos: Plongint): TEina_Bool; cdecl;
  Tecore_imf_context_func12 = function(data: pointer; ctx: PEcore_IMF_Context; text: PPchar): TEina_Bool; cdecl;

procedure ecore_imf_context_retrieve_surrounding_callback_set(ctx: PEcore_IMF_Context; func: Tecore_imf_context_func1; data: pointer); cdecl; external libecore_imf;
procedure ecore_imf_context_retrieve_selection_callback_set(ctx: PEcore_IMF_Context; func: Tecore_imf_context_func12; data: pointer); cdecl; external libecore_imf;
procedure ecore_imf_context_input_mode_set(ctx: PEcore_IMF_Context; input_mode: TEcore_IMF_Input_Mode); cdecl; external libecore_imf;
function ecore_imf_context_input_mode_get(ctx: PEcore_IMF_Context): TEcore_IMF_Input_Mode; cdecl; external libecore_imf;
function ecore_imf_context_filter_event(ctx: PEcore_IMF_Context; _type: TEcore_IMF_Event_Type; event: PEcore_IMF_Event): TEina_Bool; cdecl; external libecore_imf;
function ecore_imf_context_new(ctxc: PEcore_IMF_Context_Class): PEcore_IMF_Context; cdecl; external libecore_imf;
procedure ecore_imf_context_data_set(ctx: PEcore_IMF_Context; data: pointer); cdecl; external libecore_imf;
function ecore_imf_context_data_get(ctx: PEcore_IMF_Context): pointer; cdecl; external libecore_imf;
function ecore_imf_context_surrounding_get(ctx: PEcore_IMF_Context; text: PPchar; cursor_pos: Plongint): TEina_Bool; cdecl; external libecore_imf;
function ecore_imf_context_selection_get(ctx: PEcore_IMF_Context; text: PPchar): TEina_Bool; cdecl; external libecore_imf;
procedure ecore_imf_context_preedit_start_event_add(ctx: PEcore_IMF_Context); cdecl; external libecore_imf; deprecated;
procedure ecore_imf_context_preedit_end_event_add(ctx: PEcore_IMF_Context); cdecl; external libecore_imf; deprecated;
procedure ecore_imf_context_preedit_changed_event_add(ctx: PEcore_IMF_Context); cdecl; external libecore_imf; deprecated;
procedure ecore_imf_context_commit_event_add(ctx: PEcore_IMF_Context; str: pchar); cdecl; external libecore_imf; deprecated;
procedure ecore_imf_context_delete_surrounding_event_add(ctx: PEcore_IMF_Context; offset: longint; n_chars: longint); cdecl; external libecore_imf; deprecated;
procedure ecore_imf_context_event_callback_add(ctx: PEcore_IMF_Context; _type: TEcore_IMF_Callback_Type; func: TEcore_IMF_Event_Cb; data: pointer); cdecl; external libecore_imf;
function ecore_imf_context_event_callback_del(ctx: PEcore_IMF_Context; _type: TEcore_IMF_Callback_Type; func: TEcore_IMF_Event_Cb): pointer; cdecl; external libecore_imf;
procedure ecore_imf_context_event_callback_call(ctx: PEcore_IMF_Context; _type: TEcore_IMF_Callback_Type; event_info: pointer); cdecl; external libecore_imf;
procedure ecore_imf_context_prediction_allow_set(ctx: PEcore_IMF_Context; prediction: TEina_Bool); cdecl; external libecore_imf;
function ecore_imf_context_prediction_allow_get(ctx: PEcore_IMF_Context): TEina_Bool; cdecl; external libecore_imf;
procedure ecore_imf_context_autocapital_type_set(ctx: PEcore_IMF_Context; autocapital_type: TEcore_IMF_Autocapital_Type); cdecl; external libecore_imf;
function ecore_imf_context_autocapital_type_get(ctx: PEcore_IMF_Context): TEcore_IMF_Autocapital_Type; cdecl; external libecore_imf;
procedure ecore_imf_context_input_hint_set(ctx: PEcore_IMF_Context; hints: TEcore_IMF_Input_Hints); cdecl; external libecore_imf;
function ecore_imf_context_input_hint_get(ctx: PEcore_IMF_Context): TEcore_IMF_Input_Hints; cdecl; external libecore_imf;
procedure ecore_imf_context_control_panel_show(ctx: PEcore_IMF_Context); cdecl; external libecore_imf; deprecated;
procedure ecore_imf_context_control_panel_hide(ctx: PEcore_IMF_Context); cdecl; external libecore_imf; deprecated;
procedure ecore_imf_context_input_panel_show(ctx: PEcore_IMF_Context); cdecl; external libecore_imf;
procedure ecore_imf_context_input_panel_hide(ctx: PEcore_IMF_Context); cdecl; external libecore_imf;
procedure ecore_imf_context_input_panel_layout_set(ctx: PEcore_IMF_Context; layout: TEcore_IMF_Input_Panel_Layout); cdecl; external libecore_imf;
function ecore_imf_context_input_panel_layout_get(ctx: PEcore_IMF_Context): TEcore_IMF_Input_Panel_Layout; cdecl; external libecore_imf;
procedure ecore_imf_context_input_panel_layout_variation_set(ctx: PEcore_IMF_Context; variation: longint); cdecl; external libecore_imf;
function ecore_imf_context_input_panel_layout_variation_get(ctx: PEcore_IMF_Context): longint; cdecl; external libecore_imf;
procedure ecore_imf_context_input_panel_language_set(ctx: PEcore_IMF_Context; lang: TEcore_IMF_Input_Panel_Lang); cdecl; external libecore_imf;
function ecore_imf_context_input_panel_language_get(ctx: PEcore_IMF_Context): TEcore_IMF_Input_Panel_Lang; cdecl; external libecore_imf;
procedure ecore_imf_context_input_panel_enabled_set(ctx: PEcore_IMF_Context; enabled: TEina_Bool); cdecl; external libecore_imf;
function ecore_imf_context_input_panel_enabled_get(ctx: PEcore_IMF_Context): TEina_Bool; cdecl; external libecore_imf;
procedure ecore_imf_context_input_panel_imdata_set(ctx: PEcore_IMF_Context; data: pointer; len: longint); cdecl; external libecore_imf;
procedure ecore_imf_context_input_panel_imdata_get(ctx: PEcore_IMF_Context; data: pointer; len: Plongint); cdecl; external libecore_imf;
procedure ecore_imf_context_input_panel_return_key_type_set(ctx: PEcore_IMF_Context; return_key_type: TEcore_IMF_Input_Panel_Return_Key_Type); cdecl; external libecore_imf;
function ecore_imf_context_input_panel_return_key_type_get(ctx: PEcore_IMF_Context): TEcore_IMF_Input_Panel_Return_Key_Type; cdecl; external libecore_imf;
procedure ecore_imf_context_input_panel_return_key_disabled_set(ctx: PEcore_IMF_Context; disabled: TEina_Bool); cdecl; external libecore_imf;
function ecore_imf_context_input_panel_return_key_disabled_get(ctx: PEcore_IMF_Context): TEina_Bool; cdecl; external libecore_imf;
procedure ecore_imf_context_input_panel_caps_lock_mode_set(ctx: PEcore_IMF_Context; mode: TEina_Bool); cdecl; external libecore_imf;
function ecore_imf_context_input_panel_caps_lock_mode_get(ctx: PEcore_IMF_Context): TEina_Bool; cdecl; external libecore_imf;
procedure ecore_imf_context_input_panel_geometry_get(ctx: PEcore_IMF_Context; x: Plongint; y: Plongint; w: Plongint; h: Plongint); cdecl; external libecore_imf;
function ecore_imf_context_input_panel_state_get(ctx: PEcore_IMF_Context): TEcore_IMF_Input_Panel_State; cdecl; external libecore_imf;

type
  Tecore_imf_context_input_func = procedure(data: pointer; ctx: PEcore_IMF_Context; value: longint); cdecl;

procedure ecore_imf_context_input_panel_event_callback_add(ctx: PEcore_IMF_Context; _type: TEcore_IMF_Input_Panel_Event; func: Tecore_imf_context_input_func; data: pointer); cdecl; external libecore_imf;
procedure ecore_imf_context_input_panel_event_callback_del(ctx: PEcore_IMF_Context; _type: TEcore_IMF_Input_Panel_Event; func: Tecore_imf_context_input_func); cdecl; external libecore_imf;
procedure ecore_imf_context_input_panel_event_callback_call(ctx: PEcore_IMF_Context; _type: TEcore_IMF_Input_Panel_Event; value: longint); cdecl; external libecore_imf;
procedure ecore_imf_context_input_panel_event_callback_clear(ctx: PEcore_IMF_Context); cdecl; external libecore_imf;
procedure ecore_imf_context_input_panel_language_locale_get(ctx: PEcore_IMF_Context; lang: PPchar); cdecl; external libecore_imf;
procedure ecore_imf_context_candidate_panel_geometry_get(ctx: PEcore_IMF_Context; x: Plongint; y: Plongint; w: Plongint; h: Plongint); cdecl; external libecore_imf;
procedure ecore_imf_context_input_panel_show_on_demand_set(ctx: PEcore_IMF_Context; ondemand: TEina_Bool); cdecl; external libecore_imf;
function ecore_imf_context_input_panel_show_on_demand_get(ctx: PEcore_IMF_Context): TEina_Bool; cdecl; external libecore_imf;
procedure ecore_imf_context_bidi_direction_set(ctx: PEcore_IMF_Context; direction: TEcore_IMF_BiDi_Direction); cdecl; external libecore_imf;
function ecore_imf_context_bidi_direction_get(ctx: PEcore_IMF_Context): TEcore_IMF_BiDi_Direction; cdecl; external libecore_imf;
function ecore_imf_context_keyboard_mode_get(ctx: PEcore_IMF_Context): TEcore_IMF_Input_Panel_Keyboard_Mode; cdecl; external libecore_imf;
procedure ecore_imf_context_prediction_hint_set(ctx: PEcore_IMF_Context; prediction_hint: pchar); cdecl; external libecore_imf;
procedure ecore_imf_context_mime_type_accept_set(ctx: PEcore_IMF_Context; mime_type: pchar); cdecl; external libecore_imf;
procedure ecore_imf_context_input_panel_position_set(ctx: PEcore_IMF_Context; x: longint; y: longint); cdecl; external libecore_imf;
function ecore_imf_context_prediction_hint_hash_set(ctx: PEcore_IMF_Context; key: pchar; value: pchar): TEina_Bool; cdecl; external libecore_imf;
function ecore_imf_context_prediction_hint_hash_del(ctx: PEcore_IMF_Context; key: pchar): TEina_Bool; cdecl; external libecore_imf;
function ecore_imf_context_prediction_hint_hash_get(ctx: PEcore_IMF_Context): PEina_Hash; cdecl; external libecore_imf;

// === Konventiert am: 15-6-25 13:14:41 ===


implementation



end.
