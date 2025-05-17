
unit efl_canvas_gesture_rotate_eo;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_canvas_gesture_rotate_eo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_canvas_gesture_rotate_eo.h
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
PEfl_Canvas_Gesture_Rotate  = ^Efl_Canvas_Gesture_Rotate;
PEfl_Class  = ^Efl_Class;
PEo  = ^Eo;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _EFL_CANVAS_GESTURE_ROTATE_EO_H_}
{$define _EFL_CANVAS_GESTURE_ROTATE_EO_H_}
{$ifndef _EFL_CANVAS_GESTURE_ROTATE_EO_CLASS_TYPE}
{$define _EFL_CANVAS_GESTURE_ROTATE_EO_CLASS_TYPE}
type
  PEfl_Canvas_Gesture_Rotate = ^TEfl_Canvas_Gesture_Rotate;
  TEfl_Canvas_Gesture_Rotate = TEo;
{$endif}
{$ifndef _EFL_CANVAS_GESTURE_ROTATE_EO_TYPES}
{$define _EFL_CANVAS_GESTURE_ROTATE_EO_TYPES}
{$endif}
{$ifdef EFL_BETA_API_SUPPORT}
{*
 * @brief Rotate gesture class holding state information. See
 * @ref Efl_Canvas_Gesture to see what this state is and
 * @[Efl.Canvas.Gesture_Events.gesture,rotate] for a description of the Rotate
 * gesture.
 *
 * Application developers receive these objects inside a gesture event and do
 * not typically need to create their own.
 *
 * @ingroup Efl_Canvas_Gesture_Rotate
  }

{ was #define dname def_expr }
function EFL_CANVAS_GESTURE_ROTATE_CLASS : longint; { return type might be wrong }

(* Const before type ignored *)
function efl_canvas_gesture_rotate_class_get:PEfl_Class;cdecl;external;
{*
 * @brief The current radius (i.e. the distance between the two fingers) of the
 * gesture.
 *
 * @param[in] obj The object.
 *
 * @return The radius value in pixels.
 *
 * @ingroup Efl_Canvas_Gesture_Rotate
  }
(* Const before type ignored *)
function efl_gesture_rotate_radius_get(obj:PEo):dword;cdecl;external;
{*
 * @brief The current angle of rotation for this gesture.
 *
 * @param[in] obj The object.
 *
 * @return The angle of the rotation. <tt>0.0</tt> means no rotation has
 * occurred.
 *
 * @ingroup Efl_Canvas_Gesture_Rotate
  }
(* Const before type ignored *)
function efl_gesture_rotate_angle_get(obj:PEo):Tdouble;cdecl;external;
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$endif}

implementation

{ was #define dname def_expr }
function EFL_CANVAS_GESTURE_ROTATE_CLASS : longint; { return type might be wrong }
  begin
    EFL_CANVAS_GESTURE_ROTATE_CLASS:=efl_canvas_gesture_rotate_class_get;
  end;


end.
