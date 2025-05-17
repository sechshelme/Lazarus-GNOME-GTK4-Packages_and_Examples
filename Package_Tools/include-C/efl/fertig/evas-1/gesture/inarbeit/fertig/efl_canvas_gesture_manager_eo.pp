
unit efl_canvas_gesture_manager_eo;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_canvas_gesture_manager_eo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_canvas_gesture_manager_eo.h
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
PEfl_Canvas_Gesture_Manager  = ^Efl_Canvas_Gesture_Manager;
PEfl_Canvas_Gesture_Recognizer  = ^Efl_Canvas_Gesture_Recognizer;
PEfl_Canvas_Object  = ^Efl_Canvas_Object;
PEfl_Class  = ^Efl_Class;
PEo  = ^Eo;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _EFL_CANVAS_GESTURE_MANAGER_EO_H_}
{$define _EFL_CANVAS_GESTURE_MANAGER_EO_H_}
{$ifndef _EFL_CANVAS_GESTURE_MANAGER_EO_CLASS_TYPE}
{$define _EFL_CANVAS_GESTURE_MANAGER_EO_CLASS_TYPE}
type
  PEfl_Canvas_Gesture_Manager = ^TEfl_Canvas_Gesture_Manager;
  TEfl_Canvas_Gesture_Manager = TEo;
{$endif}
{$ifndef _EFL_CANVAS_GESTURE_MANAGER_EO_TYPES}
{$define _EFL_CANVAS_GESTURE_MANAGER_EO_TYPES}
{$endif}
{$ifdef EFL_BETA_API_SUPPORT}
{*
 * @brief This class keeps track of active @ref Efl_Canvas_Gesture_Recognizer
 * objects. For internal use only.
 *
 * This class defines methods to manage gesture recognizers and handles passing
 * input events to the recognizers that it manages.
 *
 * @ingroup Efl_Canvas_Gesture_Manager
  }

{ was #define dname def_expr }
function EFL_CANVAS_GESTURE_MANAGER_CLASS : longint; { return type might be wrong }

(* Const before type ignored *)
function efl_canvas_gesture_manager_class_get:PEfl_Class;cdecl;external;
{*
 * @brief Registers a new @ref Efl_Canvas_Gesture_Recognizer.
 *
 * @param[in] obj The object.
 * @param[in] recognizer The gesture recognizer object.
 *
 * @ingroup Efl_Canvas_Gesture_Manager
  }
procedure efl_gesture_manager_recognizer_register(obj:PEo; recognizer:PEfl_Canvas_Gesture_Recognizer);cdecl;external;
{*
 * @brief Unregisters an existing @ref Efl_Canvas_Gesture_Recognizer.
 *
 * @param[in] obj The object.
 * @param[in] recognizer The gesture recognizer object.
 *
 * @ingroup Efl_Canvas_Gesture_Manager
  }
procedure efl_gesture_manager_recognizer_unregister(obj:PEo; recognizer:PEfl_Canvas_Gesture_Recognizer);cdecl;external;
{*
 * @brief Perform cleanup for a gesture which ends after a delay.
 *
 * @param[in] obj The object.
 * @param[in] recognizer The gesture recognizer object.
 * @param[in] target The target object being processed by the recognizer.
 *
 * @ingroup Efl_Canvas_Gesture_Manager
  }
(* Const before type ignored *)
(* Const before type ignored *)
procedure efl_gesture_manager_recognizer_cleanup(obj:PEo; recognizer:PEfl_Canvas_Gesture_Recognizer; target:PEfl_Canvas_Object);cdecl;external;
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$endif}

implementation

{ was #define dname def_expr }
function EFL_CANVAS_GESTURE_MANAGER_CLASS : longint; { return type might be wrong }
  begin
    EFL_CANVAS_GESTURE_MANAGER_CLASS:=efl_canvas_gesture_manager_class_get;
  end;


end.
