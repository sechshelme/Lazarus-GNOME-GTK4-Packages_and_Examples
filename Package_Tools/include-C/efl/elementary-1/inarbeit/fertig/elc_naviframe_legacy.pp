
unit elc_naviframe_legacy;
interface

{
  Automatically converted by H2Pas 1.0.0 from elc_naviframe_legacy.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    elc_naviframe_legacy.h
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
PElm_Object_Item  = ^Elm_Object_Item;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{*
 * @brief Set an item style.
 *
 * @param[in] obj The object.
 * @param[in] style The current item style name. @c null would be default
 *
 * @ingroup Elm_Naviframe_Item_Group
  }
(* Const before type ignored *)

procedure elm_naviframe_item_style_set(obj:PElm_Object_Item; style:Pchar);cdecl;external;
{*
 * @brief Get an item style.
 *
 * @param[in] obj The object.
 *
 * @return The current item style name. @c null would be default
 *
 * @ingroup Elm_Naviframe_Item_Group
  }
(* Const before type ignored *)
(* Const before type ignored *)
function elm_naviframe_item_style_get(obj:PElm_Object_Item):Pchar;cdecl;external;
{$include "elm_naviframe_item_eo.legacy.h"}
{$include "elm_naviframe_eo.legacy.h"}

implementation


end.
