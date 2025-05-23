{$IFDEF read_interface}


type
  PEfl_Canvas_Gesture_Rotate = ^TEfl_Canvas_Gesture_Rotate;
  TEfl_Canvas_Gesture_Rotate = TEo;
{$ifdef EFL_BETA_API_SUPPORT}
function EFL_CANVAS_GESTURE_ROTATE_CLASS: PEfl_Class;

function efl_canvas_gesture_rotate_class_get: PEfl_Class; cdecl; external libevas;
function efl_gesture_rotate_radius_get(obj: PEo): dword; cdecl; external libevas;
function efl_gesture_rotate_angle_get(obj: PEo): double; cdecl; external libevas;
{$endif}

// === Konventiert am: 14-5-25 16:23:14 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


{$ifdef EFL_BETA_API_SUPPORT}
function EFL_CANVAS_GESTURE_ROTATE_CLASS: PEfl_Class;
begin
  EFL_CANVAS_GESTURE_ROTATE_CLASS := efl_canvas_gesture_rotate_class_get;
end;
{$endif}


{$ENDIF read_implementation}
