{$IFDEF read_interface}


type
  PEfl_Ui_Calendar = ^TEfl_Ui_Calendar;
  TEfl_Ui_Calendar = TEo;

  {$ifdef EFL_BETA_API_SUPPORT}
type
  PEfl_Ui_Calendar_Weekday = ^TEfl_Ui_Calendar_Weekday;
  TEfl_Ui_Calendar_Weekday = longint;

const
  EFL_UI_CALENDAR_WEEKDAY_SUNDAY = 0;
  EFL_UI_CALENDAR_WEEKDAY_MONDAY = 1;
  EFL_UI_CALENDAR_WEEKDAY_TUESDAY = 2;
  EFL_UI_CALENDAR_WEEKDAY_WEDNESDAY = 3;
  EFL_UI_CALENDAR_WEEKDAY_THURSDAY = 4;
  EFL_UI_CALENDAR_WEEKDAY_FRIDAY = 5;
  EFL_UI_CALENDAR_WEEKDAY_SATURDAY = 6;
  EFL_UI_CALENDAR_WEEKDAY_LAST = 7;
  {$endif}

{$ifdef EFL_BETA_API_SUPPORT}
function EFL_UI_CALENDAR_CLASS: PEfl_Class;

function efl_ui_calendar_class_get: PEfl_Class; cdecl; external libelementary;
procedure efl_ui_calendar_first_day_of_week_set(obj: PEo; day: TEfl_Ui_Calendar_Weekday); cdecl; external libelementary;
function efl_ui_calendar_first_day_of_week_get(obj: PEo): TEfl_Ui_Calendar_Weekday; cdecl; external libelementary;
function efl_ui_calendar_date_min_set(obj: PEo; min: TEfl_Time): TEina_Bool; cdecl; external libelementary;
function efl_ui_calendar_date_min_get(obj: PEo): TEfl_Time; cdecl; external libelementary;
function efl_ui_calendar_date_max_set(obj: PEo; max: TEfl_Time): TEina_Bool; cdecl; external libelementary;
function efl_ui_calendar_date_max_get(obj: PEo): TEfl_Time; cdecl; external libelementary;
function efl_ui_calendar_date_set(obj: PEo; date: TEfl_Time): TEina_Bool; cdecl; external libelementary;
function efl_ui_calendar_date_get(obj: PEo): TEfl_Time; cdecl; external libelementary;

var
  _EFL_UI_CALENDAR_EVENT_CHANGED: TEfl_Event_Description; cvar;external libelementary;

function EFL_UI_CALENDAR_EVENT_CHANGED: PEfl_Event_Description;
{$endif}

// === Konventiert am: 29-5-25 19:46:56 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


function EFL_UI_CALENDAR_CLASS: PEfl_Class;
begin
  EFL_UI_CALENDAR_CLASS := efl_ui_calendar_class_get;
end;

function EFL_UI_CALENDAR_EVENT_CHANGED: PEfl_Event_Description;
begin
  EFL_UI_CALENDAR_EVENT_CHANGED := @(_EFL_UI_CALENDAR_EVENT_CHANGED);
end;


{$ENDIF read_implementation}
