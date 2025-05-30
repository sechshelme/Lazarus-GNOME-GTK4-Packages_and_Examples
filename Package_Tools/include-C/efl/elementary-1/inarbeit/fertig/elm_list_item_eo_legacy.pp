
unit elm_list_item_eo_legacy;
interface

{
  Automatically converted by H2Pas 1.0.0 from elm_list_item_eo_legacy.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    elm_list_item_eo_legacy.h
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
PEfl_Canvas_Object  = ^Efl_Canvas_Object;
PElm_List_Item  = ^Elm_List_Item;
PElm_Widget_Item  = ^Elm_Widget_Item;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _ELM_LIST_ITEM_EO_LEGACY_H_}
{$define _ELM_LIST_ITEM_EO_LEGACY_H_}
{$ifndef _ELM_LIST_ITEM_EO_CLASS_TYPE}
{$define _ELM_LIST_ITEM_EO_CLASS_TYPE}
type
  PElm_List_Item = ^TElm_List_Item;
  TElm_List_Item = TEo;
{$endif}
{$ifndef _ELM_LIST_ITEM_EO_TYPES}
{$define _ELM_LIST_ITEM_EO_TYPES}
{$endif}
{*
 * @brief Set or unset item as a separator.
 *
 * Items aren't set as separator by default.
 *
 * If set as separator it will display separator theme, so won't display icons
 * or label.
 *
 * @param[in] obj The object.
 * @param[in] setting @c true means item @c it is a separator. @c false
 * indicates it's not.
 *
 * @ingroup Elm_List_Item_Group
  }

procedure elm_list_item_separator_set(obj:PElm_List_Item; setting:TEina_Bool);cdecl;external;
{*
 * @brief Get a value whether item is a separator or not.
 *
 * @param[in] obj The object.
 *
 * @return @c true means item @c it is a separator. @c false indicates it's
 * not.
 *
 * @ingroup Elm_List_Item_Group
  }
(* Const before type ignored *)
function elm_list_item_separator_get(obj:PElm_List_Item):TEina_Bool;cdecl;external;
{*
 * @brief Set the selected state of an item.
 *
 * This sets the selected state of the given item.
 *
 * If a new item is selected the previously selected will be unselected, unless
 * multiple selection is enabled with @ref elm_list_multi_select_set.
 * Previously selected item can be get with function @ref
 * elm_list_selected_item_get.
 *
 * Selected items will be highlighted.
 *
 * @param[in] obj The object.
 * @param[in] selected The selected state.
 *
 * @ingroup Elm_List_Item_Group
  }
procedure elm_list_item_selected_set(obj:PElm_List_Item; selected:TEina_Bool);cdecl;external;
{*
 * @brief Get whether the item is selected or not.
 *
 * @param[in] obj The object.
 *
 * @return The selected state.
 *
 * @ingroup Elm_List_Item_Group
  }
(* Const before type ignored *)
function elm_list_item_selected_get(obj:PElm_List_Item):TEina_Bool;cdecl;external;
{*
 * @brief Get the real Evas(Edje) object created to implement the view of a
 * given list item.
 *
 * Base object is the @c Evas_Object that represents that item.
 *
 * @param[in] obj The object.
 *
 * @return The base Edje object associated with the item.
 *
 * @ingroup Elm_List_Item_Group
  }
(* Const before type ignored *)
function elm_list_item_object_get(obj:PElm_List_Item):PEfl_Canvas_Object;cdecl;external;
{*
 * @brief Get the item before the item in list.
 *
 * @note If it is the first item, @c null will be returned.
 *
 * @param[in] obj The object.
 *
 * @return The item before or @c null.
 *
 * @ingroup Elm_List_Item_Group
  }
(* Const before type ignored *)
function elm_list_item_prev(obj:PElm_List_Item):PElm_Widget_Item;cdecl;external;
{*
 * @brief Get the item after the item in list.
 *
 * @note If it is the last item, @c null will be returned.
 *
 * @param[in] obj The object.
 *
 * @return The item after or @c null.
 *
 * @ingroup Elm_List_Item_Group
  }
(* Const before type ignored *)
function elm_list_item_next(obj:PElm_List_Item):PElm_Widget_Item;cdecl;external;
{*
 * @brief Show item in the list view.
 *
 * It won't animate list until item is visible. If such behavior is wanted, use
 * @ref elm_list_item_bring_in instead.
 * @param[in] obj The object.
 *
 * @ingroup Elm_List_Item_Group
  }
procedure elm_list_item_show(obj:PElm_List_Item);cdecl;external;
{*
 * @brief Bring in the given item to list view.
 *
 * This causes list to jump to the given item and show it (by scrolling), if it
 * is not fully visible.
 *
 * This may use animation to do so and take a period of time.
 *
 * If animation isn't wanted, @ref elm_list_item_show can be used.
 * @param[in] obj The object.
 *
 * @ingroup Elm_List_Item_Group
  }
procedure elm_list_item_bring_in(obj:PElm_List_Item);cdecl;external;
{$endif}

implementation


end.
