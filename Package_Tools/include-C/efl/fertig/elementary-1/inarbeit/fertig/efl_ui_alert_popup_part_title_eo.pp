
unit efl_ui_alert_popup_part_title_eo;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_ui_alert_popup_part_title_eo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_ui_alert_popup_part_title_eo.h
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
PEfl_Ui_Alert_Popup_Part_Title  = ^Efl_Ui_Alert_Popup_Part_Title;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _EFL_UI_ALERT_POPUP_PART_TITLE_EO_H_}
{$define _EFL_UI_ALERT_POPUP_PART_TITLE_EO_H_}
{$ifndef _EFL_UI_ALERT_POPUP_PART_TITLE_EO_CLASS_TYPE}
{$define _EFL_UI_ALERT_POPUP_PART_TITLE_EO_CLASS_TYPE}
type
  PEfl_Ui_Alert_Popup_Part_Title = ^TEfl_Ui_Alert_Popup_Part_Title;
  TEfl_Ui_Alert_Popup_Part_Title = TEo;
{$endif}
{$ifndef _EFL_UI_ALERT_POPUP_PART_TITLE_EO_TYPES}
{$define _EFL_UI_ALERT_POPUP_PART_TITLE_EO_TYPES}
{$endif}
{* Efl UI Alert Popup internal part class.
 *
 * @since 1.24
 *
 * @ingroup Efl_Ui_Alert_Popup_Part_Title
  }

{ was #define dname def_expr }
function EFL_UI_ALERT_POPUP_PART_TITLE_CLASS : longint; { return type might be wrong }

(* Const before type ignored *)
function efl_ui_alert_popup_part_title_class_get:PEfl_Class;cdecl;external;
{$endif}

implementation

{ was #define dname def_expr }
function EFL_UI_ALERT_POPUP_PART_TITLE_CLASS : longint; { return type might be wrong }
  begin
    EFL_UI_ALERT_POPUP_PART_TITLE_CLASS:=efl_ui_alert_popup_part_title_class_get;
  end;


end.
