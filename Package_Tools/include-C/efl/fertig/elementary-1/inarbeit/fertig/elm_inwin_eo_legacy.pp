
unit elm_inwin_eo_legacy;
interface

{
  Automatically converted by H2Pas 1.0.0 from elm_inwin_eo_legacy.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    elm_inwin_eo_legacy.h
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
PElm_Inwin  = ^Elm_Inwin;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _ELM_INWIN_EO_LEGACY_H_}
{$define _ELM_INWIN_EO_LEGACY_H_}
{$ifndef _ELM_INWIN_EO_CLASS_TYPE}
{$define _ELM_INWIN_EO_CLASS_TYPE}
type
  PElm_Inwin = ^TElm_Inwin;
  TElm_Inwin = TEo;
{$endif}
{$ifndef _ELM_INWIN_EO_TYPES}
{$define _ELM_INWIN_EO_TYPES}
{$endif}
{*
 * @brief Activates an inwin object, ensuring its visibility
 *
 * This function will make sure that the inwin @c obj is completely visible by
 * calling evas_object_show() and evas_object_raise() on it, to bring it to the
 * front. It also sets the keyboard focus to it, which will be passed onto its
 * content.
 *
 * The object's theme will also receive the signal "elm,action,show" with
 * source "elm".
 * @param[in] obj The object.
 *
 * @ingroup Elm_Inwin_Group
  }

procedure elm_win_inwin_activate(obj:PElm_Inwin);cdecl;external;
{$endif}

implementation


end.
