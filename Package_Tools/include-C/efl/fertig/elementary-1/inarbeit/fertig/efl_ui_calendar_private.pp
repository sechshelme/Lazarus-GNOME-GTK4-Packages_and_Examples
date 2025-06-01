
unit efl_ui_calendar_private;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_ui_calendar_private.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_ui_calendar_private.h
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
PEfl_Ui_Calendar_Data  = ^Efl_Ui_Calendar_Data;
PEo  = ^Eo;
PEvas_Object  = ^Evas_Object;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef EFL_UI_CALENDAR_PRIVATE_H}
{$define EFL_UI_CALENDAR_PRIVATE_H}
{$include "Elementary.h"}
{ DO NOT USE THIS HEADER UNLESS YOU ARE PREPARED FOR BREAKING OF YOUR
 * CODE. THIS IS ELEMENTARY'S INTERNAL WIDGET API (for now) AND IS NOT
 * FINAL. CALL elm_widget_api_check(ELM_INTERNAL_API_VERSION) TO CHECK
 * IT AT RUNTIME.
  }
{*
 * Base layout smart data extended with calendar instance data.
  }
type
{ the object itself }
(* Const before type ignored *)
  PEfl_Ui_Calendar_Data = ^TEfl_Ui_Calendar_Data;
  TEfl_Ui_Calendar_Data = record
      obj : PEvas_Object;
      interval : Tdouble;
      first_interval : Tdouble;
      spin_speed : longint;
      today_it : longint;
      selected_it : longint;
      focused_it : longint;
      update_timer : PEcore_Timer;
      weekdays : array[0..(ELM_DAY_LAST)-1] of Pchar;
      current_date : Ttm;
      shown_date : Ttm;
      date : Ttm;
      date_min : Ttm;
      date_max : Ttm;
      inc_btn_month : PEvas_Object;
      dec_btn_month : PEvas_Object;
      month_access : PEvas_Object;
      items : array[0..41] of PEo;
      first_week_day : TEfl_Ui_Calendar_Weekday;
      first_day_it : byte;
      flag0 : word;
    end;


const
  bm_TEfl_Ui_Calendar_Data_selected = $1;
  bp_TEfl_Ui_Calendar_Data_selected = 0;
  bm_TEfl_Ui_Calendar_Data_filling = $2;
  bp_TEfl_Ui_Calendar_Data_filling = 1;
  bm_TEfl_Ui_Calendar_Data_weekdays_set = $4;
  bp_TEfl_Ui_Calendar_Data_weekdays_set = 2;

function selected(var a : TEfl_Ui_Calendar_Data) : TEina_Bool;
procedure set_selected(var a : TEfl_Ui_Calendar_Data; __selected : TEina_Bool);
function filling(var a : TEfl_Ui_Calendar_Data) : TEina_Bool;
procedure set_filling(var a : TEfl_Ui_Calendar_Data; __filling : TEina_Bool);
function weekdays_set(var a : TEfl_Ui_Calendar_Data) : TEina_Bool;
procedure set_weekdays_set(var a : TEfl_Ui_Calendar_Data; __weekdays_set : TEina_Bool);

implementation

function selected(var a : TEfl_Ui_Calendar_Data) : TEina_Bool;
begin
  selected:=(a.flag0 and bm_TEfl_Ui_Calendar_Data_selected) shr bp_TEfl_Ui_Calendar_Data_selected;
end;

procedure set_selected(var a : TEfl_Ui_Calendar_Data; __selected : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__selected shl bp_TEfl_Ui_Calendar_Data_selected) and bm_TEfl_Ui_Calendar_Data_selected);
end;

function filling(var a : TEfl_Ui_Calendar_Data) : TEina_Bool;
begin
  filling:=(a.flag0 and bm_TEfl_Ui_Calendar_Data_filling) shr bp_TEfl_Ui_Calendar_Data_filling;
end;

procedure set_filling(var a : TEfl_Ui_Calendar_Data; __filling : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__filling shl bp_TEfl_Ui_Calendar_Data_filling) and bm_TEfl_Ui_Calendar_Data_filling);
end;

function weekdays_set(var a : TEfl_Ui_Calendar_Data) : TEina_Bool;
begin
  weekdays_set:=(a.flag0 and bm_TEfl_Ui_Calendar_Data_weekdays_set) shr bp_TEfl_Ui_Calendar_Data_weekdays_set;
end;

procedure set_weekdays_set(var a : TEfl_Ui_Calendar_Data; __weekdays_set : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__weekdays_set shl bp_TEfl_Ui_Calendar_Data_weekdays_set) and bm_TEfl_Ui_Calendar_Data_weekdays_set);
end;


end.
