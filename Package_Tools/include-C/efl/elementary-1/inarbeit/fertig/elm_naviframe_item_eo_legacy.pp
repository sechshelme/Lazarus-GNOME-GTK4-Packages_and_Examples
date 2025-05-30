
unit elm_naviframe_item_eo_legacy;
interface

{
  Automatically converted by H2Pas 1.0.0 from elm_naviframe_item_eo_legacy.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    elm_naviframe_item_eo_legacy.h
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
PElm_Naviframe_Item  = ^Elm_Naviframe_Item;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _ELM_NAVIFRAME_ITEM_EO_LEGACY_H_}
{$define _ELM_NAVIFRAME_ITEM_EO_LEGACY_H_}
{$ifndef _ELM_NAVIFRAME_ITEM_EO_CLASS_TYPE}
{$define _ELM_NAVIFRAME_ITEM_EO_CLASS_TYPE}
type
  PElm_Naviframe_Item = ^TElm_Naviframe_Item;
  TElm_Naviframe_Item = TEo;
{$endif}
{$ifndef _ELM_NAVIFRAME_ITEM_EO_TYPES}
{$define _ELM_NAVIFRAME_ITEM_EO_TYPES}
{$endif}
{*
 * @brief Pop the top item and delete the items between the top and the above
 * one on the given item.
 *
 * The items between the top and the given item will be deleted first, and then
 * the top item will be popped at last.
 *
 * @warning The pop callback function set by elm_naviframe_item_pop_cb_set is
 * not called for items between the top item and the destination item since
 * those items are deleted without being popped.
 * @param[in] obj The object.
 *
 * @ingroup Elm_Naviframe_Item_Group
  }

procedure elm_naviframe_item_pop_to(obj:PElm_Naviframe_Item);cdecl;external;
{*
 * @brief Get a value whether title area is enabled or not.
 *
 * @param[in] obj The object.
 *
 * @return If @c true, title area will be enabled, disabled otherwise
 *
 * @ingroup Elm_Naviframe_Item_Group
  }
(* Const before type ignored *)
function elm_naviframe_item_title_enabled_get(obj:PElm_Naviframe_Item):TEina_Bool;cdecl;external;
{*
 * @brief Enable/Disable the title area with transition effect
 *
 * When the title area is disabled, then the controls would be hidden so as to
 * expand the content area to full-size.
 *
 * @param[in] obj The object.
 * @param[in] enable If @c true, title area will be enabled, disabled otherwise
 * @param[in] transition If @c true, transition effect of the title will be
 * visible, invisible otherwise
 *
 * @ingroup Elm_Naviframe_Item_Group
  }
procedure elm_naviframe_item_title_enabled_set(obj:PElm_Naviframe_Item; enable:TEina_Bool; transition:TEina_Bool);cdecl;external;
{*
 * @brief Promote an item already in the naviframe stack to the top of the
 * stack.
 *
 * This will take the indicated item and promote it to the top of the stack as
 * if it had been pushed there. The item must already be inside the naviframe
 * stack to work.
 * @param[in] obj The object.
 *
 * @ingroup Elm_Naviframe_Item_Group
  }
procedure elm_naviframe_item_promote(obj:PElm_Naviframe_Item);cdecl;external;
{*
 * @brief Set a function to be called when an item of the naviframe is going to
 * be popped.
 *
 * @warning Don't set "clicked" callback to the prev button additionally if the
 * function does an exact same logic with this @c func. When hardware back key
 * is pressed then both callbacks will be called. Warning: The pop callback
 * function is called only if the item is popped. Therefore, the pop callback
 * function is not called if the item is deleted without being popped.
 *
 * @param[in] obj The object.
 * @param[in] func The callback function.
 * @param[in] data Data to be passed to func call.
 *
 * @since 1.8
 *
 * @ingroup Elm_Naviframe_Item_Group
  }
procedure elm_naviframe_item_pop_cb_set(obj:PElm_Naviframe_Item; func:TElm_Naviframe_Item_Pop_Cb; data:pointer);cdecl;external;
{$endif}

implementation


end.
