
unit elm_colorselector_eo_legacy;
interface

{
  Automatically converted by H2Pas 1.0.0 from elm_colorselector_eo_legacy.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    elm_colorselector_eo_legacy.h
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
PElm_Colorselector  = ^Elm_Colorselector;
PElm_Colorselector_Mode  = ^Elm_Colorselector_Mode;
PElm_Widget_Item  = ^Elm_Widget_Item;
Plongint  = ^longint;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _ELM_COLORSELECTOR_EO_LEGACY_H_}
{$define _ELM_COLORSELECTOR_EO_LEGACY_H_}
{$ifndef _ELM_COLORSELECTOR_EO_CLASS_TYPE}
{$define _ELM_COLORSELECTOR_EO_CLASS_TYPE}
type
  PElm_Colorselector = ^TElm_Colorselector;
  TElm_Colorselector = TEo;
{$endif}
{$ifndef _ELM_COLORSELECTOR_EO_TYPES}
{$define _ELM_COLORSELECTOR_EO_TYPES}
{*
 * @brief Different modes supported by Colorselector
 *
 * See also @ref elm_colorselector_mode_set, @ref elm_colorselector_mode_get.
 *
 * @ingroup Elm_Colorselector
  }
{*< Only color palette is displayed.  }
{*< Only color selector is displayed.  }
{*< Both Palette and selector is displayed, default.
                            }
{*< Only color picker is displayed.  }
{*< All possible color selector is displayed.  }
type
  PElm_Colorselector_Mode = ^TElm_Colorselector_Mode;
  TElm_Colorselector_Mode =  Longint;
  Const
    ELM_COLORSELECTOR_PALETTE = 0;
    ELM_COLORSELECTOR_COMPONENTS = 1;
    ELM_COLORSELECTOR_BOTH = 2;
    ELM_COLORSELECTOR_PICKER = 3;
    ELM_COLORSELECTOR_ALL = 4;
;
{$endif}
{*
 * @brief Set color to colorselector.
 *
 * @param[in] obj The object.
 * @param[in] r Red value of color
 * @param[in] g Green value of color
 * @param[in] b Blue value of color
 * @param[in] a Alpha value of color
 *
 * @ingroup Elm_Colorselector_Group
  }

procedure elm_colorselector_color_set(obj:PElm_Colorselector; r:longint; g:longint; b:longint; a:longint);cdecl;external;
{*
 * @brief Get current color from colorselector.
 *
 * @param[in] obj The object.
 * @param[out] r Red value of color
 * @param[out] g Green value of color
 * @param[out] b Blue value of color
 * @param[out] a Alpha value of color
 *
 * @ingroup Elm_Colorselector_Group
  }
(* Const before type ignored *)
procedure elm_colorselector_color_get(obj:PElm_Colorselector; r:Plongint; g:Plongint; b:Plongint; a:Plongint);cdecl;external;
{*
 * @brief Set current palette's name
 *
 * When colorpalette name is set, colors will be loaded from and saved to
 * config using the set name. If no name is set then colors will be loaded from
 * or saved to "default" config.
 *
 * @param[in] obj The object.
 * @param[in] palette_name Name of palette
 *
 * @ingroup Elm_Colorselector_Group
  }
(* Const before type ignored *)
procedure elm_colorselector_palette_name_set(obj:PElm_Colorselector; palette_name:Pchar);cdecl;external;
{*
 * @brief Get current palette's name
 *
 * Returns the currently set palette name using which colors will be
 * saved/loaded in to config.
 *
 * @param[in] obj The object.
 *
 * @return Name of palette
 *
 * @ingroup Elm_Colorselector_Group
  }
(* Const before type ignored *)
(* Const before type ignored *)
function elm_colorselector_palette_name_get(obj:PElm_Colorselector):Pchar;cdecl;external;
{*
 * @brief Set Colorselector's mode.
 *
 * Colorselector supports three modes palette only, selector only and both.
 *
 * @param[in] obj The object.
 * @param[in] mode Elm_Colorselector_Mode
 *
 * @ingroup Elm_Colorselector_Group
  }
procedure elm_colorselector_mode_set(obj:PElm_Colorselector; mode:TElm_Colorselector_Mode);cdecl;external;
{*
 * @brief Get Colorselector's mode.
 *
 * @param[in] obj The object.
 *
 * @return Elm_Colorselector_Mode
 *
 * @ingroup Elm_Colorselector_Group
  }
(* Const before type ignored *)
function elm_colorselector_mode_get(obj:PElm_Colorselector):TElm_Colorselector_Mode;cdecl;external;
{*
 * @brief Get list of palette items.
 *
 * Note That palette item list is internally managed by colorselector widget
 * and it should not be freed/modified by application.
 *
 * @param[in] obj The object.
 *
 * @return The list of color palette items.
 *
 * @since 1.9
 *
 * @ingroup Elm_Colorselector_Group
  }
(* Const before type ignored *)
(* Const before type ignored *)
function elm_colorselector_palette_items_get(obj:PElm_Colorselector):PEina_List;cdecl;external;
{*
 * @brief Get the selected item in colorselector palette.
 *
 * @param[in] obj The object.
 *
 * @return The selected item, or @c null if none selected.
 *
 * @since 1.9
 *
 * @ingroup Elm_Colorselector_Group
  }
(* Const before type ignored *)
function elm_colorselector_palette_selected_item_get(obj:PElm_Colorselector):PElm_Widget_Item;cdecl;external;
{*
 * @brief Add a new color item to palette.
 *
 * @param[in] obj The object.
 * @param[in] r Red value of color
 * @param[in] g Green value of color
 * @param[in] b Blue value of color
 * @param[in] a Alpha value of color
 *
 * @return A new color palette Item.
 *
 * @ingroup Elm_Colorselector_Group
  }
function elm_colorselector_palette_color_add(obj:PElm_Colorselector; r:longint; g:longint; b:longint; a:longint):PElm_Widget_Item;cdecl;external;
{* Clear the palette items.
 *
 * @ingroup Elm_Colorselector_Group
  }
procedure elm_colorselector_palette_clear(obj:PElm_Colorselector);cdecl;external;
{$endif}

implementation


end.
