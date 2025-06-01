
unit elm_scroller_eo_legacy;
interface

{
  Automatically converted by H2Pas 1.0.0 from elm_scroller_eo_legacy.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    elm_scroller_eo_legacy.h
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
PElm_Scroller  = ^Elm_Scroller;
Plongint  = ^longint;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _ELM_SCROLLER_EO_LEGACY_H_}
{$define _ELM_SCROLLER_EO_LEGACY_H_}
{$ifndef _ELM_SCROLLER_EO_CLASS_TYPE}
{$define _ELM_SCROLLER_EO_CLASS_TYPE}
type
  PElm_Scroller = ^TElm_Scroller;
  TElm_Scroller = TEo;
{$endif}
{$ifndef _ELM_SCROLLER_EO_TYPES}
{$define _ELM_SCROLLER_EO_TYPES}
{$endif}
{*
 * @brief Set custom theme elements for the scroller
 *
 * @param[in] obj The object.
 * @param[in] klass Klass name
 * @param[in] group Group name
 *
 * @ingroup Elm_Scroller_Group
  }
(* Const before type ignored *)
(* Const before type ignored *)

procedure elm_scroller_custom_widget_base_theme_set(obj:PElm_Scroller; klass:Pchar; group:Pchar);cdecl;external;
{*
 * @brief Set the maximum of the movable page at a flicking.
 *
 * The value of maximum movable page should be more than 1.
 *
 * @param[in] obj The object.
 * @param[in] page_limit_h The maximum of the movable horizontal page
 * @param[in] page_limit_v The maximum of the movable vertical page
 *
 * @since 1.8
 *
 * @ingroup Elm_Scroller_Group
  }
(* Const before type ignored *)
procedure elm_scroller_page_scroll_limit_set(obj:PElm_Scroller; page_limit_h:longint; page_limit_v:longint);cdecl;external;
{*
 * @brief Get the maximum of the movable page at a flicking.
 *
 * @param[in] obj The object.
 * @param[in] page_limit_h The maximum of the movable horizontal page
 * @param[in] page_limit_v The maximum of the movable vertical page
 *
 * @since 1.8
 *
 * @ingroup Elm_Scroller_Group
  }
(* Const before type ignored *)
procedure elm_scroller_page_scroll_limit_get(obj:PElm_Scroller; page_limit_h:Plongint; page_limit_v:Plongint);cdecl;external;
{$endif}

implementation


end.
