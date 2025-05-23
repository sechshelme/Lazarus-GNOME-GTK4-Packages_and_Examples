{$IFDEF read_interface}

type
  PEfl_Canvas_Gesture_Touch = ^TEfl_Canvas_Gesture_Touch;
  TEfl_Canvas_Gesture_Touch = TEo;
{$ifdef EFL_BETA_API_SUPPORT}
function EFL_CANVAS_GESTURE_TOUCH_CLASS : PEfl_Class;

function efl_canvas_gesture_touch_class_get:PEfl_Class;cdecl;external libevas;
procedure efl_gesture_touch_point_record(obj:PEo; event:PEfl_Input_Pointer);cdecl;external libevas;
function efl_gesture_touch_delta(obj:PEo; tool:longint):TEina_Vector2;cdecl;external libevas;
function efl_gesture_touch_distance(obj:PEo; tool:longint):TEina_Vector2;cdecl;external libevas;
function efl_gesture_touch_start_point_get(obj:PEo):TEina_Position2D;cdecl;external libevas;
function efl_gesture_touch_current_point_get(obj:PEo):TEina_Position2D;cdecl;external libevas;
function efl_gesture_touch_current_timestamp_get(obj:PEo):dword;cdecl;external libevas;
function efl_gesture_touch_points_count_get(obj:PEo):dword;cdecl;external libevas;
function efl_gesture_touch_state_get(obj:PEo):TEfl_Canvas_Gesture_Touch_State;cdecl;external libevas;
function efl_gesture_touch_current_data_get(obj:PEo):PEfl_Gesture_Touch_Point_Data;cdecl;external libevas;
function efl_gesture_touch_previous_data_get(obj:PEo):PEfl_Gesture_Touch_Point_Data;cdecl;external libevas;
function efl_gesture_touch_data_get(obj:PEo; id:dword):PEfl_Gesture_Touch_Point_Data;cdecl;external libevas;
{$endif}

// === Konventiert am: 14-5-25 16:23:17 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


{$ifdef EFL_BETA_API_SUPPORT}
function EFL_CANVAS_GESTURE_TOUCH_CLASS: PEfl_Class;
  begin
    EFL_CANVAS_GESTURE_TOUCH_CLASS:=efl_canvas_gesture_touch_class_get;
  end;
{$endif}


{$ENDIF read_implementation}
