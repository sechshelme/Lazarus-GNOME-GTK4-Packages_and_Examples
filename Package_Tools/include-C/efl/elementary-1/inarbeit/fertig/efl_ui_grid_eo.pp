
unit efl_ui_grid_eo;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_ui_grid_eo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_ui_grid_eo.h
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
PEfl_Ui_Grid  = ^Efl_Ui_Grid;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _EFL_UI_GRID_EO_H_}
{$define _EFL_UI_GRID_EO_H_}
{$ifndef _EFL_UI_GRID_EO_CLASS_TYPE}
{$define _EFL_UI_GRID_EO_CLASS_TYPE}
type
  PEfl_Ui_Grid = ^TEfl_Ui_Grid;
  TEfl_Ui_Grid = TEo;
{$endif}
{$ifndef _EFL_UI_GRID_EO_TYPES}
{$define _EFL_UI_GRID_EO_TYPES}
{$endif}
{*
 * @brief A scrollable grid of @ref Efl_Ui_Item objects, typically
 * @ref Efl_Ui_Grid_Default_Item objects.
 *
 * Items are added using the @ref Efl_Pack_Linear interface.
 *
 * The orientation (vertical or horizontal) of the grid can be set with
 * @ref efl_ui_layout_orientation_get.
 *
 * Items inside this widget can be selected according to the
 * @ref efl_ui_multi_selectable_select_mode_get policy, and the selection can
 * be retrieved with @ref efl_ui_multi_selectable_selected_iterator_new.
 *
 * @ref Efl_Ui_Grid supports grouping by using @ref Efl_Ui_Group_Item objects.
 * Group headers are displayed at the top of the viewport if items belonging to
 * the group are visible in the viewport.
 *
 * @since 1.23
 *
 * @ingroup Efl_Ui_Grid
  }

{ was #define dname def_expr }
function EFL_UI_GRID_CLASS : longint; { return type might be wrong }

(* Const before type ignored *)
function efl_ui_grid_class_get:PEfl_Class;cdecl;external;
{$endif}

implementation

{ was #define dname def_expr }
function EFL_UI_GRID_CLASS : longint; { return type might be wrong }
  begin
    EFL_UI_GRID_CLASS:=efl_ui_grid_class_get;
  end;


end.
