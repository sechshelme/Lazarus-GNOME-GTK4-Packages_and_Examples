
unit efl_canvas_gesture_eo;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_canvas_gesture_eo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_canvas_gesture_eo.h
}

{ Pointers to basic pascal types, inserted by h2pas conversion program.}
Type
  PLongint  = ^Longint;
  PSmallInt = ^SmallInt;
  PByte     = ^Byte;
  PWord     = ^Word;
  PDWord    = ^DWord;
  PDouble   = ^Double;

Type
PEfl_Canvas_Gesture  = ^Efl_Canvas_Gesture;
PEfl_Class  = ^Efl_Class;
PEo  = ^Eo;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _EFL_CANVAS_GESTURE_EO_H_}
{$define _EFL_CANVAS_GESTURE_EO_H_}
{$ifndef _EFL_CANVAS_GESTURE_EO_CLASS_TYPE}
{$define _EFL_CANVAS_GESTURE_EO_CLASS_TYPE}
type
  PEfl_Canvas_Gesture = ^TEfl_Canvas_Gesture;
  TEfl_Canvas_Gesture = TEo;
{$endif}
{$ifndef _EFL_CANVAS_GESTURE_EO_TYPES}
{$define _EFL_CANVAS_GESTURE_EO_TYPES}
{$endif}
{$ifdef EFL_BETA_API_SUPPORT}
{*
 * @brief Base abstract class to support gesture-specific classes.
 *
 * A gesture object holds the current state of that gesture (i.e. whether the
 * gesture has just been started, it is in progress or it has finished) along
 * with any gesture-specific information it needs (like the number of taps so
 * far, to detect triple-taps, for example).
 *
 * Typically this class is not used directly, instead, some sub-class of it
 * (like @ref Efl_Canvas_Gesture_Tap or @ref Efl_Canvas_Gesture_Zoom) is
 * retrieved from gesture events (like @[Efl.Canvas.Gesture_Events.gesture,tap]
 * or @[Efl.Canvas.Gesture_Events.gesture,zoom]).
 *
 * @ingroup Efl_Canvas_Gesture
  }

{ was #define dname def_expr }
function EFL_CANVAS_GESTURE_CLASS : longint; { return type might be wrong }

(* Const before type ignored *)
function efl_canvas_gesture_class_get:PEfl_Class;cdecl;external;
{*
 * @brief Current state of the gesture, from initial detection to successful
 * recognition.
 *
 * @param[in] obj The object.
 * @param[in] state State.
 *
 * @ingroup Efl_Canvas_Gesture
  }
procedure efl_gesture_state_set(obj:PEo; state:TEfl_Canvas_Gesture_State);cdecl;external;
{*
 * @brief Current state of the gesture, from initial detection to successful
 * recognition.
 *
 * @param[in] obj The object.
 *
 * @return State.
 *
 * @ingroup Efl_Canvas_Gesture
  }
(* Const before type ignored *)
function efl_gesture_state_get(obj:PEo):TEfl_Canvas_Gesture_State;cdecl;external;
{*
 * @brief Hotspot of the gesture currently being analyzed. The exact meaning
 * depends on the gesture type, but by default it reflects the current position
 * of the last touch event.
 *
 * @param[in] obj The object.
 * @param[in] hotspot Hotspot coordinates.
 *
 * @ingroup Efl_Canvas_Gesture
  }
procedure efl_gesture_hotspot_set(obj:PEo; hotspot:TEina_Position2D);cdecl;external;
{*
 * @brief Hotspot of the gesture currently being analyzed. The exact meaning
 * depends on the gesture type, but by default it reflects the current position
 * of the last touch event.
 *
 * @param[in] obj The object.
 *
 * @return Hotspot coordinates.
 *
 * @ingroup Efl_Canvas_Gesture
  }
(* Const before type ignored *)
function efl_gesture_hotspot_get(obj:PEo):TEina_Position2D;cdecl;external;
{*
 * @brief Moment when the gesture currently being analyzed started.
 *
 * @param[in] obj The object.
 * @param[in] timestamp The time-stamp, valued in milliseconds.
 *
 * @ingroup Efl_Canvas_Gesture
  }
procedure efl_gesture_timestamp_set(obj:PEo; timestamp:dword);cdecl;external;
{*
 * @brief Moment when the gesture currently being analyzed started.
 *
 * @param[in] obj The object.
 *
 * @return The time-stamp, valued in milliseconds.
 *
 * @ingroup Efl_Canvas_Gesture
  }
(* Const before type ignored *)
function efl_gesture_timestamp_get(obj:PEo):dword;cdecl;external;
{$ifdef EFL_CANVAS_GESTURE_PROTECTED}
{*
 * @brief The current number of touch points recorded in the gesture.
 *
 * @param[in] obj The object.
 * @param[in] touch_count The count of the touch points.
 *
 * @ingroup Efl_Canvas_Gesture
  }
procedure efl_gesture_touch_count_set(obj:PEo; touch_count:dword);cdecl;external;
{$endif}
{*
 * @brief The current number of touch points recorded in the gesture.
 *
 * @param[in] obj The object.
 *
 * @return The count of the touch points.
 *
 * @ingroup Efl_Canvas_Gesture
  }
(* Const before type ignored *)

function efl_gesture_touch_count_get(obj:PEo):dword;cdecl;external;
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$endif}

implementation

{ was #define dname def_expr }
function EFL_CANVAS_GESTURE_CLASS : longint; { return type might be wrong }
  begin
    EFL_CANVAS_GESTURE_CLASS:=efl_canvas_gesture_class_get;
  end;


end.
