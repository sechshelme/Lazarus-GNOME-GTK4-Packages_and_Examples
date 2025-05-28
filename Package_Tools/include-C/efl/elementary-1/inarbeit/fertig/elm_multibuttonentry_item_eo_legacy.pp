
unit elm_multibuttonentry_item_eo_legacy;
interface

{
  Automatically converted by H2Pas 1.0.0 from elm_multibuttonentry_item_eo_legacy.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    elm_multibuttonentry_item_eo_legacy.h
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
PElm_Multibuttonentry_Item  = ^Elm_Multibuttonentry_Item;
PElm_Widget_Item  = ^Elm_Widget_Item;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _ELM_MULTIBUTTONENTRY_ITEM_EO_LEGACY_H_}
{$define _ELM_MULTIBUTTONENTRY_ITEM_EO_LEGACY_H_}
{$ifndef _ELM_MULTIBUTTONENTRY_ITEM_EO_CLASS_TYPE}
{$define _ELM_MULTIBUTTONENTRY_ITEM_EO_CLASS_TYPE}
type
  PElm_Multibuttonentry_Item = ^TElm_Multibuttonentry_Item;
  TElm_Multibuttonentry_Item = TEo;
{$endif}
{$ifndef _ELM_MULTIBUTTONENTRY_ITEM_EO_TYPES}
{$define _ELM_MULTIBUTTONENTRY_ITEM_EO_TYPES}
{$endif}
{*
 * @brief Control the selected state of an item
 *
 * @param[in] obj The object.
 * @param[in] selected @c true if selected @c false otherwise
 *
 * @ingroup Elm_Multibuttonentry_Item_Group
  }

procedure elm_multibuttonentry_item_selected_set(obj:PElm_Multibuttonentry_Item; selected:TEina_Bool);cdecl;external;
{*
 * @brief Control the selected state of an item
 *
 * @param[in] obj The object.
 *
 * @return @c true if selected @c false otherwise
 *
 * @ingroup Elm_Multibuttonentry_Item_Group
  }
(* Const before type ignored *)
function elm_multibuttonentry_item_selected_get(obj:PElm_Multibuttonentry_Item):TEina_Bool;cdecl;external;
{*
 * @brief Get the previous item in the multibuttonentry
 *
 * @param[in] obj The object.
 *
 * @return The item before the item
 *
 * @ingroup Elm_Multibuttonentry_Item_Group
  }
(* Const before type ignored *)
function elm_multibuttonentry_item_prev_get(obj:PElm_Multibuttonentry_Item):PElm_Widget_Item;cdecl;external;
{*
 * @brief Get the next item in the multibuttonentry
 *
 * @param[in] obj The object.
 *
 * @return The item after the item
 *
 * @ingroup Elm_Multibuttonentry_Item_Group
  }
(* Const before type ignored *)
function elm_multibuttonentry_item_next_get(obj:PElm_Multibuttonentry_Item):PElm_Widget_Item;cdecl;external;
{$endif}

implementation


end.
