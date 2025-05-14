
unit efl_canvas_gesture_recognizer_rotate_eo;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_canvas_gesture_recognizer_rotate_eo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_canvas_gesture_recognizer_rotate_eo.h
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
PEfl_Canvas_Gesture_Recognizer_Rotate  = ^Efl_Canvas_Gesture_Recognizer_Rotate;
PEfl_Class  = ^Efl_Class;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _EFL_CANVAS_GESTURE_RECOGNIZER_ROTATE_EO_H_}
{$define _EFL_CANVAS_GESTURE_RECOGNIZER_ROTATE_EO_H_}
{$ifndef _EFL_CANVAS_GESTURE_RECOGNIZER_ROTATE_EO_CLASS_TYPE}
{$define _EFL_CANVAS_GESTURE_RECOGNIZER_ROTATE_EO_CLASS_TYPE}
type
  PEfl_Canvas_Gesture_Recognizer_Rotate = ^TEfl_Canvas_Gesture_Recognizer_Rotate;
  TEfl_Canvas_Gesture_Recognizer_Rotate = TEo;
{$endif}
{$ifndef _EFL_CANVAS_GESTURE_RECOGNIZER_ROTATE_EO_TYPES}
{$define _EFL_CANVAS_GESTURE_RECOGNIZER_ROTATE_EO_TYPES}
{$endif}
{$ifdef EFL_BETA_API_SUPPORT}
{* This is the recognizer for Rotate gestures. See
 * @ref Efl_Canvas_Gesture_Rotate and @ref Efl_Canvas_Gesture_Recognizer. For
 * internal use only.
 *
 * @ingroup Efl_Canvas_Gesture_Recognizer_Rotate
  }

{ was #define dname def_expr }
function EFL_CANVAS_GESTURE_RECOGNIZER_ROTATE_CLASS : longint; { return type might be wrong }

(* Const before type ignored *)
function efl_canvas_gesture_recognizer_rotate_class_get:PEfl_Class;cdecl;external;
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$endif}

implementation

{ was #define dname def_expr }
function EFL_CANVAS_GESTURE_RECOGNIZER_ROTATE_CLASS : longint; { return type might be wrong }
  begin
    EFL_CANVAS_GESTURE_RECOGNIZER_ROTATE_CLASS:=efl_canvas_gesture_recognizer_rotate_class_get;
  end;


end.
