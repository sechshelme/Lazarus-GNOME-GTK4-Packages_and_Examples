
unit efl_ui_tab_page_private;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_ui_tab_page_private.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_ui_tab_page_private.h
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
PEfl_Ui_Tab_Page_Data  = ^Efl_Ui_Tab_Page_Data;
PEo  = ^Eo;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef EFL_UI_TAB_PAGE_PRIVATE_H}
{$define EFL_UI_TAB_PAGE_PRIVATE_H}
type
(* Const before type ignored *)
(* Const before type ignored *)
  PEfl_Ui_Tab_Page_Data = ^TEfl_Ui_Tab_Page_Data;
  TEfl_Ui_Tab_Page_Data = record
      content : PEo;
      tab_label : Pchar;
      tab_icon : Pchar;
      tab_bar_icon : PEo;
    end;


implementation


end.
