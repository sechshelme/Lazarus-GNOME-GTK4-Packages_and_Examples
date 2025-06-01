
unit elm_widget_calendar;
interface

{
  Automatically converted by H2Pas 1.0.0 from elm_widget_calendar.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    elm_widget_calendar.h
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
PDay_Color  = ^Day_Color;
PEcore_Timer  = ^Ecore_Timer;
PEina_List  = ^Eina_List;
PElm_Calendar_Data  = ^Elm_Calendar_Data;
PElm_Calendar_Mark  = ^Elm_Calendar_Mark;
PEo  = ^Eo;
PEvas_Object  = ^Evas_Object;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef ELM_WIDGET_CALENDAR_H}
{$define ELM_WIDGET_CALENDAR_H}
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
 * @section elm-calendar-class The Elementary Calendar Class
 *
 * Elementary, besides having the @ref Calendar widget, exposes its
 * foundation -- the Elementary Calendar Class -- in order to create other
 * widgets which are a calendar with some more logic on top.
  }
{*
 * Base layout smart data extended with calendar instance data.
  }
type
{ EINA_DEPRECATED }

  PDay_Color = ^TDay_Color;
  TDay_Color =  Longint;
  Const
    DAY_WEEKDAY = 0;
    DAY_SATURDAY = 1;
    DAY_SUNDAY = 2;
;
{ the object itself }
(* Const before type ignored *)
{ EINA_DEPRECATED }
type
  PElm_Calendar_Data = ^TElm_Calendar_Data;
  TElm_Calendar_Data = record
      obj : PEvas_Object;
      marks : PEina_List;
      interval : Tdouble;
      first_interval : Tdouble;
      spin_speed : longint;
      today_it : longint;
      selected_it : longint;
      focused_it : longint;
      update_timer : PEcore_Timer;
      spin_timer : PEcore_Timer;
      format_func : TElm_Calendar_Format_Cb;
      weekdays : array[0..(ELM_DAY_LAST)-1] of Pchar;
      current_time : Ttm;
      selected_time : Ttm;
      shown_time : Ttm;
      date_min : Ttm;
      date_max : Ttm;
      day_color : array[0..41] of TDay_Color;
      inc_btn_month : PEvas_Object;
      dec_btn_month : PEvas_Object;
      month_access : PEvas_Object;
      inc_btn_year : PEvas_Object;
      dec_btn_year : PEvas_Object;
      year_access : PEvas_Object;
      items : array[0..41] of PEo;
      first_week_day : TElm_Calendar_Weekday;
      select_mode : TElm_Calendar_Select_Mode;
      selectable : TElm_Calendar_Selectable;
      first_day_it : byte;
      flag0 : word;
    end;


const
  bm_TElm_Calendar_Data_selected = $1;
  bp_TElm_Calendar_Data_selected = 0;
  bm_TElm_Calendar_Data_double_spinners = $2;
  bp_TElm_Calendar_Data_double_spinners = 1;
  bm_TElm_Calendar_Data_filling = $4;
  bp_TElm_Calendar_Data_filling = 2;
  bm_TElm_Calendar_Data_weekdays_set = $8;
  bp_TElm_Calendar_Data_weekdays_set = 3;
  bm_TElm_Calendar_Data_month_btn_clicked = $10;
  bp_TElm_Calendar_Data_month_btn_clicked = 4;

function selected(var a : TElm_Calendar_Data) : TEina_Bool;
procedure set_selected(var a : TElm_Calendar_Data; __selected : TEina_Bool);
function double_spinners(var a : TElm_Calendar_Data) : TEina_Bool;
procedure set_double_spinners(var a : TElm_Calendar_Data; __double_spinners : TEina_Bool);
function filling(var a : TElm_Calendar_Data) : TEina_Bool;
procedure set_filling(var a : TElm_Calendar_Data; __filling : TEina_Bool);
function weekdays_set(var a : TElm_Calendar_Data) : TEina_Bool;
procedure set_weekdays_set(var a : TElm_Calendar_Data; __weekdays_set : TEina_Bool);
function month_btn_clicked(var a : TElm_Calendar_Data) : TEina_Bool;
procedure set_month_btn_clicked(var a : TElm_Calendar_Data; __month_btn_clicked : TEina_Bool);
(* Const before type ignored *)
type
  PElm_Calendar_Mark = ^TElm_Calendar_Mark;
  TElm_Calendar_Mark = record
      obj : PEvas_Object;
      node : PEina_List;
      mark_time : Ttm;
      mark_type : Pchar;
      _repeat : TElm_Calendar_Mark_Repeat_Type;
    end;

{*
 * @
  }

implementation

function selected(var a : TElm_Calendar_Data) : TEina_Bool;
begin
  selected:=(a.flag0 and bm_TElm_Calendar_Data_selected) shr bp_TElm_Calendar_Data_selected;
end;

procedure set_selected(var a : TElm_Calendar_Data; __selected : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__selected shl bp_TElm_Calendar_Data_selected) and bm_TElm_Calendar_Data_selected);
end;

function double_spinners(var a : TElm_Calendar_Data) : TEina_Bool;
begin
  double_spinners:=(a.flag0 and bm_TElm_Calendar_Data_double_spinners) shr bp_TElm_Calendar_Data_double_spinners;
end;

procedure set_double_spinners(var a : TElm_Calendar_Data; __double_spinners : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__double_spinners shl bp_TElm_Calendar_Data_double_spinners) and bm_TElm_Calendar_Data_double_spinners);
end;

function filling(var a : TElm_Calendar_Data) : TEina_Bool;
begin
  filling:=(a.flag0 and bm_TElm_Calendar_Data_filling) shr bp_TElm_Calendar_Data_filling;
end;

procedure set_filling(var a : TElm_Calendar_Data; __filling : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__filling shl bp_TElm_Calendar_Data_filling) and bm_TElm_Calendar_Data_filling);
end;

function weekdays_set(var a : TElm_Calendar_Data) : TEina_Bool;
begin
  weekdays_set:=(a.flag0 and bm_TElm_Calendar_Data_weekdays_set) shr bp_TElm_Calendar_Data_weekdays_set;
end;

procedure set_weekdays_set(var a : TElm_Calendar_Data; __weekdays_set : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__weekdays_set shl bp_TElm_Calendar_Data_weekdays_set) and bm_TElm_Calendar_Data_weekdays_set);
end;

function month_btn_clicked(var a : TElm_Calendar_Data) : TEina_Bool;
begin
  month_btn_clicked:=(a.flag0 and bm_TElm_Calendar_Data_month_btn_clicked) shr bp_TElm_Calendar_Data_month_btn_clicked;
end;

procedure set_month_btn_clicked(var a : TElm_Calendar_Data; __month_btn_clicked : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__month_btn_clicked shl bp_TElm_Calendar_Data_month_btn_clicked) and bm_TElm_Calendar_Data_month_btn_clicked);
end;


end.
