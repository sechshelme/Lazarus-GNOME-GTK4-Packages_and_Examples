
unit efl_ui_grid_view_eo;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_ui_grid_view_eo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_ui_grid_view_eo.h
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
PEfl_Ui_Grid_View  = ^Efl_Ui_Grid_View;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _EFL_UI_GRID_VIEW_EO_H_}
{$define _EFL_UI_GRID_VIEW_EO_H_}
{$ifndef _EFL_UI_GRID_VIEW_EO_CLASS_TYPE}
{$define _EFL_UI_GRID_VIEW_EO_CLASS_TYPE}
type
  PEfl_Ui_Grid_View = ^TEfl_Ui_Grid_View;
  TEfl_Ui_Grid_View = TEo;
{$endif}
{$ifndef _EFL_UI_GRID_VIEW_EO_TYPES}
{$define _EFL_UI_GRID_VIEW_EO_TYPES}
{$endif}
{$ifdef EFL_BETA_API_SUPPORT}
{*
 * @brief A scrollable grid of @ref Efl_Ui_Item objects, typically
 * @ref Efl_Ui_Grid_Default_Item objects.
 *
 * Items are added asynchronously by an @ref Efl_Ui_Factory from the definition
 * of an @ref Efl_Model.
 *
 * The orientation (vertical or horizontal) of the grid can be set with
 * @ref efl_ui_layout_orientation_get.
 *
 * Items inside this widget can be selected according to the
 * @ref efl_ui_multi_selectable_select_mode_get policy, and the selection can
 * be retrieved with @ref efl_ui_multi_selectable_selected_ndx_iterator_new.
 *
 * @ingroup Efl_Ui_Grid_View
  }

{ was #define dname def_expr }
function EFL_UI_GRID_VIEW_CLASS : longint; { return type might be wrong }

(* Const before type ignored *)
function efl_ui_grid_view_class_get:PEfl_Class;cdecl;external;
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$endif}

implementation

{ was #define dname def_expr }
function EFL_UI_GRID_VIEW_CLASS : longint; { return type might be wrong }
  begin
    EFL_UI_GRID_VIEW_CLASS:=efl_ui_grid_view_class_get;
  end;


end.
