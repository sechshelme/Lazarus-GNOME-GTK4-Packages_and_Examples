unit efl_canvas_gesture_recognizer_tap_eo;

interface

uses
  ctypes, efl,fp_eo;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

type
  PEfl_Canvas_Gesture_Recognizer_Tap = ^TEfl_Canvas_Gesture_Recognizer_Tap;
  TEfl_Canvas_Gesture_Recognizer_Tap = TEo;
{$ifdef EFL_BETA_API_SUPPORT}
function EFL_CANVAS_GESTURE_RECOGNIZER_TAP_CLASS: PEfl_Class;

function efl_canvas_gesture_recognizer_tap_class_get: PEfl_Class; cdecl; external libevas;
{$endif}

// === Konventiert am: 14-5-25 16:57:25 ===


implementation


{$ifdef EFL_BETA_API_SUPPORT}
function EFL_CANVAS_GESTURE_RECOGNIZER_TAP_CLASS: PEfl_Class;
begin
  EFL_CANVAS_GESTURE_RECOGNIZER_TAP_CLASS := efl_canvas_gesture_recognizer_tap_class_get;
end;
{$endif}


end.
