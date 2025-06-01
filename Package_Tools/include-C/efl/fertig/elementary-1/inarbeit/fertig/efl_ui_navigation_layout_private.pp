
unit efl_ui_navigation_layout_private;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_ui_navigation_layout_private.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_ui_navigation_layout_private.h
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
PEfl_Ui_Layout  = ^Efl_Ui_Layout;
PEfl_Ui_Navigation_Layout_Data  = ^Efl_Ui_Navigation_Layout_Data;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef EFL_UI_WIDGET_NAVIGATION_LAYOUT_H}
{$define EFL_UI_WIDGET_NAVIGATION_LAYOUT_H}
type
  PEfl_Ui_Navigation_Layout_Data = ^TEfl_Ui_Navigation_Layout_Data;
  TEfl_Ui_Navigation_Layout_Data = record
      bar : PEfl_Ui_Layout;
    end;


implementation


end.
