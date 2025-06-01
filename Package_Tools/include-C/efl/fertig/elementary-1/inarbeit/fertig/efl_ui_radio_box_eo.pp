
unit efl_ui_radio_box_eo;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_ui_radio_box_eo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_ui_radio_box_eo.h
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
PEfl_Ui_Radio_Box  = ^Efl_Ui_Radio_Box;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _EFL_UI_RADIO_BOX_EO_H_}
{$define _EFL_UI_RADIO_BOX_EO_H_}
{$ifndef _EFL_UI_RADIO_BOX_EO_CLASS_TYPE}
{$define _EFL_UI_RADIO_BOX_EO_CLASS_TYPE}
type
  PEfl_Ui_Radio_Box = ^TEfl_Ui_Radio_Box;
  TEfl_Ui_Radio_Box = TEo;
{$endif}
{$ifndef _EFL_UI_RADIO_BOX_EO_TYPES}
{$define _EFL_UI_RADIO_BOX_EO_TYPES}
{$endif}
{*
 * @brief A standard @ref Efl_Ui_Box container which automatically handles
 * grouping of any @ref Efl_Ui_Radio widget added to it in addition to regular
 * widgets.
 *
 * All @ref Efl_Ui_Radio widgets are added to the same internal group which you
 * only indirectly access through this object.
 *
 * @since 1.24
 *
 * @ingroup Efl_Ui_Radio_Box
  }

{ was #define dname def_expr }
function EFL_UI_RADIO_BOX_CLASS : longint; { return type might be wrong }

(* Const before type ignored *)
function efl_ui_radio_box_class_get:PEfl_Class;cdecl;external;
{$endif}

implementation

{ was #define dname def_expr }
function EFL_UI_RADIO_BOX_CLASS : longint; { return type might be wrong }
  begin
    EFL_UI_RADIO_BOX_CLASS:=efl_ui_radio_box_class_get;
  end;


end.
