
unit elm_separator_eo_legacy;
interface

{
  Automatically converted by H2Pas 1.0.0 from elm_separator_eo_legacy.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    elm_separator_eo_legacy.h
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
PElm_Separator  = ^Elm_Separator;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _ELM_SEPARATOR_EO_LEGACY_H_}
{$define _ELM_SEPARATOR_EO_LEGACY_H_}
{$ifndef _ELM_SEPARATOR_EO_CLASS_TYPE}
{$define _ELM_SEPARATOR_EO_CLASS_TYPE}
type
  PElm_Separator = ^TElm_Separator;
  TElm_Separator = TEo;
{$endif}
{$ifndef _ELM_SEPARATOR_EO_TYPES}
{$define _ELM_SEPARATOR_EO_TYPES}
{$endif}
{*
 * @brief Set the horizontal mode of a separator object
 *
 * @param[in] obj The object.
 * @param[in] horizontal If true, the separator is horizontal
 *
 * @ingroup Elm_Separator_Group
  }

procedure elm_separator_horizontal_set(obj:PElm_Separator; horizontal:TEina_Bool);cdecl;external;
{*
 * @brief Get the horizontal mode of a separator object
 *
 * @param[in] obj The object.
 *
 * @return If true, the separator is horizontal
 *
 * @ingroup Elm_Separator_Group
  }
(* Const before type ignored *)
function elm_separator_horizontal_get(obj:PElm_Separator):TEina_Bool;cdecl;external;
{$endif}

implementation


end.
