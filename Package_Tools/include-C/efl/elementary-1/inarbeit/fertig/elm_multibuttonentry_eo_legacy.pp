
unit elm_multibuttonentry_eo_legacy;
interface

{
  Automatically converted by H2Pas 1.0.0 from elm_multibuttonentry_eo_legacy.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    elm_multibuttonentry_eo_legacy.h
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
PElm_Multibuttonentry  = ^Elm_Multibuttonentry;
PElm_Widget_Item  = ^Elm_Widget_Item;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _ELM_MULTIBUTTONENTRY_EO_LEGACY_H_}
{$define _ELM_MULTIBUTTONENTRY_EO_LEGACY_H_}
{$ifndef _ELM_MULTIBUTTONENTRY_EO_CLASS_TYPE}
{$define _ELM_MULTIBUTTONENTRY_EO_CLASS_TYPE}
type
  PElm_Multibuttonentry = ^TElm_Multibuttonentry;
  TElm_Multibuttonentry = TEo;
{$endif}
{$ifndef _ELM_MULTIBUTTONENTRY_EO_TYPES}
{$define _ELM_MULTIBUTTONENTRY_EO_TYPES}
{$endif}
{*
 * @brief Control if the multibuttonentry is to be editable or not.
 *
 * @param[in] obj The object.
 * @param[in] editable If @c true, user can add/delete item in
 * multibuttonentry, if not, the multibuttonentry is non-editable.
 *
 * @since 1.7
 *
 * @ingroup Elm_Multibuttonentry_Group
  }

procedure elm_multibuttonentry_editable_set(obj:PElm_Multibuttonentry; editable:TEina_Bool);cdecl;external;
{*
 * @brief Control if the multibuttonentry is to be editable or not.
 *
 * @param[in] obj The object.
 *
 * @return If @c true, user can add/delete item in multibuttonentry, if not,
 * the multibuttonentry is non-editable.
 *
 * @since 1.7
 *
 * @ingroup Elm_Multibuttonentry_Group
  }
(* Const before type ignored *)
function elm_multibuttonentry_editable_get(obj:PElm_Multibuttonentry):TEina_Bool;cdecl;external;
{*
 * @brief Control the multibuttonentry to expanded state.
 *
 * In expanded state, the complete entry will be displayed. Otherwise, only
 * single line of the entry will be displayed.
 *
 * @param[in] obj The object.
 * @param[in] expanded The value of expanded state. Set this to @c true for
 * expanded state. Set this to @c false for single line state.
 *
 * @ingroup Elm_Multibuttonentry_Group
  }
procedure elm_multibuttonentry_expanded_set(obj:PElm_Multibuttonentry; expanded:TEina_Bool);cdecl;external;
{*
 * @brief Control the multibuttonentry to expanded state.
 *
 * In expanded state, the complete entry will be displayed. Otherwise, only
 * single line of the entry will be displayed.
 *
 * @param[in] obj The object.
 *
 * @return The value of expanded state. Set this to @c true for expanded state.
 * Set this to @c false for single line state.
 *
 * @ingroup Elm_Multibuttonentry_Group
  }
(* Const before type ignored *)
function elm_multibuttonentry_expanded_get(obj:PElm_Multibuttonentry):TEina_Bool;cdecl;external;
{*
 * @brief Set a function to format the string that will be used to display the
 * hidden items counter.
 *
 * If @c format_function is @c NULL, the default format will be used, which is
 * $"... + %d".
 *
 * @param[in] obj The object.
 * @param[in] format_function Format_function The actual format function
 * @param[in] data Data User data to passed to @c format_function
 *
 * @since 1.9
 *
 * @ingroup Elm_Multibuttonentry_Group
  }
(* Const before type ignored *)
procedure elm_multibuttonentry_format_function_set(obj:PElm_Multibuttonentry; format_function:TElm_Multibuttonentry_Format_Cb; data:pointer);cdecl;external;
{*
 * @brief Get a list of items in the multibuttonentry
 *
 * @param[in] obj The object.
 *
 * @return The list of items, or NULL if none
 *
 * @ingroup Elm_Multibuttonentry_Group
  }
(* Const before type ignored *)
(* Const before type ignored *)
function elm_multibuttonentry_items_get(obj:PElm_Multibuttonentry):PEina_List;cdecl;external;
{*
 * @brief Get the first item in the multibuttonentry
 *
 * @param[in] obj The object.
 *
 * @return The first item, or NULL if none
 *
 * @ingroup Elm_Multibuttonentry_Group
  }
(* Const before type ignored *)
function elm_multibuttonentry_first_item_get(obj:PElm_Multibuttonentry):PElm_Widget_Item;cdecl;external;
{*
 * @brief Get the last item in the multibuttonentry
 *
 * @param[in] obj The object.
 *
 * @return The last item, or NULL if none
 *
 * @ingroup Elm_Multibuttonentry_Group
  }
(* Const before type ignored *)
function elm_multibuttonentry_last_item_get(obj:PElm_Multibuttonentry):PElm_Widget_Item;cdecl;external;
{*
 * @brief Get the entry of the multibuttonentry object
 *
 * @param[in] obj The object.
 *
 * @return The entry object, or NULL if none
 *
 * @ingroup Elm_Multibuttonentry_Group
  }
(* Const before type ignored *)
function elm_multibuttonentry_entry_get(obj:PElm_Multibuttonentry):PEfl_Canvas_Object;cdecl;external;
{*
 * @brief Get the selected item in the multibuttonentry
 *
 * @param[in] obj The object.
 *
 * @return The selected item, or NULL if none
 *
 * @ingroup Elm_Multibuttonentry_Group
  }
(* Const before type ignored *)
function elm_multibuttonentry_selected_item_get(obj:PElm_Multibuttonentry):PElm_Widget_Item;cdecl;external;
{*
 * @brief Prepend a new item to the multibuttonentry
 *
 * See @ref Efl.Object.invalidate to delete the item.
 *
 * @param[in] obj The object.
 * @param[in] label The label of new item
 * @param[in] func The callback function to be invoked when this item is
 * pressed.
 * @param[in] data The pointer to the data to be attached
 *
 * @return A handle to the item added or NULL if not possible
 *
 * @ingroup Elm_Multibuttonentry_Group
  }
(* Const before type ignored *)
function elm_multibuttonentry_item_prepend(obj:PElm_Multibuttonentry; _label:Pchar; func:TEvas_Smart_Cb; data:pointer):PElm_Widget_Item;cdecl;external;
{* Remove all items in the multibuttonentry.
 *
 * @ingroup Elm_Multibuttonentry_Group
  }
procedure elm_multibuttonentry_clear(obj:PElm_Multibuttonentry);cdecl;external;
{*
 * @brief Remove a filter from the list
 *
 * Removes the given callback from the filter list. See
 * elm_multibuttonentry_item_filter_append() for more information.
 *
 * @param[in] obj The object.
 * @param[in] func The filter function to remove
 * @param[in] data The user data passed when adding the function
 *
 * @ingroup Elm_Multibuttonentry_Group
  }
procedure elm_multibuttonentry_item_filter_remove(obj:PElm_Multibuttonentry; func:TElm_Multibuttonentry_Item_Filter_Cb; data:pointer);cdecl;external;
{*
 * @brief Add a new item to the multibuttonentry before the indicated object
 * reference.
 *
 * See @ref Efl.Object.invalidate to delete the item.
 *
 * @param[in] obj The object.
 * @param[in] before The item before which to add it
 * @param[in] label The label of new item
 * @param[in] func The callback function to be invoked when this item is
 * pressed.
 * @param[in] data The pointer to the data to be attached
 *
 * @return A handle to the item added or NULL if not possible
 *
 * @ingroup Elm_Multibuttonentry_Group
  }
(* Const before type ignored *)
function elm_multibuttonentry_item_insert_before(obj:PElm_Multibuttonentry; before:PElm_Widget_Item; _label:Pchar; func:TEvas_Smart_Cb; data:pointer):PElm_Widget_Item;cdecl;external;
{*
 * @brief Append a new item to the multibuttonentry
 *
 * See @ref Efl.Object.invalidate to delete the item.
 *
 * @param[in] obj The object.
 * @param[in] label The label of new item
 * @param[in] func The callback function to be invoked when this item is
 * pressed.
 * @param[in] data The pointer to the data to be attached
 *
 * @return A handle to the item added or NULL if not possible
 *
 * @ingroup Elm_Multibuttonentry_Group
  }
(* Const before type ignored *)
function elm_multibuttonentry_item_append(obj:PElm_Multibuttonentry; _label:Pchar; func:TEvas_Smart_Cb; data:pointer):PElm_Widget_Item;cdecl;external;
{*
 * @brief Prepend a filter function for text inserted in the Multibuttonentry
 *
 * Prepend the given callback to the list. See
 * elm_multibuttonentry_item_filter_append() for more information
 *
 * @param[in] obj The object.
 * @param[in] func The function to use as text filter
 * @param[in] data User data to pass to @c func
 *
 * @ingroup Elm_Multibuttonentry_Group
  }
procedure elm_multibuttonentry_item_filter_prepend(obj:PElm_Multibuttonentry; func:TElm_Multibuttonentry_Item_Filter_Cb; data:pointer);cdecl;external;
{*
 * @brief Append an item filter function for text inserted in the
 * Multibuttonentry
 *
 * Append the given callback to a list. This function is called whenever any
 * text is inserted into the Multibuttonentry, with the text to be inserted as
 * a parameter. The callback function is free to alter the text in any way it
 * wants but must free the given pointer and update it. If the new text is to
 * be discarded, the function can free it and set it text parameter to NULL.
 * This will also prevent any following filters from being called.
 *
 * @param[in] obj The object.
 * @param[in] func The function to use as item filter
 * @param[in] data User data to pass to @c func
 *
 * @ingroup Elm_Multibuttonentry_Group
  }
procedure elm_multibuttonentry_item_filter_append(obj:PElm_Multibuttonentry; func:TElm_Multibuttonentry_Item_Filter_Cb; data:pointer);cdecl;external;
{*
 * @brief Add a new item to the multibuttonentry after the indicated object
 *
 * See @ref Efl.Object.invalidate to delete the item.
 *
 * @param[in] obj The object.
 * @param[in] after The item after which to add it
 * @param[in] label The label of new item
 * @param[in] func The callback function to be invoked when this item is
 * pressed.
 * @param[in] data The pointer to the data to be attached
 *
 * @return A handle to the item added or NULL if not possible
 *
 * @ingroup Elm_Multibuttonentry_Group
  }
(* Const before type ignored *)
function elm_multibuttonentry_item_insert_after(obj:PElm_Multibuttonentry; after:PElm_Widget_Item; _label:Pchar; func:TEvas_Smart_Cb; data:pointer):PElm_Widget_Item;cdecl;external;
{$endif}

implementation


end.
