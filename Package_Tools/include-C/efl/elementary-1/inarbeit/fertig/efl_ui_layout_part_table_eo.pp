
unit efl_ui_layout_part_table_eo;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_ui_layout_part_table_eo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_ui_layout_part_table_eo.h
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
PEfl_Ui_Layout_Part_Table  = ^Efl_Ui_Layout_Part_Table;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _EFL_UI_LAYOUT_PART_TABLE_EO_H_}
{$define _EFL_UI_LAYOUT_PART_TABLE_EO_H_}
{$ifndef _EFL_UI_LAYOUT_PART_TABLE_EO_CLASS_TYPE}
{$define _EFL_UI_LAYOUT_PART_TABLE_EO_CLASS_TYPE}
type
  PEfl_Ui_Layout_Part_Table = ^TEfl_Ui_Layout_Part_Table;
  TEfl_Ui_Layout_Part_Table = TEo;
{$endif}
{$ifndef _EFL_UI_LAYOUT_PART_TABLE_EO_TYPES}
{$define _EFL_UI_LAYOUT_PART_TABLE_EO_TYPES}
{$endif}
{*
 * @brief Represents a Table created as part of a layout.
 *
 * Cannot be deleted. This is only a representation of an internal object of an
 * EFL layout.
 *
 * @since 1.23
 *
 * @ingroup Efl_Ui_Layout_Part_Table
  }

{ was #define dname def_expr }
function EFL_UI_LAYOUT_PART_TABLE_CLASS : longint; { return type might be wrong }

(* Const before type ignored *)
function efl_ui_layout_part_table_class_get:PEfl_Class;cdecl;external;
{$endif}

implementation

{ was #define dname def_expr }
function EFL_UI_LAYOUT_PART_TABLE_CLASS : longint; { return type might be wrong }
  begin
    EFL_UI_LAYOUT_PART_TABLE_CLASS:=efl_ui_layout_part_table_class_get;
  end;


end.
