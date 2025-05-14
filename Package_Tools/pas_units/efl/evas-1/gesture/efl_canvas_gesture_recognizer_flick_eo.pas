unit efl_canvas_gesture_recognizer_flick_eo;

interface

uses
  ctypes, elf;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PEfl_Canvas_Gesture_Recognizer_Flick = ^TEfl_Canvas_Gesture_Recognizer_Flick;
  TEfl_Canvas_Gesture_Recognizer_Flick = TEo;
{$ifdef EFL_BETA_API_SUPPORT}
function EFL_CANVAS_GESTURE_RECOGNIZER_FLICK_CLASS: PEfl_Class;

function efl_canvas_gesture_recognizer_flick_class_get: PEfl_Class; cdecl; external libevas;
{$endif}

// === Konventiert am: 14-5-25 16:57:11 ===


implementation


{$ifdef EFL_BETA_API_SUPPORT}
function EFL_CANVAS_GESTURE_RECOGNIZER_FLICK_CLASS: PEfl_Class;
begin
  EFL_CANVAS_GESTURE_RECOGNIZER_FLICK_CLASS := efl_canvas_gesture_recognizer_flick_class_get;
end;
{$endif}


end.
