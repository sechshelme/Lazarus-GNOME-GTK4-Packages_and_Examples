
unit efl_canvas_gesture_recognizer_custom_eo;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_canvas_gesture_recognizer_custom_eo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_canvas_gesture_recognizer_custom_eo.h
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
Pchar  = ^char;
PEfl_Canvas_Gesture_Recognizer_Custom  = ^Efl_Canvas_Gesture_Recognizer_Custom;
PEfl_Class  = ^Efl_Class;
PEo  = ^Eo;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _EFL_CANVAS_GESTURE_RECOGNIZER_CUSTOM_EO_H_}
{$define _EFL_CANVAS_GESTURE_RECOGNIZER_CUSTOM_EO_H_}
{$ifndef _EFL_CANVAS_GESTURE_RECOGNIZER_CUSTOM_EO_CLASS_TYPE}
{$define _EFL_CANVAS_GESTURE_RECOGNIZER_CUSTOM_EO_CLASS_TYPE}
type
  PEfl_Canvas_Gesture_Recognizer_Custom = ^TEfl_Canvas_Gesture_Recognizer_Custom;
  TEfl_Canvas_Gesture_Recognizer_Custom = TEo;
{$endif}
{$ifndef _EFL_CANVAS_GESTURE_RECOGNIZER_CUSTOM_EO_TYPES}
{$define _EFL_CANVAS_GESTURE_RECOGNIZER_CUSTOM_EO_TYPES}
{$endif}
{$ifdef EFL_BETA_API_SUPPORT}
{*
 * @brief This is the recognizer for Custom gestures. See
 * @ref Efl_Canvas_Gesture_Recognizer.
 *
 * Custom-written recognizers must inherit this class. They are responsible for
 * managing and updating the state of the recognized @ref Efl_Canvas_Gesture
 * object inside their implementation of the
 * @ref efl_gesture_recognizer_recognize method, which is required.
 *
 * @ingroup Efl_Canvas_Gesture_Recognizer_Custom
  }

{ was #define dname def_expr }
function EFL_CANVAS_GESTURE_RECOGNIZER_CUSTOM_CLASS : longint; { return type might be wrong }

(* Const before type ignored *)
function efl_canvas_gesture_recognizer_custom_class_get:PEfl_Class;cdecl;external;
{*
 * @brief This is the name of the gesture recognizer.
 *
 * @param[in] obj The object.
 * @param[in] gesture_name The name of the gesture recognizer.
 *
 * @ingroup Efl_Canvas_Gesture_Recognizer_Custom
  }
(* Const before type ignored *)
procedure efl_gesture_recognizer_custom_gesture_name_set(obj:PEo; gesture_name:Pchar);cdecl;external;
{*
 * @brief This is the name of the gesture recognizer.
 *
 * @param[in] obj The object.
 *
 * @return The name of the gesture recognizer.
 *
 * @ingroup Efl_Canvas_Gesture_Recognizer_Custom
  }
(* Const before type ignored *)
(* Const before type ignored *)
function efl_gesture_recognizer_custom_gesture_name_get(obj:PEo):Pchar;cdecl;external;
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$endif}

implementation

{ was #define dname def_expr }
function EFL_CANVAS_GESTURE_RECOGNIZER_CUSTOM_CLASS : longint; { return type might be wrong }
  begin
    EFL_CANVAS_GESTURE_RECOGNIZER_CUSTOM_CLASS:=efl_canvas_gesture_recognizer_custom_class_get;
  end;


end.
