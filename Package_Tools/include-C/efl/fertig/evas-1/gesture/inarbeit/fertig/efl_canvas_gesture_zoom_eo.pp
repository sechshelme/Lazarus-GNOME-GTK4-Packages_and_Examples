
unit efl_canvas_gesture_zoom_eo;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_canvas_gesture_zoom_eo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_canvas_gesture_zoom_eo.h
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
PEfl_Canvas_Gesture_Zoom  = ^Efl_Canvas_Gesture_Zoom;
PEfl_Class  = ^Efl_Class;
PEo  = ^Eo;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _EFL_CANVAS_GESTURE_ZOOM_EO_H_}
{$define _EFL_CANVAS_GESTURE_ZOOM_EO_H_}
{$ifndef _EFL_CANVAS_GESTURE_ZOOM_EO_CLASS_TYPE}
{$define _EFL_CANVAS_GESTURE_ZOOM_EO_CLASS_TYPE}
type
  PEfl_Canvas_Gesture_Zoom = ^TEfl_Canvas_Gesture_Zoom;
  TEfl_Canvas_Gesture_Zoom = TEo;
{$endif}
{$ifndef _EFL_CANVAS_GESTURE_ZOOM_EO_TYPES}
{$define _EFL_CANVAS_GESTURE_ZOOM_EO_TYPES}
{$endif}
{$ifdef EFL_BETA_API_SUPPORT}
{*
 * @brief Zoom gesture class holding state information. See
 * @ref Efl_Canvas_Gesture to see what this state is and
 * @[Efl.Canvas.Gesture_Events.gesture,zoom] for a description of the Zoom
 * gesture.
 *
 * Application developers receive these objects inside a gesture event and do
 * not typically need to create their own.
 *
 * @ingroup Efl_Canvas_Gesture_Zoom
  }

{ was #define dname def_expr }
function EFL_CANVAS_GESTURE_ZOOM_CLASS : longint; { return type might be wrong }

(* Const before type ignored *)
function efl_canvas_gesture_zoom_class_get:PEfl_Class;cdecl;external;
{*
 * @brief The current radius (i.e. the distance between the two fingers) of the
 * gesture.
 *
 * @param[in] obj The object.
 *
 * @return The radius value in pixels.
 *
 * @ingroup Efl_Canvas_Gesture_Zoom
  }
(* Const before type ignored *)
function efl_gesture_zoom_radius_get(obj:PEo):Tdouble;cdecl;external;
{*
 * @brief The current zoom value of the gesture. When the gesture begins, the
 * finger distance is recorded. When the distance becomes greater than the
 * initial one, a zoom value greater than <tt>1.0</tt> is reported. When
 * it becomes smaller, a zoom value lesser than <tt>1.0</tt> is reported.
 *
 * @param[in] obj The object.
 *
 * @return The zoom value. <tt>1.0</tt> means no zoom.
 *
 * @ingroup Efl_Canvas_Gesture_Zoom
  }
(* Const before type ignored *)
function efl_gesture_zoom_get(obj:PEo):Tdouble;cdecl;external;
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$endif}

implementation

{ was #define dname def_expr }
function EFL_CANVAS_GESTURE_ZOOM_CLASS : longint; { return type might be wrong }
  begin
    EFL_CANVAS_GESTURE_ZOOM_CLASS:=efl_canvas_gesture_zoom_class_get;
  end;


end.
