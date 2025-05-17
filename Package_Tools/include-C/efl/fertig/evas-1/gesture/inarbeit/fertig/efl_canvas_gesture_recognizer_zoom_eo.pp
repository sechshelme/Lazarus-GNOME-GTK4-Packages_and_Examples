
unit efl_canvas_gesture_recognizer_zoom_eo;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_canvas_gesture_recognizer_zoom_eo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_canvas_gesture_recognizer_zoom_eo.h
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
PEfl_Canvas_Gesture_Recognizer_Zoom  = ^Efl_Canvas_Gesture_Recognizer_Zoom;
PEfl_Class  = ^Efl_Class;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _EFL_CANVAS_GESTURE_RECOGNIZER_ZOOM_EO_H_}
{$define _EFL_CANVAS_GESTURE_RECOGNIZER_ZOOM_EO_H_}
{$ifndef _EFL_CANVAS_GESTURE_RECOGNIZER_ZOOM_EO_CLASS_TYPE}
{$define _EFL_CANVAS_GESTURE_RECOGNIZER_ZOOM_EO_CLASS_TYPE}
type
  PEfl_Canvas_Gesture_Recognizer_Zoom = ^TEfl_Canvas_Gesture_Recognizer_Zoom;
  TEfl_Canvas_Gesture_Recognizer_Zoom = TEo;
{$endif}
{$ifndef _EFL_CANVAS_GESTURE_RECOGNIZER_ZOOM_EO_TYPES}
{$define _EFL_CANVAS_GESTURE_RECOGNIZER_ZOOM_EO_TYPES}
{$endif}
{$ifdef EFL_BETA_API_SUPPORT}
{* This is the recognizer for Zoom gestures. See @ref Efl_Canvas_Gesture_Zoom
 * and @ref Efl_Canvas_Gesture_Recognizer. For internal use only.
 *
 * @ingroup Efl_Canvas_Gesture_Recognizer_Zoom
  }

{ was #define dname def_expr }
function EFL_CANVAS_GESTURE_RECOGNIZER_ZOOM_CLASS : longint; { return type might be wrong }

(* Const before type ignored *)
function efl_canvas_gesture_recognizer_zoom_class_get:PEfl_Class;cdecl;external;
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$endif}

implementation

{ was #define dname def_expr }
function EFL_CANVAS_GESTURE_RECOGNIZER_ZOOM_CLASS : longint; { return type might be wrong }
  begin
    EFL_CANVAS_GESTURE_RECOGNIZER_ZOOM_CLASS:=efl_canvas_gesture_recognizer_zoom_class_get;
  end;


end.
