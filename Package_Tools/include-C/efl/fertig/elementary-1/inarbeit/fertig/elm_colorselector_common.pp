
unit elm_colorselector_common;
interface

{
  Automatically converted by H2Pas 1.0.0 from elm_colorselector_common.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    elm_colorselector_common.h
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
PElm_Color_RGBA  = ^Elm_Color_RGBA;
PElm_Custom_Palette  = ^Elm_Custom_Palette;
PElm_Object_Item  = ^Elm_Object_Item;
Plongint  = ^longint;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{*
 * @addtogroup Elm_Colorselector
 *
 * @
  }
type
  PElm_Color_RGBA = ^TElm_Color_RGBA;
  TElm_Color_RGBA = record
      r : dword;
      g : dword;
      b : dword;
      a : dword;
    end;

(* Const before type ignored *)
  PElm_Custom_Palette = ^TElm_Custom_Palette;
  TElm_Custom_Palette = record
      palette_name : Pchar;
      color_list : PEina_List;
    end;

{*
 * @brief Get Palette item's color.
 *
 * @param[in] it The color palette item.
 * @param[out] r integer pointer for r-value of color
 * @param[out] g integer pointer for g-value of color
 * @param[out] b integer pointer for b-value of color
 * @param[out] a integer pointer for a-value of color
 *
 * @ingroup Elm_Colorselector
  }
(* Const before type ignored *)

procedure elm_colorselector_palette_item_color_get(it:PElm_Object_Item; r:Plongint; g:Plongint; b:Plongint; a:Plongint);cdecl;external;
{*
 * @brief Set palette item's color.
 *
 * @param[in] it The color palette item.
 * @param[in] r r-value of color
 * @param[in] g g-value of color
 * @param[in] b b-value of color
 * @param[in] a a-value of color
 *
 * @ingroup Elm_Colorselector
  }
procedure elm_colorselector_palette_item_color_set(it:PElm_Object_Item; r:longint; g:longint; b:longint; a:longint);cdecl;external;
{*
 * @brief Get the selected state of color palette item.
 *
 * @param[in] it The colorpalette item
 * @return @c EINA_TRUE if the item is selected, @c EINA_FALSE otherwise.
 *
 * @ingroup Elm_Colorselector
  }
(* Const before type ignored *)
function elm_colorselector_palette_item_selected_get(it:PElm_Object_Item):TEina_Bool;cdecl;external;
{*
 * @brief Set the selected state of color palette item.
 *
 * @param[in] it The colorpalette item
 * @param[in] selected The selected state
 *
 * @ingroup Elm_Colorselector
  }
procedure elm_colorselector_palette_item_selected_set(it:PElm_Object_Item; selected:TEina_Bool);cdecl;external;
{*
 * @
  }

implementation


end.
