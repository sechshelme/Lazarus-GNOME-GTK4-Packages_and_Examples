
unit elm_menu_item_eo_legacy;
interface

{
  Automatically converted by H2Pas 1.0.0 from elm_menu_item_eo_legacy.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    elm_menu_item_eo_legacy.h
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
PEfl_Canvas_Object  = ^Efl_Canvas_Object;
PEina_List  = ^Eina_List;
PElm_Menu_Item  = ^Elm_Menu_Item;
PElm_Widget_Item  = ^Elm_Widget_Item;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _ELM_MENU_ITEM_EO_LEGACY_H_}
{$define _ELM_MENU_ITEM_EO_LEGACY_H_}
{$ifndef _ELM_MENU_ITEM_EO_CLASS_TYPE}
{$define _ELM_MENU_ITEM_EO_CLASS_TYPE}
type
  PElm_Menu_Item = ^TElm_Menu_Item;
  TElm_Menu_Item = TEo;
{$endif}
{$ifndef _ELM_MENU_ITEM_EO_TYPES}
{$define _ELM_MENU_ITEM_EO_TYPES}
{$endif}
{*
 * @brief Set the icon of a menu item to the standard icon with the given name.
 *
 * Once this icon is set, any previously set icon will be deleted. To hide icon
 * set it to "".
 *
 * @param[in] obj The object.
 * @param[in] icon The name of icon object.
 *
 * @ingroup Elm_Menu_Item_Group
  }
(* Const before type ignored *)

procedure elm_menu_item_icon_name_set(obj:PElm_Menu_Item; icon:Pchar);cdecl;external;
{*
 * @brief Get the string representation from the icon of a menu item
 *
 * Once this icon is set, any previously set icon will be deleted. To hide icon
 * set it to "".
 *
 * @param[in] obj The object.
 *
 * @return The name of icon object.
 *
 * @ingroup Elm_Menu_Item_Group
  }
(* Const before type ignored *)
(* Const before type ignored *)
function elm_menu_item_icon_name_get(obj:PElm_Menu_Item):Pchar;cdecl;external;
{*
 * @brief Get the item before this one in the widget's list of items.
 *
 * See also @ref elm_menu_item_next_get.
 *
 * @param[in] obj The object.
 *
 * @return The item before the object in its parent's list. If there is no
 * previous item or in case of error, @c null is returned.
 *
 * @ingroup Elm_Menu_Item_Group
  }
(* Const before type ignored *)
function elm_menu_item_prev_get(obj:PElm_Menu_Item):PElm_Widget_Item;cdecl;external;
{*
 * @brief Get the item after this one in the widget's list of items.
 *
 * See also @ref elm_menu_item_prev_get.
 *
 * @param[in] obj The object.
 *
 * @return The item after the object in its parent's list. If there is no next
 * item or in case of error, @c null is returned.
 *
 * @ingroup Elm_Menu_Item_Group
  }
(* Const before type ignored *)
function elm_menu_item_next_get(obj:PElm_Menu_Item):PElm_Widget_Item;cdecl;external;
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
 * @ref elm_menu_selected_item_get.
 *
 * Selected items will be highlighted.
 *
 * @param[in] obj The object.
 * @param[in] selected The selection state.
 *
 * @ingroup Elm_Menu_Item_Group
  }
procedure elm_menu_item_selected_set(obj:PElm_Menu_Item; selected:TEina_Bool);cdecl;external;
{*
 * @brief Indicates whether this item is currently selected.
 *
 * Get the selected state of this item.
 *
 * @param[in] obj The object.
 *
 * @return The selection state.
 *
 * @ingroup Elm_Menu_Item_Group
  }
(* Const before type ignored *)
function elm_menu_item_selected_get(obj:PElm_Menu_Item):TEina_Bool;cdecl;external;
{*
 * @brief Get the item index
 *
 * @param[in] obj The object.
 *
 * @return Item index
 *
 * @ingroup Elm_Menu_Item_Group
  }
(* Const before type ignored *)
function elm_menu_item_index_get(obj:PElm_Menu_Item):dword;cdecl;external;
{*
 * @brief Remove all sub-items (children) of the given item
 *
 * This removes all items that are children (and their descendants) of the
 * given item @c it.
 *
 * @param[in] obj The object.
 *
 * @since 1.8
 *
 * @ingroup Elm_Menu_Item_Group
  }
procedure elm_menu_item_subitems_clear(obj:PElm_Menu_Item);cdecl;external;
{*
 * @brief Returns a list of @c item's subitems.
 *
 * @param[in] obj The object.
 *
 * @return A list of @c item's subitems
 *
 * @ingroup Elm_Menu_Item_Group
  }
(* Const before type ignored *)
(* Const before type ignored *)
function elm_menu_item_subitems_get(obj:PElm_Menu_Item):PEina_List;cdecl;external;
{*
 * @brief Returns whether @c item is a separator.
 *
 * @param[in] obj The object.
 *
 * @return @c true if the item is a separator.
 *
 * @ingroup Elm_Menu_Item_Group
  }
(* Const before type ignored *)
function elm_menu_item_is_separator(obj:PElm_Menu_Item):TEina_Bool;cdecl;external;
{*
 * @brief Get the real Evas(Edje) object created to implement the view of a
 * given menu item.
 *
 * @warning Don't manipulate this object!
 *
 * @param[in] obj The object.
 *
 * @return The base Edje object containing the swallowed content associated
 * with the item.
 *
 * @ingroup Elm_Menu_Item_Group
  }
(* Const before type ignored *)
function elm_menu_item_object_get(obj:PElm_Menu_Item):PEfl_Canvas_Object;cdecl;external;
{$endif}

implementation


end.
