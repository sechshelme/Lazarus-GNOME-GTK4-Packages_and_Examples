
unit elm_slideshow_eo_legacy;
interface

{
  Automatically converted by H2Pas 1.0.0 from elm_slideshow_eo_legacy.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    elm_slideshow_eo_legacy.h
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
PElm_Slideshow  = ^Elm_Slideshow;
PElm_Slideshow_Item_Class  = ^Elm_Slideshow_Item_Class;
PElm_Widget_Item  = ^Elm_Widget_Item;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _ELM_SLIDESHOW_EO_LEGACY_H_}
{$define _ELM_SLIDESHOW_EO_LEGACY_H_}
{$ifndef _ELM_SLIDESHOW_EO_CLASS_TYPE}
{$define _ELM_SLIDESHOW_EO_CLASS_TYPE}
type
  PElm_Slideshow = ^TElm_Slideshow;
  TElm_Slideshow = TEo;
{$endif}
{$ifndef _ELM_SLIDESHOW_EO_TYPES}
{$define _ELM_SLIDESHOW_EO_TYPES}
{$endif}
{*
 * @brief Set the number of items to cache, on a given slideshow widget, after
 * the current item.
 *
 * The default value for this property is 2. See @ref Slideshow_Caching
 * "slideshow caching" for more details.
 *
 * @param[in] obj The object.
 * @param[in] count Number of items to cache after the current one.
 *
 * @ingroup Elm_Slideshow_Group
  }

procedure elm_slideshow_cache_after_set(obj:PElm_Slideshow; count:longint);cdecl;external;
{*
 * @brief Get the number of items to cache, on a given slideshow widget, after
 * the current item.
 *
 * @param[in] obj The object.
 *
 * @return Number of items to cache after the current one.
 *
 * @ingroup Elm_Slideshow_Group
  }
(* Const before type ignored *)
function elm_slideshow_cache_after_get(obj:PElm_Slideshow):longint;cdecl;external;
{*
 * @brief Set the number of items to cache, on a given slideshow widget, before
 * the current item.
 *
 * The default value for this property is 2. See @ref Slideshow_Caching
 * "slideshow caching" for more details.
 *
 * @param[in] obj The object.
 * @param[in] count Number of items to cache before the current one.
 *
 * @ingroup Elm_Slideshow_Group
  }
procedure elm_slideshow_cache_before_set(obj:PElm_Slideshow; count:longint);cdecl;external;
{*
 * @brief Get the number of items to cache, on a given slideshow widget, before
 * the current item.
 *
 * @param[in] obj The object.
 *
 * @return Number of items to cache before the current one.
 *
 * @ingroup Elm_Slideshow_Group
  }
(* Const before type ignored *)
function elm_slideshow_cache_before_get(obj:PElm_Slideshow):longint;cdecl;external;
{*
 * @brief Set the current slide layout in use for a given slideshow widget
 *
 * If @c layout is implemented in @c obj's theme (i.e., is contained in the
 * list returned by elm_slideshow_layouts_get()), this new images layout will
 * be used on the widget.
 *
 * See @ref elm_slideshow_layouts_get for more details.
 *
 * @param[in] obj The object.
 * @param[in] layout The new layout's name string.
 *
 * @ingroup Elm_Slideshow_Group
  }
(* Const before type ignored *)
procedure elm_slideshow_layout_set(obj:PElm_Slideshow; layout:Pchar);cdecl;external;
{*
 * @brief Get the current slide layout in use for a given slideshow widget.
 *
 * @param[in] obj The object.
 *
 * @return The new layout's name string.
 *
 * @ingroup Elm_Slideshow_Group
  }
(* Const before type ignored *)
(* Const before type ignored *)
function elm_slideshow_layout_get(obj:PElm_Slideshow):Pchar;cdecl;external;
{*
 * @brief Set the current slide transition/effect in use for a given slideshow
 * widget.
 *
 * If @c transition is implemented in @c obj's theme (i.e., is contained in the
 * list returned by @ref elm_slideshow_transitions_get), this new sliding
 * effect will be used on the widget.
 *
 * @param[in] obj The object.
 * @param[in] transition The new transition's name string.
 *
 * @ingroup Elm_Slideshow_Group
  }
(* Const before type ignored *)
procedure elm_slideshow_transition_set(obj:PElm_Slideshow; transition:Pchar);cdecl;external;
{*
 * @brief Get the current slide transition/effect in use for a given slideshow
 * widget.
 *
 * @param[in] obj The object.
 *
 * @return The new transition's name string.
 *
 * @ingroup Elm_Slideshow_Group
  }
(* Const before type ignored *)
(* Const before type ignored *)
function elm_slideshow_transition_get(obj:PElm_Slideshow):Pchar;cdecl;external;
{*
 * @brief Set if the slideshow items should be displayed cyclically or not, so
 * when the end is reached it will restart from the first item.
 *
 * @note This will affect the "automatic" slidshow behaviour and the
 * @ref elm_slideshow_next and @ref elm_slideshow_previous functions as well.
 *
 * @param[in] obj The object.
 * @param[in] loop Use @c true to make it cycle through items or @c false for
 * it to stop at the end of @c obj's internal list of items.
 *
 * @ingroup Elm_Slideshow_Group
  }
procedure elm_slideshow_loop_set(obj:PElm_Slideshow; loop:TEina_Bool);cdecl;external;
{*
 * @brief Get if, after a slideshow is started, for a given slideshow widget,
 * its items are to be displayed cyclically or not.
 *
 * @param[in] obj The object.
 *
 * @return Use @c true to make it cycle through items or @c false for it to
 * stop at the end of @c obj's internal list of items.
 *
 * @ingroup Elm_Slideshow_Group
  }
(* Const before type ignored *)
function elm_slideshow_loop_get(obj:PElm_Slideshow):TEina_Bool;cdecl;external;
{*
 * @brief Set the interval between each image transition on a given slideshow
 * widget and start the slideshow itself.
 *
 * After this call, the slideshow widget will start cycling its view,
 * sequentially and automatically, with the images of the items it has. The
 * time between each new image displayed is going to be @c timeout, in seconds.
 * If a different timeout was set previously and an slideshow was in progress,
 * it will continue with the new time between transitions, after this call.
 *
 * @note A value less than or equal to 0 on @c timeout will disable the
 * widget's internal timer, thus halting any slideshow which could be happening
 * on @c obj.
 *
 * @param[in] obj The object.
 * @param[in] timeout The new displaying timeout for images.
 *
 * @ingroup Elm_Slideshow_Group
  }
procedure elm_slideshow_timeout_set(obj:PElm_Slideshow; timeout:Tdouble);cdecl;external;
{*
 * @brief Get the interval set for image transitions on a given slideshow
 * widget.
 *
 * @param[in] obj The object.
 *
 * @return The new displaying timeout for images.
 *
 * @ingroup Elm_Slideshow_Group
  }
(* Const before type ignored *)
function elm_slideshow_timeout_get(obj:PElm_Slideshow):Tdouble;cdecl;external;
{*
 * @brief Get the internal list of items in a given slideshow widget.
 *
 * This list is not to be modified in any way and must not be freed.
 *
 * @warning This list is only valid until @c obj object's internal items list
 * is changed. It should be fetched again with another call to this function
 * when changes happen.
 *
 * @param[in] obj The object.
 *
 * @return The list of items (#Elm_Widget_Item as data) or @c null on errors.
 *
 * @ingroup Elm_Slideshow_Group
  }
(* Const before type ignored *)
(* Const before type ignored *)
function elm_slideshow_items_get(obj:PElm_Slideshow):PEina_List;cdecl;external;
{*
 * @brief Returns the list of sliding transition/effect names available, for a
 * given slideshow widget.
 *
 * The transitions, which come from @c obj's theme, must be an EDC data item
 * named $"transitions" on the theme file, with (prefix) names of EDC programs
 * actually implementing them.
 *
 * The available transitions for slideshows on the default theme are "fade"
 * (the current item fades out, while the new one fades in to the slideshow's
 * viewport), "black_fade" (the current item fades to black, and just then, the
 * new item will fade in), "horizontal" (the current item slides horizontally,
 * until it gets out of the slideshow's viewport, while the new item comes from
 * the left to take its place), "vertical" (the current item slides vertically,
 * until it gets out of the slideshow's viewport, while the new item comes from
 * the bottom to take its place), "square" (the new item starts to appear from
 * the middle of the current one, but with a tiny size, growing until its
 * target (full) size and covering the old one.
 *
 * @warning The stringshared strings get no new references exclusive to the
 * user grabbing the list, here, so if you'd like to use them out of this
 * call's context, you'd better @ref eina_stringshare_ref them. Also the list
 * is an internal list and so is only valid for as long as the slideshow object
 * is valid and has not internally changed its list for some reason, so make a
 * copy if you need it around.
 *
 * @param[in] obj The object.
 *
 * @return The list of transitions (list of stringshared strings as data).
 *
 * @ingroup Elm_Slideshow_Group
  }
(* Const before type ignored *)
(* Const before type ignored *)
function elm_slideshow_transitions_get(obj:PElm_Slideshow):PEina_List;cdecl;external;
{*
 * @brief Get the number of items stored in a given slideshow widget.
 *
 * @param[in] obj The object.
 *
 * @return The number of items on @c obj, at the moment of this call.
 *
 * @ingroup Elm_Slideshow_Group
  }
(* Const before type ignored *)
function elm_slideshow_count_get(obj:PElm_Slideshow):dword;cdecl;external;
{*
 * @brief Returns the currently displayed item, in a given slideshow widget.
 *
 * @param[in] obj The object.
 *
 * @return A handle to the item being displayed in @c obj or @c null, if none
 * is (and on errors)
 *
 * @ingroup Elm_Slideshow_Group
  }
(* Const before type ignored *)
function elm_slideshow_item_current_get(obj:PElm_Slideshow):PElm_Widget_Item;cdecl;external;
{*
 * @brief Returns the list of layout names available, for a given slideshow
 * widget.
 *
 * Slideshow layouts will change how the widget is to dispose each image item
 * in its viewport, with regard to cropping, scaling, etc.
 *
 * The layouts, which come from @c obj's theme, must be an EDC data item name
 * $"layouts" on the theme file, with (prefix) names of EDC programs actually
 * implementing them.
 *
 * The available layouts for slideshows on the default theme are "fullscreen"
 * (item images with original aspect, scaled to touch top and down slideshow
 * borders or, if the image's height is not enough, left and right slideshow
 * borders) and "not_fullscreen" (the same behavior as the "fullscreen" one,
 * but always leaving 10% of the slideshow's dimensions of distance between the
 * item image's borders and the slideshow borders, for each axis)-
 *
 * @warning The stringshared strings get no new references exclusive to the
 * user grabbing the list, here, so if you'd like to use them out of this
 * call's context, you'd better @ref eina_stringshare_ref them.
 *
 * @param[in] obj The object.
 *
 * @return The list of layouts (list of stringshared strings as data)
 *
 * @ingroup Elm_Slideshow_Group
  }
(* Const before type ignored *)
(* Const before type ignored *)
function elm_slideshow_layouts_get(obj:PElm_Slideshow):PEina_List;cdecl;external;
{*
 * @brief Slide to the previous item, in a given slideshow widget
 *
 * The sliding animation @c obj is set to use will be the transition effect
 * used, after this call is issued.
 *
 * @note If the beginning of the slideshow's internal list of items is reached,
 * it'll wrap around to the list's end, again.
 * @param[in] obj The object.
 *
 * @ingroup Elm_Slideshow_Group
  }
procedure elm_slideshow_previous(obj:PElm_Slideshow);cdecl;external;
{*
 * @brief Get the the item, in a given slideshow widget, placed at position
 * @c nth, in its internal items list.
 *
 * @param[in] obj The object.
 * @param[in] nth The number of the item to grab a handle to (0 being the
 * first).
 *
 * @return The item stored in @c obj at position @c nth or @c null if there's
 * no item with that index (and on errors).
 *
 * @ingroup Elm_Slideshow_Group
  }
(* Const before type ignored *)
function elm_slideshow_item_nth_get(obj:PElm_Slideshow; nth:dword):PElm_Widget_Item;cdecl;external;
{*
 * @brief Slide to the next item, in a given slideshow widget.
 *
 * The sliding animation @c obj is set to use will be the transition effect
 * used, after this call is issued.
 *
 * @note If the end of the slideshow's internal list of items is reached, it'll
 * wrap around to the list's beginning, again.
 * @param[in] obj The object.
 *
 * @ingroup Elm_Slideshow_Group
  }
procedure elm_slideshow_next(obj:PElm_Slideshow);cdecl;external;
{*
 * @brief Remove all items from a given slideshow widget.
 *
 * This removes (and deletes) all items in @c obj, leaving it empty.
 * @param[in] obj The object.
 *
 * @ingroup Elm_Slideshow_Group
  }
procedure elm_slideshow_clear(obj:PElm_Slideshow);cdecl;external;
{*
 * @brief Add (append) a new item in a given slideshow widget.
 *
 * Add a new item to @c obj's internal list of items, appending it. The item's
 * class must contain the function really fetching the image object to show for
 * this item, which could be an Evas image object or an Elementary photo, for
 * example. The @c data parameter is going to be passed to both class functions
 * of the item.
 *
 * @param[in] obj The object.
 * @param[in] itc The item class for the item.
 * @param[in] data The item's data.
 *
 * @return A handle to the item added or @c null on errors.
 *
 * @ingroup Elm_Slideshow_Group
  }
(* Const before type ignored *)
(* Const before type ignored *)
function elm_slideshow_item_add(obj:PElm_Slideshow; itc:PElm_Slideshow_Item_Class; data:pointer):PElm_Widget_Item;cdecl;external;
{*
 * @brief Insert a new item into the given slideshow widget, using the @c func
 * function to sort items (by item handles).
 *
 * Add a new item to @c obj's internal list of items, in a position determined
 * by the @c func comparing function. The item's class must contain the
 * function really fetching the image object to show for this item, which could
 * be an Evas image object or an Elementary photo, for example. The @c data
 * parameter is going to be passed to both class functions of the item.
 *
 * @param[in] obj The object.
 * @param[in] itc The item class for the item.
 * @param[in] data The item's data.
 * @param[in] func The comparing function to be used to sort the slideshow
 * items by #Elm_Slideshow_Item_Class item handles.
 *
 * @return Returns The slideshow item handle, on success, or @c null on errors.
 *
 * @ingroup Elm_Slideshow_Group
  }
(* Const before type ignored *)
(* Const before type ignored *)
function elm_slideshow_item_sorted_insert(obj:PElm_Slideshow; itc:PElm_Slideshow_Item_Class; data:pointer; func:TEina_Compare_Cb):PElm_Widget_Item;cdecl;external;
{$endif}

implementation


end.
