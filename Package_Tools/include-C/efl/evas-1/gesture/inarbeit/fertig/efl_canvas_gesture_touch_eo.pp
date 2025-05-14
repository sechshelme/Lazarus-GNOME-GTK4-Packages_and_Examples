
unit efl_canvas_gesture_touch_eo;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_canvas_gesture_touch_eo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_canvas_gesture_touch_eo.h
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
PEfl_Canvas_Gesture_Touch  = ^Efl_Canvas_Gesture_Touch;
PEfl_Class  = ^Efl_Class;
PEfl_Gesture_Touch_Point_Data  = ^Efl_Gesture_Touch_Point_Data;
PEfl_Input_Pointer  = ^Efl_Input_Pointer;
PEo  = ^Eo;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _EFL_CANVAS_GESTURE_TOUCH_EO_H_}
{$define _EFL_CANVAS_GESTURE_TOUCH_EO_H_}
{$ifndef _EFL_CANVAS_GESTURE_TOUCH_EO_CLASS_TYPE}
{$define _EFL_CANVAS_GESTURE_TOUCH_EO_CLASS_TYPE}
type
  PEfl_Canvas_Gesture_Touch = ^TEfl_Canvas_Gesture_Touch;
  TEfl_Canvas_Gesture_Touch = TEo;
{$endif}
{$ifndef _EFL_CANVAS_GESTURE_TOUCH_EO_TYPES}
{$define _EFL_CANVAS_GESTURE_TOUCH_EO_TYPES}
{$endif}
{$ifdef EFL_BETA_API_SUPPORT}
{*
 * @brief EFL Gesture Touch class
 *
 * This gesture class defines a method that records touch points and supports
 * properties - first touch point, current touch point, timestamp, multi-touch
 *  and state information.
 *
 * @ingroup Efl_Canvas_Gesture_Touch
  }

{ was #define dname def_expr }
function EFL_CANVAS_GESTURE_TOUCH_CLASS : longint; { return type might be wrong }

(* Const before type ignored *)
function efl_canvas_gesture_touch_class_get:PEfl_Class;cdecl;external;
{*
 * @brief Touch point record method
 *
 * @param[in] obj The object.
 * @param[in] event The pointer information
 *
 * @ingroup Efl_Canvas_Gesture_Touch
  }
procedure efl_gesture_touch_point_record(obj:PEo; event:PEfl_Input_Pointer);cdecl;external;
{*
 * @brief Compute the distance between the last two events
 *
 * @param[in] obj The object.
 * @param[in] tool The finger id
 *
 * @return The distance vector.
 *
 * @ingroup Efl_Canvas_Gesture_Touch
  }
(* Const before type ignored *)
function efl_gesture_touch_delta(obj:PEo; tool:longint):TEina_Vector2;cdecl;external;
{*
 * @brief Compute the distance between the first touch and the last event.
 *
 * @param[in] obj The object.
 * @param[in] tool The finger id
 *
 * @return The distance vector.
 *
 * @ingroup Efl_Canvas_Gesture_Touch
  }
(* Const before type ignored *)
function efl_gesture_touch_distance(obj:PEo; tool:longint):TEina_Vector2;cdecl;external;
{*
 * @brief Returns the first touch point.
 *
 * @param[in] obj The object.
 *
 * @return The start position.
 *
 * @ingroup Efl_Canvas_Gesture_Touch
  }
(* Const before type ignored *)
function efl_gesture_touch_start_point_get(obj:PEo):TEina_Position2D;cdecl;external;
{*
 * @brief Returns the current touch point.
 *
 * @param[in] obj The object.
 *
 * @return The current position.
 *
 * @ingroup Efl_Canvas_Gesture_Touch
  }
(* Const before type ignored *)
function efl_gesture_touch_current_point_get(obj:PEo):TEina_Position2D;cdecl;external;
{*
 * @brief Returns the timestamp.
 *
 * @param[in] obj The object.
 *
 * @return The timestamp.
 *
 * @ingroup Efl_Canvas_Gesture_Touch
  }
(* Const before type ignored *)
function efl_gesture_touch_current_timestamp_get(obj:PEo):dword;cdecl;external;
{*
 * @brief This provides the number of touch points active.
 *
 * @param[in] obj The object.
 *
 * @return The number of active touch points.
 *
 * @ingroup Efl_Canvas_Gesture_Touch
  }
(* Const before type ignored *)
function efl_gesture_touch_points_count_get(obj:PEo):dword;cdecl;external;
{*
 * @brief This property holds the state of the touch event.
 *
 * @param[in] obj The object.
 *
 * @return touch event state
 *
 * @ingroup Efl_Canvas_Gesture_Touch
  }
(* Const before type ignored *)
function efl_gesture_touch_state_get(obj:PEo):TEfl_Canvas_Gesture_Touch_State;cdecl;external;
{*
 * @brief This property holds the data struct of the most recent touch point.
 *
 * @param[in] obj The object.
 *
 * @return The current data.
 *
 * @ingroup Efl_Canvas_Gesture_Touch
  }
(* Const before type ignored *)
(* Const before type ignored *)
function efl_gesture_touch_current_data_get(obj:PEo):PEfl_Gesture_Touch_Point_Data;cdecl;external;
{*
 * @brief This property holds the data struct of the second-most recent touch
 * point. If there is only one touch point active, it will return NULL.
 *
 * @param[in] obj The object.
 *
 * @return The previous touch point's data.
 *
 * @ingroup Efl_Canvas_Gesture_Touch
  }
(* Const before type ignored *)
(* Const before type ignored *)
function efl_gesture_touch_previous_data_get(obj:PEo):PEfl_Gesture_Touch_Point_Data;cdecl;external;
{*
 * @brief This fetches the data for a specified touch point.
 *
 * @param[in] obj The object.
 * @param[in] id The id of the touch point to return.
 *
 * @return The specified data if it exists.
 *
 * @ingroup Efl_Canvas_Gesture_Touch
  }
(* Const before type ignored *)
(* Const before type ignored *)
function efl_gesture_touch_data_get(obj:PEo; id:dword):PEfl_Gesture_Touch_Point_Data;cdecl;external;
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$endif}

implementation

{ was #define dname def_expr }
function EFL_CANVAS_GESTURE_TOUCH_CLASS : longint; { return type might be wrong }
  begin
    EFL_CANVAS_GESTURE_TOUCH_CLASS:=efl_canvas_gesture_touch_class_get;
  end;


end.
