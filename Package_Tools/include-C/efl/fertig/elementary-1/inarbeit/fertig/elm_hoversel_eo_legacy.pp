
unit elm_hoversel_eo_legacy;
interface

{
  Automatically converted by H2Pas 1.0.0 from elm_hoversel_eo_legacy.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    elm_hoversel_eo_legacy.h
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
PElm_Hoversel  = ^Elm_Hoversel;
PElm_Widget_Item  = ^Elm_Widget_Item;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _ELM_HOVERSEL_EO_LEGACY_H_}
{$define _ELM_HOVERSEL_EO_LEGACY_H_}
{$ifndef _ELM_HOVERSEL_EO_CLASS_TYPE}
{$define _ELM_HOVERSEL_EO_CLASS_TYPE}
type
  PElm_Hoversel = ^TElm_Hoversel;
  TElm_Hoversel = TEo;
{$endif}
{$ifndef _ELM_HOVERSEL_EO_TYPES}
{$define _ELM_HOVERSEL_EO_TYPES}
{$endif}
{*
 * @brief Control if the hoversel should expand horizontally.
 *
 * @note The initial button will display horizontally regradless of this
 * setting.
 *
 * @param[in] obj The object.
 * @param[in] horizontal If @c true, the hover will expand horizontally to the
 * right.
 *
 * @ingroup Elm_Hoversel_Group
  }

procedure elm_hoversel_horizontal_set(obj:PElm_Hoversel; horizontal:TEina_Bool);cdecl;external;
{*
 * @brief Control if the hoversel should expand horizontally.
 *
 * @note The initial button will display horizontally regradless of this
 * setting.
 *
 * @param[in] obj The object.
 *
 * @return If @c true, the hover will expand horizontally to the right.
 *
 * @ingroup Elm_Hoversel_Group
  }
(* Const before type ignored *)
function elm_hoversel_horizontal_get(obj:PElm_Hoversel):TEina_Bool;cdecl;external;
{*
 * @brief Control the hover parent.
 *
 * Sets the hover parent object, the area that will be darkened when the
 * hoversel is clicked. Should probably be the window that the hoversel is in.
 *
 * @param[in] obj The object.
 * @param[in] parent The parent to use
 *
 * @ingroup Elm_Hoversel_Group
  }
procedure elm_hoversel_hover_parent_set(obj:PElm_Hoversel; parent:PEfl_Canvas_Object);cdecl;external;
{*
 * @brief Control the hover parent.
 *
 * Sets the hover parent object, the area that will be darkened when the
 * hoversel is clicked. Should probably be the window that the hoversel is in.
 *
 * @param[in] obj The object.
 *
 * @return The parent to use
 *
 * @ingroup Elm_Hoversel_Group
  }
(* Const before type ignored *)
function elm_hoversel_hover_parent_get(obj:PElm_Hoversel):PEfl_Canvas_Object;cdecl;external;
{*
 * @brief Returns whether the hoversel is expanded.
 *
 * @param[in] obj The object.
 *
 * @return @c true if the hoversel is expanded or @c false otherwise
 *
 * @ingroup Elm_Hoversel_Group
  }
(* Const before type ignored *)
function elm_hoversel_expanded_get(obj:PElm_Hoversel):TEina_Bool;cdecl;external;
{*
 * @brief Get the list of items within the given hoversel.
 *
 * @param[in] obj The object.
 *
 * @return List of items
 *
 * @ingroup Elm_Hoversel_Group
  }
(* Const before type ignored *)
(* Const before type ignored *)
function elm_hoversel_items_get(obj:PElm_Hoversel):PEina_List;cdecl;external;
{*
 * @brief Update icon and text of hoversel same to those of selected item
 * automatically.
 *
 * @param[in] obj The object.
 * @param[in] auto_update @c true if hoversel is updated automatically or
 * @c false otherwise
 *
 * @ingroup Elm_Hoversel_Group
  }
procedure elm_hoversel_auto_update_set(obj:PElm_Hoversel; auto_update:TEina_Bool);cdecl;external;
{*
 * @brief Update icon and text of hoversel same to those of selected item
 * automatically.
 *
 * @param[in] obj The object.
 *
 * @return @c true if hoversel is updated automatically or @c false otherwise
 *
 * @ingroup Elm_Hoversel_Group
  }
(* Const before type ignored *)
function elm_hoversel_auto_update_get(obj:PElm_Hoversel):TEina_Bool;cdecl;external;
{* This triggers the hoversel popup from code, the same as if the user had
 * clicked the button.
 *
 * @ingroup Elm_Hoversel_Group
  }
procedure elm_hoversel_hover_begin(obj:PElm_Hoversel);cdecl;external;
{*
 * @brief This will remove all the children items from the hoversel.
 *
 * Warning Should *not* be called while the hoversel is active; use
 * @ref elm_hoversel_expanded_get to check first.
 * @param[in] obj The object.
 *
 * @ingroup Elm_Hoversel_Group
  }
procedure elm_hoversel_clear(obj:PElm_Hoversel);cdecl;external;
{* This dismisses the hoversel popup as if the user had clicked outside the
 * hover.
 *
 * @ingroup Elm_Hoversel_Group
  }
procedure elm_hoversel_hover_end(obj:PElm_Hoversel);cdecl;external;
{*
 * @brief Add an item to the hoversel button
 *
 * This adds an item to the hoversel to show when it is clicked. Note: if you
 * need to use an icon from an edje file then use Elm.Hoversel.Item.icon.set
 * right after this function, and set icon_file to @c null here.
 *
 * @param[in] obj The object.
 * @param[in] label The text label to use for the item (NULL if not desired)
 * @param[in] icon_file An image file path on disk to use for the icon or
 * standard icon name (NULL if not desired)
 * @param[in] icon_type The icon type if relevant
 * @param[in] func Convenience function to call when this item is selected. The
 * last parameter @c event_info of @c func is the selected item pointer.
 * @param[in] data Data to pass to item-related functions
 *
 * @return A handle to the added item.
 *
 * @ingroup Elm_Hoversel_Group
  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function elm_hoversel_item_add(obj:PElm_Hoversel; _label:Pchar; icon_file:Pchar; icon_type:TElm_Icon_Type; func:TEvas_Smart_Cb; 
           data:pointer):PElm_Widget_Item;cdecl;external;
{$endif}

implementation


end.
