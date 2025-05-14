
unit efl_canvas_gesture_recognizer_eo;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_canvas_gesture_recognizer_eo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_canvas_gesture_recognizer_eo.h
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
PEfl_Canvas_Gesture_Recognizer  = ^Efl_Canvas_Gesture_Recognizer;
PEfl_Canvas_Gesture_Touch  = ^Efl_Canvas_Gesture_Touch;
PEfl_Class  = ^Efl_Class;
PEfl_Object  = ^Efl_Object;
PEo  = ^Eo;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _EFL_CANVAS_GESTURE_RECOGNIZER_EO_H_}
{$define _EFL_CANVAS_GESTURE_RECOGNIZER_EO_H_}
{$ifndef _EFL_CANVAS_GESTURE_RECOGNIZER_EO_CLASS_TYPE}
{$define _EFL_CANVAS_GESTURE_RECOGNIZER_EO_CLASS_TYPE}
type
  PEfl_Canvas_Gesture_Recognizer = ^TEfl_Canvas_Gesture_Recognizer;
  TEfl_Canvas_Gesture_Recognizer = TEo;
{$endif}
{$ifndef _EFL_CANVAS_GESTURE_RECOGNIZER_EO_TYPES}
{$define _EFL_CANVAS_GESTURE_RECOGNIZER_EO_TYPES}
{$endif}
{$ifdef EFL_BETA_API_SUPPORT}
{*
 * @brief Base abstract class for Gesture Recognizers. For internal use only.
 *
 * Gesture recognizers listen to events that occur on a target object to see if
 * a particular gesture has occurred.
 *
 * Recognizer-specific configuration values can be modified through
 * @ref efl_config_get, and the global config object can be found using
 * @ref efl_provider_find. Default configuration values are taken from the
 * system's configuration.
 *
 * @ingroup Efl_Canvas_Gesture_Recognizer
  }

{ was #define dname def_expr }
function EFL_CANVAS_GESTURE_RECOGNIZER_CLASS : longint; { return type might be wrong }

(* Const before type ignored *)
function efl_canvas_gesture_recognizer_class_get:PEfl_Class;cdecl;external;
{*
 * @brief This property returns the class type of gesture recognized by this
 * recognizer. It must be implemented for the recognizer to function.
 *
 * @param[in] obj The object.
 *
 * @return The gesture type to recognize.
 *
 * @ingroup Efl_Canvas_Gesture_Recognizer
  }
(* Const before type ignored *)
(* Const before type ignored *)
function efl_gesture_recognizer_type_get(obj:PEo):PEfl_Class;cdecl;external;
{*
 * @brief Analyzes the given @c event and the current state of the @c gesture
 * object to see if the state has to be modified. For example, to signal a
 * complete gesture detection.
 *
 * Updates the state of the gesture object as required, and returns a suitable
 * result for the current recognition step.
 *
 * This method must be implemented for the recognizer to function.
 *
 * @param[in] obj The object.
 * @param[in] gesture The gesture object.
 * @param[in] watched The target canvas object.
 * @param[in] event The pointer event being analyzed.
 *
 * @return Returns the result of the analysis.
 *
 * @ingroup Efl_Canvas_Gesture_Recognizer
  }
function efl_gesture_recognizer_recognize(obj:PEo; gesture:PEfl_Canvas_Gesture; watched:PEfl_Object; event:PEfl_Canvas_Gesture_Touch):TEfl_Canvas_Gesture_Recognizer_Result;cdecl;external;
{*
 * @brief This property determines whether a gesture recognizer should continue
 * to try processing events after returning
 * @ref EFL_GESTURE_RECOGNIZER_RESULT_FINISH or
 * @ref EFL_GESTURE_RECOGNIZER_RESULT_CANCEL.
 *
 * @param[in] obj The object.
 * @param[in] value Value of the property.
 *
 * @ingroup Efl_Canvas_Gesture_Recognizer
  }
procedure efl_gesture_recognizer_continues_set(obj:PEo; value:TEina_Bool);cdecl;external;
{*
 * @brief This property determines whether a gesture recognizer should continue
 * to try processing events after returning
 * @ref EFL_GESTURE_RECOGNIZER_RESULT_FINISH or
 * @ref EFL_GESTURE_RECOGNIZER_RESULT_CANCEL.
 *
 * @param[in] obj The object.
 *
 * @return Value of the property.
 *
 * @ingroup Efl_Canvas_Gesture_Recognizer
  }
(* Const before type ignored *)
function efl_gesture_recognizer_continues_get(obj:PEo):TEina_Bool;cdecl;external;
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$endif}

implementation

{ was #define dname def_expr }
function EFL_CANVAS_GESTURE_RECOGNIZER_CLASS : longint; { return type might be wrong }
  begin
    EFL_CANVAS_GESTURE_RECOGNIZER_CLASS:=efl_canvas_gesture_recognizer_class_get;
  end;


end.
