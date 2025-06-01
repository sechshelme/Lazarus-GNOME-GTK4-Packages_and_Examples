
unit efl_ui_radio_eo_legacy;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_ui_radio_eo_legacy.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_ui_radio_eo_legacy.h
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
PEfl_Canvas_Object  = ^Efl_Canvas_Object;
PEfl_Ui_Radio  = ^Efl_Ui_Radio;
Plongint  = ^longint;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _EFL_UI_RADIO_EO_LEGACY_H_}
{$define _EFL_UI_RADIO_EO_LEGACY_H_}
{$ifndef _EFL_UI_RADIO_EO_CLASS_TYPE}
{$define _EFL_UI_RADIO_EO_CLASS_TYPE}
type
  PEfl_Ui_Radio = ^TEfl_Ui_Radio;
  TEfl_Ui_Radio = TEo;
{$endif}
{$ifndef _EFL_UI_RADIO_EO_TYPES}
{$define _EFL_UI_RADIO_EO_TYPES}
{$endif}
{*
 * @brief Set the integer value that this radio object represents.
 *
 * This sets the value of the radio.
 *
 * @param[in] obj The object.
 * @param[in] value The value to use if this radio object is selected.
 *
 * @ingroup Elm_Radio_Group
  }

procedure elm_radio_state_value_set(obj:PEfl_Ui_Radio; value:longint);cdecl;external;
{*
 * @brief Get the integer value that this radio object represents.
 *
 * This gets the value of the radio.
 *
 * @param[in] obj The object.
 *
 * @return The value to use if this radio object is selected.
 *
 * @ingroup Elm_Radio_Group
  }
(* Const before type ignored *)
function elm_radio_state_value_get(obj:PEfl_Ui_Radio):longint;cdecl;external;
{*
 * @brief Set a convenience pointer to an integer, which changes when radio
 * group value changes.
 *
 * This sets a pointer to an integer that in addition to the radio object state
 * will also be modified directly. To stop setting the object pointed to,
 * simply use NULL as the valuep argument. If valuep is not NULL then when
 * called, the radio object state will also be modified to reflect the value of
 * the integer valuep points to, just like calling elm_radio_value_set().
 *
 * @param[in] obj The object.
 * @param[in] valuep Pointer to the integer to modify
 *
 * @ingroup Elm_Radio_Group
  }
procedure elm_radio_value_pointer_set(obj:PEfl_Ui_Radio; valuep:Plongint);cdecl;external;
{*
 * @brief Get the selected radio object.
 *
 * @param[in] obj The object.
 *
 * @return The selected radio object
 *
 * @ingroup Elm_Radio_Group
  }
(* Const before type ignored *)
function elm_radio_selected_object_get(obj:PEfl_Ui_Radio):PEfl_Canvas_Object;cdecl;external;
{*
 * @brief Add this radio to a group of other radio objects
 *
 * Radio objects work in groups. Each member should have a different integer
 * value assigned. In order to have them work as a group, they need to know
 * about each other. This adds the given radio object to the group of which the
 * group object indicated is a member.
 *
 * @param[in] obj The object.
 * @param[in] group Any radio object whose group the obj is to join.
 *
 * @ingroup Elm_Radio_Group
  }
procedure elm_radio_group_add(obj:PEfl_Ui_Radio; group:PEfl_Ui_Radio);cdecl;external;
{$endif}

implementation


end.
