
unit efl_ui_tab_bar_private;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_ui_tab_bar_private.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_ui_tab_bar_private.h
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
PEfl_Ui_Box  = ^Efl_Ui_Box;
PEfl_Ui_Item  = ^Efl_Ui_Item;
PEfl_Ui_Tab_Bar_Data  = ^Efl_Ui_Tab_Bar_Data;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef EFL_UI_TAB_BAR_PRIVATE_H}
{$define EFL_UI_TAB_BAR_PRIVATE_H}
type
  PEfl_Ui_Tab_Bar_Data = ^TEfl_Ui_Tab_Bar_Data;
  TEfl_Ui_Tab_Bar_Data = record
      bx : PEfl_Ui_Box;
      selected : PEfl_Ui_Item;
      fallback_selection : PEfl_Ui_Item;
      in_value_change : TEina_Bool;
      flag0 : word;
    end;


const
  bm_TEfl_Ui_Tab_Bar_Data_allow_manual_deselection = $1;
  bp_TEfl_Ui_Tab_Bar_Data_allow_manual_deselection = 0;

function allow_manual_deselection(var a : TEfl_Ui_Tab_Bar_Data) : TEina_Bool;
procedure set_allow_manual_deselection(var a : TEfl_Ui_Tab_Bar_Data; __allow_manual_deselection : TEina_Bool);

implementation

function allow_manual_deselection(var a : TEfl_Ui_Tab_Bar_Data) : TEina_Bool;
begin
  allow_manual_deselection:=(a.flag0 and bm_TEfl_Ui_Tab_Bar_Data_allow_manual_deselection) shr bp_TEfl_Ui_Tab_Bar_Data_allow_manual_deselection;
end;

procedure set_allow_manual_deselection(var a : TEfl_Ui_Tab_Bar_Data; __allow_manual_deselection : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__allow_manual_deselection shl bp_TEfl_Ui_Tab_Bar_Data_allow_manual_deselection) and bm_TEfl_Ui_Tab_Bar_Data_allow_manual_deselection);
end;


end.
