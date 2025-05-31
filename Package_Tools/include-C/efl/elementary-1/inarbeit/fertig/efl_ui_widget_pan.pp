
unit efl_ui_widget_pan;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_ui_widget_pan.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_ui_widget_pan.h
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
PEfl_Ui_Pan_Data  = ^Efl_Ui_Pan_Data;
PEvas_Object  = ^Evas_Object;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef EFL_UI_WIDGET_PAN_H}
{$define EFL_UI_WIDGET_PAN_H}
{$include "Elementary.h"}
type
  PEfl_Ui_Pan_Data = ^TEfl_Ui_Pan_Data;
  TEfl_Ui_Pan_Data = record
      content : PEvas_Object;
      x : TEvas_Coord;
      y : TEvas_Coord;
      w : TEvas_Coord;
      h : TEvas_Coord;
      content_w : TEvas_Coord;
      content_h : TEvas_Coord;
      px : TEvas_Coord;
      py : TEvas_Coord;
    end;

{$endif}

implementation


end.
