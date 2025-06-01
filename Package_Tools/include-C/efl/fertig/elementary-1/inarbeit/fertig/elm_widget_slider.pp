
unit elm_widget_slider;
interface

{
  Automatically converted by H2Pas 1.0.0 from elm_widget_slider.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    elm_widget_slider.h
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
PEcore_Timer  = ^Ecore_Timer;
PEina_Strbuf  = ^Eina_Strbuf;
PElm_Slider_Data  = ^Elm_Slider_Data;
PEvas_Object  = ^Evas_Object;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef ELM_WIDGET_SLIDER_H}
{$define ELM_WIDGET_SLIDER_H}
{$include "Elementary.h"}
{ DO NOT USE THIS HEADER UNLESS YOU ARE PREPARED FOR BREAKING OF YOUR
 * CODE. THIS IS ELEMENTARY'S INTERNAL WIDGET API (for now) AND IS NOT
 * FINAL. CALL elm_widget_api_check(ELM_INTERNAL_API_VERSION) TO CHECK
 * IT AT RUNTIME.
  }
{*
 * @addtogroup Widget
 * @
 *
 * @section elm-slider-class The Elementary Slider Class
 *
 * Elementary, besides having the @ref Slider widget, exposes its
 * foundation -- the Elementary Slider Class -- in order to create other
 * widgets which are a slider with some more logic on top.
  }
{*
 * Base layout smart data extended with slider instance data.
  }
type
{*< indicator_visible_mode of the slider.
                                                                This indicates when to show an indicator  }
(* Const before type ignored *)
  PElm_Slider_Data = ^TElm_Slider_Data;
  TElm_Slider_Data = record
      popup : PEvas_Object;
      popup2 : PEvas_Object;
      track : PEvas_Object;
      track2 : PEvas_Object;
      spacer : PEvas_Object;
      val : Tdouble;
      val_min : Tdouble;
      val_max : Tdouble;
      step : Tdouble;
      intvl_from : Tdouble;
      intvl_to : Tdouble;
      wheel_indicator_duration : Tdouble;
      intvl_flag : longint;
      downx : TEvas_Coord;
      downy : TEvas_Coord;
      dir : TEfl_Ui_Layout_Orientation;
      wheel_indicator_timer : PEcore_Timer;
      delay : PEcore_Timer;
      indicator_visible_mode : TElm_Slider_Indicator_Visible_Mode;
      size : TEvas_Coord;
      format_cb : TEfl_Ui_Format_Func;
      format_free_cb : TEina_Free_Cb;
      format_cb_data : pointer;
      format_strbuf : PEina_Strbuf;
      indi_format_cb : TEfl_Ui_Format_Func;
      indi_format_free_cb : TEina_Free_Cb;
      indi_format_cb_data : pointer;
      indi_format_strbuf : PEina_Strbuf;
      indi_template : Pchar;
      flag0 : word;
    end;


const
  bm_TElm_Slider_Data_indicator_show = $1;
  bp_TElm_Slider_Data_indicator_show = 0;
  bm_TElm_Slider_Data_units_show = $2;
  bp_TElm_Slider_Data_units_show = 1;
  bm_TElm_Slider_Data_popup_visible = $4;
  bp_TElm_Slider_Data_popup_visible = 2;
  bm_TElm_Slider_Data_intvl_enable = $8;
  bp_TElm_Slider_Data_intvl_enable = 3;
  bm_TElm_Slider_Data_spacer_down = $10;
  bp_TElm_Slider_Data_spacer_down = 4;
  bm_TElm_Slider_Data_frozen = $20;
  bp_TElm_Slider_Data_frozen = 5;

function indicator_show(var a : TElm_Slider_Data) : TEina_Bool;
procedure set_indicator_show(var a : TElm_Slider_Data; __indicator_show : TEina_Bool);
function units_show(var a : TElm_Slider_Data) : TEina_Bool;
procedure set_units_show(var a : TElm_Slider_Data; __units_show : TEina_Bool);
function popup_visible(var a : TElm_Slider_Data) : TEina_Bool;
procedure set_popup_visible(var a : TElm_Slider_Data; __popup_visible : TEina_Bool);
function intvl_enable(var a : TElm_Slider_Data) : TEina_Bool;
procedure set_intvl_enable(var a : TElm_Slider_Data; __intvl_enable : TEina_Bool);
function spacer_down(var a : TElm_Slider_Data) : TEina_Bool;
procedure set_spacer_down(var a : TElm_Slider_Data; __spacer_down : TEina_Bool);
function frozen(var a : TElm_Slider_Data) : TEina_Bool;
procedure set_frozen(var a : TElm_Slider_Data; __frozen : TEina_Bool);

implementation

function indicator_show(var a : TElm_Slider_Data) : TEina_Bool;
begin
  indicator_show:=(a.flag0 and bm_TElm_Slider_Data_indicator_show) shr bp_TElm_Slider_Data_indicator_show;
end;

procedure set_indicator_show(var a : TElm_Slider_Data; __indicator_show : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__indicator_show shl bp_TElm_Slider_Data_indicator_show) and bm_TElm_Slider_Data_indicator_show);
end;

function units_show(var a : TElm_Slider_Data) : TEina_Bool;
begin
  units_show:=(a.flag0 and bm_TElm_Slider_Data_units_show) shr bp_TElm_Slider_Data_units_show;
end;

procedure set_units_show(var a : TElm_Slider_Data; __units_show : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__units_show shl bp_TElm_Slider_Data_units_show) and bm_TElm_Slider_Data_units_show);
end;

function popup_visible(var a : TElm_Slider_Data) : TEina_Bool;
begin
  popup_visible:=(a.flag0 and bm_TElm_Slider_Data_popup_visible) shr bp_TElm_Slider_Data_popup_visible;
end;

procedure set_popup_visible(var a : TElm_Slider_Data; __popup_visible : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__popup_visible shl bp_TElm_Slider_Data_popup_visible) and bm_TElm_Slider_Data_popup_visible);
end;

function intvl_enable(var a : TElm_Slider_Data) : TEina_Bool;
begin
  intvl_enable:=(a.flag0 and bm_TElm_Slider_Data_intvl_enable) shr bp_TElm_Slider_Data_intvl_enable;
end;

procedure set_intvl_enable(var a : TElm_Slider_Data; __intvl_enable : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__intvl_enable shl bp_TElm_Slider_Data_intvl_enable) and bm_TElm_Slider_Data_intvl_enable);
end;

function spacer_down(var a : TElm_Slider_Data) : TEina_Bool;
begin
  spacer_down:=(a.flag0 and bm_TElm_Slider_Data_spacer_down) shr bp_TElm_Slider_Data_spacer_down;
end;

procedure set_spacer_down(var a : TElm_Slider_Data; __spacer_down : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__spacer_down shl bp_TElm_Slider_Data_spacer_down) and bm_TElm_Slider_Data_spacer_down);
end;

function frozen(var a : TElm_Slider_Data) : TEina_Bool;
begin
  frozen:=(a.flag0 and bm_TElm_Slider_Data_frozen) shr bp_TElm_Slider_Data_frozen;
end;

procedure set_frozen(var a : TElm_Slider_Data; __frozen : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__frozen shl bp_TElm_Slider_Data_frozen) and bm_TElm_Slider_Data_frozen);
end;


end.
