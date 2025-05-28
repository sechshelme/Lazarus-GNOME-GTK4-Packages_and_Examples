{$IFDEF read_interface}


type
  PEfl_Ui_Clock = ^TEfl_Ui_Clock;
  TEfl_Ui_Clock = TEo;

  {$ifdef EFL_BETA_API_SUPPORT}
type
  PEfl_Ui_Clock_Type = ^TEfl_Ui_Clock_Type;
  TEfl_Ui_Clock_Type = longint;

const
  EFL_UI_CLOCK_TYPE_YEAR = 0;
  EFL_UI_CLOCK_TYPE_MONTH = 1;
  EFL_UI_CLOCK_TYPE_DATE = 2;
  EFL_UI_CLOCK_TYPE_HOUR = 3;
  EFL_UI_CLOCK_TYPE_MINUTE = 4;
  EFL_UI_CLOCK_TYPE_SECOND = 5;
  EFL_UI_CLOCK_TYPE_DAY = 6;
  EFL_UI_CLOCK_TYPE_AMPM = 7;
  {$endif}

{$ifdef EFL_BETA_API_SUPPORT}
function EFL_UI_CLOCK_CLASS: PEfl_Class;

function efl_ui_clock_class_get: PEfl_Class; cdecl; external libelementary;
procedure efl_ui_clock_format_set(obj: PEo; fmt: pchar); cdecl; external libelementary;
function efl_ui_clock_format_get(obj: PEo): pchar; cdecl; external libelementary;
procedure efl_ui_clock_pause_set(obj: PEo; paused: TEina_Bool); cdecl; external libelementary;
function efl_ui_clock_pause_get(obj: PEo): TEina_Bool; cdecl; external libelementary;
procedure efl_ui_clock_edit_mode_set(obj: PEo; value: TEina_Bool); cdecl; external libelementary;
function efl_ui_clock_edit_mode_get(obj: PEo): TEina_Bool; cdecl; external libelementary;
procedure efl_ui_clock_time_min_set(obj: PEo; mintime: TEfl_Time); cdecl; external libelementary;
function efl_ui_clock_time_min_get(obj: PEo): TEfl_Time; cdecl; external libelementary;
procedure efl_ui_clock_time_max_set(obj: PEo; maxtime: TEfl_Time); cdecl; external libelementary;
function efl_ui_clock_time_max_get(obj: PEo): TEfl_Time; cdecl; external libelementary;
procedure efl_ui_clock_time_set(obj: PEo; curtime: TEfl_Time); cdecl; external libelementary;
function efl_ui_clock_time_get(obj: PEo): TEfl_Time; cdecl; external libelementary;
procedure efl_ui_clock_field_visible_set(obj: PEo; fieldtype: TEfl_Ui_Clock_Type; visible: TEina_Bool); cdecl; external libelementary;
function efl_ui_clock_field_visible_get(obj: PEo; fieldtype: TEfl_Ui_Clock_Type): TEina_Bool; cdecl; external libelementary;
procedure efl_ui_clock_field_limit_set(obj: PEo; fieldtype: TEfl_Ui_Clock_Type; min: longint; max: longint); cdecl; external libelementary;
procedure efl_ui_clock_field_limit_get(obj: PEo; fieldtype: TEfl_Ui_Clock_Type; min: Plongint; max: Plongint); cdecl; external libelementary;

var
  _EFL_UI_CLOCK_EVENT_CHANGED: TEfl_Event_Description; cvar;external libelementary;

function EFL_UI_CLOCK_EVENT_CHANGED: PEfl_Event_Description;
{$endif}

// === Konventiert am: 27-5-25 19:21:01 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


{$ifdef EFL_BETA_API_SUPPORT}
function EFL_UI_CLOCK_CLASS: PEfl_Class;
begin
  EFL_UI_CLOCK_CLASS := efl_ui_clock_class_get;
end;

function EFL_UI_CLOCK_EVENT_CHANGED: PEfl_Event_Description;
begin
  EFL_UI_CLOCK_EVENT_CHANGED := @(_EFL_UI_CLOCK_EVENT_CHANGED);
end;
{$endif}


{$ENDIF read_implementation}
