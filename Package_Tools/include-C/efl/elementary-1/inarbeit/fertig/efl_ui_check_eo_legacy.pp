
unit efl_ui_check_eo_legacy;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_ui_check_eo_legacy.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_ui_check_eo_legacy.h
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
PEfl_Ui_Check  = ^Efl_Ui_Check;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _EFL_UI_CHECK_EO_LEGACY_H_}
{$define _EFL_UI_CHECK_EO_LEGACY_H_}
{$ifndef _EFL_UI_CHECK_EO_CLASS_TYPE}
{$define _EFL_UI_CHECK_EO_CLASS_TYPE}
type
  PEfl_Ui_Check = ^TEfl_Ui_Check;
  TEfl_Ui_Check = TEo;
{$endif}
{$ifndef _EFL_UI_CHECK_EO_TYPES}
{$define _EFL_UI_CHECK_EO_TYPES}
{$endif}
{*
 * @brief The on/off state of the check object.
 *
 * @param[in] obj The object.
 * @param[in] value @c true if the check object is selected, @c false otherwise
 *
 * @ingroup Elm_Check_Group
  }

procedure elm_check_selected_set(obj:PEfl_Ui_Check; value:TEina_Bool);cdecl;external;
{*
 * @brief The on/off state of the check object.
 *
 * @param[in] obj The object.
 *
 * @return @c true if the check object is selected, @c false otherwise
 *
 * @ingroup Elm_Check_Group
  }
(* Const before type ignored *)
function elm_check_selected_get(obj:PEfl_Ui_Check):TEina_Bool;cdecl;external;
{$endif}

implementation


end.
