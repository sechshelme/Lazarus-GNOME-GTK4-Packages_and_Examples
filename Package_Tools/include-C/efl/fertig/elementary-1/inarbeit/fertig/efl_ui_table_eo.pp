
unit efl_ui_table_eo;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_ui_table_eo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_ui_table_eo.h
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
PEfl_Ui_Table  = ^Efl_Ui_Table;
PEina_Bool  = ^Eina_Bool;
PEo  = ^Eo;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _EFL_UI_TABLE_EO_H_}
{$define _EFL_UI_TABLE_EO_H_}
{$ifndef _EFL_UI_TABLE_EO_CLASS_TYPE}
{$define _EFL_UI_TABLE_EO_CLASS_TYPE}
type
  PEfl_Ui_Table = ^TEfl_Ui_Table;
  TEfl_Ui_Table = TEo;
{$endif}
{$ifndef _EFL_UI_TABLE_EO_TYPES}
{$define _EFL_UI_TABLE_EO_TYPES}
{$endif}
{*
 * @brief Widget container that arranges its elements in a grid.
 *
 * The amount of rows and columns can be controlled with
 * @ref efl_pack_table_rows_get and @ref efl_pack_table_columns_get, and
 * elements can be manually positioned with @ref efl_pack_table. Additionally,
 * a fill direction can be defined with @ref efl_ui_layout_orientation_get and
 * elements added with @ref efl_pack. Elements are then added following this
 * direction (horizontal or vertical) and when the amount of columns or rows
 * has been reached, a step is taken in the orthogonal direction. In this
 * second case there is no need to define both the amount of columns and rows,
 * as the table will expand as needed. The default fill direction is
 * @ref EFL_UI_LAYOUT_ORIENTATION_HORIZONTAL.
 *
 * @since 1.23
 *
 * @ingroup Efl_Ui_Table
  }

{ was #define dname def_expr }
function EFL_UI_TABLE_CLASS : longint; { return type might be wrong }

(* Const before type ignored *)
function efl_ui_table_class_get:PEfl_Class;cdecl;external;
{*
 * @brief Control homogeneous mode.
 *
 * This will enable the homogeneous mode where cells are of the same weight and
 * of the same min size which is determined by maximum min size of cells.
 *
 * @param[in] obj The object.
 * @param[in] homogeneoush @c true if the box is homogeneous horizontally,
 * @c false otherwise
 * @param[in] homogeneousv @c true if the box is homogeneous vertically,
 * @c false otherwise
 *
 * @since 1.23
 *
 * @ingroup Efl_Ui_Table
  }
procedure efl_ui_table_homogeneous_set(obj:PEo; homogeneoush:TEina_Bool; homogeneousv:TEina_Bool);cdecl;external;
{*
 * @brief Control homogeneous mode.
 *
 * This will enable the homogeneous mode where cells are of the same weight and
 * of the same min size which is determined by maximum min size of cells.
 *
 * @param[in] obj The object.
 * @param[out] homogeneoush @c true if the box is homogeneous horizontally,
 * @c false otherwise
 * @param[out] homogeneousv @c true if the box is homogeneous vertically,
 * @c false otherwise
 *
 * @since 1.23
 *
 * @ingroup Efl_Ui_Table
  }
(* Const before type ignored *)
procedure efl_ui_table_homogeneous_get(obj:PEo; homogeneoush:PEina_Bool; homogeneousv:PEina_Bool);cdecl;external;
{$endif}

implementation

{ was #define dname def_expr }
function EFL_UI_TABLE_CLASS : longint; { return type might be wrong }
  begin
    EFL_UI_TABLE_CLASS:=efl_ui_table_class_get;
  end;


end.
