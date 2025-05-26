
unit elm_toolbar_item_eo_legacy;
interface

{
  Automatically converted by H2Pas 1.0.0 from elm_toolbar_item_eo_legacy.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    elm_toolbar_item_eo_legacy.h
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
PElm_Toolbar_Item  = ^Elm_Toolbar_Item;
PElm_Toolbar_Item_Scrollto_Type  = ^Elm_Toolbar_Item_Scrollto_Type;
PElm_Toolbar_Item_State  = ^Elm_Toolbar_Item_State;
PElm_Widget_Item  = ^Elm_Widget_Item;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _ELM_TOOLBAR_ITEM_EO_LEGACY_H_}
{$define _ELM_TOOLBAR_ITEM_EO_LEGACY_H_}
{$ifndef _ELM_TOOLBAR_ITEM_EO_CLASS_TYPE}
{$define _ELM_TOOLBAR_ITEM_EO_CLASS_TYPE}
type
  PElm_Toolbar_Item = ^TElm_Toolbar_Item;
  TElm_Toolbar_Item = TEo;
{$endif}
{$ifndef _ELM_TOOLBAR_ITEM_EO_TYPES}
{$define _ELM_TOOLBAR_ITEM_EO_TYPES}
{* Defines where to position the item in the toolbar.
 *
 * @ingroup Elm
  }
{*< no scrollto  }
{ 1 >> 0  }{*< to the nearest viewport  }
{ 1 >> 1  }{*< to the first of
                                                     * viewport  }
{ 1 >> 2  }{*< to the middle of
                                                      * viewport  }
{ 1 >> 3  }{*< to the last of viewport
                                                    }
type
  PElm_Toolbar_Item_Scrollto_Type = ^TElm_Toolbar_Item_Scrollto_Type;
  TElm_Toolbar_Item_Scrollto_Type =  Longint;
  Const
    ELM_TOOLBAR_ITEM_SCROLLTO_NONE = 0;
    ELM_TOOLBAR_ITEM_SCROLLTO_IN = 1;
    ELM_TOOLBAR_ITEM_SCROLLTO_FIRST = 2;
    ELM_TOOLBAR_ITEM_SCROLLTO_MIDDLE = 4;
    ELM_TOOLBAR_ITEM_SCROLLTO_LAST = 8;
;
{* State of a Elm_Toolbar_Item. Can be created with
 * elm_toolbar_item_state_add() and removed with elm_toolbar_item_state_del().
 *
 * @ingroup Elm
  }
(* Const before type ignored *)
{*< Item label  }
(* Const before type ignored *)
{*< Item icon string  }
{*< Item icon  }
{*< Item callback function  }
(* Const before type ignored *)
{*< Item data  }
type
  PElm_Toolbar_Item_State = ^TElm_Toolbar_Item_State;
  TElm_Toolbar_Item_State = record
      _label : Pchar;
      icon_str : Pchar;
      icon : PEfl_Canvas_Object;
      func : TEvas_Smart_Cb;
      data : pointer;
    end;
{$endif}
{*
 * @brief Get the item before this one in the widget's list of items.
 *
 * See also @ref elm_toolbar_item_next_get.
 *
 * @param[in] obj The object.
 *
 * @return The item before the object in its parent's list. If there is no
 * previous item or in case of error, @c null is returned.
 *
 * @ingroup Elm_Toolbar_Item_Group
  }
(* Const before type ignored *)

function elm_toolbar_item_prev_get(obj:PElm_Toolbar_Item):PElm_Widget_Item;cdecl;external;
{*
 * @brief Get the item after this one in the widget's list of items.
 *
 * See also @ref elm_toolbar_item_prev_get.
 *
 * @param[in] obj The object.
 *
 * @return The item after the object in its parent's list. If there is no next
 * item or in case of error, @c null is returned.
 *
 * @ingroup Elm_Toolbar_Item_Group
  }
(* Const before type ignored *)
function elm_toolbar_item_next_get(obj:PElm_Toolbar_Item):PElm_Widget_Item;cdecl;external;
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
 * @ref elm_toolbar_selected_item_get.
 *
 * Selected items will be highlighted.
 *
 * @param[in] obj The object.
 * @param[in] selected The selection state.
 *
 * @ingroup Elm_Toolbar_Item_Group
  }
procedure elm_toolbar_item_selected_set(obj:PElm_Toolbar_Item; selected:TEina_Bool);cdecl;external;
{*
 * @brief Indicates whether this item is currently selected.
 *
 * Get the selected state of this item.
 *
 * @param[in] obj The object.
 *
 * @return The selection state.
 *
 * @ingroup Elm_Toolbar_Item_Group
  }
(* Const before type ignored *)
function elm_toolbar_item_selected_get(obj:PElm_Toolbar_Item):TEina_Bool;cdecl;external;
{*
 * @brief Set the priority of a toolbar item.
 *
 * This is used only when the toolbar shrink mode is set to
 * #ELM_TOOLBAR_SHRINK_MENU or #ELM_TOOLBAR_SHRINK_HIDE. When space is less
 * than required, items with low priority will be removed from the toolbar and
 * added to a dynamically-created menu, while items with higher priority will
 * remain on the toolbar, with the same order they were added.
 *
 * @param[in] obj The object.
 * @param[in] priority The @c item priority. The default is zero for set and 0
 * is returned on failure.
 *
 * @ingroup Elm_Toolbar_Item_Group
  }
procedure elm_toolbar_item_priority_set(obj:PElm_Toolbar_Item; priority:longint);cdecl;external;
{*
 * @brief Get the priority of a toolbar item.
 *
 * @param[in] obj The object.
 *
 * @return The @c item priority. The default is zero for set and 0 is returned
 * on failure.
 *
 * @ingroup Elm_Toolbar_Item_Group
  }
(* Const before type ignored *)
function elm_toolbar_item_priority_get(obj:PElm_Toolbar_Item):longint;cdecl;external;
{*
 * @brief Set the icon associated with @c item.
 *
 * Toolbar will load icon image from fdo or current theme. This behavior can be
 * set by elm_toolbar_icon_order_lookup_set function. If an absolute path is
 * provided it will load it direct from a file.
 *
 * @note This function does not accept relative icon path.
 *
 * @param[in] obj The object.
 * @param[in] icon A string with icon name or the absolute path of an image
 * file.
 *
 * @ingroup Elm_Toolbar_Item_Group
  }
(* Const before type ignored *)
procedure elm_toolbar_item_icon_set(obj:PElm_Toolbar_Item; icon:Pchar);cdecl;external;
{*
 * @brief Get the string used to set the icon of @c item.
 *
 * @param[in] obj The object.
 *
 * @return A string with icon name or the absolute path of an image file.
 *
 * @ingroup Elm_Toolbar_Item_Group
  }
(* Const before type ignored *)
(* Const before type ignored *)
function elm_toolbar_item_icon_get(obj:PElm_Toolbar_Item):Pchar;cdecl;external;
{*
 * @brief Get the real Evas(Edje) object created to implement the view of a
 * given toolbar @c item.
 *
 * @param[in] obj The object.
 *
 * @return The base Edje object associated with @c it.
 *
 * @ingroup Elm_Toolbar_Item_Group
  }
(* Const before type ignored *)
function elm_toolbar_item_object_get(obj:PElm_Toolbar_Item):PEfl_Canvas_Object;cdecl;external;
{*
 * @brief Get the icon object of @c item.
 *
 * See also @ref elm_toolbar_item_icon_set,
 * @ref elm_toolbar_item_icon_file_set, @ref elm_toolbar_item_icon_memfile_set.
 *
 * @param[in] obj The object.
 *
 * @return The icon object.
 *
 * @ingroup Elm_Toolbar_Item_Group
  }
(* Const before type ignored *)
function elm_toolbar_item_icon_object_get(obj:PElm_Toolbar_Item):PEfl_Canvas_Object;cdecl;external;
{*
 * @brief Set or unset item as a separator.
 *
 * Items aren't set as separator by default.
 *
 * If set as separator it will display separator theme, so won't display icons
 * or label.
 *
 * @param[in] obj The object.
 * @param[in] separator @c true if the item is a separator, @c false otherwise
 *
 * @ingroup Elm_Toolbar_Item_Group
  }
procedure elm_toolbar_item_separator_set(obj:PElm_Toolbar_Item; separator:TEina_Bool);cdecl;external;
{*
 * @brief Get a value whether item is a separator or not.
 *
 * @param[in] obj The object.
 *
 * @return @c true if the item is a separator, @c false otherwise
 *
 * @ingroup Elm_Toolbar_Item_Group
  }
(* Const before type ignored *)
function elm_toolbar_item_separator_get(obj:PElm_Toolbar_Item):TEina_Bool;cdecl;external;
{*
 * @brief Get toolbar item's menu.
 *
 * If @c item wasn't set as menu item with @ref elm_toolbar_item_menu_set, this
 * function will set it.
 *
 * @param[in] obj The object.
 *
 * @return Item's menu object or @c null on failure.
 *
 * @ingroup Elm_Toolbar_Item_Group
  }
(* Const before type ignored *)
function elm_toolbar_item_menu_get(obj:PElm_Toolbar_Item):PEfl_Canvas_Object;cdecl;external;
{*
 * @brief Set @c state as the current state of @c it.
 *
 * If @c state is @c NULL, it won't select any state and the default item's
 * icon and label will be used. It's the behavior as @ref
 * elm_toolbar_item_state_unset.
 *
 * @param[in] obj The object.
 * @param[in] state Item state
 *
 * @return @c true on success, @c false otherwise
 *
 * @ingroup Elm_Toolbar_Item_Group
  }
function elm_toolbar_item_state_set(obj:PElm_Toolbar_Item; state:PElm_Toolbar_Item_State):TEina_Bool;cdecl;external;
{*
 * @brief Get the current state of @c it.
 *
 * @param[in] obj The object.
 *
 * @return Item state
 *
 * @ingroup Elm_Toolbar_Item_Group
  }
(* Const before type ignored *)
function elm_toolbar_item_state_get(obj:PElm_Toolbar_Item):PElm_Toolbar_Item_State;cdecl;external;
{*
 * @brief Set the icon associated with @c item to an image in a binary buffer.
 *
 * @note The icon image set by this function can be changed by
 * @ref elm_toolbar_item_icon_set.
 *
 * @param[in] obj The object.
 * @param[in] img The binary data that will be used as an image.
 * @param[in] size The size of binary data @c img.
 * @param[in] format Optional format of @c img to pass to the image loader.
 * @param[in] key Optional key of @c img to pass to the image loader (eg. if
 * @c img is an edje file).
 *
 * @return @c true on success, @c false otherwise
 *
 * @ingroup Elm_Toolbar_Item_Group
  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function elm_toolbar_item_icon_memfile_set(obj:PElm_Toolbar_Item; img:pointer; size:Tsize_t; format:Pchar; key:Pchar):TEina_Bool;cdecl;external;
{*
 * @brief Set the icon associated with @c item to an image in a binary buffer.
 *
 * @note The icon image set by this function can be changed by
 * elm_toolbar_item_icon_set().
 *
 * @param[in] obj The object.
 * @param[in] file The file that contains the image.
 * @param[in] key Optional key of @c img to pass to the image loader (eg. if
 * @c img is an edje file).
 *
 * @return @c true on success, @c false otherwise
 *
 * @ingroup Elm_Toolbar_Item_Group
  }
(* Const before type ignored *)
(* Const before type ignored *)
function elm_toolbar_item_icon_file_set(obj:PElm_Toolbar_Item; file:Pchar; key:Pchar):TEina_Bool;cdecl;external;
{*
 * @brief Add a new state to @c item.
 *
 * Toolbar will load icon image from fdo or current theme. This behavior can be
 * set by elm_toolbar_icon_order_lookup_set function. If an absolute path is
 * provided it will load it direct from a file.
 *
 * States created with this function can be removed with
 * @ref elm_toolbar_item_state_del.
 *
 * @param[in] obj The object.
 * @param[in] icon A string with icon name or the absolute path of an image
 * file.
 * @param[in] label The label of the new state.
 * @param[in] func The function to call when the item is clicked when this
 * state is selected.
 * @param[in] data The data to associate with the state.
 *
 * @return The toolbar item state, or @c null upon failure.
 *
 * @ingroup Elm_Toolbar_Item_Group
  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function elm_toolbar_item_state_add(obj:PElm_Toolbar_Item; icon:Pchar; _label:Pchar; func:TEvas_Smart_Cb; data:pointer):PElm_Toolbar_Item_State;cdecl;external;
{*
 * @brief Delete a previously added state to @c item.
 *
 * @param[in] obj The object.
 * @param[in] state The state to be deleted.
 *
 * @return @c true on success or @c false on failure.
 *
 * @ingroup Elm_Toolbar_Item_Group
  }
function elm_toolbar_item_state_del(obj:PElm_Toolbar_Item; state:PElm_Toolbar_Item_State):TEina_Bool;cdecl;external;
{*
 * @brief Get the state after selected state in toolbar's @c item.
 *
 * If last state is selected, this function will return first state.
 *
 * @param[in] obj The object.
 *
 * @return The state after current state, or @c null on failure.
 *
 * @ingroup Elm_Toolbar_Item_Group
  }
function elm_toolbar_item_state_next(obj:PElm_Toolbar_Item):PElm_Toolbar_Item_State;cdecl;external;
{*
 * @brief Get the state before selected state in toolbar's @c item.
 *
 * If first state is selected, this function will return last state.
 *
 * @param[in] obj The object.
 *
 * @return The state before current state, or @c null on failure.
 *
 * @ingroup Elm_Toolbar_Item_Group
  }
function elm_toolbar_item_state_prev(obj:PElm_Toolbar_Item):PElm_Toolbar_Item_State;cdecl;external;
{*
 * @brief Show a specific item, when the toolbar can be scrolled.
 *
 * @param[in] obj The object.
 * @param[in] scrollto The position the item should appear at.
 *
 * @since 1.8
 *
 * @ingroup Elm_Toolbar_Item_Group
  }
procedure elm_toolbar_item_show(obj:PElm_Toolbar_Item; scrollto:TElm_Toolbar_Item_Scrollto_Type);cdecl;external;
{*
 * @brief Show a specific item with scroll animation, when the toolbar can be
 * scrolled.
 *
 * @param[in] obj The object.
 * @param[in] scrollto The position the item should appear at.
 *
 * @since 1.8
 *
 * @ingroup Elm_Toolbar_Item_Group
  }
procedure elm_toolbar_item_bring_in(obj:PElm_Toolbar_Item; scrollto:TElm_Toolbar_Item_Scrollto_Type);cdecl;external;
{*
 * @brief Set whether the toolbar item opens a menu.
 *
 * A toolbar item can be set to be a menu, using this function.
 *
 * Once it is set to be a menu, it can be manipulated through the menu-like
 * function @ref elm_toolbar_menu_parent_set and the other elm_menu functions,
 * using the Evas_Object @c menu returned by @ref elm_toolbar_item_menu_get.
 *
 * So, items to be displayed in this item's menu should be added with @ref
 * elm_menu_item_add.
 *
 * @param[in] obj The object.
 * @param[in] menu If @c true, @c item will opens a menu when selected.
 *
 * @ingroup Elm_Toolbar_Item_Group
  }
procedure elm_toolbar_item_menu_set(obj:PElm_Toolbar_Item; menu:TEina_Bool);cdecl;external;
{$endif}

implementation


end.
