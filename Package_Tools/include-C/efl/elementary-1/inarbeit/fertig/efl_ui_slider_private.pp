
unit efl_ui_slider_private;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_ui_slider_private.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_ui_slider_private.h
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
PEfl_Ui_Slider_Data  = ^Efl_Ui_Slider_Data;
PEvas_Object  = ^Evas_Object;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef EFL_UI_SLIDER_PRIVATE_H}
{$define EFL_UI_SLIDER_PRIVATE_H}
{$include "Elementary.h"}
type
  PEfl_Ui_Slider_Data = ^TEfl_Ui_Slider_Data;
  TEfl_Ui_Slider_Data = record
      spacer : PEvas_Object;
      delay : PEcore_Timer;
      val : Tdouble;
      val_min : Tdouble;
      val_max : Tdouble;
      step : Tdouble;
      downx : TEvas_Coord;
      downy : TEvas_Coord;
      dir : TEfl_Ui_Layout_Orientation;
      flag0 : word;
    end;


const
  bm_TEfl_Ui_Slider_Data_spacer_down = $1;
  bp_TEfl_Ui_Slider_Data_spacer_down = 0;
  bm_TEfl_Ui_Slider_Data_frozen = $2;
  bp_TEfl_Ui_Slider_Data_frozen = 1;

function spacer_down(var a : TEfl_Ui_Slider_Data) : TEina_Bool;
procedure set_spacer_down(var a : TEfl_Ui_Slider_Data; __spacer_down : TEina_Bool);
function frozen(var a : TEfl_Ui_Slider_Data) : TEina_Bool;
procedure set_frozen(var a : TEfl_Ui_Slider_Data; __frozen : TEina_Bool);
{*
 * @
  }

implementation

function spacer_down(var a : TEfl_Ui_Slider_Data) : TEina_Bool;
begin
  spacer_down:=(a.flag0 and bm_TEfl_Ui_Slider_Data_spacer_down) shr bp_TEfl_Ui_Slider_Data_spacer_down;
end;

procedure set_spacer_down(var a : TEfl_Ui_Slider_Data; __spacer_down : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__spacer_down shl bp_TEfl_Ui_Slider_Data_spacer_down) and bm_TEfl_Ui_Slider_Data_spacer_down);
end;

function frozen(var a : TEfl_Ui_Slider_Data) : TEina_Bool;
begin
  frozen:=(a.flag0 and bm_TEfl_Ui_Slider_Data_frozen) shr bp_TEfl_Ui_Slider_Data_frozen;
end;

procedure set_frozen(var a : TEfl_Ui_Slider_Data; __frozen : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__frozen shl bp_TEfl_Ui_Slider_Data_frozen) and bm_TEfl_Ui_Slider_Data_frozen);
end;


end.
