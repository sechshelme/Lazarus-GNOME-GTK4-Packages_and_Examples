{$IFDEF read_interface}


type
  PEfl_Ui_Timepicker = ^TEfl_Ui_Timepicker;
  TEfl_Ui_Timepicker = TEo;

function EFL_UI_TIMEPICKER_CLASS: PEfl_Class;

function efl_ui_timepicker_class_get: PEfl_Class; cdecl; external libelementary;
procedure efl_ui_timepicker_time_set(obj: PEo; hour: longint; min: longint); cdecl; external libelementary;
procedure efl_ui_timepicker_time_get(obj: PEo; hour: Plongint; min: Plongint); cdecl; external libelementary;
procedure efl_ui_timepicker_is_24hour_set(obj: PEo; is_24hour: TEina_Bool); cdecl; external libelementary;
function efl_ui_timepicker_is_24hour_get(obj: PEo): TEina_Bool; cdecl; external libelementary;

var
  _EFL_UI_TIMEPICKER_EVENT_TIME_CHANGED: TEfl_Event_Description; cvar;external libelementary;

function EFL_UI_TIMEPICKER_EVENT_TIME_CHANGED: PEfl_Event_Description;


// === Konventiert am: 31-5-25 19:14:21 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


function EFL_UI_TIMEPICKER_CLASS: PEfl_Class;
begin
  EFL_UI_TIMEPICKER_CLASS := efl_ui_timepicker_class_get;
end;

function EFL_UI_TIMEPICKER_EVENT_TIME_CHANGED: PEfl_Event_Description;
begin
  EFL_UI_TIMEPICKER_EVENT_TIME_CHANGED := @(_EFL_UI_TIMEPICKER_EVENT_TIME_CHANGED);
end;


{$ENDIF read_implementation}
