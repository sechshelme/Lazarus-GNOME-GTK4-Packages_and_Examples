
unit efl_ui_popup_private;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_ui_popup_private.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_ui_popup_private.h
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
PEcore_Timer  = ^Ecore_Timer;
PEfl_Ui_Popup_Data  = ^Efl_Ui_Popup_Data;
PEo  = ^Eo;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef EFL_UI_WIDGET_POPUP_H}
{$define EFL_UI_WIDGET_POPUP_H}
type
  PEfl_Ui_Popup_Data = ^TEfl_Ui_Popup_Data;
  TEfl_Ui_Popup_Data = record
      win_parent : PEo;
      backwall : PEo;
      align : TEfl_Ui_Popup_Align;
      anchor : PEo;
      priority : array[0..4] of TEfl_Ui_Popup_Align;
      used_align : TEfl_Ui_Popup_Align;
      timer : PEcore_Timer;
      timeout : Tdouble;
      flag0 : word;
    end;


const
  bm_TEfl_Ui_Popup_Data_in_calc = $1;
  bp_TEfl_Ui_Popup_Data_in_calc = 0;

function in_calc(var a : TEfl_Ui_Popup_Data) : TEina_Bool;
procedure set_in_calc(var a : TEfl_Ui_Popup_Data; __in_calc : TEina_Bool);

implementation

function in_calc(var a : TEfl_Ui_Popup_Data) : TEina_Bool;
begin
  in_calc:=(a.flag0 and bm_TEfl_Ui_Popup_Data_in_calc) shr bp_TEfl_Ui_Popup_Data_in_calc;
end;

procedure set_in_calc(var a : TEfl_Ui_Popup_Data; __in_calc : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__in_calc shl bp_TEfl_Ui_Popup_Data_in_calc) and bm_TEfl_Ui_Popup_Data_in_calc);
end;


end.
