
unit efl_canvas_gesture_custom_eo;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_canvas_gesture_custom_eo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_canvas_gesture_custom_eo.h
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
PEfl_Canvas_Gesture_Custom  = ^Efl_Canvas_Gesture_Custom;
PEfl_Class  = ^Efl_Class;
PEo  = ^Eo;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _EFL_CANVAS_GESTURE_CUSTOM_EO_H_}
{$define _EFL_CANVAS_GESTURE_CUSTOM_EO_H_}
{$ifndef _EFL_CANVAS_GESTURE_CUSTOM_EO_CLASS_TYPE}
{$define _EFL_CANVAS_GESTURE_CUSTOM_EO_CLASS_TYPE}
type
  PEfl_Canvas_Gesture_Custom = ^TEfl_Canvas_Gesture_Custom;
  TEfl_Canvas_Gesture_Custom = TEo;
{$endif}
{$ifndef _EFL_CANVAS_GESTURE_CUSTOM_EO_TYPES}
{$define _EFL_CANVAS_GESTURE_CUSTOM_EO_TYPES}
{$endif}
{$ifdef EFL_BETA_API_SUPPORT}
{*
 * @brief Custom gesture class holding state information. See
 * @ref Efl_Canvas_Gesture to see what this state is and
 * @[Efl.Canvas.Gesture_Events.gesture,custom] for a description of the Custom
 * gesture.
 *
 * Application developers receive these objects inside a gesture event and do
 * not typically need to create their own.
 *
 * Custom gesture recognizers which implement their own gesture properties
 * (e.g., gesture momentum or angle) must inherit this class, and their
 * recognizers must implement the @ref efl_gesture_recognizer_type_get property
 * to return this class.
 *
 * @ingroup Efl_Canvas_Gesture_Custom
  }

{ was #define dname def_expr }
function EFL_CANVAS_GESTURE_CUSTOM_CLASS : longint; { return type might be wrong }

(* Const before type ignored *)
function efl_canvas_gesture_custom_class_get:PEfl_Class;cdecl;external;
{$ifdef EFL_CANVAS_GESTURE_CUSTOM_PROTECTED}
{*
 * @brief This is the name of the custom gesture.
 *
 * @param[in] obj The object.
 * @param[in] gesture_name The name of the custom gesture.
 *
 * @ingroup Efl_Canvas_Gesture_Custom
  }
(* Const before type ignored *)
procedure efl_gesture_custom_gesture_name_set(obj:PEo; gesture_name:Pchar);cdecl;external;
{$endif}
{*
 * @brief This is the name of the custom gesture.
 *
 * @param[in] obj The object.
 *
 * @return The name of the custom gesture.
 *
 * @ingroup Efl_Canvas_Gesture_Custom
  }
(* Const before type ignored *)
(* Const before type ignored *)

function efl_gesture_custom_gesture_name_get(obj:PEo):Pchar;cdecl;external;
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$endif}

implementation

{ was #define dname def_expr }
function EFL_CANVAS_GESTURE_CUSTOM_CLASS : longint; { return type might be wrong }
  begin
    EFL_CANVAS_GESTURE_CUSTOM_CLASS:=efl_canvas_gesture_custom_class_get;
  end;


end.
