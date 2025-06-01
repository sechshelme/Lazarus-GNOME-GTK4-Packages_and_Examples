
unit elm_hoversel_item_eo_legacy;
interface

{
  Automatically converted by H2Pas 1.0.0 from elm_hoversel_item_eo_legacy.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    elm_hoversel_item_eo_legacy.h
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
PElm_Hoversel_Item  = ^Elm_Hoversel_Item;
PElm_Icon_Type  = ^Elm_Icon_Type;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _ELM_HOVERSEL_ITEM_EO_LEGACY_H_}
{$define _ELM_HOVERSEL_ITEM_EO_LEGACY_H_}
{$ifndef _ELM_HOVERSEL_ITEM_EO_CLASS_TYPE}
{$define _ELM_HOVERSEL_ITEM_EO_CLASS_TYPE}
type
  PElm_Hoversel_Item = ^TElm_Hoversel_Item;
  TElm_Hoversel_Item = TEo;
{$endif}
{$ifndef _ELM_HOVERSEL_ITEM_EO_TYPES}
{$define _ELM_HOVERSEL_ITEM_EO_TYPES}
{$endif}
{*
 * @brief This controls the icon for the given hoversel item.
 *
 * The icon can be loaded from the standard set, from an image file, or from an
 * edje file.
 *
 * @param[in] obj The object.
 * @param[in] icon_file An image file path on disk to use for the icon or
 * standard icon name
 * @param[in] icon_group The edje group to use if @c icon_file is an edje file.
 * Set this to NULL if the icon is not an edje file
 * @param[in] icon_type The icon type
 *
 * @ingroup Elm_Hoversel_Item_Group
  }
(* Const before type ignored *)
(* Const before type ignored *)

procedure elm_hoversel_item_icon_set(obj:PElm_Hoversel_Item; icon_file:Pchar; icon_group:Pchar; icon_type:TElm_Icon_Type);cdecl;external;
{*
 * @brief This controls the icon for the given hoversel item.
 *
 * The icon can be loaded from the standard set, from an image file, or from an
 * edje file.
 *
 * @param[in] obj The object.
 * @param[out] icon_file An image file path on disk to use for the icon or
 * standard icon name
 * @param[out] icon_group The edje group to use if @c icon_file is an edje
 * file. Set this to NULL if the icon is not an edje file
 * @param[out] icon_type The icon type
 *
 * @ingroup Elm_Hoversel_Item_Group
  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure elm_hoversel_item_icon_get(obj:PElm_Hoversel_Item; icon_file:PPchar; icon_group:PPchar; icon_type:PElm_Icon_Type);cdecl;external;
{$endif}

implementation


end.
