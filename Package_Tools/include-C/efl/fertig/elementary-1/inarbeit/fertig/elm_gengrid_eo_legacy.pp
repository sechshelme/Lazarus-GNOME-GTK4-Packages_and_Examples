
unit elm_gengrid_eo_legacy;
interface

{
  Automatically converted by H2Pas 1.0.0 from elm_gengrid_eo_legacy.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    elm_gengrid_eo_legacy.h
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
Pdouble  = ^double;
PEina_List  = ^Eina_List;
PElm_Gengrid  = ^Elm_Gengrid;
PElm_Gengrid_Item_Class  = ^Elm_Gengrid_Item_Class;
PElm_Gengrid_Reorder_Type  = ^Elm_Gengrid_Reorder_Type;
PElm_Widget_Item  = ^Elm_Widget_Item;
Plongint  = ^longint;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _ELM_GENGRID_EO_LEGACY_H_}
{$define _ELM_GENGRID_EO_LEGACY_H_}
{$ifndef _ELM_GENGRID_EO_CLASS_TYPE}
{$define _ELM_GENGRID_EO_CLASS_TYPE}
type
  PElm_Gengrid = ^TElm_Gengrid;
  TElm_Gengrid = TEo;
{$endif}
{$ifndef _ELM_GENGRID_EO_TYPES}
{$define _ELM_GENGRID_EO_TYPES}
{* Gengrid reorder modes
 *
 * @ingroup Elm_Gengrid_Group
  }
{*< Normal reorder type  }
{*< Swap reorder type  }
type
  PElm_Gengrid_Reorder_Type = ^TElm_Gengrid_Reorder_Type;
  TElm_Gengrid_Reorder_Type =  Longint;
  Const
    ELM_GENGRID_REORDER_TYPE_NORMAL = 0;
    ELM_GENGRID_REORDER_TYPE_SWAP = 1;
;
{$endif}
{*
 * @brief Set the items grid's alignment within a given gengrid widget.
 *
 * This sets the alignment of the whole grid of items of a gengrid within its
 * given viewport. By default, those values are both 0.5, meaning that the
 * gengrid will have its items grid placed exactly in the middle of its
 * viewport.
 *
 * @note If given alignment values are out of the cited ranges, they'll be
 * changed to the nearest boundary values on the valid ranges.
 *
 * @param[in] obj The object.
 * @param[in] align_x Alignment in the horizontal axis (0 <= align_x <= 1).
 * @param[in] align_y Alignment in the vertical axis (0 <= align_y <= 1).
 *
 * @ingroup Elm_Gengrid_Group
  }

procedure elm_gengrid_align_set(obj:PElm_Gengrid; align_x:Tdouble; align_y:Tdouble);cdecl;external;
{*
 * @brief Get the items grid's alignment values within a given gengrid widget.
 *
 * @note Use @c null pointers on the alignment values you're not interested in:
 * they'll be ignored by the function.
 *
 * @param[in] obj The object.
 * @param[out] align_x Alignment in the horizontal axis (0 <= align_x <= 1).
 * @param[out] align_y Alignment in the vertical axis (0 <= align_y <= 1).
 *
 * @ingroup Elm_Gengrid_Group
  }
(* Const before type ignored *)
procedure elm_gengrid_align_get(obj:PElm_Gengrid; align_x:Pdouble; align_y:Pdouble);cdecl;external;
{*
 * @brief Set how the items grid's filled within a given gengrid widget
 *
 * This sets the fill state of the whole grid of items of a gengrid within its
 * given viewport. By default, this value is false, meaning that if the first
 * line of items grid's isn't filled, the items are centered with the
 * alignment.
 *
 * @param[in] obj The object.
 * @param[in] fill @c true if the grid is filled, @c false otherwise
 *
 * @ingroup Elm_Gengrid_Group
  }
procedure elm_gengrid_filled_set(obj:PElm_Gengrid; fill:TEina_Bool);cdecl;external;
{*
 * @brief Get how the items grid's filled within a given gengrid widget
 *
 * @note Use @c null pointers on the alignment values you're not interested in:
 * they'll be ignored by the function.
 *
 * @param[in] obj The object.
 *
 * @return @c true if the grid is filled, @c false otherwise
 *
 * @ingroup Elm_Gengrid_Group
  }
(* Const before type ignored *)
function elm_gengrid_filled_get(obj:PElm_Gengrid):TEina_Bool;cdecl;external;
{*
 * @brief Enable or disable multi-selection in a given gengrid widget.
 *
 * Multi-selection is the ability to have more than one item selected, on a
 * given gengrid, simultaneously. When it is enabled, a sequence of clicks on
 * different items will make them all selected, progressively. A click on an
 * already selected item will unselect it. If interacting via the keyboard,
 * multi-selection is enabled while holding the "Shift" key.
 *
 * @note By default, multi-selection is disabled on gengrids.
 *
 * @param[in] obj The object.
 * @param[in] multi @c true if multislect is enabled, @c false otherwise
 *
 * @ingroup Elm_Gengrid_Group
  }
procedure elm_gengrid_multi_select_set(obj:PElm_Gengrid; multi:TEina_Bool);cdecl;external;
{*
 * @brief Get whether multi-selection is enabled or disabled for a given
 * gengrid widget.
 *
 * @param[in] obj The object.
 *
 * @return @c true if multislect is enabled, @c false otherwise
 *
 * @ingroup Elm_Gengrid_Group
  }
(* Const before type ignored *)
function elm_gengrid_multi_select_get(obj:PElm_Gengrid):TEina_Bool;cdecl;external;
{*
 * @brief Set the size for the group items of a given gengrid widget.
 *
 * A gengrid, after creation, has still no information on the size to give to
 * each of its cells. So, you most probably will end up with squares one @ref
 * Fingers "finger" wide, the default size. Use this function to force a custom
 * size for you group items, making them as big as you wish.
 *
 * @param[in] obj The object.
 * @param[in] w The group items' width.
 * @param[in] h The group items' height.
 *
 * @ingroup Elm_Gengrid_Group
  }
procedure elm_gengrid_group_item_size_set(obj:PElm_Gengrid; w:longint; h:longint);cdecl;external;
{*
 * @brief Get the size set for the group items of a given gengrid widget.
 *
 * @note Use @c null pointers on the size values you're not interested in:
 * they'll be ignored by the function.
 *
 * @param[in] obj The object.
 * @param[out] w The group items' width.
 * @param[out] h The group items' height.
 *
 * @ingroup Elm_Gengrid_Group
  }
(* Const before type ignored *)
procedure elm_gengrid_group_item_size_get(obj:PElm_Gengrid; w:Plongint; h:Plongint);cdecl;external;
{*
 * @brief Set the gengrid select mode.
 *
 * This changes item select mode in the gengrid widget.
 * #ELM_OBJECT_SELECT_MODE_DEFAULT means that items will only call their
 * selection func and callback when first becoming selected. Any further clicks
 * will do nothing, unless you set always select mode.
 * #ELM_OBJECT_SELECT_MODE_ALWAYS means that even if selected, every click will
 * make the selected callbacks be called. #ELM_OBJECT_SELECT_MODE_NONE will
 * turn off the ability to select items entirely and they will neither appear
 * selected nor call selected callback functions.
 *
 * @param[in] obj The object.
 * @param[in] mode The select mode.
 *
 * @ingroup Elm_Gengrid_Group
  }
procedure elm_gengrid_select_mode_set(obj:PElm_Gengrid; mode:TElm_Object_Select_Mode);cdecl;external;
{*
 * @brief Get the gengrid select mode.
 *
 * @param[in] obj The object.
 *
 * @return The select mode.
 *
 * @ingroup Elm_Gengrid_Group
  }
(* Const before type ignored *)
function elm_gengrid_select_mode_get(obj:PElm_Gengrid):TElm_Object_Select_Mode;cdecl;external;
{*
 * @brief Set whether a given gengrid widget is or not able have items
 * reordered.
 *
 * If a gengrid is set to allow reordering, a click held for more than 0.5 over
 * a given item will highlight it specially, signaling the gengrid has entered
 * the reordering state. From that time on, the user will be able to, while
 * still holding the mouse button down, move the item freely in the gengrid's
 * viewport, replacing to said item to the locations it goes to. The
 * replacements will be animated and, whenever the user releases the mouse
 * button, the item being replaced gets a new definitive place in the grid.
 *
 * @param[in] obj The object.
 * @param[in] reorder_mode Use @c true to turn reordering on, @c false to turn
 * it off.
 *
 * @ingroup Elm_Gengrid_Group
  }
procedure elm_gengrid_reorder_mode_set(obj:PElm_Gengrid; reorder_mode:TEina_Bool);cdecl;external;
{*
 * @brief Get whether a given gengrid widget is or not able have items
 * reordered.
 *
 * @param[in] obj The object.
 *
 * @return Use @c true to turn reordering on, @c false to turn it off.
 *
 * @ingroup Elm_Gengrid_Group
  }
(* Const before type ignored *)
function elm_gengrid_reorder_mode_get(obj:PElm_Gengrid):TEina_Bool;cdecl;external;
{*
 * @brief Control whether the gengrid items' should be highlighted when item
 * selected.
 *
 * @param[in] obj The object.
 * @param[in] highlight @c true if item will be highlighted, @c false otherwise
 *
 * @ingroup Elm_Gengrid_Group
  }
procedure elm_gengrid_highlight_mode_set(obj:PElm_Gengrid; highlight:TEina_Bool);cdecl;external;
{*
 * @brief Control whether the gengrid items' should be highlighted when item
 * selected.
 *
 * @param[in] obj The object.
 *
 * @return @c true if item will be highlighted, @c false otherwise
 *
 * @ingroup Elm_Gengrid_Group
  }
(* Const before type ignored *)
function elm_gengrid_highlight_mode_get(obj:PElm_Gengrid):TEina_Bool;cdecl;external;
{*
 * @brief Set the Gengrid reorder type
 *
 * @param[in] obj The object.
 * @param[in] type Reorder type value
 *
 * @since 1.11
 *
 * @ingroup Elm_Gengrid_Group
  }
procedure elm_gengrid_reorder_type_set(obj:PElm_Gengrid; _type:TElm_Gengrid_Reorder_Type);cdecl;external;
{*
 * @brief Set the size for the items of a given gengrid widget.
 *
 * A gengrid, after creation, has still no information on the size to give to
 * each of its cells. So, you most probably will end up with squares one @ref
 * Fingers "finger" wide, the default size. Use this function to force a custom
 * size for you items, making them as big as you wish.
 *
 * @param[in] obj The object.
 * @param[in] w The items' width.
 * @param[in] h The items' height.
 *
 * @ingroup Elm_Gengrid_Group
  }
procedure elm_gengrid_item_size_set(obj:PElm_Gengrid; w:longint; h:longint);cdecl;external;
{*
 * @brief Get the size set for the items of a given gengrid widget.
 *
 * @note Use @c null pointers on the size values you're not interested in:
 * they'll be ignored by the function.
 *
 * @param[in] obj The object.
 * @param[out] w The items' width.
 * @param[out] h The items' height.
 *
 * @ingroup Elm_Gengrid_Group
  }
(* Const before type ignored *)
procedure elm_gengrid_item_size_get(obj:PElm_Gengrid; w:Plongint; h:Plongint);cdecl;external;
{*
 * @brief Set the gengrid multi select mode.
 *
 * #ELM_OBJECT_MULTI_SELECT_MODE_DEFAULT means that select/unselect items
 * whenever each item is clicked. #ELM_OBJECT_MULTI_SELECT_MODE_WITH_CONTROL
 * means that only one item will be selected although multi-selection is
 * enabled, if clicked without pressing control key. This mode is only
 * available with multi-selection.
 *
 * @param[in] obj The object.
 * @param[in] mode The multi select mode.
 *
 * @since 1.8
 *
 * @ingroup Elm_Gengrid_Group
  }
procedure elm_gengrid_multi_select_mode_set(obj:PElm_Gengrid; mode:TElm_Object_Multi_Select_Mode);cdecl;external;
{*
 * @brief Get the gengrid multi select mode.
 *
 * If getting mode fails, it returns #ELM_OBJECT_MULTI_SELECT_MODE_MAX.
 *
 * @param[in] obj The object.
 *
 * @return The multi select mode.
 *
 * @since 1.8
 *
 * @ingroup Elm_Gengrid_Group
  }
(* Const before type ignored *)
function elm_gengrid_multi_select_mode_get(obj:PElm_Gengrid):TElm_Object_Multi_Select_Mode;cdecl;external;
{*
 * @brief Set the direction in which a given gengrid widget will expand while
 * placing its items.
 *
 * When in "horizontal mode" ($true), items will be placed in columns, from top
 * to bottom and, when the space for a column is filled, another one is started
 * on the right, thus expanding the grid horizontally. When in "vertical mode"
 * ($false), though, items will be placed in rows, from left to right and, when
 * the space for a row is filled, another one is started below, thus expanding
 * the grid vertically.
 *
 * @note By default, gengrid is in vertical mode, @c false.
 *
 * @param[in] obj The object.
 * @param[in] horizontal @c true to make the gengrid expand horizontally,
 * @c false to expand vertically.
 *
 * @ingroup Elm_Gengrid_Group
  }
procedure elm_gengrid_horizontal_set(obj:PElm_Gengrid; horizontal:TEina_Bool);cdecl;external;
{*
 * @brief Get for what direction a given gengrid widget will expand while
 * placing its items.
 *
 * @param[in] obj The object.
 *
 * @return @c true to make the gengrid expand horizontally, @c false to expand
 * vertically.
 *
 * @ingroup Elm_Gengrid_Group
  }
(* Const before type ignored *)
function elm_gengrid_horizontal_get(obj:PElm_Gengrid):TEina_Bool;cdecl;external;
{*
 * @brief Get the selected item in a given gengrid widget.
 *
 * This returns the selected item in @c obj. If multi selection is enabled on
 * @c obj (See @ref elm_gengrid_multi_select_set), only the first item in the
 * list is selected, which might not be very useful. For that case, see
 * @ref elm_gengrid_selected_items_get.
 *
 * @param[in] obj The object.
 *
 * @return The selected item's handle or @c null if none is selected at the
 * moment (and on errors).
 *
 * @ingroup Elm_Gengrid_Group
  }
(* Const before type ignored *)
function elm_gengrid_selected_item_get(obj:PElm_Gengrid):PElm_Widget_Item;cdecl;external;
{*
 * @brief Get a list of realized items in gengrid.
 *
 * This returns a list of the realized items in the gengrid. The list contains
 * gengrid item pointers. The list must be freed by the caller when done with
 * eina_list_free(). The item pointers in the list are only valid so long as
 * those items are not deleted or the gengrid is not deleted.
 *
 * @param[in] obj The object.
 *
 * @return The list of realized items or @c null if none are realized.
 *
 * @ingroup Elm_Gengrid_Group
  }
(* Const before type ignored *)
function elm_gengrid_realized_items_get(obj:PElm_Gengrid):PEina_List;cdecl;external;
{*
 * @brief Get the first item in a given gengrid widget.
 *
 * This returns the first item in the @c obj's internal list of items.
 *
 * @param[in] obj The object.
 *
 * @return The first item's handle or @c null, if there are no items in @c obj
 * (and on errors)
 *
 * @ingroup Elm_Gengrid_Group
  }
(* Const before type ignored *)
function elm_gengrid_first_item_get(obj:PElm_Gengrid):PElm_Widget_Item;cdecl;external;
{*
 * @brief Get a list of selected items in a given gengrid.
 *
 * This returns a list of the selected items, in the order that they appear in
 * the grid. This list is only valid as long as no more items are selected or
 * unselected (or unselected implicitly by deletion). The list contains Gengrid
 * item pointers as data, naturally.
 *
 * @param[in] obj The object.
 *
 * @return The list of selected items or @c null, if none is selected at the
 * moment (and on errors).
 *
 * @ingroup Elm_Gengrid_Group
  }
(* Const before type ignored *)
(* Const before type ignored *)
function elm_gengrid_selected_items_get(obj:PElm_Gengrid):PEina_List;cdecl;external;
{*
 * @brief Get the last item in a given gengrid widget.
 *
 * This returns the last item in the @c obj's internal list of items.
 *
 * @param[in] obj The object.
 *
 * @return The last item's handle or @c null if there are no  items in @c obj
 * (and on errors).
 *
 * @ingroup Elm_Gengrid_Group
  }
(* Const before type ignored *)
function elm_gengrid_last_item_get(obj:PElm_Gengrid):PElm_Widget_Item;cdecl;external;
{*
 * @brief Insert an item before another in a gengrid widget.
 *
 * This inserts an item before another in the gengrid.
 *
 * @param[in] obj The object.
 * @param[in] itc The item class for the item.
 * @param[in] data The item data.
 * @param[in] relative The item to place this new one before.
 * @param[in] func Convenience function called when the item is selected.
 * @param[in] func_data Data to be passed to @c func.
 *
 * @return A handle to the item added or @c null on errors.
 *
 * @ingroup Elm_Gengrid_Group
  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function elm_gengrid_item_insert_before(obj:PElm_Gengrid; itc:PElm_Gengrid_Item_Class; data:pointer; relative:PElm_Widget_Item; func:TEvas_Smart_Cb; 
           func_data:pointer):PElm_Widget_Item;cdecl;external;
{*
 * @brief Update the contents of all realized items.
 *
 * This updates all realized items by calling all the item class functions
 * again to get the contents, texts and states. Use this when the original item
 * data has changed and the changes are desired to be reflected.
 *
 * To update just one item, use @ref elm_gengrid_item_update.
 * @param[in] obj The object.
 *
 * @ingroup Elm_Gengrid_Group
  }
procedure elm_gengrid_realized_items_update(obj:PElm_Gengrid);cdecl;external;
{*
 * @brief Insert an item after another in a gengrid widget.
 *
 * This inserts an item after another in the gengrid.
 *
 * @param[in] obj The object.
 * @param[in] itc The item class for the item.
 * @param[in] data The item data.
 * @param[in] relative The item to place this new one after.
 * @param[in] func Convenience function called when the item is selected.
 * @param[in] func_data Data to be passed to @c func.
 *
 * @return A handle to the item added or @c null on error.
 *
 * @ingroup Elm_Gengrid_Group
  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function elm_gengrid_item_insert_after(obj:PElm_Gengrid; itc:PElm_Gengrid_Item_Class; data:pointer; relative:PElm_Widget_Item; func:TEvas_Smart_Cb; 
           func_data:pointer):PElm_Widget_Item;cdecl;external;
{*
 * @brief Return how many items are currently in a list
 *
 * This behavior is O(1) and includes items which may or may not be realized.
 *
 * @param[in] obj The object.
 *
 * @return Items in list
 *
 * @ingroup Elm_Gengrid_Group
  }
(* Const before type ignored *)
function elm_gengrid_items_count(obj:PElm_Gengrid):dword;cdecl;external;
{*
 * @brief Get the item that is at the x, y canvas coords.
 *
 * This returns the item at the given coordinates (which are canvas relative,
 * not object-relative). If an item is at that coordinate, that item handle is
 * returned, and if @c xposret is not @c null, the integer pointed to is set to
 * a value of -1, 0 or 1, depending if the coordinate is on the left portion of
 * that item (-1), on the middle section (0) or on the right part (1).
 *
 * If @c yposret is not @c null, the integer pointed to is set to a value of
 * -1, 0 or 1, depending if the coordinate is on the upper portion of that item
 * (-1), on the middle section (0) or on the lower part (1). If NULL is
 * returned as an item (no item found there), then posret may indicate -1 or 1
 * based if the coordinate is above or below all items respectively in the
 * gengrid.
 *
 * @param[in] obj The object.
 * @param[in] x The input x coordinate.
 * @param[in] y The input y coordinate.
 * @param[out] xposret The position relative to the item returned here.
 * @param[out] yposret The position relative to the item returned here.
 *
 * @return The item at the coordinates or @c null if none.
 *
 * @ingroup Elm_Gengrid_Group
  }
(* Const before type ignored *)
function elm_gengrid_at_xy_item_get(obj:PElm_Gengrid; x:longint; y:longint; xposret:Plongint; yposret:Plongint):PElm_Widget_Item;cdecl;external;
{*
 * @brief Append a new item in a given gengrid widget.
 *
 * This adds an item to the beginning of the gengrid.
 *
 * @param[in] obj The object.
 * @param[in] itc The item class for the item.
 * @param[in] data The item data.
 * @param[in] func Convenience function called when the item is selected.
 * @param[in] func_data Data to be passed to @c func.
 *
 * @return A handle to the item added or @c null on errors.
 *
 * @ingroup Elm_Gengrid_Group
  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function elm_gengrid_item_append(obj:PElm_Gengrid; itc:PElm_Gengrid_Item_Class; data:pointer; func:TEvas_Smart_Cb; func_data:pointer):PElm_Widget_Item;cdecl;external;
{*
 * @brief Prepend a new item in a given gengrid widget.
 *
 * This adds an item to the end of the gengrid.
 *
 * @param[in] obj The object.
 * @param[in] itc The item class for the item.
 * @param[in] data The item data.
 * @param[in] func Convenience function called when the item is selected.
 * @param[in] func_data Data to be passed to @c func.
 *
 * @return A handle to the item added or @c null on errors.
 *
 * @ingroup Elm_Gengrid_Group
  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function elm_gengrid_item_prepend(obj:PElm_Gengrid; itc:PElm_Gengrid_Item_Class; data:pointer; func:TEvas_Smart_Cb; func_data:pointer):PElm_Widget_Item;cdecl;external;
{*
 * @brief Remove all items from a given gengrid widget.
 *
 * This removes (and deletes) all items in @c obj, leaving it empty.
 *
 * See @ref elm_gengrid_item_del to remove just one item.
 * @param[in] obj The object.
 *
 * @ingroup Elm_Gengrid_Group
  }
procedure elm_gengrid_clear(obj:PElm_Gengrid);cdecl;external;
{*
 * @brief Insert an item in a gengrid widget using a user-defined sort
 * function.
 *
 * This inserts an item in the gengrid based on user defined comparison
 * function. The two arguments passed to the function @c func are gengrid item
 * handles to compare.
 *
 * @param[in] obj The object.
 * @param[in] itc The item class for the item.
 * @param[in] data The item data.
 * @param[in] comp User defined comparison function that defines the sort order
 * based on gengrid item and its data.
 * @param[in] func Convenience function called when the item is selected.
 * @param[in] func_data Data to be passed to @c func.
 *
 * @return A handle to the item added or @c null on errors.
 *
 * @ingroup Elm_Gengrid_Group
  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function elm_gengrid_item_sorted_insert(obj:PElm_Gengrid; itc:PElm_Gengrid_Item_Class; data:pointer; comp:TEina_Compare_Cb; func:TEvas_Smart_Cb; 
           func_data:pointer):PElm_Widget_Item;cdecl;external;
{*
 * @brief Get gengrid item by given string.
 *
 * It takes pointer to the gengrid item that will be used to start search from
 * it.
 *
 * This function uses globs (like "*.jpg") for searching and takes search flags
 * as last parameter That is a bitfield with values to be ored together or 0
 * for no flags.
 *
 * @param[in] obj The object.
 * @param[in] item_to_search_from Pointer to item to start search from. If
 * @c null, search will be started from the first item of the gengrid.
 * @param[in] part_name Name of the TEXT part of gengrid item to search string
 * in. If @c null, search by "elm.text" parts.
 * @param[in] pattern The search pattern.
 * @param[in] flags Search flags.
 *
 * @return Pointer to the gengrid item which matches search_string in case of
 * success, otherwise @c null.
 *
 * @since 1.11
 *
 * @ingroup Elm_Gengrid_Group
  }
(* Const before type ignored *)
(* Const before type ignored *)
function elm_gengrid_search_by_text_item_get(obj:PElm_Gengrid; item_to_search_from:PElm_Widget_Item; part_name:Pchar; pattern:Pchar; flags:TElm_Glob_Match_Flags):PElm_Widget_Item;cdecl;external;
{*
 * @brief Starts the reorder mode of Gengrid
 *
 * @param[in] obj The object.
 * @param[in] tween_mode Position mappings for animation
 *
 * @since 1.10
 *
 * @ingroup Elm_Gengrid_Group
  }
procedure elm_gengrid_reorder_mode_start(obj:PElm_Gengrid; tween_mode:TEcore_Pos_Map);cdecl;external;
{* Stops the reorder mode of Gengrid
 *
 * @since 1.10
 *
 * @ingroup Elm_Gengrid_Group
  }
procedure elm_gengrid_reorder_mode_stop(obj:PElm_Gengrid);cdecl;external;
{$endif}

implementation


end.
