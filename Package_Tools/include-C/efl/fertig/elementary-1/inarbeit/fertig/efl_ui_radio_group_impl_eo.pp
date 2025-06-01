
unit efl_ui_radio_group_impl_eo;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_ui_radio_group_impl_eo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_ui_radio_group_impl_eo.h
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
PEfl_Class  = ^Efl_Class;
PEfl_Ui_Radio_Group_Impl  = ^Efl_Ui_Radio_Group_Impl;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _EFL_UI_RADIO_GROUP_IMPL_EO_H_}
{$define _EFL_UI_RADIO_GROUP_IMPL_EO_H_}
{$ifndef _EFL_UI_RADIO_GROUP_IMPL_EO_CLASS_TYPE}
{$define _EFL_UI_RADIO_GROUP_IMPL_EO_CLASS_TYPE}
type
  PEfl_Ui_Radio_Group_Impl = ^TEfl_Ui_Radio_Group_Impl;
  TEfl_Ui_Radio_Group_Impl = TEo;
{$endif}
{$ifndef _EFL_UI_RADIO_GROUP_IMPL_EO_TYPES}
{$define _EFL_UI_RADIO_GROUP_IMPL_EO_TYPES}
{$endif}
{* Object with the default implementation for @ref Efl_Ui_Radio_Group.
 *
 * @since 1.23
 *
 * @ingroup Efl_Ui_Radio_Group_Impl
  }

{ was #define dname def_expr }
function EFL_UI_RADIO_GROUP_IMPL_CLASS : longint; { return type might be wrong }

(* Const before type ignored *)
function efl_ui_radio_group_impl_class_get:PEfl_Class;cdecl;external;
{$endif}

implementation

{ was #define dname def_expr }
function EFL_UI_RADIO_GROUP_IMPL_CLASS : longint; { return type might be wrong }
  begin
    EFL_UI_RADIO_GROUP_IMPL_CLASS:=efl_ui_radio_group_impl_class_get;
  end;


end.
