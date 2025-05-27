
unit elm_fileselector_eo_legacy;
interface

{
  Automatically converted by H2Pas 1.0.0 from elm_fileselector_eo_legacy.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    elm_fileselector_eo_legacy.h
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
PElm_Fileselector  = ^Elm_Fileselector;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _ELM_FILESELECTOR_EO_LEGACY_H_}
{$define _ELM_FILESELECTOR_EO_LEGACY_H_}
{$ifndef _ELM_FILESELECTOR_EO_CLASS_TYPE}
{$define _ELM_FILESELECTOR_EO_CLASS_TYPE}
type
  PElm_Fileselector = ^TElm_Fileselector;
  TElm_Fileselector = TEo;
{$endif}
{$ifndef _ELM_FILESELECTOR_EO_TYPES}
{$define _ELM_FILESELECTOR_EO_TYPES}
{$endif}
{*
 * @brief Enable/disable the "ok" and "cancel" buttons on a given file selector
 * widget
 *
 * @note A file selector without those buttons will never emit the "done" smart
 * event, and is only usable if one is just hooking to the other two events.
 *
 * See also @ref elm_fileselector_buttons_ok_cancel_get.
 *
 * @param[in] obj The object.
 * @param[in] visible @c true to show buttons, @c false to hide.
 *
 * @ingroup Elm_Fileselector_Group
  }

procedure elm_fileselector_buttons_ok_cancel_set(obj:PElm_Fileselector; visible:TEina_Bool);cdecl;external;
{*
 * @brief Get whether the "ok" and "cancel" buttons on a given file selector
 * widget are being shown.
 *
 * See also @ref elm_fileselector_buttons_ok_cancel_set for more details.
 *
 * @param[in] obj The object.
 *
 * @return @c true to show buttons, @c false to hide.
 *
 * @ingroup Elm_Fileselector_Group
  }
(* Const before type ignored *)
function elm_fileselector_buttons_ok_cancel_get(obj:PElm_Fileselector):TEina_Bool;cdecl;external;
{$endif}

implementation


end.
