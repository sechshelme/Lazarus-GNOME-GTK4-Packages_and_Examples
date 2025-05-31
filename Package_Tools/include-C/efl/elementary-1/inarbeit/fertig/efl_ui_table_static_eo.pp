
unit efl_ui_table_static_eo;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_ui_table_static_eo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_ui_table_static_eo.h
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
PEfl_Ui_Table_Static  = ^Efl_Ui_Table_Static;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _EFL_UI_TABLE_STATIC_EO_H_}
{$define _EFL_UI_TABLE_STATIC_EO_H_}
{$ifndef _EFL_UI_TABLE_STATIC_EO_CLASS_TYPE}
{$define _EFL_UI_TABLE_STATIC_EO_CLASS_TYPE}
type
  PEfl_Ui_Table_Static = ^TEfl_Ui_Table_Static;
  TEfl_Ui_Table_Static = TEo;
{$endif}
{$ifndef _EFL_UI_TABLE_STATIC_EO_TYPES}
{$define _EFL_UI_TABLE_STATIC_EO_TYPES}
{$endif}
{$ifdef EFL_BETA_API_SUPPORT}
{*
 * @brief Widget container that arranges its elements in a uniform grid.
 *
 * For convenience, the grid has an initial size of 100 by 100 cells, so all
 * positions and sizes can be interpreted as percentages. Cells are always
 * shown with the same size, regardless of their content. Therefore, adding
 * content to one cell does not affect other cells.
 *
 * @ingroup Efl_Ui_Table_Static
  }

{ was #define dname def_expr }
function EFL_UI_TABLE_STATIC_CLASS : longint; { return type might be wrong }

(* Const before type ignored *)
function efl_ui_table_static_class_get:PEfl_Class;cdecl;external;
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$endif}

implementation

{ was #define dname def_expr }
function EFL_UI_TABLE_STATIC_CLASS : longint; { return type might be wrong }
  begin
    EFL_UI_TABLE_STATIC_CLASS:=efl_ui_table_static_class_get;
  end;


end.
