{$IFDEF read_interface}


type
  PElm_Gesture_Layer = ^TElm_Gesture_Layer;
  TElm_Gesture_Layer = TEo;

type
  PElm_Gesture_Type = ^TElm_Gesture_Type;
  TElm_Gesture_Type = longint;

const
  ELM_GESTURE_FIRST = 0;
  ELM_GESTURE_N_TAPS = 1;
  ELM_GESTURE_N_LONG_TAPS = 2;
  ELM_GESTURE_N_DOUBLE_TAPS = 3;
  ELM_GESTURE_N_TRIPLE_TAPS = 4;
  ELM_GESTURE_MOMENTUM = 5;
  ELM_GESTURE_N_LINES = 6;
  ELM_GESTURE_N_FLICKS = 7;
  ELM_GESTURE_ZOOM = 8;
  ELM_GESTURE_ROTATE = 9;
  ELM_GESTURE_LAST = 10;

type
  PElm_Gesture_State = ^TElm_Gesture_State;
  TElm_Gesture_State = longint;

const
  ELM_GESTURE_STATE_UNDEFINED = -(1);
  ELM_GESTURE_STATE_START = (-(1)) + 1;
  ELM_GESTURE_STATE_MOVE = (-(1)) + 2;
  ELM_GESTURE_STATE_END = (-(1)) + 3;
  ELM_GESTURE_STATE_ABORT = (-(1)) + 4;

procedure elm_gesture_layer_zoom_step_set(obj: PElm_Gesture_Layer; step: double); cdecl; external libelementary;
function elm_gesture_layer_zoom_step_get(obj: PElm_Gesture_Layer): double; cdecl; external libelementary;
procedure elm_gesture_layer_tap_finger_size_set(obj: PElm_Gesture_Layer; sz: longint); cdecl; external libelementary;
function elm_gesture_layer_tap_finger_size_get(obj: PElm_Gesture_Layer): longint; cdecl; external libelementary;
procedure elm_gesture_layer_hold_events_set(obj: PElm_Gesture_Layer; hold_events: TEina_Bool); cdecl; external libelementary;
function elm_gesture_layer_hold_events_get(obj: PElm_Gesture_Layer): TEina_Bool; cdecl; external libelementary;
procedure elm_gesture_layer_rotate_step_set(obj: PElm_Gesture_Layer; step: double); cdecl; external libelementary;
function elm_gesture_layer_rotate_step_get(obj: PElm_Gesture_Layer): double; cdecl; external libelementary;
procedure elm_gesture_layer_cb_set(obj: PElm_Gesture_Layer; idx: TElm_Gesture_Type; cb_type: TElm_Gesture_State; cb: TElm_Gesture_Event_Cb; data: pointer); cdecl; external libelementary;
function elm_gesture_layer_attach(obj: PElm_Gesture_Layer; target: PEfl_Canvas_Object): TEina_Bool; cdecl; external libelementary;
procedure elm_gesture_layer_cb_del(obj: PElm_Gesture_Layer; idx: TElm_Gesture_Type; cb_type: TElm_Gesture_State; cb: TElm_Gesture_Event_Cb; data: pointer); cdecl; external libelementary;
procedure elm_gesture_layer_cb_add(obj: PElm_Gesture_Layer; idx: TElm_Gesture_Type; cb_type: TElm_Gesture_State; cb: TElm_Gesture_Event_Cb; data: pointer); cdecl; external libelementary;

// === Konventiert am: 28-5-25 19:25:16 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
