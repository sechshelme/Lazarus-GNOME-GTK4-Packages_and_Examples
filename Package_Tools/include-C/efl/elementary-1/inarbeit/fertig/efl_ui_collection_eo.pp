
unit efl_ui_collection_eo;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_ui_collection_eo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_ui_collection_eo.h
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
PEfl_Ui_Collection  = ^Efl_Ui_Collection;
PEfl_Ui_Item  = ^Efl_Ui_Item;
PEfl_Ui_Position_Manager_Entity  = ^Efl_Ui_Position_Manager_Entity;
PEo  = ^Eo;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _EFL_UI_COLLECTION_EO_H_}
{$define _EFL_UI_COLLECTION_EO_H_}
{$ifndef _EFL_UI_COLLECTION_EO_CLASS_TYPE}
{$define _EFL_UI_COLLECTION_EO_CLASS_TYPE}
type
  PEfl_Ui_Collection = ^TEfl_Ui_Collection;
  TEfl_Ui_Collection = TEo;
{$endif}
{$ifndef _EFL_UI_COLLECTION_EO_TYPES}
{$define _EFL_UI_COLLECTION_EO_TYPES}
{$endif}
{*
 * @brief This widget displays a list of items in an arrangement controlled by
 * an external @ref efl_ui_collection_position_manager_get object. By using
 * different @ref efl_ui_collection_position_manager_get objects this widget
 * can show unidimensional lists or two-dimensional grids of items, for
 * example.
 *
 * This class is intended to act as a base for widgets like @ref Efl_Ui_List or
 * @ref Efl_Ui_Grid, which hide this complexity from the user.
 *
 * Items are added using the @ref Efl_Pack_Linear interface and must be of
 * @ref Efl_Ui_Item type.
 *
 * The direction of the arrangement can be controlled through
 * @ref efl_ui_layout_orientation_get.
 *
 * If all items do not fit in the current widget size scrolling facilities are
 * provided.
 *
 * Items inside this widget can be selected according to the
 * @ref efl_ui_multi_selectable_select_mode_get policy, and the selection can
 * be retrieved with @ref efl_ui_multi_selectable_selected_iterator_new.
 *
 * @since 1.23
 *
 * @ingroup Efl_Ui_Collection
  }

{ was #define dname def_expr }
function EFL_UI_COLLECTION_CLASS : longint; { return type might be wrong }

(* Const before type ignored *)
function efl_ui_collection_class_get:PEfl_Class;cdecl;external;
{*
 * @brief Brings the passed item into the viewport.
 *
 * @param[in] obj The object.
 * @param[in] item The target to move into view.
 * @param[in] animation If you want to have an animated transition.
 *
 * @since 1.23
 *
 * @ingroup Efl_Ui_Collection
  }
procedure efl_ui_collection_item_scroll(obj:PEo; item:PEfl_Ui_Item; animation:TEina_Bool);cdecl;external;
{*
 * @brief Brings the passed item into the viewport and align it.
 *
 * @c align selects the final position of the object inside the viewport. 0.0
 * will move the object to the first visible position inside the viewport, 1.0
 * will move it to the last visible position, and values in between will move
 * it accordingly to positions in between, along the scrolling axis.
 *
 * @param[in] obj The object.
 * @param[in] item The target to move into view.
 * @param[in] align 0.0 to have this item at the upper or left side of the
 * viewport, 1.0 to have this item at the lower or right side of the viewport.
 * @param[in] animation If you want to have an animated transition.
 *
 * @since 1.23
 *
 * @ingroup Efl_Ui_Collection
  }
procedure efl_ui_collection_item_scroll_align(obj:PEo; item:PEfl_Ui_Item; align:Tdouble; animation:TEina_Bool);cdecl;external;
{$ifdef EFL_BETA_API_SUPPORT}
{*
 * @brief Position manager object that handles placement of items.
 *
 * @param[in] obj The object.
 * @param[in] position_manager Ownership is passed to the item container.
 *
 * @since 1.23
 *
 * @ingroup Efl_Ui_Collection
  }
procedure efl_ui_collection_position_manager_set(obj:PEo; position_manager:PEfl_Ui_Position_Manager_Entity);cdecl;external;
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$ifdef EFL_BETA_API_SUPPORT}
{*
 * @brief Position manager object that handles placement of items.
 *
 * @param[in] obj The object.
 *
 * @return A borrowed handle to the item container.
 *
 * @since 1.23
 *
 * @ingroup Efl_Ui_Collection
  }
(* Const before type ignored *)

function efl_ui_collection_position_manager_get(obj:PEo):PEfl_Ui_Position_Manager_Entity;cdecl;external;
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$endif}

implementation

{ was #define dname def_expr }
function EFL_UI_COLLECTION_CLASS : longint; { return type might be wrong }
  begin
    EFL_UI_COLLECTION_CLASS:=efl_ui_collection_class_get;
  end;


end.
