
unit elm_flipselector_eo_legacy;
interface

{
  Automatically converted by H2Pas 1.0.0 from elm_flipselector_eo_legacy.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    elm_flipselector_eo_legacy.h
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
PElm_Flipselector  = ^Elm_Flipselector;
PElm_Widget_Item  = ^Elm_Widget_Item;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _ELM_FLIPSELECTOR_EO_LEGACY_H_}
{$define _ELM_FLIPSELECTOR_EO_LEGACY_H_}
{$ifndef _ELM_FLIPSELECTOR_EO_CLASS_TYPE}
{$define _ELM_FLIPSELECTOR_EO_CLASS_TYPE}
type
  PElm_Flipselector = ^TElm_Flipselector;
  TElm_Flipselector = TEo;
{$endif}
{$ifndef _ELM_FLIPSELECTOR_EO_TYPES}
{$define _ELM_FLIPSELECTOR_EO_TYPES}
{$endif}
{*
 * @brief Get the internal list of items in a given flip selector widget.
 *
 * This list is not to be modified in any way and must not be freed. Use the
 * list members with functions like @ref elm_object_item_text_set, @ref
 * elm_object_item_text_get, @ref elm_object_item_del, @ref
 * elm_flipselector_item_selected_get, @ref elm_flipselector_item_selected_set.
 *
 * @warning This list is only valid until @c obj object's internal items list
 * is changed. It should be fetched again with another call to this function
 * when changes happen.
 *
 * @param[in] obj The object.
 *
 * @return List of items
 *
 * @ingroup Elm_Flipselector_Group
  }
(* Const before type ignored *)
(* Const before type ignored *)

function elm_flipselector_items_get(obj:PElm_Flipselector):PEina_List;cdecl;external;
{*
 * @brief Get the first item in the given flip selector widget's list of items.
 *
 * See also @ref elm_flipselector_item_append,
 * @ref elm_flipselector_last_item_get.
 *
 * @param[in] obj The object.
 *
 * @return The first item or @c null, if it has no items (and on errors).
 *
 * @ingroup Elm_Flipselector_Group
  }
(* Const before type ignored *)
function elm_flipselector_first_item_get(obj:PElm_Flipselector):PElm_Widget_Item;cdecl;external;
{*
 * @brief Get the last item in the given flip selector widget's list of items.
 *
 * See also @ref elm_flipselector_item_prepend,
 * @ref elm_flipselector_first_item_get.
 *
 * @param[in] obj The object.
 *
 * @return The last item or @c null, if it has no items (and on errors).
 *
 * @ingroup Elm_Flipselector_Group
  }
(* Const before type ignored *)
function elm_flipselector_last_item_get(obj:PElm_Flipselector):PElm_Widget_Item;cdecl;external;
{*
 * @brief Get the currently selected item in a flip selector widget.
 *
 * @param[in] obj The object.
 *
 * @return The selected item or @c null, if the widget has no items (and on
 * errors).
 *
 * @ingroup Elm_Flipselector_Group
  }
(* Const before type ignored *)
function elm_flipselector_selected_item_get(obj:PElm_Flipselector):PElm_Widget_Item;cdecl;external;
{*
 * @brief Set the interval on time updates for a user mouse button hold on a
 * flip selector widget.
 *
 * This interval value is decreased while the user holds the mouse pointer
 * either flipping up or flipping down a given flip selector.
 *
 * This helps the user to get to a given item distant from the current one
 * easier/faster, as it will start to flip quicker and quicker on mouse button
 * holds.
 *
 * The calculation for the next flip interval value, starting from the one set
 * with this call, is the previous interval divided by 1.05, so it decreases a
 * little bit.
 *
 * The default starting interval value for automatic flips is 0.85 seconds.
 *
 * See also @ref elm_flipselector_first_interval_get.
 *
 * @param[in] obj The object.
 * @param[in] interval The (first) interval value in seconds.
 *
 * @ingroup Elm_Flipselector_Group
  }
procedure elm_flipselector_first_interval_set(obj:PElm_Flipselector; interval:Tdouble);cdecl;external;
{*
 * @brief Get the interval on time updates for a user mouse button hold on a
 * flip selector widget.
 *
 * See also @ref elm_flipselector_first_interval_set for more details.
 *
 * @param[in] obj The object.
 *
 * @return The (first) interval value in seconds.
 *
 * @ingroup Elm_Flipselector_Group
  }
(* Const before type ignored *)
function elm_flipselector_first_interval_get(obj:PElm_Flipselector):Tdouble;cdecl;external;
{*
 * @brief Prepend a (text) item to a flip selector widget
 *
 * The widget's list of labels to show will be prepended with the given value.
 * If the user wishes so, a callback function pointer can be passed, which will
 * get called when this same item is selected.
 *
 * @note The current selection won't be modified by prepending an element to
 * the list.
 *
 * @note The maximum length of the text label is going to be determined by the
 * widget's theme. Strings larger than that value are going to be truncated.
 *
 * @param[in] obj The object.
 * @param[in] label The (text) label of the new item.
 * @param[in] func Convenience callback function to take place when item is
 * selected.
 * @param[in] data Data passed to @c func, above.
 *
 * @return New widget item
 *
 * @ingroup Elm_Flipselector_Group
  }
(* Const before type ignored *)
function elm_flipselector_item_prepend(obj:PElm_Flipselector; _label:Pchar; func:TEvas_Smart_Cb; data:pointer):PElm_Widget_Item;cdecl;external;
{*
 * @brief Programmatically select the next item of a flip selector widget
 *
 * @note The selection will be animated. Also, if it reaches the end of its
 * list of member items, it will continue with the first one onwards.
 * @param[in] obj The object.
 *
 * @ingroup Elm_Flipselector_Group
  }
procedure elm_flipselector_flip_next(obj:PElm_Flipselector);cdecl;external;
{*
 * @brief Append a (text) item to a flip selector widget
 *
 * The widget's list of labels to show will be appended with the given value.
 * If the user wishes so, a callback function pointer can be passed, which will
 * get called when this same item is selected.
 *
 * @note The current selection won't be modified by appending an element to the
 * list.
 *
 * @note The maximum length of the text label is going to be determined by the
 * widget's theme. Strings larger than that value are going to be truncated.
 *
 * @param[in] obj The object.
 * @param[in] label The (text) label of the new item.
 * @param[in] func Convenience callback function to take place when item is
 * selected.
 * @param[in] data Data passed to @c func, above.
 *
 * @return New widget item
 *
 * @ingroup Elm_Flipselector_Group
  }
(* Const before type ignored *)
(* Const before type ignored *)
function elm_flipselector_item_append(obj:PElm_Flipselector; _label:Pchar; func:TEvas_Smart_Cb; data:pointer):PElm_Widget_Item;cdecl;external;
{*
 * @brief Programmatically select the previous item of a flip selector widget
 *
 * @note The selection will be animated. Also, if it reaches the beginning of
 * its list of member items, it will continue with the last one backwards.
 * @param[in] obj The object.
 *
 * @ingroup Elm_Flipselector_Group
  }
procedure elm_flipselector_flip_prev(obj:PElm_Flipselector);cdecl;external;
{$endif}

implementation


end.
