
unit efl_ui_spin_eo;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_ui_spin_eo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_ui_spin_eo.h
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
PEfl_Ui_Spin  = ^Efl_Ui_Spin;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _EFL_UI_SPIN_EO_H_}
{$define _EFL_UI_SPIN_EO_H_}
{$ifndef _EFL_UI_SPIN_EO_CLASS_TYPE}
{$define _EFL_UI_SPIN_EO_CLASS_TYPE}
type
  PEfl_Ui_Spin = ^TEfl_Ui_Spin;
  TEfl_Ui_Spin = TEo;
{$endif}
{$ifndef _EFL_UI_SPIN_EO_TYPES}
{$define _EFL_UI_SPIN_EO_TYPES}
{$endif}
{*
 * @brief A Spin.
 *
 * This is a widget which allows the user to increase or decrease a numeric
 * value using arrow buttons. It's a basic type of widget for choosing and
 * displaying values.
 *
 * @since 1.23
 *
 * @ingroup Efl_Ui_Spin
  }

{ was #define dname def_expr }
function EFL_UI_SPIN_CLASS : longint; { return type might be wrong }

(* Const before type ignored *)
function efl_ui_spin_class_get:PEfl_Class;cdecl;external;
{$endif}

implementation

{ was #define dname def_expr }
function EFL_UI_SPIN_CLASS : longint; { return type might be wrong }
  begin
    EFL_UI_SPIN_CLASS:=efl_ui_spin_class_get;
  end;


end.
