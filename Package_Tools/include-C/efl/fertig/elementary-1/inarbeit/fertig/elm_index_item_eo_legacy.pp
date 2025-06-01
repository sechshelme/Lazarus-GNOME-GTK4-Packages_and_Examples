
unit elm_index_item_eo_legacy;
interface

{
  Automatically converted by H2Pas 1.0.0 from elm_index_item_eo_legacy.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    elm_index_item_eo_legacy.h
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
Pchar  = ^char;
PElm_Index_Item  = ^Elm_Index_Item;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _ELM_INDEX_ITEM_EO_LEGACY_H_}
{$define _ELM_INDEX_ITEM_EO_LEGACY_H_}
{$ifndef _ELM_INDEX_ITEM_EO_CLASS_TYPE}
{$define _ELM_INDEX_ITEM_EO_CLASS_TYPE}
type
  PElm_Index_Item = ^TElm_Index_Item;
  TElm_Index_Item = TEo;
{$endif}
{$ifndef _ELM_INDEX_ITEM_EO_TYPES}
{$define _ELM_INDEX_ITEM_EO_TYPES}
{$endif}
{*
 * @defgroup Elm_Index_Item_Group Index Item
 * @ingroup Elm_Index_Group
  }
{*
 * @brief Set the selected state of an item.
 *
 * This sets the selected state of the given item @c it. @c true for selected,
 * @c false for not selected.
 *
 * If a new item is selected the previously selected will be unselected.
 * Previously selected item can be get with function
 * elm_index_selected_item_get().
 *
 * Selected items will be highlighted.
 *
 * @param[in] obj The object.
 * @param[in] selected @c true if selected, @c false otherwise
 *
 * @ingroup Elm_Index_Item_Group
  }

procedure elm_index_item_selected_set(obj:PElm_Index_Item; selected:TEina_Bool);cdecl;external;
{*
 * @brief Sets the priority of an item.
 *
 * The priority is -1 by default, which means that the item doesn't belong to a
 * group. The value of the priority starts from 0.
 *
 * In elm_index_level_go, the items are sorted in ascending order according to
 * priority. Items of the same priority make a group and the primary group is
 * shown by default.
 *
 * @param[in] obj The object.
 * @param[in] priority The priority
 *
 * @ingroup Elm_Index_Item_Group
  }
procedure elm_index_item_priority_set(obj:PElm_Index_Item; priority:longint);cdecl;external;
{*
 * @brief Get the letter (string) set on a given index widget item.
 *
 * @param[in] obj The object.
 *
 * @return The letter string set on @c item
 *
 * @ingroup Elm_Index_Item_Group
  }
(* Const before type ignored *)
(* Const before type ignored *)
function elm_index_item_letter_get(obj:PElm_Index_Item):Pchar;cdecl;external;
{$endif}

implementation


end.
