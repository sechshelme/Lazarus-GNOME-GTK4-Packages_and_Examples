{$IFDEF read_interface}


type
  PEfl_Canvas_Gesture_Recognizer_Double_Tap = ^TEfl_Canvas_Gesture_Recognizer_Double_Tap;
  TEfl_Canvas_Gesture_Recognizer_Double_Tap = TEo;
{$ifdef EFL_BETA_API_SUPPORT}
function EFL_CANVAS_GESTURE_RECOGNIZER_DOUBLE_TAP_CLASS: PEfl_Class;

function efl_canvas_gesture_recognizer_double_tap_class_get: PEfl_Class; cdecl; external libevas;
{$endif}

// === Konventiert am: 14-5-25 16:57:08 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


{$ifdef EFL_BETA_API_SUPPORT}
function EFL_CANVAS_GESTURE_RECOGNIZER_DOUBLE_TAP_CLASS: PEfl_Class;
begin
  EFL_CANVAS_GESTURE_RECOGNIZER_DOUBLE_TAP_CLASS := efl_canvas_gesture_recognizer_double_tap_class_get;
end;
{$endif}


{$ENDIF read_implementation}
