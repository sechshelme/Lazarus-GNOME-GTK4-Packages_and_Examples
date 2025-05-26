unit elm_calendar_eo_legacy;

interface

uses
  efl, fp_eo, fp_eina, fp_efl, fp_evas, fp_ecore, fp_edje, elm_calendar_common;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PElm_Calendar = ^TElm_Calendar;
  TElm_Calendar = TEo;

type
  PElm_Calendar_Mark_Repeat_Type = ^TElm_Calendar_Mark_Repeat_Type;
  TElm_Calendar_Mark_Repeat_Type = longint;

const
  ELM_CALENDAR_UNIQUE = 0;
  ELM_CALENDAR_DAILY = 1;
  ELM_CALENDAR_WEEKLY = 2;
  ELM_CALENDAR_MONTHLY = 3;
  ELM_CALENDAR_ANNUALLY = 4;
  ELM_CALENDAR_LAST_DAY_OF_MONTH = 5;
  ELM_CALENDAR_REVERSE_DAILY = 6;

type
  PElm_Calendar_Weekday = ^TElm_Calendar_Weekday;
  TElm_Calendar_Weekday = longint;

const
  ELM_DAY_SUNDAY = 0;
  ELM_DAY_MONDAY = 1;
  ELM_DAY_TUESDAY = 2;
  ELM_DAY_WEDNESDAY = 3;
  ELM_DAY_THURSDAY = 4;
  ELM_DAY_FRIDAY = 5;
  ELM_DAY_SATURDAY = 6;
  ELM_DAY_LAST = 7;

type
  PElm_Calendar_Select_Mode = ^TElm_Calendar_Select_Mode;
  TElm_Calendar_Select_Mode = longint;

const
  ELM_CALENDAR_SELECT_MODE_DEFAULT = 0;
  ELM_CALENDAR_SELECT_MODE_ALWAYS = 1;
  ELM_CALENDAR_SELECT_MODE_NONE = 2;
  ELM_CALENDAR_SELECT_MODE_ONDEMAND = 3;

type
  PElm_Calendar_Selectable = ^TElm_Calendar_Selectable;
  TElm_Calendar_Selectable = longint;

const
  ELM_CALENDAR_SELECTABLE_NONE = 0;
  ELM_CALENDAR_SELECTABLE_YEAR = 1;
  ELM_CALENDAR_SELECTABLE_MONTH = 2;
  ELM_CALENDAR_SELECTABLE_DAY = 4;

type
  TElm_Calendar_Mark = record
  end;
  PElm_Calendar_Mark = ^TElm_Calendar_Mark;

procedure elm_calendar_first_day_of_week_set(obj: PElm_Calendar; day: TElm_Calendar_Weekday); cdecl; external libelementary;
function elm_calendar_first_day_of_week_get(obj: PElm_Calendar): TElm_Calendar_Weekday; cdecl; external libelementary;
procedure elm_calendar_selectable_set(obj: PElm_Calendar; selectable: TElm_Calendar_Selectable); cdecl; external libelementary;
function elm_calendar_selectable_get(obj: PElm_Calendar): TElm_Calendar_Selectable; cdecl; external libelementary;
procedure elm_calendar_interval_set(obj: PElm_Calendar; interval: double); cdecl; external libelementary;
function elm_calendar_interval_get(obj: PElm_Calendar): double; cdecl; external libelementary;
procedure elm_calendar_weekdays_names_set(obj: PElm_Calendar; weekdays: PPchar); cdecl; external libelementary;
function elm_calendar_weekdays_names_get(obj: PElm_Calendar): ppchar; cdecl; external libelementary;
procedure elm_calendar_select_mode_set(obj: PElm_Calendar; mode: TElm_Calendar_Select_Mode); cdecl; external libelementary;
function elm_calendar_select_mode_get(obj: PElm_Calendar): TElm_Calendar_Select_Mode; cdecl; external libelementary;
procedure elm_calendar_format_function_set(obj: PElm_Calendar; format_function: TElm_Calendar_Format_Cb); cdecl; external libelementary;
function elm_calendar_marks_get(obj: PElm_Calendar): PEina_List; cdecl; external libelementary;
procedure elm_calendar_date_min_set(obj: PElm_Calendar; min: PEfl_Time); cdecl; external libelementary;
function elm_calendar_date_min_get(obj: PElm_Calendar): PEfl_Time; cdecl; external libelementary;
procedure elm_calendar_date_max_set(obj: PElm_Calendar; max: PEfl_Time); cdecl; external libelementary;
function elm_calendar_date_max_get(obj: PElm_Calendar): PEfl_Time; cdecl; external libelementary;
procedure elm_calendar_selected_time_set(obj: PElm_Calendar; selected_time: PEfl_Time); cdecl; external libelementary;
function elm_calendar_selected_time_get(obj: PElm_Calendar; selected_time: PEfl_Time): TEina_Bool; cdecl; external libelementary;
function elm_calendar_mark_add(obj: PElm_Calendar; mark_type: pchar; mark_time: PEfl_Time; _repeat: TElm_Calendar_Mark_Repeat_Type): PElm_Calendar_Mark; cdecl; external libelementary;
procedure elm_calendar_marks_clear(obj: PElm_Calendar); cdecl; external libelementary;
procedure elm_calendar_marks_draw(obj: PElm_Calendar); cdecl; external libelementary;
function elm_calendar_displayed_time_get(obj: PElm_Calendar; displayed_time: PEfl_Time): TEina_Bool; cdecl; external libelementary;

// === Konventiert am: 26-5-25 17:31:51 ===


implementation



end.
