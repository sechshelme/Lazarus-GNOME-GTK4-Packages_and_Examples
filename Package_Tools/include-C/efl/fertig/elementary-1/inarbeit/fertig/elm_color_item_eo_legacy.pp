
unit elm_color_item_eo_legacy;
interface

{
  Automatically converted by H2Pas 1.0.0 from elm_color_item_eo_legacy.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    elm_color_item_eo_legacy.h
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
PElm_Color_Item  = ^Elm_Color_Item;
Plongint  = ^longint;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _ELM_COLOR_ITEM_EO_LEGACY_H_}
{$define _ELM_COLOR_ITEM_EO_LEGACY_H_}
{$ifndef _ELM_COLOR_ITEM_EO_CLASS_TYPE}
{$define _ELM_COLOR_ITEM_EO_CLASS_TYPE}
type
  PElm_Color_Item = ^TElm_Color_Item;
  TElm_Color_Item = TEo;
{$endif}
{$ifndef _ELM_COLOR_ITEM_EO_TYPES}
{$define _ELM_COLOR_ITEM_EO_TYPES}
{$endif}
{*
 * @brief Set Palette item's color.
 *
 * @param[in] obj The object.
 * @param[in] r Red-value of color
 * @param[in] g Green-value of color
 * @param[in] b Blue-value of color
 * @param[in] a Alpha-value of color
 *
 * @ingroup Elm_Color_Item_Group
  }

procedure elm_color_item_color_set(obj:PElm_Color_Item; r:longint; g:longint; b:longint; a:longint);cdecl;external;
{*
 * @brief Get Palette item's color.
 *
 * @param[in] obj The object.
 * @param[out] r Red-value of color
 * @param[out] g Green-value of color
 * @param[out] b Blue-value of color
 * @param[out] a Alpha-value of color
 *
 * @ingroup Elm_Color_Item_Group
  }
(* Const before type ignored *)
procedure elm_color_item_color_get(obj:PElm_Color_Item; r:Plongint; g:Plongint; b:Plongint; a:Plongint);cdecl;external;
{*
 * @brief Set the selected state of color palette item
 *
 * @param[in] obj The object.
 * @param[in] selected @c true if selected @c false otherwise
 *
 * @since 1.9
 *
 * @ingroup Elm_Color_Item_Group
  }
procedure elm_color_item_selected_set(obj:PElm_Color_Item; selected:TEina_Bool);cdecl;external;
{*
 * @brief Get the selected state of color palette item
 *
 * @param[in] obj The object.
 *
 * @return @c true if selected @c false otherwise
 *
 * @since 1.9
 *
 * @ingroup Elm_Color_Item_Group
  }
(* Const before type ignored *)
function elm_color_item_selected_get(obj:PElm_Color_Item):TEina_Bool;cdecl;external;
{$endif}

implementation


end.
