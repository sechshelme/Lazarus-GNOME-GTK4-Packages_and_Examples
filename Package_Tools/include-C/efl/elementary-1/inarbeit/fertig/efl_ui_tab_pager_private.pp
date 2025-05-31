
unit efl_ui_tab_pager_private;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_ui_tab_pager_private.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_ui_tab_pager_private.h
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
PEfl_Ui_Tab_Pager_Data  = ^Efl_Ui_Tab_Pager_Data;
PEo  = ^Eo;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef EFL_UI_TAB_PAGER_PRIVATE_H}
{$define EFL_UI_TAB_PAGER_PRIVATE_H}
type
  PEfl_Ui_Tab_Pager_Data = ^TEfl_Ui_Tab_Pager_Data;
  TEfl_Ui_Tab_Pager_Data = record
      tab_bar : PEo;
      spotlight : PEo;
    end;


implementation


end.
