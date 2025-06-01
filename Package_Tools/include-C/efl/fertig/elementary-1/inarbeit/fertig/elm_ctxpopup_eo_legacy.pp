
unit elm_ctxpopup_eo_legacy;
interface

{
  Automatically converted by H2Pas 1.0.0 from elm_ctxpopup_eo_legacy.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    elm_ctxpopup_eo_legacy.h
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
PElm_Ctxpopup  = ^Elm_Ctxpopup;
PElm_Ctxpopup_Direction  = ^Elm_Ctxpopup_Direction;
PElm_Widget_Item  = ^Elm_Widget_Item;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _ELM_CTXPOPUP_EO_LEGACY_H_}
{$define _ELM_CTXPOPUP_EO_LEGACY_H_}
{$ifndef _ELM_CTXPOPUP_EO_CLASS_TYPE}
{$define _ELM_CTXPOPUP_EO_CLASS_TYPE}
type
  PElm_Ctxpopup = ^TElm_Ctxpopup;
  TElm_Ctxpopup = TEo;
{$endif}
{$ifndef _ELM_CTXPOPUP_EO_TYPES}
{$define _ELM_CTXPOPUP_EO_TYPES}
{* Direction in which to show the popup.
 *
 * @ingroup Elm_Ctxpopup_Group
  }
{*< Ctxpopup show appear below clicked area.
                                     }
{*< Ctxpopup show appear to the right of the
                                 * clicked area.  }
{*< Ctxpopup show appear to the left of the
                                * clicked area.  }
{*< Ctxpopup show appear above the clicked area.
                               }
{*< Ctxpopup does not determine it's direction
                                  * yet.  }
type
  PElm_Ctxpopup_Direction = ^TElm_Ctxpopup_Direction;
  TElm_Ctxpopup_Direction = (ELM_CTXPOPUP_DIRECTION_DOWN := 0,ELM_CTXPOPUP_DIRECTION_RIGHT,
    ELM_CTXPOPUP_DIRECTION_LEFT,ELM_CTXPOPUP_DIRECTION_UP,
    ELM_CTXPOPUP_DIRECTION_UNKNOWN);
{$endif}
{*
 * @brief Get the selected item in the widget.
 *
 * @param[in] obj The object.
 *
 * @return The selected item or @c null.
 *
 * @ingroup Elm_Ctxpopup_Group
  }
(* Const before type ignored *)

function elm_ctxpopup_selected_item_get(obj:PElm_Ctxpopup):PElm_Widget_Item;cdecl;external;
{*
 * @brief Get the first item in the widget.
 *
 * @param[in] obj The object.
 *
 * @return The first item or @c null.
 *
 * @ingroup Elm_Ctxpopup_Group
  }
(* Const before type ignored *)
function elm_ctxpopup_first_item_get(obj:PElm_Ctxpopup):PElm_Widget_Item;cdecl;external;
{*
 * @brief Get the last item in the widget.
 *
 * @param[in] obj The object.
 *
 * @return The last item or @c null.
 *
 * @ingroup Elm_Ctxpopup_Group
  }
(* Const before type ignored *)
function elm_ctxpopup_last_item_get(obj:PElm_Ctxpopup):PElm_Widget_Item;cdecl;external;
{*
 * @brief Returns a list of the widget item.
 *
 * @param[in] obj The object.
 *
 * @return const list to widget items
 *
 * @ingroup Elm_Ctxpopup_Group
  }
(* Const before type ignored *)
(* Const before type ignored *)
function elm_ctxpopup_items_get(obj:PElm_Ctxpopup):PEina_List;cdecl;external;
{*
 * @brief Change the ctxpopup's orientation to horizontal or vertical.
 *
 * @param[in] obj The object.
 * @param[in] horizontal @c true for horizontal mode, @c false for vertical.
 *
 * @ingroup Elm_Ctxpopup_Group
  }
procedure elm_ctxpopup_horizontal_set(obj:PElm_Ctxpopup; horizontal:TEina_Bool);cdecl;external;
{*
 * @brief Get the value of current ctxpopup object's orientation.
 *
 * See also @ref elm_ctxpopup_horizontal_set.
 *
 * @param[in] obj The object.
 *
 * @return @c true for horizontal mode, @c false for vertical.
 *
 * @ingroup Elm_Ctxpopup_Group
  }
(* Const before type ignored *)
function elm_ctxpopup_horizontal_get(obj:PElm_Ctxpopup):TEina_Bool;cdecl;external;
{*
 * @brief Set ctxpopup auto hide mode triggered by ctxpopup policy.
 *
 * Use this function when user wants ctxpopup not to hide automatically. By
 * default, ctxpopup is dismissed whenever mouse clicked its background area,
 * language is changed, and its parent geometry is updated(changed). Not to
 * hide ctxpopup automatically, disable auto hide function by calling this API,
 * then ctxpopup won't be dismissed in those scenarios.
 *
 * Default value of disabled is @c false.
 *
 * See also @ref elm_ctxpopup_auto_hide_disabled_get.
 *
 * @param[in] obj The object.
 * @param[in] disabled Auto hide enable/disable.
 *
 * @since 1.9
 *
 * @ingroup Elm_Ctxpopup_Group
  }
procedure elm_ctxpopup_auto_hide_disabled_set(obj:PElm_Ctxpopup; disabled:TEina_Bool);cdecl;external;
{*
 * @brief Get ctxpopup auto hide mode triggered by ctxpopup policy.
 *
 * See also @ref elm_ctxpopup_auto_hide_disabled_set for more information.
 *
 * @param[in] obj The object.
 *
 * @return Auto hide enable/disable.
 *
 * @since 1.9
 *
 * @ingroup Elm_Ctxpopup_Group
  }
(* Const before type ignored *)
function elm_ctxpopup_auto_hide_disabled_get(obj:PElm_Ctxpopup):TEina_Bool;cdecl;external;
{*
 * @brief Set the Ctxpopup's parent
 *
 * Set the parent object.
 *
 * @note @ref elm_ctxpopup_add will automatically call this function with its
 * @c parent argument.
 *
 * See also @ref elm_ctxpopup_add, @ref elm_hover_parent_set.
 *
 * @param[in] obj The object.
 * @param[in] parent The parent to use.
 *
 * @ingroup Elm_Ctxpopup_Group
  }
procedure elm_ctxpopup_hover_parent_set(obj:PElm_Ctxpopup; parent:PEfl_Canvas_Object);cdecl;external;
{*
 * @brief Get the Ctxpopup's parent
 *
 * See also @ref elm_ctxpopup_hover_parent_set for more information
 *
 * @param[in] obj The object.
 *
 * @return The parent to use.
 *
 * @ingroup Elm_Ctxpopup_Group
  }
(* Const before type ignored *)
function elm_ctxpopup_hover_parent_get(obj:PElm_Ctxpopup):PEfl_Canvas_Object;cdecl;external;
{*
 * @brief Set the direction priority of a ctxpopup.
 *
 * This functions gives a chance to user to set the priority of ctxpopup
 * showing direction. This doesn't guarantee the ctxpopup will appear in the
 * requested direction.
 *
 * See also @ref Elm_Ctxpopup_Direction.
 *
 * @param[in] obj The object.
 * @param[in] first 1st priority of direction
 * @param[in] second 2nd priority of direction
 * @param[in] third 3th priority of direction
 * @param[in] fourth 4th priority of direction
 *
 * @ingroup Elm_Ctxpopup_Group
  }
procedure elm_ctxpopup_direction_priority_set(obj:PElm_Ctxpopup; first:TElm_Ctxpopup_Direction; second:TElm_Ctxpopup_Direction; third:TElm_Ctxpopup_Direction; fourth:TElm_Ctxpopup_Direction);cdecl;external;
{*
 * @brief Get the direction priority of a ctxpopup.
 *
 * See also @ref elm_ctxpopup_direction_priority_set for more information.
 *
 * @param[in] obj The object.
 * @param[out] first 1st priority of direction
 * @param[out] second 2nd priority of direction
 * @param[out] third 3th priority of direction
 * @param[out] fourth 4th priority of direction
 *
 * @ingroup Elm_Ctxpopup_Group
  }
(* Const before type ignored *)
procedure elm_ctxpopup_direction_priority_get(obj:PElm_Ctxpopup; first:PElm_Ctxpopup_Direction; second:PElm_Ctxpopup_Direction; third:PElm_Ctxpopup_Direction; fourth:PElm_Ctxpopup_Direction);cdecl;external;
{*
 * @brief Get the current direction of a ctxpopup.
 *
 * @warning Once the ctxpopup showed up, the direction would be determined
 *
 * @param[in] obj The object.
 *
 * @return Direction
 *
 * @ingroup Elm_Ctxpopup_Group
  }
(* Const before type ignored *)
function elm_ctxpopup_direction_get(obj:PElm_Ctxpopup):TElm_Ctxpopup_Direction;cdecl;external;
{*
 * @brief Dismiss a ctxpopup object
 *
 * Use this function to simulate clicking outside of the ctxpopup to dismiss
 * it. In this way, the ctxpopup will be hidden and the "clicked" signal will
 * be emitted.
 * @param[in] obj The object.
 *
 * @ingroup Elm_Ctxpopup_Group
  }
procedure elm_ctxpopup_dismiss(obj:PElm_Ctxpopup);cdecl;external;
{* Clear all items in the given ctxpopup object.
 *
 * @ingroup Elm_Ctxpopup_Group
  }
procedure elm_ctxpopup_clear(obj:PElm_Ctxpopup);cdecl;external;
{*
 * @brief Insert a new item to a ctxpopup object before item @c before.
 *
 * See also elm_object_content_set.
 *
 * @param[in] obj The object.
 * @param[in] before The ctxpopup item to insert before.
 * @param[in] label The Label of the new item
 * @param[in] icon Icon to be set on new item
 * @param[in] func Convenience function called when item selected
 * @param[in] data Data passed to @c func
 *
 * @return A handle to the item added or @c null, on errors.
 *
 * @since 1.21
 *
 * @ingroup Elm_Ctxpopup_Group
  }
(* Const before type ignored *)
(* Const before type ignored *)
function elm_ctxpopup_item_insert_before(obj:PElm_Ctxpopup; before:PElm_Widget_Item; _label:Pchar; icon:PEfl_Canvas_Object; func:TEvas_Smart_Cb; 
           data:pointer):PElm_Widget_Item;cdecl;external;
{*
 * @brief Insert a new item to a ctxpopup object after item @c after.
 *
 * See also elm_object_content_set.
 *
 * @param[in] obj The object.
 * @param[in] after The ctxpopup item to insert after.
 * @param[in] label The Label of the new item
 * @param[in] icon Icon to be set on new item
 * @param[in] func Convenience function called when item selected
 * @param[in] data Data passed to @c func
 *
 * @return A handle to the item added or @c null, on errors.
 *
 * @since 1.21
 *
 * @ingroup Elm_Ctxpopup_Group
  }
(* Const before type ignored *)
(* Const before type ignored *)
function elm_ctxpopup_item_insert_after(obj:PElm_Ctxpopup; after:PElm_Widget_Item; _label:Pchar; icon:PEfl_Canvas_Object; func:TEvas_Smart_Cb; 
           data:pointer):PElm_Widget_Item;cdecl;external;
{*
 * @brief Add a new item to a ctxpopup object.
 *
 * Warning:Ctxpopup can't hold both an item list and a content at the same
 * time. When an item is added, any previous content will be removed.
 *
 * See also @ref elm_object_content_set.
 *
 * @param[in] obj The object.
 * @param[in] label The Label of the new item
 * @param[in] icon Icon to be set on new item
 * @param[in] func Convenience function called when item selected
 * @param[in] data Data passed to @c func
 *
 * @return A handle to the item added or @c null, on errors.
 *
 * @ingroup Elm_Ctxpopup_Group
  }
(* Const before type ignored *)
(* Const before type ignored *)
function elm_ctxpopup_item_append(obj:PElm_Ctxpopup; _label:Pchar; icon:PEfl_Canvas_Object; func:TEvas_Smart_Cb; data:pointer):PElm_Widget_Item;cdecl;external;
{*
 * @brief Prepend a new item to a ctxpopup object.
 *
 * @warning Ctxpopup can't hold both an item list and a content at the same
 * time. When an item is added, any previous content will be removed.
 *
 * See also @ref elm_object_content_set.
 *
 * @param[in] obj The object.
 * @param[in] label The Label of the new item
 * @param[in] icon Icon to be set on new item
 * @param[in] func Convenience function called when item selected
 * @param[in] data Data passed to @c func
 *
 * @return A handle to the item added or @c null, on errors.
 *
 * @since 1.11
 *
 * @ingroup Elm_Ctxpopup_Group
  }
(* Const before type ignored *)
(* Const before type ignored *)
function elm_ctxpopup_item_prepend(obj:PElm_Ctxpopup; _label:Pchar; icon:PEfl_Canvas_Object; func:TEvas_Smart_Cb; data:pointer):PElm_Widget_Item;cdecl;external;
{$endif}

implementation


end.
