
unit elm_diskselector_item_eo_legacy;
interface

{
  Automatically converted by H2Pas 1.0.0 from elm_diskselector_item_eo_legacy.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    elm_diskselector_item_eo_legacy.h
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
PElm_Diskselector_Item  = ^Elm_Diskselector_Item;
PElm_Widget_Item  = ^Elm_Widget_Item;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _ELM_DISKSELECTOR_ITEM_EO_LEGACY_H_}
{$define _ELM_DISKSELECTOR_ITEM_EO_LEGACY_H_}
{$ifndef _ELM_DISKSELECTOR_ITEM_EO_CLASS_TYPE}
{$define _ELM_DISKSELECTOR_ITEM_EO_CLASS_TYPE}
type
  PElm_Diskselector_Item = ^TElm_Diskselector_Item;
  TElm_Diskselector_Item = TEo;
{$endif}
{$ifndef _ELM_DISKSELECTOR_ITEM_EO_TYPES}
{$define _ELM_DISKSELECTOR_ITEM_EO_TYPES}
{$endif}
{*
 * @brief Get the item before @c item in diskselector.
 *
 * The list of items follows append order. So it will return item appended just
 * before @c item and that wasn't deleted.
 *
 * If it is the first item, @c null will be returned. First item can be get by
 * @ref elm_diskselector_first_item_get.
 *
 * See also @ref elm_diskselector_item_append, @ref elm_diskselector_items_get.
 *
 * @param[in] obj The object.
 *
 * @return The item before @c item, or @c null if none or on failure.
 *
 * @ingroup Elm_Diskselector_Item_Group
  }
(* Const before type ignored *)

function elm_diskselector_item_prev_get(obj:PElm_Diskselector_Item):PElm_Widget_Item;cdecl;external;
{*
 * @brief Get the item after @c item in diskselector.
 *
 * The list of items follows append order. So it will return item appended just
 * after @c item and that wasn't deleted.
 *
 * If it is the last item, @c null will be returned. Last item can be get by
 * @ref elm_diskselector_last_item_get.
 *
 * See also @ref elm_diskselector_item_append, @ref elm_diskselector_items_get.
 *
 * @param[in] obj The object.
 *
 * @return The item after @c item, or @c null if none or on failure.
 *
 * @ingroup Elm_Diskselector_Item_Group
  }
(* Const before type ignored *)
function elm_diskselector_item_next_get(obj:PElm_Diskselector_Item):PElm_Widget_Item;cdecl;external;
{*
 * @brief Set the selected state of an item.
 *
 * This sets the selected state of the given @c item as @c true, for selected
 * and @c false for not selected.
 *
 * If a new item is selected the previously selected will be unselected.
 * Previously selected item can be get with function @ref
 * elm_diskselector_selected_item_get.
 *
 * If the @c item is unselected, the first item of diskselector will be
 * selected.
 *
 * Selected items will be visible on center position of diskselector. So if it
 * was on another position before selected, or was invisible, diskselector will
 * animate items until the selected item reaches center position.
 *
 * See also @ref elm_diskselector_item_selected_get, @ref
 * elm_diskselector_selected_item_get.
 *
 * @param[in] obj The object.
 * @param[in] selected The selected state
 *
 * @ingroup Elm_Diskselector_Item_Group
  }
procedure elm_diskselector_item_selected_set(obj:PElm_Diskselector_Item; selected:TEina_Bool);cdecl;external;
{*
 * @brief Get whether the @c item is selected or not.
 *
 * See also @ref elm_diskselector_selected_item_set for details, @ref
 * elm_diskselector_item_selected_get.
 *
 * @param[in] obj The object.
 *
 * @return The selected state
 *
 * @ingroup Elm_Diskselector_Item_Group
  }
(* Const before type ignored *)
function elm_diskselector_item_selected_get(obj:PElm_Diskselector_Item):TEina_Bool;cdecl;external;
{$endif}

implementation


end.
