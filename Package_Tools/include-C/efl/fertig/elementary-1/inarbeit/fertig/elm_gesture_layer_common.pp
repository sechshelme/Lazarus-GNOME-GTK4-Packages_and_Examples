
unit elm_gesture_layer_common;
interface

{
  Automatically converted by H2Pas 1.0.0 from elm_gesture_layer_common.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    elm_gesture_layer_common.h
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
PElm_Gesture_Line_Info  = ^Elm_Gesture_Line_Info;
PElm_Gesture_Momentum_Info  = ^Elm_Gesture_Momentum_Info;
PElm_Gesture_Rotate_Info  = ^Elm_Gesture_Rotate_Info;
PElm_Gesture_Taps_Info  = ^Elm_Gesture_Taps_Info;
PElm_Gesture_Zoom_Info  = ^Elm_Gesture_Zoom_Info;
PEvas_Object  = ^Evas_Object;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{*
 * @addtogroup Elm_Gesture_Layer
 *
 * @
  }
{*
 * Holds taps info for user
  }
type
{*
 * Struct holds taps info for user
  }
{*< Holds center point between fingers  }
{*< Number of fingers tapped            }
{*< event timestamp        }
  PElm_Gesture_Taps_Info = ^TElm_Gesture_Taps_Info;
  TElm_Gesture_Taps_Info = record
      x : TEvas_Coord;
      y : TEvas_Coord;
      n : dword;
      timestamp : dword;
    end;

{*
 * holds momentum info for user
  }
{*
 * Struct holds momentum info for user
 * x1 and y1 are not necessarily in sync
 * x1 holds x value of x direction starting point
 * and same holds for y1.
 * This is noticeable when doing V-shape movement
  }
{ Report line ends, timestamps, and momentum computed         }
{*< Final-swipe direction starting point on X  }
{*< Final-swipe direction starting point on Y  }
{*< Final-swipe direction ending point on X    }
{*< Final-swipe direction ending point on Y    }
{*< Timestamp of start of final x-swipe  }
{*< Timestamp of start of final y-swipe  }
{*< Momentum on X  }
{*< Momentum on Y  }
{*< Number of fingers  }
  PElm_Gesture_Momentum_Info = ^TElm_Gesture_Momentum_Info;
  TElm_Gesture_Momentum_Info = record
      x1 : TEvas_Coord;
      y1 : TEvas_Coord;
      x2 : TEvas_Coord;
      y2 : TEvas_Coord;
      tx : dword;
      ty : dword;
      mx : TEvas_Coord;
      my : TEvas_Coord;
      n : dword;
    end;

{*
 * Holds line info for user
  }
{*
 * Struct holds line info for user
  }
{ Report line ends, timestamps, and momentum computed       }
{*< Line momentum info  }
{*< Angle (direction) of lines   }
  PElm_Gesture_Line_Info = ^TElm_Gesture_Line_Info;
  TElm_Gesture_Line_Info = record
      momentum : TElm_Gesture_Momentum_Info;
      angle : Tdouble;
    end;

{*
 * Holds zoom info for user
  }
{*
 * Struct holds zoom info for user
  }
{*< Holds zoom center point reported to user   }
{*< Holds radius between fingers reported to user  }
{*< Zoom value: 1.0 means no zoom              }
{*< Zoom momentum: zoom growth per second (NOT YET SUPPORTED)  }
  PElm_Gesture_Zoom_Info = ^TElm_Gesture_Zoom_Info;
  TElm_Gesture_Zoom_Info = record
      x : TEvas_Coord;
      y : TEvas_Coord;
      radius : TEvas_Coord;
      zoom : Tdouble;
      momentum : Tdouble;
    end;

{*
 * Holds rotation info for user
  }
{*
 * Struct holds rotation info for user
  }
{*< Holds zoom center point reported to user       }
{*< Holds radius between fingers reported to user  }
{*< Holds start-angle  }
{*< Rotation value: 0.0 means no rotation          }
{*< Rotation momentum: rotation done per second (NOT YET SUPPORTED)  }
  PElm_Gesture_Rotate_Info = ^TElm_Gesture_Rotate_Info;
  TElm_Gesture_Rotate_Info = record
      x : TEvas_Coord;
      y : TEvas_Coord;
      radius : TEvas_Coord;
      base_angle : Tdouble;
      angle : Tdouble;
      momentum : Tdouble;
    end;

{*
 * User callback used to stream gesture info from gesture layer
 * @param data user data
 * @param event_info gesture report info
 * Returns a flag field to be applied on the causing event.
 * You should probably return EVAS_EVENT_FLAG_ON_HOLD if your widget acted
 * upon the event, in an irreversible way.
  }

  TElm_Gesture_Event_Cb = function (data:pointer; event_info:pointer):TEvas_Event_Flags;cdecl;
{*
 * This function sets the gesture layer line min length of an object
 *
 * Sets the minimum line length at which the user's gesture will be recognized as a line.
 *
 * @param obj gesture-layer.
 * @param line_min_length the length.
 *
 * @since 1.8
  }

procedure elm_gesture_layer_line_min_length_set(obj:PEvas_Object; line_min_length:longint);cdecl;external;
{*
 * This function returns the gesture layer line min length of an object
 *
 * @param obj gesture-layer.
 * @return the length.
 *
 * @since 1.8
  }
(* Const before type ignored *)
function elm_gesture_layer_line_min_length_get(obj:PEvas_Object):longint;cdecl;external;
{*
 * This function sets the gesture layer zoom distance tolerance of an object
 *
 * If the distance between the two tab events becomes larger or smaller
 * than @c zoom_distance_tolerance, it is recognized as the start of the
 * zoom gesture.
 *
 * @param obj gesture-layer.
 * @param zoom_distance_tolerance zoom distance tolerance
 *
 * @since 1.8
  }
procedure elm_gesture_layer_zoom_distance_tolerance_set(obj:PEvas_Object; zoom_distance_tolerance:TEvas_Coord);cdecl;external;
{*
 * This function returns the gesture layer zoom distance tolerance of an object
 *
 * @param obj gesture-layer.
 * @return zoom distance tolerance
 *
 * @since 1.8
  }
(* Const before type ignored *)
function elm_gesture_layer_zoom_distance_tolerance_get(obj:PEvas_Object):TEvas_Coord;cdecl;external;
{*
 * This function sets the gesture layer line distance tolerance of an object
 *
 * Sets the minimum @c line_distance_tolerance length for the gesture to be recognized as a line.
 *
 * @param obj gesture-layer.
 * @param line_distance_tolerance line distance tolerance
 *
 * @since 1.8
  }
procedure elm_gesture_layer_line_distance_tolerance_set(obj:PEvas_Object; line_distance_tolerance:TEvas_Coord);cdecl;external;
{*
 * This function returns the gesture layer line distance tolerance of an object
 *
 * @param obj gesture-layer.
 * @return line distance tolerance
 *
 * @since 1.8
  }
(* Const before type ignored *)
function elm_gesture_layer_line_distance_tolerance_get(obj:PEvas_Object):TEvas_Coord;cdecl;external;
{*
 * This function sets the gesture layer line angular tolerance of an object
 *
 * Sets the minimum @c line_angular_tolerance angle for the gesture to be recognized as a line.
 *
 * @param obj gesture-layer.
 * @param line_angular_tolerance line angular tolerance
 *
 * @since 1.8
  }
procedure elm_gesture_layer_line_angular_tolerance_set(obj:PEvas_Object; line_angular_tolerance:Tdouble);cdecl;external;
{*
 * This function returns the gesture layer line angular tolerance of an object
 *
 * @param obj gesture-layer.
 * @return line angular tolerance
 *
 * @since 1.8
  }
(* Const before type ignored *)
function elm_gesture_layer_line_angular_tolerance_get(obj:PEvas_Object):Tdouble;cdecl;external;
{*
 * This function sets the gesture layer zoom wheel factor of an object
 *
 * Sets the zoom size when a mouse wheel event occurs.
 *
 * @param obj gesture-layer.
 * @param zoom_wheel_factor zoom wheel factor
 *
 * @since 1.8
  }
procedure elm_gesture_layer_zoom_wheel_factor_set(obj:PEvas_Object; zoom_wheel_factor:Tdouble);cdecl;external;
{*
 * This function returns the gesture layer zoom wheel factor of an object
 *
 * @param obj gesture-layer.
 * @return zoom wheel factor
 *
 * @since 1.8
  }
(* Const before type ignored *)
function elm_gesture_layer_zoom_wheel_factor_get(obj:PEvas_Object):Tdouble;cdecl;external;
{*
 * This function sets the gesture layer zoom finger factor of an object
 *
 * Sets the zoom size by multiplaying the zoom value by @c zoom_finger_factor
 * when zooming.
 *
 * @param obj gesture-layer.
 * @param zoom_finger_factor zoom finger factor
 *
 * @since 1.8
  }
procedure elm_gesture_layer_zoom_finger_factor_set(obj:PEvas_Object; zoom_finger_factor:Tdouble);cdecl;external;
{*
 * This function returns the gesture layer zoom finger factor of an object
 *
 * @param obj gesture-layer.
 * @return zoom finger factor
 *
 * @since 1.8
  }
(* Const before type ignored *)
function elm_gesture_layer_zoom_finger_factor_get(obj:PEvas_Object):Tdouble;cdecl;external;
{*
 * This function sets the gesture layer rotate angular tolerance of an object
 *
 * Sets the minimum @c rotate_angular_tolerance angle for the gesture to be recognized as a rotate.
 * Rotate should be rotated beyond the givin @c rotate_angular_tolerance to recognize
 * the start of the rotate gesture.
 *
 * @param obj gesture-layer.
 * @param rotate_angular_tolerance rotate angular tolerance
 *
 * @since 1.8
  }
procedure elm_gesture_layer_rotate_angular_tolerance_set(obj:PEvas_Object; rotate_angular_tolerance:Tdouble);cdecl;external;
{*
 * This function returns the gesture layer rotate angular tolerance of an object
 *
 * @param obj gesture-layer.
 * @return rotate angular tolerance
 *
 * @since 1.8
  }
(* Const before type ignored *)
function elm_gesture_layer_rotate_angular_tolerance_get(obj:PEvas_Object):Tdouble;cdecl;external;
{*
 * This function sets the gesture layer flick time limit (in ms) of an object
 *
 * Recognize as a flick when a gesture occurs over @c flick_time_limit_ms.
 *
 * @param obj gesture-layer.
 * @param flick_time_limit_ms flick time limit (in ms)
 *
 * @since 1.8
  }
procedure elm_gesture_layer_flick_time_limit_ms_set(obj:PEvas_Object; flick_time_limit_ms:dword);cdecl;external;
{*
 * This function returns the gesture layer flick time limit (in ms) of an object
 *
 * @param obj gesture-layer.
 * @return flick time limit (in ms)
 *
 * @since 1.8
  }
(* Const before type ignored *)
function elm_gesture_layer_flick_time_limit_ms_get(obj:PEvas_Object):dword;cdecl;external;
{*
 * This function sets the gesture layer long tap start timeout of an object
 *
 * Recognize as a long tap when a tab occurs over @c long_tap_start_timeout,
 * if set negative value, timeout will be 0.
 *
 * @param obj gesture-layer.
 * @param long_tap_start_timeout long tap start timeout
 *
 * @since 1.8
  }
procedure elm_gesture_layer_long_tap_start_timeout_set(obj:PEvas_Object; long_tap_start_timeout:Tdouble);cdecl;external;
{*
 * this function returns the gesture layer long tap start timeout of an object
 *
 * @param obj gesture-layer.
 * @return long tap start timeout
 *
 * @since 1.8
  }
(* Const before type ignored *)
function elm_gesture_layer_long_tap_start_timeout_get(obj:PEvas_Object):Tdouble;cdecl;external;
{*
 * This function sets the gesture layer continues enable of an object
 *
 * An option that allows user to start a gesture even when user is in touch move state.
 *
 * @param obj gesture-layer.
 * @param continues_enable continues enable
 *
 * @since 1.8
  }
procedure elm_gesture_layer_continues_enable_set(obj:PEvas_Object; continues_enable:TEina_Bool);cdecl;external;
{*
 * This function returns the gesture layer continues enable of an object
 *
 * @param obj gesture-layer.
 * @return continues enable
 *
 * @since 1.8
  }
(* Const before type ignored *)
function elm_gesture_layer_continues_enable_get(obj:PEvas_Object):TEina_Bool;cdecl;external;
{*
 * This function sets the gesture layer double tap timeout of an object
 *
 * When the time difference between two tabs is less than the @c double_tap_timeout value,
 * it is recognized as a double tab, if set negative value, timeout will be 0.
 *
 * @param obj gesture-layer.
 * @param double_tap_timeout double tap timeout
 *
 * @since 1.8
  }
procedure elm_gesture_layer_double_tap_timeout_set(obj:PEvas_Object; double_tap_timeout:Tdouble);cdecl;external;
{*
 * this function returns the gesture layer double tap timeout of an object
 *
 * @param obj gesture-layer.
 * @return double tap timeout
 *
 * @since 1.8
  }
(* Const before type ignored *)
function elm_gesture_layer_double_tap_timeout_get(obj:PEvas_Object):Tdouble;cdecl;external;
{*
 * This function sets the gesture layer finger-size for taps
 * If not set, this size taken from elm_config.
 * Set to ZERO if you want GLayer to use system finger size value (default)
 *
 * @param obj gesture-layer.
 * @param sz Finger size
 *
 * @since 1.8
  }
procedure elm_gesture_layer_tap_finger_size_set(obj:PEvas_Object; sz:TEvas_Coord);cdecl;external;
{*
 * This function returns the gesture layer finger-size for taps
 *
 * @param obj gesture-layer.
 * @return Finger size that is currently used by Gesture Layer for taps.
 *
 * @since 1.8
  }
(* Const before type ignored *)
function elm_gesture_layer_tap_finger_size_get(obj:PEvas_Object):TEvas_Coord;cdecl;external;
{*
 * @
  }

implementation


end.
