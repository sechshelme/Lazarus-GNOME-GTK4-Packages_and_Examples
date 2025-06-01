{$IFDEF read_interface}


type
  PEfl_Ui_Slider_Interval = ^TEfl_Ui_Slider_Interval;
  TEfl_Ui_Slider_Interval = TEo;

{$ifdef EFL_BETA_API_SUPPORT}
function EFL_UI_SLIDER_INTERVAL_CLASS: PEfl_Class;

function efl_ui_slider_interval_class_get: PEfl_Class; cdecl; external libelementary;
procedure efl_ui_slider_interval_value_set(obj: PEo; from: double; to_: double); cdecl; external libelementary;
procedure efl_ui_slider_interval_value_get(obj: PEo; from: Pdouble; to_: Pdouble); cdecl; external libelementary;

var
  _EFL_UI_SLIDER_INTERVAL_EVENT_SLIDER_DRAG_START: TEfl_Event_Description; cvar;external libelementary;
  _EFL_UI_SLIDER_INTERVAL_EVENT_SLIDER_DRAG_STOP: TEfl_Event_Description; cvar;external libelementary;

function EFL_UI_SLIDER_INTERVAL_EVENT_SLIDER_DRAG_START: PEfl_Event_Description;
function EFL_UI_SLIDER_INTERVAL_EVENT_SLIDER_DRAG_STOP: PEfl_Event_Description;
{$endif}

// === Konventiert am: 31-5-25 17:22:21 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


{$ifdef EFL_BETA_API_SUPPORT}
function EFL_UI_SLIDER_INTERVAL_CLASS: PEfl_Class;
begin
  EFL_UI_SLIDER_INTERVAL_CLASS := efl_ui_slider_interval_class_get;
end;

function EFL_UI_SLIDER_INTERVAL_EVENT_SLIDER_DRAG_START: PEfl_Event_Description;
begin
  EFL_UI_SLIDER_INTERVAL_EVENT_SLIDER_DRAG_START := @(_EFL_UI_SLIDER_INTERVAL_EVENT_SLIDER_DRAG_START);
end;

function EFL_UI_SLIDER_INTERVAL_EVENT_SLIDER_DRAG_STOP: PEfl_Event_Description;
begin
  EFL_UI_SLIDER_INTERVAL_EVENT_SLIDER_DRAG_STOP := @(_EFL_UI_SLIDER_INTERVAL_EVENT_SLIDER_DRAG_STOP);
end;
{$endif}


{$ENDIF read_implementation}
