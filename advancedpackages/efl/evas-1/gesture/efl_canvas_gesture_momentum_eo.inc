{$IFDEF read_interface}


type
  PEfl_Canvas_Gesture_Momentum = ^TEfl_Canvas_Gesture_Momentum;
  TEfl_Canvas_Gesture_Momentum = TEo;
{$ifdef EFL_BETA_API_SUPPORT}
function EFL_CANVAS_GESTURE_MOMENTUM_CLASS: PEfl_Class;

function efl_canvas_gesture_momentum_class_get: PEfl_Class; cdecl; external libevas;
function efl_gesture_momentum_get(obj: PEo): TEina_Vector2; cdecl; external libevas;
{$endif}

// === Konventiert am: 14-5-25 16:23:04 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


{$ifdef EFL_BETA_API_SUPPORT}
function EFL_CANVAS_GESTURE_MOMENTUM_CLASS: PEfl_Class;
begin
  EFL_CANVAS_GESTURE_MOMENTUM_CLASS := efl_canvas_gesture_momentum_class_get;
end;
{$endif}


{$ENDIF read_implementation}
