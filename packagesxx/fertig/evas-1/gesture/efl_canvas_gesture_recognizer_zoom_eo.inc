{$IFDEF read_interface}


type
  PEfl_Canvas_Gesture_Recognizer_Zoom = ^TEfl_Canvas_Gesture_Recognizer_Zoom;
  TEfl_Canvas_Gesture_Recognizer_Zoom = TEo;
{$ifdef EFL_BETA_API_SUPPORT}
function EFL_CANVAS_GESTURE_RECOGNIZER_ZOOM_CLASS: PEfl_Class;

function efl_canvas_gesture_recognizer_zoom_class_get: PEfl_Class; cdecl; external libevas;
{$endif}

// === Konventiert am: 14-5-25 16:57:33 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


{$ifdef EFL_BETA_API_SUPPORT}
function EFL_CANVAS_GESTURE_RECOGNIZER_ZOOM_CLASS: PEfl_Class;
begin
  EFL_CANVAS_GESTURE_RECOGNIZER_ZOOM_CLASS := efl_canvas_gesture_recognizer_zoom_class_get;
end;
{$endif}


{$ENDIF read_implementation}
