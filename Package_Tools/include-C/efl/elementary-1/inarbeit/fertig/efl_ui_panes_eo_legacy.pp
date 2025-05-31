
unit efl_ui_panes_eo_legacy;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_ui_panes_eo_legacy.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_ui_panes_eo_legacy.h
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
PEfl_Ui_Panes  = ^Efl_Ui_Panes;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _EFL_UI_PANES_EO_LEGACY_H_}
{$define _EFL_UI_PANES_EO_LEGACY_H_}
{$ifndef _EFL_UI_PANES_EO_CLASS_TYPE}
{$define _EFL_UI_PANES_EO_CLASS_TYPE}
type
  PEfl_Ui_Panes = ^TEfl_Ui_Panes;
  TEfl_Ui_Panes = TEo;
{$endif}
{$ifndef _EFL_UI_PANES_EO_TYPES}
{$define _EFL_UI_PANES_EO_TYPES}
{$endif}
{*
 * @brief Set whether the left and right panes can be resized by user
 * interaction.
 *
 * By default panes' contents are resizable by user interaction.
 *
 * @param[in] obj The object.
 * @param[in] fixed Use @c true to fix the left and right panes sizes and make
 * them not to be resized by user interaction. Use @c false to make them
 * resizable.
 *
 * @ingroup Elm_Panes_Group
  }

procedure elm_panes_fixed_set(obj:PEfl_Ui_Panes; fixed:TEina_Bool);cdecl;external;
{*
 * @brief Set whether the left and right panes can be resized by user
 * interaction.
 *
 * By default panes' contents are resizable by user interaction.
 *
 * @param[in] obj The object.
 *
 * @return Use @c true to fix the left and right panes sizes and make them not
 * to be resized by user interaction. Use @c false to make them resizable.
 *
 * @ingroup Elm_Panes_Group
  }
(* Const before type ignored *)
function elm_panes_fixed_get(obj:PEfl_Ui_Panes):TEina_Bool;cdecl;external;
{$endif}

implementation


end.
