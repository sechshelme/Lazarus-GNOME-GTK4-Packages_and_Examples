unit efl_canvas_gesture_recognizer_eo;

interface

uses
  ctypes, efl, fp_eina,fp_eo, efl_canvas_gesture_eo, efl_canvas_gesture_touch_eo, efl_canvas_gesture_types_eot, efl_canvas_gesture_recognizer_custom_eo;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


type
  PEfl_Canvas_Gesture_Recognizer = ^TEfl_Canvas_Gesture_Recognizer;
  TEfl_Canvas_Gesture_Recognizer = TEo;
{$ifdef EFL_BETA_API_SUPPORT}
function EFL_CANVAS_GESTURE_RECOGNIZER_CLASS : PEfl_Class;

function efl_canvas_gesture_recognizer_class_get:PEfl_Class;cdecl;external libevas;
function efl_gesture_recognizer_type_get(obj:PEo):PEfl_Class;cdecl;external libevas;
function efl_gesture_recognizer_recognize(obj:PEo; gesture:PEfl_Canvas_Gesture; watched:PEfl_Object; event:PEfl_Canvas_Gesture_Touch):TEfl_Canvas_Gesture_Recognizer_Result;cdecl;external libevas;
procedure efl_gesture_recognizer_continues_set(obj:PEo; value:TEina_Bool);cdecl;external libevas;
function efl_gesture_recognizer_continues_get(obj:PEo):TEina_Bool;cdecl;external libevas;
{$endif}

// === Konventiert am: 14-5-25 16:23:10 ===


implementation


{$ifdef EFL_BETA_API_SUPPORT}
function EFL_CANVAS_GESTURE_RECOGNIZER_CLASS: PEfl_Class; { return type might be wrong }
  begin
    EFL_CANVAS_GESTURE_RECOGNIZER_CLASS:=efl_canvas_gesture_recognizer_class_get;
  end;
{$endif}


end.
