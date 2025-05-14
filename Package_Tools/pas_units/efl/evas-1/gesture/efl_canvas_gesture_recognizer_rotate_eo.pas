unit efl_canvas_gesture_recognizer_rotate_eo;

interface

uses
  ctypes, efl;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PEfl_Canvas_Gesture_Recognizer_Rotate = ^TEfl_Canvas_Gesture_Recognizer_Rotate;
  TEfl_Canvas_Gesture_Recognizer_Rotate = TEo;
{$ifdef EFL_BETA_API_SUPPORT}
function EFL_CANVAS_GESTURE_RECOGNIZER_ROTATE_CLASS: PEfl_Class;

function efl_canvas_gesture_recognizer_rotate_class_get: PEfl_Class; cdecl; external libevas;
{$endif}

// === Konventiert am: 14-5-25 16:57:22 ===


implementation


{$ifdef EFL_BETA_API_SUPPORT}
function EFL_CANVAS_GESTURE_RECOGNIZER_ROTATE_CLASS: PEfl_Class;
begin
  EFL_CANVAS_GESTURE_RECOGNIZER_ROTATE_CLASS := efl_canvas_gesture_recognizer_rotate_class_get;
end;
{$endif}


end.
