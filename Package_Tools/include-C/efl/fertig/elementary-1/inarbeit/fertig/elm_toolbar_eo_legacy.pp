
unit elm_toolbar_eo_legacy;
interface

{
  Automatically converted by H2Pas 1.0.0 from elm_toolbar_eo_legacy.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    elm_toolbar_eo_legacy.h
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
PEina_Iterator  = ^Eina_Iterator;
PElm_Toolbar  = ^Elm_Toolbar;
PElm_Toolbar_Shrink_Mode  = ^Elm_Toolbar_Shrink_Mode;
PElm_Widget_Item  = ^Elm_Widget_Item;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _ELM_TOOLBAR_EO_LEGACY_H_}
{$define _ELM_TOOLBAR_EO_LEGACY_H_}
{$ifndef _ELM_TOOLBAR_EO_CLASS_TYPE}
{$define _ELM_TOOLBAR_EO_CLASS_TYPE}
type
  PElm_Toolbar = ^TElm_Toolbar;
  TElm_Toolbar = TEo;
{$endif}
{$ifndef _ELM_TOOLBAR_EO_TYPES}
{$define _ELM_TOOLBAR_EO_TYPES}
{*
 * @brief Set toolbar's items display behavior, it can be scrollable, show a
 * menu with exceeding items, or simply hide them.
 *
 * Default value is #ELM_TOOLBAR_SHRINK_MENU. It reads value from elm config.
 *
 * Values don't work as bitmask, only one can be chosen.
 *
 * See also @ref elm_toolbar_shrink_mode_set, @ref elm_toolbar_shrink_mode_get.
 *
 * @ingroup Elm_Toolbar
  }
{*< Set toolbar minimum size to fit all the
                                * items.  }
{*< Hide exceeding items.  }
{*< Allow accessing exceeding items through a
                              * scroller.  }
{*< Inserts a button to pop up a menu with exceeding
                            * items.  }
{*< Expand all items according the size of the
                              * toolbar.  }
{*< Indicates error if returned by
                           * elm_toolbar_shrink_mode_get()  }
type
  PElm_Toolbar_Shrink_Mode = ^TElm_Toolbar_Shrink_Mode;
  TElm_Toolbar_Shrink_Mode =  Longint;
  Const
    ELM_TOOLBAR_SHRINK_NONE = 0;
    ELM_TOOLBAR_SHRINK_HIDE = 1;
    ELM_TOOLBAR_SHRINK_SCROLL = 2;
    ELM_TOOLBAR_SHRINK_MENU = 3;
    ELM_TOOLBAR_SHRINK_EXPAND = 4;
    ELM_TOOLBAR_SHRINK_LAST = 5;
;
{$endif}
{*
 * @brief Get the selected item in the widget.
 *
 * @param[in] obj The object.
 *
 * @return The selected item or @c null.
 *
 * @ingroup Elm_Toolbar
  }
(* Const before type ignored *)

function elm_toolbar_selected_item_get(obj:PElm_Toolbar):PElm_Widget_Item;cdecl;external;
{*
 * @brief Get the first item in the widget.
 *
 * @param[in] obj The object.
 *
 * @return The first item or @c null.
 *
 * @ingroup Elm_Toolbar
  }
(* Const before type ignored *)
function elm_toolbar_first_item_get(obj:PElm_Toolbar):PElm_Widget_Item;cdecl;external;
{*
 * @brief Get the last item in the widget.
 *
 * @param[in] obj The object.
 *
 * @return The last item or @c null.
 *
 * @ingroup Elm_Toolbar
  }
(* Const before type ignored *)
function elm_toolbar_last_item_get(obj:PElm_Toolbar):PElm_Widget_Item;cdecl;external;
{*
 * @brief Returns a list of the widget item.
 *
 * @param[in] obj The object.
 *
 * @return iterator to widget items
 *
 * @ingroup Elm_Toolbar
  }
(* Const before type ignored *)
function elm_toolbar_items_get(obj:PElm_Toolbar):PEina_Iterator;cdecl;external;
{*
 * @brief Control homogeneous mode.
 *
 * This will enable the homogeneous mode where items are of the same size.
 *
 * @param[in] obj The object.
 * @param[in] homogeneous Assume the items within the toolbar are of the same
 * size (true = on, false = off). Default is @c false.
 *
 * @ingroup Elm_Toolbar
  }
procedure elm_toolbar_homogeneous_set(obj:PElm_Toolbar; homogeneous:TEina_Bool);cdecl;external;
{*
 * @brief Control homogeneous mode.
 *
 * This will enable the homogeneous mode where items are of the same size.
 *
 * @param[in] obj The object.
 *
 * @return Assume the items within the toolbar are of the same size (true = on,
 * false = off). Default is @c false.
 *
 * @ingroup Elm_Toolbar
  }
(* Const before type ignored *)
function elm_toolbar_homogeneous_get(obj:PElm_Toolbar):TEina_Bool;cdecl;external;
{*
 * @brief Control the alignment of the items.
 *
 * Alignment of toolbar items, from 0.0 to indicates to align left, to 1.0, to
 * align to right. 0.5 centralize items.
 *
 * Centered items by default.
 *
 * @param[in] obj The object.
 * @param[in] align The new alignment, a float between 0.0 and 1.0.
 *
 * @ingroup Elm_Toolbar
  }
procedure elm_toolbar_align_set(obj:PElm_Toolbar; align:Tdouble);cdecl;external;
{*
 * @brief Control the alignment of the items.
 *
 * Alignment of toolbar items, from 0.0 to indicates to align left, to 1.0, to
 * align to right. 0.5 centralize items.
 *
 * Centered items by default.
 *
 * @param[in] obj The object.
 *
 * @return The new alignment, a float between 0.0 and 1.0.
 *
 * @ingroup Elm_Toolbar
  }
(* Const before type ignored *)
function elm_toolbar_align_get(obj:PElm_Toolbar):Tdouble;cdecl;external;
{*
 * @brief Control the toolbar select mode.
 *
 * elm_toolbar_select_mode_set() changes item select mode in the toolbar
 * widget. - #ELM_OBJECT_SELECT_MODE_DEFAULT : Items will only call their
 * selection func and callback when first becoming selected. Any further clicks
 * will do nothing, unless you set always select mode. -
 * #ELM_OBJECT_SELECT_MODE_ALWAYS : This means that, even if selected, every
 * click will make the selected callbacks be called. -
 * #ELM_OBJECT_SELECT_MODE_NONE : This will turn off the ability to select
 * items entirely and they will neither appear selected nor call selected
 * callback functions.
 *
 * @param[in] obj The object.
 * @param[in] mode The select mode If getting mode fails, it returns
 * #ELM_OBJECT_SELECT_MODE_MAX
 *
 * @ingroup Elm_Toolbar
  }
procedure elm_toolbar_select_mode_set(obj:PElm_Toolbar; mode:TElm_Object_Select_Mode);cdecl;external;
{*
 * @brief Control the toolbar select mode.
 *
 * elm_toolbar_select_mode_set() changes item select mode in the toolbar
 * widget. - #ELM_OBJECT_SELECT_MODE_DEFAULT : Items will only call their
 * selection func and callback when first becoming selected. Any further clicks
 * will do nothing, unless you set always select mode. -
 * #ELM_OBJECT_SELECT_MODE_ALWAYS : This means that, even if selected, every
 * click will make the selected callbacks be called. -
 * #ELM_OBJECT_SELECT_MODE_NONE : This will turn off the ability to select
 * items entirely and they will neither appear selected nor call selected
 * callback functions.
 *
 * @param[in] obj The object.
 *
 * @return The select mode If getting mode fails, it returns
 * #ELM_OBJECT_SELECT_MODE_MAX
 *
 * @ingroup Elm_Toolbar
  }
(* Const before type ignored *)
function elm_toolbar_select_mode_get(obj:PElm_Toolbar):TElm_Object_Select_Mode;cdecl;external;
{*
 * @brief Control the icon size, in pixels, to be used by toolbar items.
 *
 * @note Default value is $32. It reads value from elm config.
 *
 * @param[in] obj The object.
 * @param[in] icon_size The icon size in pixels
 *
 * @ingroup Elm_Toolbar
  }
procedure elm_toolbar_icon_size_set(obj:PElm_Toolbar; icon_size:longint);cdecl;external;
{*
 * @brief Control the icon size, in pixels, to be used by toolbar items.
 *
 * @note Default value is $32. It reads value from elm config.
 *
 * @param[in] obj The object.
 *
 * @return The icon size in pixels
 *
 * @ingroup Elm_Toolbar
  }
(* Const before type ignored *)
function elm_toolbar_icon_size_get(obj:PElm_Toolbar):longint;cdecl;external;
{*
 * @brief Control the item displaying mode of a given toolbar widget @c obj.
 *
 * The toolbar won't scroll under #ELM_TOOLBAR_SHRINK_NONE mode, but it will
 * enforce a minimum size, so that all the items will fit inside it. It won't
 * scroll and won't show the items that don't fit under
 * #ELM_TOOLBAR_SHRINK_HIDE mode. Finally, it'll scroll under
 * #ELM_TOOLBAR_SHRINK_SCROLL mode, and it will create a button to aggregate
 * items which didn't fit with the #ELM_TOOLBAR_SHRINK_MENU mode.
 *
 * If shrink mode is changed, Toolbar will send one of the following signal to
 * each item for informing the current shrink mode. "elm,state,shrink,default"
 * "elm,state,shrink,hide" "elm,state,shrink,scroll" "elm,state,shrink,menu"
 * "elm,state,shrink,expand"
 *
 * @warning This function's behavior will clash with those of
 * elm_scroller_policy_set(), so use either one of them, but not both.
 *
 * @param[in] obj The object.
 * @param[in] shrink_mode Toolbar's items display behavior
 *
 * @ingroup Elm_Toolbar
  }
procedure elm_toolbar_shrink_mode_set(obj:PElm_Toolbar; shrink_mode:TElm_Toolbar_Shrink_Mode);cdecl;external;
{*
 * @brief Control the item displaying mode of a given toolbar widget @c obj.
 *
 * The toolbar won't scroll under #ELM_TOOLBAR_SHRINK_NONE mode, but it will
 * enforce a minimum size, so that all the items will fit inside it. It won't
 * scroll and won't show the items that don't fit under
 * #ELM_TOOLBAR_SHRINK_HIDE mode. Finally, it'll scroll under
 * #ELM_TOOLBAR_SHRINK_SCROLL mode, and it will create a button to aggregate
 * items which didn't fit with the #ELM_TOOLBAR_SHRINK_MENU mode.
 *
 * If shrink mode is changed, Toolbar will send one of the following signal to
 * each item for informing the current shrink mode. "elm,state,shrink,default"
 * "elm,state,shrink,hide" "elm,state,shrink,scroll" "elm,state,shrink,menu"
 * "elm,state,shrink,expand"
 *
 * @warning This function's behavior will clash with those of
 * elm_scroller_policy_set(), so use either one of them, but not both.
 *
 * @param[in] obj The object.
 *
 * @return Toolbar's items display behavior
 *
 * @ingroup Elm_Toolbar
  }
(* Const before type ignored *)
function elm_toolbar_shrink_mode_get(obj:PElm_Toolbar):TElm_Toolbar_Shrink_Mode;cdecl;external;
{*
 * @brief Control the parent object of the toolbar items' menus.
 *
 * Each item can be set as item menu, with elm_toolbar_item_menu_set().
 *
 * For more details about setting the parent for toolbar menus, see
 * elm_menu_parent_set().
 *
 * See: elm_menu_parent_set() for details. See: elm_toolbar_item_menu_set() for
 * details.
 *
 * @param[in] obj The object.
 * @param[in] parent The parent of the menu objects.
 *
 * @ingroup Elm_Toolbar
  }
procedure elm_toolbar_menu_parent_set(obj:PElm_Toolbar; parent:PEfl_Canvas_Object);cdecl;external;
{*
 * @brief Control the parent object of the toolbar items' menus.
 *
 * Each item can be set as item menu, with elm_toolbar_item_menu_set().
 *
 * For more details about setting the parent for toolbar menus, see
 * elm_menu_parent_set().
 *
 * See: elm_menu_parent_set() for details. See: elm_toolbar_item_menu_set() for
 * details.
 *
 * @param[in] obj The object.
 *
 * @return The parent of the menu objects.
 *
 * @ingroup Elm_Toolbar
  }
(* Const before type ignored *)
function elm_toolbar_menu_parent_get(obj:PElm_Toolbar):PEfl_Canvas_Object;cdecl;external;
{*
 * @brief Set the standard priority of visible items in a toolbar
 *
 * If the priority of the item is up to standard priority, it is shown in basic
 * panel. The other items are located in more menu or panel. The more menu or
 * panel can be shown when the more item is clicked.
 *
 * @param[in] obj The object.
 * @param[in] priority The standard_priority of visible items
 *
 * @since 1.7
 *
 * @ingroup Elm_Toolbar
  }
procedure elm_toolbar_standard_priority_set(obj:PElm_Toolbar; priority:longint);cdecl;external;
{*
 * @brief Set the standard priority of visible items in a toolbar
 *
 * If the priority of the item is up to standard priority, it is shown in basic
 * panel. The other items are located in more menu or panel. The more menu or
 * panel can be shown when the more item is clicked.
 *
 * @param[in] obj The object.
 *
 * @return The standard_priority of visible items
 *
 * @since 1.7
 *
 * @ingroup Elm_Toolbar
  }
(* Const before type ignored *)
function elm_toolbar_standard_priority_get(obj:PElm_Toolbar):longint;cdecl;external;
{*
 * @brief Get the more item which is auto-generated by toolbar.
 *
 * Toolbar generates 'more' item when there is no more space to fit items in
 * and toolbar is in #ELM_TOOLBAR_SHRINK_MENU or #ELM_TOOLBAR_SHRINK_EXPAND
 * mode. The more item can be manipulated by elm_object_item_text_set() and
 * elm_object_item_content_set.
 *
 * @param[in] obj The object.
 *
 * @return The toolbar more item.
 *
 * @ingroup Elm_Toolbar
  }
(* Const before type ignored *)
function elm_toolbar_more_item_get(obj:PElm_Toolbar):PElm_Widget_Item;cdecl;external;
{*
 * @brief Insert a new item into the toolbar object before item @c before.
 *
 * A new item will be created and added to the toolbar. Its position in this
 * toolbar will be just before item @c before.
 *
 * Items created with this method can be deleted with elm_object_item_del().
 *
 * Associated @c data can be properly freed when item is deleted if a callback
 * function is set with elm_object_item_del_cb_set().
 *
 * If a function is passed as argument, it will be called every time this item
 * is selected, i.e., the user clicks over an unselected item. If such function
 * isn't needed, just passing @c NULL as @c func is enough. The same should be
 * done for @c data.
 *
 * Toolbar will load icon image from fdo or current theme. This behavior can be
 * set by elm_toolbar_icon_order_lookup_set() function. If an absolute path is
 * provided it will load it direct from a file.
 *
 * @note This function does not accept relative icon path.
 *
 * See: elm_toolbar_item_icon_set()
 *
 * @param[in] obj The object.
 * @param[in] before The toolbar item to insert before.
 * @param[in] icon A string with icon name or the absolute path of an image
 * file.
 * @param[in] label The label of the item.
 * @param[in] func The function to call when the item is clicked.
 * @param[in] data The data to associate with the item for related callbacks.
 *
 * @return The created item or @c NULL upon failure.
 *
 * @ingroup Elm_Toolbar
  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function elm_toolbar_item_insert_before(obj:PElm_Toolbar; before:PElm_Widget_Item; icon:Pchar; _label:Pchar; func:TEvas_Smart_Cb; 
           data:pointer):PElm_Widget_Item;cdecl;external;
{*
 * @brief Insert a new item into the toolbar object after item @c after.
 *
 * A new item will be created and added to the toolbar. Its position in this
 * toolbar will be just after item @c after.
 *
 * Items created with this method can be deleted with elm_object_item_del().
 *
 * Associated @c data can be properly freed when item is deleted if a callback
 * function is set with elm_object_item_del_cb_set().
 *
 * If a function is passed as argument, it will be called every time this item
 * is selected, i.e., the user clicks over an unselected item. If such function
 * isn't needed, just passing @c NULL as @c func is enough. The same should be
 * done for @c data.
 *
 * Toolbar will load icon image from fdo or current theme. This behavior can be
 * set by elm_toolbar_icon_order_lookup_set() function. If an absolute path is
 * provided it will load it direct from a file.
 *
 * @note This function does not accept relative icon path.
 *
 * See: elm_toolbar_item_icon_set()
 *
 * @param[in] obj The object.
 * @param[in] after The toolbar item to insert after.
 * @param[in] icon A string with icon name or the absolute path of an image
 * file.
 * @param[in] label The label of the item.
 * @param[in] func The function to call when the item is clicked.
 * @param[in] data The data to associate with the item for related callbacks.
 *
 * @return The created item or @c NULL upon failure.
 *
 * @ingroup Elm_Toolbar
  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function elm_toolbar_item_insert_after(obj:PElm_Toolbar; after:PElm_Widget_Item; icon:Pchar; _label:Pchar; func:TEvas_Smart_Cb; 
           data:pointer):PElm_Widget_Item;cdecl;external;
{*
 * @brief Append item to the toolbar.
 *
 * A new item will be created and appended to the toolbar, i.e., will be set as
 * last item.
 *
 * Items created with this method can be deleted with elm_object_item_del().
 *
 * Associated @c data can be properly freed when item is deleted if a callback
 * function is set with elm_object_item_del_cb_set().
 *
 * If a function is passed as argument, it will be called every time this item
 * is selected, i.e., the user clicks over an unselected item. If such function
 * isn't needed, just passing @c NULL as @c func is enough. The same should be
 * done for @c data.
 *
 * Toolbar will load icon image from fdo or current theme. This behavior can be
 * set by elm_toolbar_icon_order_lookup_set() function. If an absolute path is
 * provided it will load it direct from a file.
 *
 * @note This function does not accept relative icon path.
 *
 * See: elm_toolbar_item_icon_set()
 *
 * @param[in] obj The object.
 * @param[in] icon A string with icon name or the absolute path of an image
 * file.
 * @param[in] label The label of the item.
 * @param[in] func The function to call when the item is clicked.
 * @param[in] data The data to associate with the item for related callbacks.
 *
 * @return The created item or @c NULL upon failure.
 *
 * @ingroup Elm_Toolbar
  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function elm_toolbar_item_append(obj:PElm_Toolbar; icon:Pchar; _label:Pchar; func:TEvas_Smart_Cb; data:pointer):PElm_Widget_Item;cdecl;external;
{*
 * @brief Get the number of items in a toolbar
 *
 * @param[in] obj The object.
 *
 * @return The number of items in @c obj toolbar
 *
 * @ingroup Elm_Toolbar
  }
(* Const before type ignored *)
function elm_toolbar_items_count(obj:PElm_Toolbar):dword;cdecl;external;
{*
 * @brief Prepend item to the toolbar.
 *
 * A new item will be created and prepended to the toolbar, i.e., will be set
 * as first item.
 *
 * Items created with this method can be deleted with elm_object_item_del().
 *
 * Associated @c data can be properly freed when item is deleted if a callback
 * function is set with elm_object_item_del_cb_set().
 *
 * If a function is passed as argument, it will be called every time this item
 * is selected, i.e., the user clicks over an unselected item. If such function
 * isn't needed, just passing @c NULL as @c func is enough. The same should be
 * done for @c data.
 *
 * Toolbar will load icon image from fdo or current theme. This behavior can be
 * set by elm_toolbar_icon_order_lookup_set() function. If an absolute path is
 * provided it will load it direct from a file.
 *
 * @note This function does not accept relative icon path.
 *
 * See: elm_toolbar_item_icon_set()
 *
 * @param[in] obj The object.
 * @param[in] icon A string with icon name or the absolute path of an image
 * file.
 * @param[in] label The label of the item.
 * @param[in] func The function to call when the item is clicked.
 * @param[in] data The data to associate with the item for related callbacks.
 *
 * @return The created item or @c NULL upon failure.
 *
 * @ingroup Elm_Toolbar
  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function elm_toolbar_item_prepend(obj:PElm_Toolbar; icon:Pchar; _label:Pchar; func:TEvas_Smart_Cb; data:pointer):PElm_Widget_Item;cdecl;external;
{*
 * @brief Returns a pointer to a toolbar item by its label.
 *
 * @param[in] obj The object.
 * @param[in] label The label of the item to find.
 *
 * @return The pointer to the toolbar item matching @c label or @c NULL on
 * failure.
 *
 * @ingroup Elm_Toolbar
  }
(* Const before type ignored *)
(* Const before type ignored *)
function elm_toolbar_item_find_by_label(obj:PElm_Toolbar; _label:Pchar):PElm_Widget_Item;cdecl;external;
{$endif}

implementation


end.
