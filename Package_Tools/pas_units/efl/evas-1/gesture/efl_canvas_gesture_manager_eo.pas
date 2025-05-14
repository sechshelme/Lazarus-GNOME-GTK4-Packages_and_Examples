unit efl_canvas_gesture_manager_eo;

interface

uses
  ctypes, efl, Evas_Common, efl_canvas_gesture_recognizer_eo;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PEfl_Canvas_Gesture_Manager = ^TEfl_Canvas_Gesture_Manager;
  TEfl_Canvas_Gesture_Manager = TEo;
{$ifdef EFL_BETA_API_SUPPORT}
function EFL_CANVAS_GESTURE_MANAGER_CLASS: PEfl_Class;

function efl_canvas_gesture_manager_class_get: PEfl_Class; cdecl; external libevas;
procedure efl_gesture_manager_recognizer_register(obj: PEo; recognizer: PEfl_Canvas_Gesture_Recognizer); cdecl; external libevas;
procedure efl_gesture_manager_recognizer_unregister(obj: PEo; recognizer: PEfl_Canvas_Gesture_Recognizer); cdecl; external libevas;
procedure efl_gesture_manager_recognizer_cleanup(obj: PEo; recognizer: PEfl_Canvas_Gesture_Recognizer; target: PEfl_Canvas_Object); cdecl; external libevas;
{$endif}

// === Konventiert am: 14-5-25 16:23:00 ===


implementation


{$ifdef EFL_BETA_API_SUPPORT}
function EFL_CANVAS_GESTURE_MANAGER_CLASS: PEfl_Class;
begin
  EFL_CANVAS_GESTURE_MANAGER_CLASS := efl_canvas_gesture_manager_class_get;
end;
{$endif}


end.
