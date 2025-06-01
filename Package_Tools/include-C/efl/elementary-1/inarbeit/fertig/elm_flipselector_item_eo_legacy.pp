
unit elm_flipselector_item_eo_legacy;
interface

{
  Automatically converted by H2Pas 1.0.0 from elm_flipselector_item_eo_legacy.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    elm_flipselector_item_eo_legacy.h
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
PElm_Flipselector_Item  = ^Elm_Flipselector_Item;
PElm_Widget_Item  = ^Elm_Widget_Item;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _ELM_FLIPSELECTOR_ITEM_EO_LEGACY_H_}
{$define _ELM_FLIPSELECTOR_ITEM_EO_LEGACY_H_}
{$ifndef _ELM_FLIPSELECTOR_ITEM_EO_CLASS_TYPE}
{$define _ELM_FLIPSELECTOR_ITEM_EO_CLASS_TYPE}
type
  PElm_Flipselector_Item = ^TElm_Flipselector_Item;
  TElm_Flipselector_Item = TEo;
{$endif}
{$ifndef _ELM_FLIPSELECTOR_ITEM_EO_TYPES}
{$define _ELM_FLIPSELECTOR_ITEM_EO_TYPES}
{$endif}
{*
 * @brief Set whether a given flip selector widget's item should be the
 * currently selected one.
 *
 * This sets whether @c item is or not the selected (thus, under display) one.
 * If @c item is different than the one under display, the latter will be
 * unselected. If the @c item is set to be unselected, on the other hand, the
 * first item in the widget's internal members list will be the new selected
 * one.
 *
 * See also @ref elm_flipselector_item_selected_get.
 *
 * @param[in] obj The object.
 * @param[in] selected @c true if selected, @c false otherwise.
 *
 * @ingroup Elm_Flipselector_Item_Group
  }

procedure elm_flipselector_item_selected_set(obj:PElm_Flipselector_Item; selected:TEina_Bool);cdecl;external;
{*
 * @brief Get whether a given flip selector widget's item is the currently
 * selected one.
 *
 * See also @ref elm_flipselector_item_selected_set.
 *
 * @param[in] obj The object.
 *
 * @return @c true if selected, @c false otherwise.
 *
 * @ingroup Elm_Flipselector_Item_Group
  }
(* Const before type ignored *)
function elm_flipselector_item_selected_get(obj:PElm_Flipselector_Item):TEina_Bool;cdecl;external;
{*
 * @brief Get the item before @c item in a flip selector widget's internal list
 * of items.
 *
 * See also @ref elm_flipselector_item_next_get.
 *
 * @param[in] obj The object.
 *
 * @return The item before the @c item, in its parent's list. If there is no
 * previous item for @c item or there's an error, @c null is returned.
 *
 * @ingroup Elm_Flipselector_Item_Group
  }
(* Const before type ignored *)
function elm_flipselector_item_prev_get(obj:PElm_Flipselector_Item):PElm_Widget_Item;cdecl;external;
{*
 * @brief Get the item after @c item in a flip selector widget's internal list
 * of items.
 *
 * See also @ref elm_flipselector_item_prev_get.
 *
 * @param[in] obj The object.
 *
 * @return The item after the @c item, in its parent's list. If there is no
 * next item for @c item or there's an error, @c null is returned.
 *
 * @ingroup Elm_Flipselector_Item_Group
  }
(* Const before type ignored *)
function elm_flipselector_item_next_get(obj:PElm_Flipselector_Item):PElm_Widget_Item;cdecl;external;
{$endif}

implementation


end.
