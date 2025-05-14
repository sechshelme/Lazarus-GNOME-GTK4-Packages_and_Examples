unit efl_canvas_gesture_flick_eo;

interface

uses
  ctypes, elf;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PEfl_Canvas_Gesture_Flick = ^TEfl_Canvas_Gesture_Flick;
  TEfl_Canvas_Gesture_Flick = TEo;
{$ifdef EFL_BETA_API_SUPPORT}
function EFL_CANVAS_GESTURE_FLICK_CLASS: PEfl_Class;

function efl_canvas_gesture_flick_class_get: PEfl_Class; cdecl; external libevas;
function efl_gesture_flick_momentum_get(obj: PEo): TEina_Vector2; cdecl; external libevas;
function efl_gesture_flick_angle_get(obj: PEo): double; cdecl; external libevas;
{$endif}

// === Konventiert am: 14-5-25 16:22:57 ===


implementation


{$ifdef EFL_BETA_API_SUPPORT}
function EFL_CANVAS_GESTURE_FLICK_CLASS: PEfl_Class;
begin
  EFL_CANVAS_GESTURE_FLICK_CLASS := efl_canvas_gesture_flick_class_get;
end;
{$endif}


end.
