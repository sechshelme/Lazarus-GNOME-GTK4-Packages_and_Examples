
unit efl_ui_layout_part_box_eo;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_ui_layout_part_box_eo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_ui_layout_part_box_eo.h
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
PEfl_Ui_Layout_Part_Box  = ^Efl_Ui_Layout_Part_Box;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _EFL_UI_LAYOUT_PART_BOX_EO_H_}
{$define _EFL_UI_LAYOUT_PART_BOX_EO_H_}
{$ifndef _EFL_UI_LAYOUT_PART_BOX_EO_CLASS_TYPE}
{$define _EFL_UI_LAYOUT_PART_BOX_EO_CLASS_TYPE}
type
  PEfl_Ui_Layout_Part_Box = ^TEfl_Ui_Layout_Part_Box;
  TEfl_Ui_Layout_Part_Box = TEo;
{$endif}
{$ifndef _EFL_UI_LAYOUT_PART_BOX_EO_TYPES}
{$define _EFL_UI_LAYOUT_PART_BOX_EO_TYPES}
{$endif}
{*
 * @brief Represents a Box created as part of a layout.
 *
 * Cannot be deleted. This is only a representation of an internal object of an
 * EFL layout.
 *
 * @since 1.23
 *
 * @ingroup Efl_Ui_Layout_Part_Box
  }

{ was #define dname def_expr }
function EFL_UI_LAYOUT_PART_BOX_CLASS : longint; { return type might be wrong }

(* Const before type ignored *)
function efl_ui_layout_part_box_class_get:PEfl_Class;cdecl;external;
{$endif}

implementation

{ was #define dname def_expr }
function EFL_UI_LAYOUT_PART_BOX_CLASS : longint; { return type might be wrong }
  begin
    EFL_UI_LAYOUT_PART_BOX_CLASS:=efl_ui_layout_part_box_class_get;
  end;


end.
