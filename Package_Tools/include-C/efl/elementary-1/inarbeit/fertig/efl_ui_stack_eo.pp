
unit efl_ui_stack_eo;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_ui_stack_eo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_ui_stack_eo.h
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
PEfl_Ui_Stack  = ^Efl_Ui_Stack;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _EFL_UI_STACK_EO_H_}
{$define _EFL_UI_STACK_EO_H_}
{$ifndef _EFL_UI_STACK_EO_CLASS_TYPE}
{$define _EFL_UI_STACK_EO_CLASS_TYPE}
type
  PEfl_Ui_Stack = ^TEfl_Ui_Stack;
  TEfl_Ui_Stack = TEo;
{$endif}
{$ifndef _EFL_UI_STACK_EO_TYPES}
{$define _EFL_UI_STACK_EO_TYPES}
{$endif}
{*
 * @brief A spotlight with predefined @ref efl_ui_spotlight_manager_get
 *
 * The container will alpha-blend the new content over the old content.
 *
 * @since 1.24
 *
 * @ingroup Efl_Ui_Stack
  }

{ was #define dname def_expr }
function EFL_UI_STACK_CLASS : longint; { return type might be wrong }

(* Const before type ignored *)
function efl_ui_stack_class_get:PEfl_Class;cdecl;external;
{$endif}

implementation

{ was #define dname def_expr }
function EFL_UI_STACK_CLASS : longint; { return type might be wrong }
  begin
    EFL_UI_STACK_CLASS:=efl_ui_stack_class_get;
  end;


end.
