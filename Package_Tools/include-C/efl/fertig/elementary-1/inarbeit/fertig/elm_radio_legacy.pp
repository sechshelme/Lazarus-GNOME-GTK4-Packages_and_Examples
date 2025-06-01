
unit elm_radio_legacy;
interface

{
  Automatically converted by H2Pas 1.0.0 from elm_radio_legacy.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    elm_radio_legacy.h
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
PElm_Radio  = ^Elm_Radio;
PEvas_Object  = ^Evas_Object;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


type
  PElm_Radio = ^TElm_Radio;
  TElm_Radio = TEo;
{*
 * @brief Add a new radio to the parent
 *
 * @param parent The parent object
 * @return The new object or NULL if it cannot be created
 *
 * @ingroup Elm_Radio_Group
  }

function elm_radio_add(parent:PEvas_Object):PEvas_Object;cdecl;external;
{*
 * @brief Set the value of the radio group.
 *
 * This sets the value of the radio group and will also set the value if
 * pointed to, to the value supplied, but will not call any callbacks.
 *
 * @param[in] value The value to use for the group
 *
 * @ingroup Elm_Radio_Group
  }
procedure elm_radio_value_set(obj:PEvas_Object; value:longint);cdecl;external;
{*
 * @brief Get the value of the radio group
 *
 * @return The value to use for the group
 *
 * @ingroup Elm_Radio_Group
  }
(* Const before type ignored *)
function elm_radio_value_get(obj:PEvas_Object):longint;cdecl;external;
{$include "efl_ui_radio_eo.legacy.h"}

implementation


end.
