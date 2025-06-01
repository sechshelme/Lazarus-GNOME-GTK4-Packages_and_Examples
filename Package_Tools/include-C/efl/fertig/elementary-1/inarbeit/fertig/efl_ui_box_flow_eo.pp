
unit efl_ui_box_flow_eo;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_ui_box_flow_eo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_ui_box_flow_eo.h
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
PEfl_Ui_Box_Flow  = ^Efl_Ui_Box_Flow;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _EFL_UI_BOX_FLOW_EO_H_}
{$define _EFL_UI_BOX_FLOW_EO_H_}
{$ifndef _EFL_UI_BOX_FLOW_EO_CLASS_TYPE}
{$define _EFL_UI_BOX_FLOW_EO_CLASS_TYPE}
type
  PEfl_Ui_Box_Flow = ^TEfl_Ui_Box_Flow;
  TEfl_Ui_Box_Flow = TEo;
{$endif}
{$ifndef _EFL_UI_BOX_FLOW_EO_TYPES}
{$define _EFL_UI_BOX_FLOW_EO_TYPES}
{$endif}
{* A Flow Box is a customized type of @ref Efl_Ui_Box. It will fill along the
 * axis selected with @ref efl_ui_layout_orientation_get (which defaults to
 * Horizontal), until items will no longer fit in the available space, at which
 * point it will begin filling items in a new row/column after the current one.
 * This is useful if an application wants to e.g., present a group of items and
 * wrap them onto subsequent lines when the number of items grows too large to
 * fit on the screen. Adding or removing items in the middle re-arrange the
 * rest of the items as expected.
 *
 * @since 1.23
 *
 * @ingroup Efl_Ui_Box_Flow
  }

{ was #define dname def_expr }
function EFL_UI_BOX_FLOW_CLASS : longint; { return type might be wrong }

(* Const before type ignored *)
function efl_ui_box_flow_class_get:PEfl_Class;cdecl;external;
{$endif}

implementation

{ was #define dname def_expr }
function EFL_UI_BOX_FLOW_CLASS : longint; { return type might be wrong }
  begin
    EFL_UI_BOX_FLOW_CLASS:=efl_ui_box_flow_class_get;
  end;


end.
