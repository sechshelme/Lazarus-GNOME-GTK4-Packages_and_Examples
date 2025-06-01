
unit efl_ui_alert_popup_private;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_ui_alert_popup_private.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_ui_alert_popup_private.h
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
Pchar  = ^char;
PEfl_Ui_Alert_Popup_Button_Type  = ^Efl_Ui_Alert_Popup_Button_Type;
PEfl_Ui_Alert_Popup_Data  = ^Efl_Ui_Alert_Popup_Data;
PEvas_Object  = ^Evas_Object;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef EFL_UI_ALERT_POPUP_H}
{$define EFL_UI_ALERT_POPUP_H}
{$include "Elementary.h"}
type
  PEfl_Ui_Alert_Popup_Button_Type = ^TEfl_Ui_Alert_Popup_Button_Type;
  TEfl_Ui_Alert_Popup_Button_Type =  Longint;
  Const
    EFL_UI_ALERT_POPUP_BUTTON_1 = 0;
    EFL_UI_ALERT_POPUP_BUTTON_2 = 1;
    EFL_UI_ALERT_POPUP_BUTTON_3 = 2;
    EFL_UI_ALERT_POPUP_BUTTON_COUNT = 3;
;
type
(* Const before type ignored *)
  PEfl_Ui_Alert_Popup_Data = ^TEfl_Ui_Alert_Popup_Data;
  TEfl_Ui_Alert_Popup_Data = record
      title_text : Pchar;
      button : array[0..(EFL_UI_ALERT_POPUP_BUTTON_COUNT)-1] of PEvas_Object;
      button_layout : array[0..(EFL_UI_ALERT_POPUP_BUTTON_COUNT)-1] of PEvas_Object;
    end;

{$endif}

implementation


end.
