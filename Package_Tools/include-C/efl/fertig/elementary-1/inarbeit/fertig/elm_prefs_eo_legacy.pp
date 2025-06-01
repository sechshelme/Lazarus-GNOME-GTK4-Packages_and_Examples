
unit elm_prefs_eo_legacy;
interface

{
  Automatically converted by H2Pas 1.0.0 from elm_prefs_eo_legacy.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    elm_prefs_eo_legacy.h
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
PEina_Value  = ^Eina_Value;
PElm_Prefs  = ^Elm_Prefs;
PElm_Prefs_Data  = ^Elm_Prefs_Data;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _ELM_PREFS_EO_LEGACY_H_}
{$define _ELM_PREFS_EO_LEGACY_H_}
{$ifndef _ELM_PREFS_EO_CLASS_TYPE}
{$define _ELM_PREFS_EO_CLASS_TYPE}
type
  PElm_Prefs = ^TElm_Prefs;
  TElm_Prefs = TEo;
{$endif}
{$ifndef _ELM_PREFS_EO_TYPES}
{$define _ELM_PREFS_EO_TYPES}
{$endif}
{*
 * @brief Set user data for a given prefs widget
 *
 * Once a prefs widget is created, after elm_prefs_file_set() is issued on it,
 * all of its UI elements will get default values, when declared on that file.
 * To fetch a user's own, personal set of those values, one gets to pair a
 * prefs data handle to the prefs widget. This is what this call is intended
 * for.
 *
 * Prefs data values from @c prefs_data with keys matching the ones present on
 * the file passed on elm_prefs_file_set() to @c obj will have their values
 * applied to the respective UI elements of the widget.
 *
 * When @c obj dies, the values of the elements declared on its $.epb file (the
 * one set on elm_prefs_file_set()) marked as permanent will be written back to
 * prefs_data, if it is writable. One is also able to make this writing event
 * to take place automatically after each UI element modification by using
 * elm_prefs_autosave_set().
 *
 * @note @c obj will keep a reference of its own for @c prefs_data, but you
 * should still unreference it by yourself, after the widget is gone.
 *
 * @param[in] obj The object.
 * @param[in] data A valid prefs_data handle
 *
 * @return @c true, on success, @c false otherwise
 *
 * @since 1.8
 *
 * @ingroup Elm_Prefs_Group
  }

function elm_prefs_data_set(obj:PElm_Prefs; data:PElm_Prefs_Data):TEina_Bool;cdecl;external;
{*
 * @brief Set user data for a given prefs widget
 *
 * Once a prefs widget is created, after elm_prefs_file_set() is issued on it,
 * all of its UI elements will get default values, when declared on that file.
 * To fetch a user's own, personal set of those values, one gets to pair a
 * prefs data handle to the prefs widget. This is what this call is intended
 * for.
 *
 * Prefs data values from @c prefs_data with keys matching the ones present on
 * the file passed on elm_prefs_file_set() to @c obj will have their values
 * applied to the respective UI elements of the widget.
 *
 * When @c obj dies, the values of the elements declared on its $.epb file (the
 * one set on elm_prefs_file_set()) marked as permanent will be written back to
 * prefs_data, if it is writable. One is also able to make this writing event
 * to take place automatically after each UI element modification by using
 * elm_prefs_autosave_set().
 *
 * @note @c obj will keep a reference of its own for @c prefs_data, but you
 * should still unreference it by yourself, after the widget is gone.
 *
 * @param[in] obj The object.
 *
 * @return A valid prefs_data handle
 *
 * @since 1.8
 *
 * @ingroup Elm_Prefs_Group
  }
(* Const before type ignored *)
function elm_prefs_data_get(obj:PElm_Prefs):PElm_Prefs_Data;cdecl;external;
{*
 * @brief Control whether a given prefs widget should save its values back (on
 * the user data file, if set) automatically on every UI element changes.
 *
 * If @c autosave is @c true, every call to elm_prefs_item_value_set(), every
 * Elm_Prefs_Data_Event_Type.ELM_PREFS_DATA_EVENT_ITEM_CHANGED event coming for
 * its prefs data and every UI element direct value changing will implicitly
 * make the prefs values to be flushed back to it prefs data. If a prefs data
 * handle with no writing permissions or no prefs data is set on @c prefs,
 * naturally nothing will happen.
 *
 * @param[in] obj The object.
 * @param[in] autosave @c true to save automatically, @c false otherwise.
 *
 * @since 1.8
 *
 * @ingroup Elm_Prefs_Group
  }
procedure elm_prefs_autosave_set(obj:PElm_Prefs; autosave:TEina_Bool);cdecl;external;
{*
 * @brief Control whether a given prefs widget should save its values back (on
 * the user data file, if set) automatically on every UI element changes.
 *
 * If @c autosave is @c true, every call to elm_prefs_item_value_set(), every
 * Elm_Prefs_Data_Event_Type.ELM_PREFS_DATA_EVENT_ITEM_CHANGED event coming for
 * its prefs data and every UI element direct value changing will implicitly
 * make the prefs values to be flushed back to it prefs data. If a prefs data
 * handle with no writing permissions or no prefs data is set on @c prefs,
 * naturally nothing will happen.
 *
 * @param[in] obj The object.
 *
 * @return @c true to save automatically, @c false otherwise.
 *
 * @since 1.8
 *
 * @ingroup Elm_Prefs_Group
  }
(* Const before type ignored *)
function elm_prefs_autosave_get(obj:PElm_Prefs):TEina_Bool;cdecl;external;
{*
 * @brief Reset the values of a given prefs widget to a previous state.
 *
 * As can be seen on #Elm_Prefs_Reset_Mode, there are two possible actions to
 * be taken by this call -- either to reset @c prefs' values to the defaults
 * (declared on the $.epb file it is bound to) or to reset to the state they
 * were before the last modification it got.
 *
 * @param[in] obj The object.
 * @param[in] mode The reset mode to apply on @c prefs
 *
 * @since 1.8
 *
 * @ingroup Elm_Prefs_Group
  }
procedure elm_prefs_reset(obj:PElm_Prefs; mode:TElm_Prefs_Reset_Mode);cdecl;external;
{*
 * @brief Set the value on a given prefs widget's item.
 *
 * This will change the value of item named @c name programmatically.
 *
 * @param[in] obj The object.
 * @param[in] name The name of the item (as declared in the prefs collection)
 * @param[in] value The value to set on the item. It should be typed as the
 * item expects, preferably, or a conversion will take place
 *
 * @return @c true, on success, @c false otherwise
 *
 * @since 1.8
 *
 * @ingroup Elm_Prefs_Group
  }
(* Const before type ignored *)
(* Const before type ignored *)
function elm_prefs_item_value_set(obj:PElm_Prefs; name:Pchar; value:PEina_Value):TEina_Bool;cdecl;external;
{*
 * @brief Get the value of a given prefs widget's item.
 *
 * This will retrieve the value of item named @c name.
 *
 * @param[in] obj The object.
 * @param[in] name The name of the item (as declared in the prefs collection)
 * to get value from
 * @param[out] value Where to store the value of the item. It will be
 * overwritten and setup with the type the item is bound to
 *
 * @return @c true, on success, @c false otherwise
 *
 * @since 1.8
 *
 * @ingroup Elm_Prefs_Group
  }
(* Const before type ignored *)
(* Const before type ignored *)
function elm_prefs_item_value_get(obj:PElm_Prefs; name:Pchar; value:PEina_Value):TEina_Bool;cdecl;external;
{*
 * @brief Get the Elementary widget bound to a given prefs widget's item.
 *
 * This will retrieve a handle to the real widget implementing a given item of
 * @c prefs, <b>for read-only</b> actions.
 *
 * @warning You should never modify the state of the returned widget, because
 * it's meant to be managed by @c prefs, solely.
 *
 * @param[in] obj The object.
 * @param[in] name The name of the item (as declared in the prefs collection)
 * to get object from
 *
 * @return A valid widget handle, on success, or @c NULL, otherwise
 *
 * @since 1.8
 *
 * @ingroup Elm_Prefs_Group
  }
(* Const before type ignored *)
(* Const before type ignored *)
function elm_prefs_item_object_get(obj:PElm_Prefs; name:Pchar):PEfl_Canvas_Object;cdecl;external;
{*
 * @brief Set whether the widget bound to a given prefs widget's item is
 * disabled or not.
 *
 * @param[in] obj The object.
 * @param[in] name The name of the item (as declared in the prefs collection)
 * to act on
 * @param[in] disabled @c true, to make it disabled, @c false otherwise
 *
 * @since 1.8
 *
 * @ingroup Elm_Prefs_Group
  }
(* Const before type ignored *)
procedure elm_prefs_item_disabled_set(obj:PElm_Prefs; name:Pchar; disabled:TEina_Bool);cdecl;external;
{*
 * @brief Get whether the widget bound to a given prefs widget's item is
 * disabled or not.
 *
 * @param[in] obj The object.
 * @param[in] name The name of the item (as declared in the prefs collection)
 * to get disabled state from
 *
 * @return @c true, if it is disabled, @c false otherwise
 *
 * @since 1.8
 *
 * @ingroup Elm_Prefs_Group
  }
(* Const before type ignored *)
(* Const before type ignored *)
function elm_prefs_item_disabled_get(obj:PElm_Prefs; name:Pchar):TEina_Bool;cdecl;external;
{*
 * @brief "Swallows" an object into a SWALLOW item of a prefs widget.
 *
 * @param[in] obj The object.
 * @param[in] name The name of the SWALLOW item (as declared in the prefs
 * collection)
 * @param[in] child The object to occupy the item
 *
 * @return @c true, on success, @c false otherwise
 *
 * @since 1.8
 *
 * @ingroup Elm_Prefs_Group
  }
(* Const before type ignored *)
function elm_prefs_item_swallow(obj:PElm_Prefs; name:Pchar; child:PEfl_Canvas_Object):TEina_Bool;cdecl;external;
{*
 * @brief Set whether the widget bound to a given prefs widget's item is
 * editable or not.
 *
 * @note Only @c TEXT or @c TEXTAREA items' default widgets implement the
 * 'editable' property. Custom registered widgets may as well implement them.
 *
 * @param[in] obj The object.
 * @param[in] name The name of the item (as declared in the prefs collection)
 * to act on
 * @param[in] editable @c true, to make it editable, @c false otherwise
 *
 * @since 1.8
 *
 * @ingroup Elm_Prefs_Group
  }
(* Const before type ignored *)
procedure elm_prefs_item_editable_set(obj:PElm_Prefs; name:Pchar; editable:TEina_Bool);cdecl;external;
{*
 * @brief Get whether the widget bound to a given prefs widget's item is
 * editable or not.
 *
 * @param[in] obj The object.
 * @param[in] name The name of the item (as declared in the prefs collection)
 * to get editable state from
 *
 * @return @c true, if it is editable, @c false otherwise
 *
 * @since 1.8
 *
 * @ingroup Elm_Prefs_Group
  }
(* Const before type ignored *)
(* Const before type ignored *)
function elm_prefs_item_editable_get(obj:PElm_Prefs; name:Pchar):TEina_Bool;cdecl;external;
{*
 * @brief Unswallow an object from a SWALLOW item of a prefs widget.
 *
 * @param[in] obj The object.
 * @param[in] name The name of the SWALLOW item (as declared in the prefs
 * collection)
 *
 * @return The unswallowed object, or NULL on errors
 *
 * @since 1.8
 *
 * @ingroup Elm_Prefs_Group
  }
(* Const before type ignored *)
function elm_prefs_item_unswallow(obj:PElm_Prefs; name:Pchar):PEfl_Canvas_Object;cdecl;external;
{*
 * @brief Set whether the widget bound to given prefs widget's item should be
 * visible or not.
 *
 * Each prefs item may have a default visibility state, declared on the $.epb
 * @c prefs it was loaded with. By this call one may alter that state,
 * programmatically.
 *
 * @param[in] obj The object.
 * @param[in] name The name of the item (as declared in the prefs collection)
 * to change visibility of
 * @param[in] visible @c true, to make it visible, @c false otherwise
 *
 * @since 1.8
 *
 * @ingroup Elm_Prefs_Group
  }
(* Const before type ignored *)
procedure elm_prefs_item_visible_set(obj:PElm_Prefs; name:Pchar; visible:TEina_Bool);cdecl;external;
{*
 * @brief Get whether the widget bound to a given prefs widget's item is
 * visible or not.
 *
 * @param[in] obj The object.
 * @param[in] name The name of the item (as declared in the prefs collection)
 * to get visibility state from
 *
 * @return @c true, if it is visible, @c false otherwise
 *
 * @since 1.8
 *
 * @ingroup Elm_Prefs_Group
  }
(* Const before type ignored *)
(* Const before type ignored *)
function elm_prefs_item_visible_get(obj:PElm_Prefs; name:Pchar):TEina_Bool;cdecl;external;
{$endif}

implementation


end.
