
unit elm_ctxpopup_item_eo_legacy;
interface

{
  Automatically converted by H2Pas 1.0.0 from elm_ctxpopup_item_eo_legacy.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    elm_ctxpopup_item_eo_legacy.h
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
PElm_Ctxpopup_Item  = ^Elm_Ctxpopup_Item;
PElm_Widget_Item  = ^Elm_Widget_Item;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _ELM_CTXPOPUP_ITEM_EO_LEGACY_H_}
{$define _ELM_CTXPOPUP_ITEM_EO_LEGACY_H_}
{$ifndef _ELM_CTXPOPUP_ITEM_EO_CLASS_TYPE}
{$define _ELM_CTXPOPUP_ITEM_EO_CLASS_TYPE}
type
  PElm_Ctxpopup_Item = ^TElm_Ctxpopup_Item;
  TElm_Ctxpopup_Item = TEo;
{$endif}
{$ifndef _ELM_CTXPOPUP_ITEM_EO_TYPES}
{$define _ELM_CTXPOPUP_ITEM_EO_TYPES}
{$endif}
{*
 * @brief Get the item before this one in the widget's list of items.
 *
 * See also @ref elm_ctxpopup_item_next_get.
 *
 * @param[in] obj The object.
 *
 * @return The item before the object in its parent's list. If there is no
 * previous item or in case of error, @c null is returned.
 *
 * @ingroup Elm_Ctxpopup_Item_Group
  }
(* Const before type ignored *)

function elm_ctxpopup_item_prev_get(obj:PElm_Ctxpopup_Item):PElm_Widget_Item;cdecl;external;
{*
 * @brief Get the item after this one in the widget's list of items.
 *
 * See also @ref elm_ctxpopup_item_prev_get.
 *
 * @param[in] obj The object.
 *
 * @return The item after the object in its parent's list. If there is no next
 * item or in case of error, @c null is returned.
 *
 * @ingroup Elm_Ctxpopup_Item_Group
  }
(* Const before type ignored *)
function elm_ctxpopup_item_next_get(obj:PElm_Ctxpopup_Item):PElm_Widget_Item;cdecl;external;
{*
 * @brief Indicates whether this item is currently selected.
 *
 * Set the selected state of @c item.
 *
 * This sets the selected state of the given item @c it. @c true for selected,
 * @c false for not selected.
 *
 * If a new item is selected the previously selected will be unselected.
 * Previously selected item can be retrieved with
 * @ref elm_ctxpopup_selected_item_get.
 *
 * Selected items will be highlighted.
 *
 * @param[in] obj The object.
 * @param[in] selected The selection state.
 *
 * @ingroup Elm_Ctxpopup_Item_Group
  }
procedure elm_ctxpopup_item_selected_set(obj:PElm_Ctxpopup_Item; selected:TEina_Bool);cdecl;external;
{*
 * @brief Indicates whether this item is currently selected.
 *
 * Get the selected state of this item.
 *
 * @param[in] obj The object.
 *
 * @return The selection state.
 *
 * @ingroup Elm_Ctxpopup_Item_Group
  }
(* Const before type ignored *)
function elm_ctxpopup_item_selected_get(obj:PElm_Ctxpopup_Item):TEina_Bool;cdecl;external;
{*
 * @brief Init context popup item
 *
 * @param[in] obj The object.
 * @param[in] func Smart callback function
 * @param[in] data Data pointer
 *
 * @ingroup Elm_Ctxpopup_Item_Group
  }
(* Const before type ignored *)
procedure elm_ctxpopup_item_init(obj:PElm_Ctxpopup_Item; func:TEvas_Smart_Cb; data:pointer);cdecl;external;
{$endif}

implementation


end.
