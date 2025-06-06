
unit elm_list_eo_legacy;
interface

{
  Automatically converted by H2Pas 1.0.0 from elm_list_eo_legacy.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    elm_list_eo_legacy.h
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
PElm_List  = ^Elm_List;
PElm_Widget_Item  = ^Elm_Widget_Item;
Plongint  = ^longint;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _ELM_LIST_EO_LEGACY_H_}
{$define _ELM_LIST_EO_LEGACY_H_}
{$ifndef _ELM_LIST_EO_CLASS_TYPE}
{$define _ELM_LIST_EO_CLASS_TYPE}
type
  PElm_List = ^TElm_List;
  TElm_List = TEo;
{$endif}
{$ifndef _ELM_LIST_EO_TYPES}
{$define _ELM_LIST_EO_TYPES}
{$endif}
{*
 * @brief Control horizontal mode on the list object.
 *
 * @note Vertical mode is set by default.
 *
 * On horizontal mode items are displayed on list from left to right, instead
 * of from top to bottom. Also, the list will scroll horizontally. Each item
 * will presents left icon on top and right icon, or end, at the bottom.
 *
 * @param[in] obj The object.
 * @param[in] horizontal @c true to enable horizontal or @c false to disable
 * it, i.e., to enable vertical mode.
 *
 * @ingroup Elm_List_Group
  }

procedure elm_list_horizontal_set(obj:PElm_List; horizontal:TEina_Bool);cdecl;external;
{*
 * @brief Control horizontal mode on the list object.
 *
 * @note Vertical mode is set by default.
 *
 * On horizontal mode items are displayed on list from left to right, instead
 * of from top to bottom. Also, the list will scroll horizontally. Each item
 * will presents left icon on top and right icon, or end, at the bottom.
 *
 * @param[in] obj The object.
 *
 * @return @c true to enable horizontal or @c false to disable it, i.e., to
 * enable vertical mode.
 *
 * @ingroup Elm_List_Group
  }
(* Const before type ignored *)
function elm_list_horizontal_get(obj:PElm_List):TEina_Bool;cdecl;external;
{*
 * @brief Control the list select mode.
 *
 * elm_list_select_mode_set() changes item select mode in the list widget. -
 * #ELM_OBJECT_SELECT_MODE_DEFAULT : Items will only call their selection func
 * and callback when first becoming selected. Any further clicks will do
 * nothing, unless you set always select mode. - #ELM_OBJECT_SELECT_MODE_ALWAYS
 * : This means that, even if selected, every click will make the selected
 * callbacks be called. - #ELM_OBJECT_SELECT_MODE_NONE : This will turn off the
 * ability to select items entirely and they will neither appear selected nor
 * call selected callback functions.
 *
 * @param[in] obj The object.
 * @param[in] mode The select mode
 *
 * @ingroup Elm_List_Group
  }
procedure elm_list_select_mode_set(obj:PElm_List; mode:TElm_Object_Select_Mode);cdecl;external;
{*
 * @brief Control the list select mode.
 *
 * elm_list_select_mode_set() changes item select mode in the list widget. -
 * #ELM_OBJECT_SELECT_MODE_DEFAULT : Items will only call their selection func
 * and callback when first becoming selected. Any further clicks will do
 * nothing, unless you set always select mode. - #ELM_OBJECT_SELECT_MODE_ALWAYS
 * : This means that, even if selected, every click will make the selected
 * callbacks be called. - #ELM_OBJECT_SELECT_MODE_NONE : This will turn off the
 * ability to select items entirely and they will neither appear selected nor
 * call selected callback functions.
 *
 * @param[in] obj The object.
 *
 * @return The select mode
 *
 * @ingroup Elm_List_Group
  }
(* Const before type ignored *)
function elm_list_select_mode_get(obj:PElm_List):TElm_Object_Select_Mode;cdecl;external;
{*
 * @brief Control focus upon items selection mode
 *
 * When enabled, every selection of an item inside the genlist will
 * automatically set focus to its first focusable widget from the left. This is
 * true of course if the selection was made by clicking an unfocusable area in
 * an item or selecting it with a key movement. Clicking on a focusable widget
 * inside an item will cause this particular item to get focus as usual.
 *
 * @param[in] obj The object.
 * @param[in] enabled The tree effect status ($true = enabled, @c false =
 * disabled)
 *
 * @ingroup Elm_List_Group
  }
procedure elm_list_focus_on_selection_set(obj:PElm_List; enabled:TEina_Bool);cdecl;external;
{*
 * @brief Control focus upon items selection mode
 *
 * When enabled, every selection of an item inside the genlist will
 * automatically set focus to its first focusable widget from the left. This is
 * true of course if the selection was made by clicking an unfocusable area in
 * an item or selecting it with a key movement. Clicking on a focusable widget
 * inside an item will cause this particular item to get focus as usual.
 *
 * @param[in] obj The object.
 *
 * @return The tree effect status ($true = enabled, @c false = disabled)
 *
 * @ingroup Elm_List_Group
  }
(* Const before type ignored *)
function elm_list_focus_on_selection_get(obj:PElm_List):TEina_Bool;cdecl;external;
{*
 * @brief Control multiple items selection on the list object.
 *
 * Disabled by default. If disabled, the user can select a single item of the
 * list each time. Selected items are highlighted on list. If enabled, many
 * items can be selected.
 *
 * If a selected item is selected again, it will be unselected.
 *
 * @param[in] obj The object.
 * @param[in] multi @c true to enable multi selection or @c false to disable
 * it.
 *
 * @ingroup Elm_List_Group
  }
procedure elm_list_multi_select_set(obj:PElm_List; multi:TEina_Bool);cdecl;external;
{*
 * @brief Control multiple items selection on the list object.
 *
 * Disabled by default. If disabled, the user can select a single item of the
 * list each time. Selected items are highlighted on list. If enabled, many
 * items can be selected.
 *
 * If a selected item is selected again, it will be unselected.
 *
 * @param[in] obj The object.
 *
 * @return @c true to enable multi selection or @c false to disable it.
 *
 * @ingroup Elm_List_Group
  }
(* Const before type ignored *)
function elm_list_multi_select_get(obj:PElm_List):TEina_Bool;cdecl;external;
{*
 * @brief Control the list multi select mode.
 *
 * - #ELM_OBJECT_MULTI_SELECT_MODE_DEFAULT : select/unselect items whenever
 * each item is clicked. - #ELM_OBJECT_MULTI_SELECT_MODE_WITH_CONTROL : Only
 * one item will be selected although multi-selection is enabled, if clicked
 * without pressing control key. This mode is only available with
 * multi-selection.
 *
 * See: @ref elm_list_multi_select_get
 *
 * @param[in] obj The object.
 * @param[in] mode The multi select mode
 *
 * @since 1.8
 *
 * @ingroup Elm_List_Group
  }
procedure elm_list_multi_select_mode_set(obj:PElm_List; mode:TElm_Object_Multi_Select_Mode);cdecl;external;
{*
 * @brief Control the list multi select mode.
 *
 * - #ELM_OBJECT_MULTI_SELECT_MODE_DEFAULT : select/unselect items whenever
 * each item is clicked. - #ELM_OBJECT_MULTI_SELECT_MODE_WITH_CONTROL : Only
 * one item will be selected although multi-selection is enabled, if clicked
 * without pressing control key. This mode is only available with
 * multi-selection.
 *
 * See: @ref elm_list_multi_select_get
 *
 * @param[in] obj The object.
 *
 * @return The multi select mode
 *
 * @since 1.8
 *
 * @ingroup Elm_List_Group
  }
(* Const before type ignored *)
function elm_list_multi_select_mode_get(obj:PElm_List):TElm_Object_Multi_Select_Mode;cdecl;external;
{*
 * @brief Control which mode to use for the list object.
 *
 * Set list's resize behavior, transverse axis scroll and items cropping. See
 * each mode's description for more details.
 *
 * @note Default value is #ELM_LIST_SCROLL.
 *
 * Only one mode at a time can be set. If a previous one was set, it will be
 * changed by the new mode after this call. Bitmasks won't work here as well.
 *
 * @warning This function's behavior will clash with those of
 * elm_scroller_content_min_limit(), so use either one of them, but not both.
 *
 * @param[in] obj The object.
 * @param[in] mode One of #Elm_List_Mode: #ELM_LIST_COMPRESS, #ELM_LIST_SCROLL,
 * #ELM_LIST_LIMIT or #ELM_LIST_EXPAND.
 *
 * @ingroup Elm_List_Group
  }
procedure elm_list_mode_set(obj:PElm_List; mode:TElm_List_Mode);cdecl;external;
{*
 * @brief Control which mode to use for the list object.
 *
 * Set list's resize behavior, transverse axis scroll and items cropping. See
 * each mode's description for more details.
 *
 * @note Default value is #ELM_LIST_SCROLL.
 *
 * Only one mode at a time can be set. If a previous one was set, it will be
 * changed by the new mode after this call. Bitmasks won't work here as well.
 *
 * @warning This function's behavior will clash with those of
 * elm_scroller_content_min_limit(), so use either one of them, but not both.
 *
 * @param[in] obj The object.
 *
 * @return One of #Elm_List_Mode: #ELM_LIST_COMPRESS, #ELM_LIST_SCROLL,
 * #ELM_LIST_LIMIT or #ELM_LIST_EXPAND.
 *
 * @ingroup Elm_List_Group
  }
(* Const before type ignored *)
function elm_list_mode_get(obj:PElm_List):TElm_List_Mode;cdecl;external;
{*
 * @brief Get the selected item.
 *
 * The selected item can be unselected with function
 * elm_list_item_selected_set().
 *
 * The selected item always will be highlighted on list.
 *
 * @param[in] obj The object.
 *
 * @return The selected list item.
 *
 * @ingroup Elm_List_Group
  }
(* Const before type ignored *)
function elm_list_selected_item_get(obj:PElm_List):PElm_Widget_Item;cdecl;external;
{*
 * @brief Get a list of all the list items.
 *
 * @param[in] obj The object.
 *
 * @return A @c list of list items, #Elm_Widget_Item, or @c NULL on failure.
 *
 * @ingroup Elm_List_Group
  }
(* Const before type ignored *)
(* Const before type ignored *)
function elm_list_items_get(obj:PElm_List):PEina_List;cdecl;external;
{*
 * @brief Get the first item in the list
 *
 * This returns the first item in the list.
 *
 * @param[in] obj The object.
 *
 * @return The first item, or NULL if none
 *
 * @ingroup Elm_List_Group
  }
(* Const before type ignored *)
function elm_list_first_item_get(obj:PElm_List):PElm_Widget_Item;cdecl;external;
{*
 * @brief Return a list of the currently selected list items.
 *
 * Multiple items can be selected if multi select is enabled. It can be done
 * with elm_list_multi_select_set().
 *
 * @param[in] obj The object.
 *
 * @return An @c list of list items, #Elm_Widget_Item, or @c NULL on failure.
 *
 * @ingroup Elm_List_Group
  }
(* Const before type ignored *)
(* Const before type ignored *)
function elm_list_selected_items_get(obj:PElm_List):PEina_List;cdecl;external;
{*
 * @brief Get the last item in the list
 *
 * This returns the last item in the list.
 *
 * @param[in] obj The object.
 *
 * @return The last item, or NULL if none
 *
 * @ingroup Elm_List_Group
  }
(* Const before type ignored *)
function elm_list_last_item_get(obj:PElm_List):PElm_Widget_Item;cdecl;external;
{*
 * @brief Insert a new item into the list object before item @c before.
 *
 * A new item will be created and added to the list. Its position in this list
 * will be just before item @c before.
 *
 * Items created with this method can be deleted with elm_object_item_del().
 *
 * Associated @c data can be properly freed when item is deleted if a callback
 * function is set with elm_object_item_del_cb_set().
 *
 * If a function is passed as argument, it will be called every time this item
 * is selected, i.e., the user clicks over an unselected item. If always select
 * is enabled it will call this function every time user clicks over an item
 * (already selected or not). If such function isn't needed, just passing
 * @c NULL as @c func is enough. The same should be done for @c data.
 *
 * @note Remember that the label parameter is copied inside the list. So if an
 * application dynamically allocated the label, the application should free the
 * label after this call.
 *
 * @param[in] obj The object.
 * @param[in] before The list item to insert before.
 * @param[in] label The label of the list item.
 * @param[in] icon The icon object to use for the left side of the item. An
 * icon can be any Evas object, but usually it is an icon created with
 * elm_icon_add().
 * @param[in] end The icon object to use for the right side of the item. An
 * icon can be any Evas object.
 * @param[in] func The function to call when the item is clicked.
 * @param[in] data The data to associate with the item for related callbacks.
 *
 * @return The created item or @c NULL upon failure.
 *
 * @ingroup Elm_List_Group
  }
(* Const before type ignored *)
(* Const before type ignored *)
function elm_list_item_insert_before(obj:PElm_List; before:PElm_Widget_Item; _label:Pchar; icon:PEfl_Canvas_Object; end:PEfl_Canvas_Object; 
           func:TEvas_Smart_Cb; data:pointer):PElm_Widget_Item;cdecl;external;
{*
 * @brief Starts the list.
 *
 * @note Call before running show() on the list object. Warning: If not called,
 * it won't display the list properly.
 * @param[in] obj The object.
 *
 * @ingroup Elm_List_Group
  }
procedure elm_list_go(obj:PElm_List);cdecl;external;
{*
 * @brief Insert a new item into the list object after item @c after.
 *
 * A new item will be created and added to the list. Its position in this list
 * will be just after item @c after.
 *
 * Items created with this method can be deleted with elm_object_item_del().
 *
 * Associated @c data can be properly freed when item is deleted if a callback
 * function is set with elm_object_item_del_cb_set().
 *
 * If a function is passed as argument, it will be called every time this item
 * is selected, i.e., the user clicks over an unselected item. If always select
 * is enabled it will call this function every time user clicks over an item
 * (already selected or not). If such function isn't needed, just passing
 * @c NULL as @c func is enough. The same should be done for @c data.
 *
 * @note Remember that the label parameter is copied inside the list. So if an
 * application dynamically allocated the label, the application should free the
 * label after this call.
 *
 * @param[in] obj The object.
 * @param[in] after The list item to insert after.
 * @param[in] label The label of the list item.
 * @param[in] icon The icon object to use for the left side of the item. An
 * icon can be any Evas object, but usually it is an icon created with
 * elm_icon_add().
 * @param[in] end The icon object to use for the right side of the item. An
 * icon can be any Evas object.
 * @param[in] func The function to call when the item is clicked.
 * @param[in] data The data to associate with the item for related callbacks.
 *
 * @return The created item or @c NULL upon failure.
 *
 * @ingroup Elm_List_Group
  }
(* Const before type ignored *)
(* Const before type ignored *)
function elm_list_item_insert_after(obj:PElm_List; after:PElm_Widget_Item; _label:Pchar; icon:PEfl_Canvas_Object; end:PEfl_Canvas_Object; 
           func:TEvas_Smart_Cb; data:pointer):PElm_Widget_Item;cdecl;external;
{*
 * @brief Get the item that is at the x, y canvas coords.
 *
 * This returns the item at the given coordinates (which are canvas relative,
 * not object-relative). If an item is at that coordinate, that item handle is
 * returned, and if @c posret is not NULL, the integer pointed to is set to a
 * value of -1, 0 or 1, depending if the coordinate is on the upper portion of
 * that item (-1), on the middle section (0) or on the lower part (1). If NULL
 * is returned as an item (no item found there), then posret may indicate -1 or
 * 1 based if the coordinate is above or below all items respectively in the
 * list.
 *
 * @param[in] obj The object.
 * @param[in] x The input x coordinate
 * @param[in] y The input y coordinate
 * @param[out] posret The position relative to the item returned here
 *
 * @return The item at the coordinates or NULL if none
 *
 * @ingroup Elm_List_Group
  }
(* Const before type ignored *)
function elm_list_at_xy_item_get(obj:PElm_List; x:longint; y:longint; posret:Plongint):PElm_Widget_Item;cdecl;external;
{*
 * @brief Append a new item to the list object.
 *
 * A new item will be created and appended to the list, i.e., will be set as
 * last item.
 *
 * Items created with this method can be deleted with elm_object_item_del().
 *
 * Associated @c data can be properly freed when item is deleted if a callback
 * function is set with elm_object_item_del_cb_set().
 *
 * If a function is passed as argument, it will be called every time this item
 * is selected, i.e., the user clicks over an unselected item. If always select
 * is enabled it will call this function every time user clicks over an item
 * (already selected or not). If such function isn't needed, just passing
 * @c NULL as @c func is enough. The same should be done for @c data.
 *
 * @note Remember that the label parameter is copied inside the list. So if an
 * application dynamically allocated the label, the application should free the
 * label after this call.
 *
 * @param[in] obj The object.
 * @param[in] label The label of the list item.
 * @param[in] icon The icon object to use for the left side of the item. An
 * icon can be any Evas object, but usually it is an icon created with
 * elm_icon_add().
 * @param[in] end The icon object to use for the right side of the item. An
 * icon can be any Evas object.
 * @param[in] func The function to call when the item is clicked.
 * @param[in] data The data to associate with the item for related callbacks.
 *
 * @return The created item or @c NULL upon failure.
 *
 * @ingroup Elm_List_Group
  }
(* Const before type ignored *)
(* Const before type ignored *)
function elm_list_item_append(obj:PElm_List; _label:Pchar; icon:PEfl_Canvas_Object; end:PEfl_Canvas_Object; func:TEvas_Smart_Cb; 
           data:pointer):PElm_Widget_Item;cdecl;external;
{*
 * @brief Prepend a new item to the list object.
 *
 * A new item will be created and prepended to the list, i.e., will be set as
 * first item.
 *
 * Items created with this method can be deleted with elm_object_item_del().
 *
 * Associated @c data can be properly freed when item is deleted if a callback
 * function is set with elm_object_item_del_cb_set().
 *
 * If a function is passed as argument, it will be called every time this item
 * is selected, i.e., the user clicks over an unselected item. If always select
 * is enabled it will call this function every time user clicks over an item
 * (already selected or not). If such function isn't needed, just passing
 * @c NULL as @c func is enough. The same should be done for @c data.
 *
 * @note Remember that the label parameter is copied inside the list. So if an
 * application dynamically allocated the label, the application should free the
 * label after this call.
 *
 * @param[in] obj The object.
 * @param[in] label The label of the list item.
 * @param[in] icon The icon object to use for the left side of the item. An
 * icon can be any Evas object, but usually it is an icon created with
 * elm_icon_add().
 * @param[in] end The icon object to use for the right side of the item. An
 * icon can be any Evas object.
 * @param[in] func The function to call when the item is clicked.
 * @param[in] data The data to associate with the item for related callbacks.
 *
 * @return The created item or @c NULL upon failure.
 *
 * @ingroup Elm_List_Group
  }
(* Const before type ignored *)
(* Const before type ignored *)
function elm_list_item_prepend(obj:PElm_List; _label:Pchar; icon:PEfl_Canvas_Object; end:PEfl_Canvas_Object; func:TEvas_Smart_Cb; 
           data:pointer):PElm_Widget_Item;cdecl;external;
{* Remove all list's items.
 *
 * @ingroup Elm_List_Group
  }
procedure elm_list_clear(obj:PElm_List);cdecl;external;
{*
 * @brief Insert a new item into the sorted list object.
 *
 * @note This function inserts values into a list object assuming it was sorted
 * and the result will be sorted.
 *
 * A new item will be created and added to the list. Its position in this list
 * will be found comparing the new item with previously inserted items using
 * function @c cmp_func.
 *
 * Items created with this method can be deleted with elm_object_item_del().
 *
 * Associated @c data can be properly freed when item is deleted if a callback
 * function is set with elm_object_item_del_cb_set().
 *
 * If a function is passed as argument, it will be called every time this item
 * is selected, i.e., the user clicks over an unselected item. If always select
 * is enabled it will call this function every time user clicks over an item
 * (already selected or not). If such function isn't needed, just passing
 * @c NULL as @c func is enough. The same should be done for @c data.
 *
 * @note Remember that the label parameter is copied inside the list. So if an
 * application dynamically allocated the label, the application should free the
 * label after this call.
 *
 * @param[in] obj The object.
 * @param[in] label The label of the list item.
 * @param[in] icon The icon object to use for the left side of the item. An
 * icon can be any Evas object, but usually it is an icon created with
 * elm_icon_add().
 * @param[in] end The icon object to use for the right side of the item. An
 * icon can be any Evas object.
 * @param[in] func The function to call when the item is clicked.
 * @param[in] data The data to associate with the item for related callbacks.
 * @param[in] cmp_func The comparing function to be used to sort list items by
 * #Elm_Widget_Item item handles. This function will receive two items and
 * compare them, returning a non-negative integer if the second item should be
 * place after the first, or negative value if should be placed before.
 *
 * @return The created item or @c NULL upon failure.
 *
 * @ingroup Elm_List_Group
  }
(* Const before type ignored *)
(* Const before type ignored *)
function elm_list_item_sorted_insert(obj:PElm_List; _label:Pchar; icon:PEfl_Canvas_Object; end:PEfl_Canvas_Object; func:TEvas_Smart_Cb; 
           data:pointer; cmp_func:TEina_Compare_Cb):PElm_Widget_Item;cdecl;external;
{$endif}

implementation


end.
