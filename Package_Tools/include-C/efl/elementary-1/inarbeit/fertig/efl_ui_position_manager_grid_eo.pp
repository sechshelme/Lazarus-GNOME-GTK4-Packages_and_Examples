
unit efl_ui_position_manager_grid_eo;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_ui_position_manager_grid_eo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_ui_position_manager_grid_eo.h
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
PEfl_Ui_Position_Manager_Grid  = ^Efl_Ui_Position_Manager_Grid;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _EFL_UI_POSITION_MANAGER_GRID_EO_H_}
{$define _EFL_UI_POSITION_MANAGER_GRID_EO_H_}
{$ifndef _EFL_UI_POSITION_MANAGER_GRID_EO_CLASS_TYPE}
{$define _EFL_UI_POSITION_MANAGER_GRID_EO_CLASS_TYPE}
type
  PEfl_Ui_Position_Manager_Grid = ^TEfl_Ui_Position_Manager_Grid;
  TEfl_Ui_Position_Manager_Grid = TEo;
{$endif}
{$ifndef _EFL_UI_POSITION_MANAGER_GRID_EO_TYPES}
{$define _EFL_UI_POSITION_MANAGER_GRID_EO_TYPES}
{$endif}
{$ifdef EFL_BETA_API_SUPPORT}
{*
 * @brief Implementation of @ref Efl_Ui_Position_Manager_Entity for
 * two-dimensional grids.
 *
 * Every item in the grid has the same size, which is the biggest minimum size
 * of all items.
 *
 * @ingroup Efl_Ui_Position_Manager_Grid
  }

{ was #define dname def_expr }
function EFL_UI_POSITION_MANAGER_GRID_CLASS : longint; { return type might be wrong }

(* Const before type ignored *)
function efl_ui_position_manager_grid_class_get:PEfl_Class;cdecl;external;
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$endif}

implementation

{ was #define dname def_expr }
function EFL_UI_POSITION_MANAGER_GRID_CLASS : longint; { return type might be wrong }
  begin
    EFL_UI_POSITION_MANAGER_GRID_CLASS:=efl_ui_position_manager_grid_class_get;
  end;


end.
