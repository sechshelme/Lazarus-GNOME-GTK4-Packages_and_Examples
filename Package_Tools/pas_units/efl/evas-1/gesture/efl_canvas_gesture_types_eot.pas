unit efl_canvas_gesture_types_eot;

interface

uses
  ctypes, efl, fp_eina, efl_input_types_eot;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


  {$ifdef EFL_BETA_API_SUPPORT}
type
  PEfl_Canvas_Gesture_Touch_State = ^TEfl_Canvas_Gesture_Touch_State;
  TEfl_Canvas_Gesture_Touch_State = longint;

const
  EFL_GESTURE_TOUCH_STATE_UNKNOWN = 0;
  EFL_GESTURE_TOUCH_STATE_BEGIN = 1;
  EFL_GESTURE_TOUCH_STATE_UPDATE = 2;
  EFL_GESTURE_TOUCH_STATE_END = 3;
  {$endif}
  {$ifdef EFL_BETA_API_SUPPORT}
type
  PEfl_Canvas_Gesture_State = ^TEfl_Canvas_Gesture_State;
  TEfl_Canvas_Gesture_State = longint;

const
  EFL_GESTURE_STATE_NONE = 0;
  EFL_GESTURE_STATE_STARTED = 1;
  EFL_GESTURE_STATE_UPDATED = 2;
  EFL_GESTURE_STATE_FINISHED = 3;
  EFL_GESTURE_STATE_CANCELED = 4;

  {$endif}
  {$ifdef EFL_BETA_API_SUPPORT}

type
  PEfl_Canvas_Gesture_Recognizer_Result = ^TEfl_Canvas_Gesture_Recognizer_Result;
  TEfl_Canvas_Gesture_Recognizer_Result = longint;

const
  EFL_GESTURE_RECOGNIZER_RESULT_IGNORE = 1;
  EFL_GESTURE_RECOGNIZER_RESULT_MAYBE = 2;
  EFL_GESTURE_RECOGNIZER_RESULT_TRIGGER = 4;
  EFL_GESTURE_RECOGNIZER_RESULT_FINISH = 8;
  EFL_GESTURE_RECOGNIZER_RESULT_CANCEL = 16;
  EFL_GESTURE_RECOGNIZER_RESULT_RESULT_MASK = 255;
  {$endif}
  {$ifdef EFL_BETA_API_SUPPORT}
type
  PEfl_Gesture_Touch_Point_Info = ^TEfl_Gesture_Touch_Point_Info;

  TEfl_Gesture_Touch_Point_Info = record
    pos: TEina_Position2D;
    pressed: TEina_Bool;
    timestamp: dword;
  end;
  {$endif}
  {$ifdef EFL_BETA_API_SUPPORT}
type
  PEfl_Gesture_Touch_Point_Data = ^TEfl_Gesture_Touch_Point_Data;

  TEfl_Gesture_Touch_Point_Data = record
    id: longint;
    action: TEfl_Pointer_Action;
    start: TEfl_Gesture_Touch_Point_Info;
    prev: TEfl_Gesture_Touch_Point_Info;
    cur: TEfl_Gesture_Touch_Point_Info;
  end;
  {$endif}

  // === Konventiert am: 14-5-25 16:23:21 ===


implementation



end.
