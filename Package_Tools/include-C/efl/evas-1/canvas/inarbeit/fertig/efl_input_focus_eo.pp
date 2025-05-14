
unit efl_input_focus_eo;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_input_focus_eo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_input_focus_eo.h
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
PEfl_Class  = ^Efl_Class;
PEfl_Input_Focus  = ^Efl_Input_Focus;
PEfl_Object  = ^Efl_Object;
PEo  = ^Eo;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _EFL_INPUT_FOCUS_EO_H_}
{$define _EFL_INPUT_FOCUS_EO_H_}
{$ifndef _EFL_INPUT_FOCUS_EO_CLASS_TYPE}
{$define _EFL_INPUT_FOCUS_EO_CLASS_TYPE}
type
  PEfl_Input_Focus = ^TEfl_Input_Focus;
  TEfl_Input_Focus = TEo;
{$endif}
{$ifndef _EFL_INPUT_FOCUS_EO_TYPES}
{$define _EFL_INPUT_FOCUS_EO_TYPES}
{$endif}
{* Represents a focus event.
 *
 * @since 1.22
 *
 * @ingroup Efl_Input_Focus
  }

{ was #define dname def_expr }
function EFL_INPUT_FOCUS_CLASS : longint; { return type might be wrong }

(* Const before type ignored *)
function efl_input_focus_class_get:PEfl_Class;cdecl;external;
{*
 * @brief The focused object.
 *
 * @param[in] obj The object.
 * @param[in] object The focused object, or @c NULL if the event comes from the
 * canvas.
 *
 * @since 1.22
 *
 * @ingroup Efl_Input_Focus
  }
procedure efl_input_focus_object_set(obj:PEo; object:PEfl_Object);cdecl;external;
{*
 * @brief The focused object.
 *
 * @param[in] obj The object.
 *
 * @return The focused object, or @c NULL if the event comes from the canvas.
 *
 * @since 1.22
 *
 * @ingroup Efl_Input_Focus
  }
(* Const before type ignored *)
function efl_input_focus_object_get(obj:PEo):PEfl_Object;cdecl;external;
{$endif}

implementation

{ was #define dname def_expr }
function EFL_INPUT_FOCUS_CLASS : longint; { return type might be wrong }
  begin
    EFL_INPUT_FOCUS_CLASS:=efl_input_focus_class_get;
  end;


end.
