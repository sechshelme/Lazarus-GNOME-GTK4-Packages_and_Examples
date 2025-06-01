
unit efl_ui_widget_scroller;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_ui_widget_scroller.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_ui_widget_scroller.h
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
PEfl_Ui_Scroller_Data  = ^Efl_Ui_Scroller_Data;
PEo  = ^Eo;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef EFL_UI_WIDGET_SCROLLER_H}
{$define EFL_UI_WIDGET_SCROLLER_H}
{$include "Elementary.h"}
type
  PEfl_Ui_Scroller_Data = ^TEfl_Ui_Scroller_Data;
  TEfl_Ui_Scroller_Data = record
      content : PEo;
      pan_obj : PEo;
      smanager : PEo;
      flag0 : word;
    end;

const
  bm__Efl_Ui_Scroller_Data_freeze_want = $1;
  bp__Efl_Ui_Scroller_Data_freeze_want = 0;
  bm__Efl_Ui_Scroller_Data_match_content_w = $2;
  bp__Efl_Ui_Scroller_Data_match_content_w = 1;
  bm__Efl_Ui_Scroller_Data_match_content_h = $4;
  bp__Efl_Ui_Scroller_Data_match_content_h = 2;

function freeze_want(var a : _Efl_Ui_Scroller_Data) : TEina_Bool;
procedure set_freeze_want(var a : _Efl_Ui_Scroller_Data; __freeze_want : TEina_Bool);
function match_content_w(var a : _Efl_Ui_Scroller_Data) : TEina_Bool;
procedure set_match_content_w(var a : _Efl_Ui_Scroller_Data; __match_content_w : TEina_Bool);
function match_content_h(var a : _Efl_Ui_Scroller_Data) : TEina_Bool;
procedure set_match_content_h(var a : _Efl_Ui_Scroller_Data; __match_content_h : TEina_Bool);
{$endif}

implementation

function freeze_want(var a : _Efl_Ui_Scroller_Data) : TEina_Bool;
begin
  freeze_want:=(a.flag0 and bm__Efl_Ui_Scroller_Data_freeze_want) shr bp__Efl_Ui_Scroller_Data_freeze_want;
end;

procedure set_freeze_want(var a : _Efl_Ui_Scroller_Data; __freeze_want : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__freeze_want shl bp__Efl_Ui_Scroller_Data_freeze_want) and bm__Efl_Ui_Scroller_Data_freeze_want);
end;

function match_content_w(var a : _Efl_Ui_Scroller_Data) : TEina_Bool;
begin
  match_content_w:=(a.flag0 and bm__Efl_Ui_Scroller_Data_match_content_w) shr bp__Efl_Ui_Scroller_Data_match_content_w;
end;

procedure set_match_content_w(var a : _Efl_Ui_Scroller_Data; __match_content_w : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__match_content_w shl bp__Efl_Ui_Scroller_Data_match_content_w) and bm__Efl_Ui_Scroller_Data_match_content_w);
end;

function match_content_h(var a : _Efl_Ui_Scroller_Data) : TEina_Bool;
begin
  match_content_h:=(a.flag0 and bm__Efl_Ui_Scroller_Data_match_content_h) shr bp__Efl_Ui_Scroller_Data_match_content_h;
end;

procedure set_match_content_h(var a : _Efl_Ui_Scroller_Data; __match_content_h : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__match_content_h shl bp__Efl_Ui_Scroller_Data_match_content_h) and bm__Efl_Ui_Scroller_Data_match_content_h);
end;


end.
