
unit elm_menu_eo_legacy;
interface

{
  Automatically converted by H2Pas 1.0.0 from elm_menu_eo_legacy.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    elm_menu_eo_legacy.h
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
PEina_List  = ^Eina_List;
PElm_Menu  = ^Elm_Menu;
PElm_Widget_Item  = ^Elm_Widget_Item;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _ELM_MENU_EO_LEGACY_H_}
{$define _ELM_MENU_EO_LEGACY_H_}
{$ifndef _ELM_MENU_EO_CLASS_TYPE}
{$define _ELM_MENU_EO_CLASS_TYPE}
type
  PElm_Menu = ^TElm_Menu;
  TElm_Menu = TEo;
{$endif}
{$ifndef _ELM_MENU_EO_TYPES}
{$define _ELM_MENU_EO_TYPES}
{$endif}
{*
 * @brief Get the selected item in the widget.
 *
 * @param[in] obj The object.
 *
 * @return The selected item or @c null.
 *
 * @ingroup Elm_Menu_Group
  }
(* Const before type ignored *)

function elm_menu_selected_item_get(obj:PElm_Menu):PElm_Widget_Item;cdecl;external;
{*
 * @brief Get the first item in the widget.
 *
 * @param[in] obj The object.
 *
 * @return The first item or @c null.
 *
 * @ingroup Elm_Menu_Group
  }
(* Const before type ignored *)
function elm_menu_first_item_get(obj:PElm_Menu):PElm_Widget_Item;cdecl;external;
{*
 * @brief Get the last item in the widget.
 *
 * @param[in] obj The object.
 *
 * @return The last item or @c null.
 *
 * @ingroup Elm_Menu_Group
  }
(* Const before type ignored *)
function elm_menu_last_item_get(obj:PElm_Menu):PElm_Widget_Item;cdecl;external;
{*
 * @brief Returns a list of the widget item.
 *
 * @param[in] obj The object.
 *
 * @return const list to widget items
 *
 * @ingroup Elm_Menu_Group
  }
(* Const before type ignored *)
(* Const before type ignored *)
function elm_menu_items_get(obj:PElm_Menu):PEina_List;cdecl;external;
{*
 * @brief Move the menu to a new position
 *
 * Sets the top-left position of the menu to ($x, @c y).
 *
 * @note @c x and @c y coordinates are relative to parent.
 *
 * @param[in] obj The object.
 * @param[in] x The new X coordinate
 * @param[in] y The new Y coordinate
 *
 * @ingroup Elm_Menu_Group
  }
procedure elm_menu_move(obj:PElm_Menu; x:longint; y:longint);cdecl;external;
{*
 * @brief Add an item at the end of the given menu widget.
 *
 * @note This function does not accept relative icon path.
 *
 * @param[in] obj The object.
 * @param[in] parent The parent menu item (optional).
 * @param[in] icon An icon display on the item. The icon will be destroyed by
 * the menu.
 * @param[in] label The label of the item.
 * @param[in] func Function called when the user select the item.
 * @param[in] data Data sent by the callback.
 *
 * @return The new menu item.
 *
 * @ingroup Elm_Menu_Group
  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function elm_menu_item_add(obj:PElm_Menu; parent:PElm_Widget_Item; icon:Pchar; _label:Pchar; func:TEvas_Smart_Cb; 
           data:pointer):PElm_Widget_Item;cdecl;external;
{*
 * @brief Open a closed menu
 *
 * Show the menu with no child sub-menus expanded..
 * @param[in] obj The object.
 *
 * @ingroup Elm_Menu_Group
  }
procedure elm_menu_open(obj:PElm_Menu);cdecl;external;
{*
 * @brief Close a opened menu
 *
 * Hides the menu and all it's sub-menus.
 * @param[in] obj The object.
 *
 * @ingroup Elm_Menu_Group
  }
procedure elm_menu_close(obj:PElm_Menu);cdecl;external;
{*
 * @brief Add a separator item to menu @c obj under @c parent.
 *
 * @param[in] obj The object.
 * @param[in] parent The item to add the separator under.
 *
 * @return The created item or @c null.
 *
 * @ingroup Elm_Menu_Group
  }
function elm_menu_item_separator_add(obj:PElm_Menu; parent:PElm_Widget_Item):PElm_Widget_Item;cdecl;external;
{$endif}

implementation


end.
