{$IFDEF read_interface}


type
  PEfl_Ui_Range_Display = ^TEfl_Ui_Range_Display;
  TEfl_Ui_Range_Display = TEo;

function EFL_UI_RANGE_DISPLAY_INTERFACE: PEfl_Class;

function efl_ui_range_display_interface_get: PEfl_Class; cdecl; external libefl;
procedure efl_ui_range_value_set(obj: PEo; val: double); cdecl; external libefl;
function efl_ui_range_value_get(obj: PEo): double; cdecl; external libefl;
procedure efl_ui_range_limits_set(obj: PEo; min: double; max: double); cdecl; external libefl;
procedure efl_ui_range_limits_get(obj: PEo; min: Pdouble; max: Pdouble); cdecl; external libefl;

var
  _EFL_UI_RANGE_EVENT_CHANGED: TEfl_Event_Description; cvar;external libefl;
  _EFL_UI_RANGE_EVENT_MIN_REACHED: TEfl_Event_Description; cvar;external libefl;
  _EFL_UI_RANGE_EVENT_MAX_REACHED: TEfl_Event_Description; cvar;external libefl;

function EFL_UI_RANGE_EVENT_CHANGED: PEfl_Event_Description;
function EFL_UI_RANGE_EVENT_MIN_REACHED: PEfl_Event_Description;
function EFL_UI_RANGE_EVENT_MAX_REACHED: PEfl_Event_Description;


// === Konventiert am: 20-5-25 13:05:50 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


function EFL_UI_RANGE_DISPLAY_INTERFACE: PEfl_Class;
begin
  EFL_UI_RANGE_DISPLAY_INTERFACE := efl_ui_range_display_interface_get;
end;

function EFL_UI_RANGE_EVENT_CHANGED: PEfl_Event_Description;
begin
  EFL_UI_RANGE_EVENT_CHANGED := @(_EFL_UI_RANGE_EVENT_CHANGED);
end;

function EFL_UI_RANGE_EVENT_MIN_REACHED: PEfl_Event_Description;
begin
  EFL_UI_RANGE_EVENT_MIN_REACHED := @(_EFL_UI_RANGE_EVENT_MIN_REACHED);
end;

function EFL_UI_RANGE_EVENT_MAX_REACHED: PEfl_Event_Description;
begin
  EFL_UI_RANGE_EVENT_MAX_REACHED := @(_EFL_UI_RANGE_EVENT_MAX_REACHED);
end;


{$ENDIF read_implementation}
