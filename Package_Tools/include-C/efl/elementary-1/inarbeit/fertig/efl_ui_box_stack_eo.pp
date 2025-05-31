
unit efl_ui_box_stack_eo;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_ui_box_stack_eo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_ui_box_stack_eo.h
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
PEfl_Ui_Box_Stack  = ^Efl_Ui_Box_Stack;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _EFL_UI_BOX_STACK_EO_H_}
{$define _EFL_UI_BOX_STACK_EO_H_}
{$ifndef _EFL_UI_BOX_STACK_EO_CLASS_TYPE}
{$define _EFL_UI_BOX_STACK_EO_CLASS_TYPE}
type
  PEfl_Ui_Box_Stack = ^TEfl_Ui_Box_Stack;
  TEfl_Ui_Box_Stack = TEo;
{$endif}
{$ifndef _EFL_UI_BOX_STACK_EO_TYPES}
{$define _EFL_UI_BOX_STACK_EO_TYPES}
{$endif}
{*
 * @brief A custom layout engine for @ref Efl_Ui_Box that stacks items.
 *
 * Items will be stacked on top of each other (in the Z direction) meaning
 * that, in the absence of transparency, only the last item added through the
 * @ref Efl_Pack interface will actually be visible.
 *
 * This can be useful to display transparent objects on top of each other, for
 * example.
 *
 * @since 1.23
 *
 * @ingroup Efl_Ui_Box_Stack
  }

{ was #define dname def_expr }
function EFL_UI_BOX_STACK_CLASS : longint; { return type might be wrong }

(* Const before type ignored *)
function efl_ui_box_stack_class_get:PEfl_Class;cdecl;external;
{$endif}

implementation

{ was #define dname def_expr }
function EFL_UI_BOX_STACK_CLASS : longint; { return type might be wrong }
  begin
    EFL_UI_BOX_STACK_CLASS:=efl_ui_box_stack_class_get;
  end;


end.
