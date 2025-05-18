unit efl_canvas_gesture_eo;

interface

uses
  ctypes, efl, fp_eina,fp_eo, efl_canvas_gesture_types_eot;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

type
  PEfl_Canvas_Gesture = ^TEfl_Canvas_Gesture;
  TEfl_Canvas_Gesture = TEo;
{$ifdef EFL_BETA_API_SUPPORT}
function EFL_CANVAS_GESTURE_CLASS: PEfl_Class;

function efl_canvas_gesture_class_get: PEfl_Class; cdecl; external libevas;
procedure efl_gesture_state_set(obj: PEo; state: TEfl_Canvas_Gesture_State); cdecl; external libevas;
function efl_gesture_state_get(obj: PEo): TEfl_Canvas_Gesture_State; cdecl; external libevas;
procedure efl_gesture_hotspot_set(obj: PEo; hotspot: TEina_Position2D); cdecl; external libevas;
function efl_gesture_hotspot_get(obj: PEo): TEina_Position2D; cdecl; external libevas;
procedure efl_gesture_timestamp_set(obj: PEo; timestamp: dword); cdecl; external libevas;
function efl_gesture_timestamp_get(obj: PEo): dword; cdecl; external libevas;
procedure efl_gesture_touch_count_set(obj: PEo; touch_count: dword); cdecl; external libevas;
function efl_gesture_touch_count_get(obj: PEo): dword; cdecl; external libevas;
{$endif}

// === Konventiert am: 14-5-25 16:22:50 ===


implementation


{$ifdef EFL_BETA_API_SUPPORT}
function EFL_CANVAS_GESTURE_CLASS: PEfl_Class;
begin
  EFL_CANVAS_GESTURE_CLASS := efl_canvas_gesture_class_get;
end;
{$endif}


end.
