unit efl_canvas_gesture_tap_eo;

interface

uses
  ctypes, efl;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PEfl_Canvas_Gesture_Tap = ^TEfl_Canvas_Gesture_Tap;
  TEfl_Canvas_Gesture_Tap = TEo;
{$ifdef EFL_BETA_API_SUPPORT}
function EFL_CANVAS_GESTURE_TAP_CLASS: PEfl_Class;

function efl_canvas_gesture_tap_class_get: PEfl_Class; cdecl; external libevas;
{$endif}

// === Konventiert am: 14-5-25 16:57:36 ===


implementation


{$ifdef EFL_BETA_API_SUPPORT}
function EFL_CANVAS_GESTURE_TAP_CLASS: PEfl_Class;
begin
  EFL_CANVAS_GESTURE_TAP_CLASS := efl_canvas_gesture_tap_class_get;
end;
{$endif}


end.
