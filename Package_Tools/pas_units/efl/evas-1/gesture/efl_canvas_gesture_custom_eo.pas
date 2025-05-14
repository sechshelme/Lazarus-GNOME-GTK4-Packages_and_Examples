unit efl_canvas_gesture_custom_eo;

interface

uses
  ctypes, efl;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PEfl_Canvas_Gesture_Custom = ^TEfl_Canvas_Gesture_Custom;
  TEfl_Canvas_Gesture_Custom = TEo;
{$ifdef EFL_BETA_API_SUPPORT}
function EFL_CANVAS_GESTURE_CUSTOM_CLASS: PEfl_Class;

function efl_canvas_gesture_custom_class_get: PEfl_Class; cdecl; external libevas;
procedure efl_gesture_custom_gesture_name_set(obj: PEo; gesture_name: pchar); cdecl; external libevas;
function efl_gesture_custom_gesture_name_get(obj: PEo): pchar; cdecl; external libevas;
{$endif}

// === Konventiert am: 14-5-25 16:22:47 ===


implementation


{$ifdef EFL_BETA_API_SUPPORT}
function EFL_CANVAS_GESTURE_CUSTOM_CLASS: PEfl_Class;
begin
  EFL_CANVAS_GESTURE_CUSTOM_CLASS := efl_canvas_gesture_custom_class_get;
end;
{$endif}


end.
