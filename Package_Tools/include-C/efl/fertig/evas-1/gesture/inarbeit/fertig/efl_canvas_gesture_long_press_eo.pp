
unit efl_canvas_gesture_long_press_eo;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_canvas_gesture_long_press_eo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_canvas_gesture_long_press_eo.h
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
PEfl_Canvas_Gesture_Long_Press  = ^Efl_Canvas_Gesture_Long_Press;
PEfl_Class  = ^Efl_Class;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _EFL_CANVAS_GESTURE_LONG_PRESS_EO_H_}
{$define _EFL_CANVAS_GESTURE_LONG_PRESS_EO_H_}
{$ifndef _EFL_CANVAS_GESTURE_LONG_PRESS_EO_CLASS_TYPE}
{$define _EFL_CANVAS_GESTURE_LONG_PRESS_EO_CLASS_TYPE}
type
  PEfl_Canvas_Gesture_Long_Press = ^TEfl_Canvas_Gesture_Long_Press;
  TEfl_Canvas_Gesture_Long_Press = TEo;
{$endif}
{$ifndef _EFL_CANVAS_GESTURE_LONG_PRESS_EO_TYPES}
{$define _EFL_CANVAS_GESTURE_LONG_PRESS_EO_TYPES}
{$endif}
{$ifdef EFL_BETA_API_SUPPORT}
{*
 * @brief Long-tap gesture class holding state information. See
 * @ref Efl_Canvas_Gesture to see what this state is and
 * @[Efl.Canvas.Gesture_Events.gesture,long_press] for a description of the
 * Long-tap gesture.
 *
 * Application developers receive these objects inside a gesture event and do
 * not typically need to create their own.
 *
 * @ingroup Efl_Canvas_Gesture_Long_Press
  }

{ was #define dname def_expr }
function EFL_CANVAS_GESTURE_LONG_PRESS_CLASS : longint; { return type might be wrong }

(* Const before type ignored *)
function efl_canvas_gesture_long_press_class_get:PEfl_Class;cdecl;external;
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$endif}

implementation

{ was #define dname def_expr }
function EFL_CANVAS_GESTURE_LONG_PRESS_CLASS : longint; { return type might be wrong }
  begin
    EFL_CANVAS_GESTURE_LONG_PRESS_CLASS:=efl_canvas_gesture_long_press_class_get;
  end;


end.
