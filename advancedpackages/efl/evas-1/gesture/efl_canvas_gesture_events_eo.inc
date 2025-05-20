{$IFDEF read_interface}


type
  PEfl_Canvas_Gesture_Events = ^TEfl_Canvas_Gesture_Events;
  TEfl_Canvas_Gesture_Events = TEo;
{$ifdef EFL_BETA_API_SUPPORT}
function EFL_CANVAS_GESTURE_EVENTS_INTERFACE: PEfl_Class;

function efl_canvas_gesture_events_interface_get: PEfl_Class; cdecl; external libevas;

var
  _EFL_EVENT_GESTURE_TAP: TEfl_Event_Description; cvar;external libevas;
  _EFL_EVENT_GESTURE_DOUBLE_TAP: TEfl_Event_Description; cvar;external libevas;
  _EFL_EVENT_GESTURE_TRIPLE_TAP: TEfl_Event_Description; cvar;external libevas;
  _EFL_EVENT_GESTURE_LONG_PRESS: TEfl_Event_Description; cvar;external libevas;
  _EFL_EVENT_GESTURE_MOMENTUM: TEfl_Event_Description; cvar;external libevas;
  _EFL_EVENT_GESTURE_FLICK: TEfl_Event_Description; cvar;external libevas;
  _EFL_EVENT_GESTURE_ROTATE: TEfl_Event_Description; cvar;external libevas;
  _EFL_EVENT_GESTURE_ZOOM: TEfl_Event_Description; cvar;external libevas;
  _EFL_EVENT_GESTURE_CUSTOM: TEfl_Event_Description; cvar;external libevas;

function EFL_EVENT_GESTURE_TAP: PEfl_Event_Description;
function EFL_EVENT_GESTURE_DOUBLE_TAP: PEfl_Event_Description;
function EFL_EVENT_GESTURE_TRIPLE_TAP: PEfl_Event_Description;
function EFL_EVENT_GESTURE_LONG_PRESS: PEfl_Event_Description;
function EFL_EVENT_GESTURE_MOMENTUM: PEfl_Event_Description;
function EFL_EVENT_GESTURE_FLICK: PEfl_Event_Description;
function EFL_EVENT_GESTURE_ROTATE: PEfl_Event_Description;
function EFL_EVENT_GESTURE_ZOOM: PEfl_Event_Description;
function EFL_EVENT_GESTURE_CUSTOM: PEfl_Event_Description;
{$endif}

// === Konventiert am: 14-5-25 16:22:53 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ifdef EFL_BETA_API_SUPPORT}
function EFL_CANVAS_GESTURE_EVENTS_INTERFACE: PEfl_Class;
begin
  EFL_CANVAS_GESTURE_EVENTS_INTERFACE := efl_canvas_gesture_events_interface_get;
end;


function EFL_EVENT_GESTURE_TAP: PEfl_Event_Description;
begin
  EFL_EVENT_GESTURE_TAP := @(_EFL_EVENT_GESTURE_TAP);
end;


function EFL_EVENT_GESTURE_DOUBLE_TAP: PEfl_Event_Description;
begin
  EFL_EVENT_GESTURE_DOUBLE_TAP := @(_EFL_EVENT_GESTURE_DOUBLE_TAP);
end;


function EFL_EVENT_GESTURE_TRIPLE_TAP: PEfl_Event_Description;
begin
  EFL_EVENT_GESTURE_TRIPLE_TAP := @(_EFL_EVENT_GESTURE_TRIPLE_TAP);
end;


function EFL_EVENT_GESTURE_LONG_PRESS: PEfl_Event_Description;
begin
  EFL_EVENT_GESTURE_LONG_PRESS := @(_EFL_EVENT_GESTURE_LONG_PRESS);
end;


function EFL_EVENT_GESTURE_MOMENTUM: PEfl_Event_Description;
begin
  EFL_EVENT_GESTURE_MOMENTUM := @(_EFL_EVENT_GESTURE_MOMENTUM);
end;


function EFL_EVENT_GESTURE_FLICK: PEfl_Event_Description;
begin
  EFL_EVENT_GESTURE_FLICK := @(_EFL_EVENT_GESTURE_FLICK);
end;


function EFL_EVENT_GESTURE_ROTATE: PEfl_Event_Description;
begin
  EFL_EVENT_GESTURE_ROTATE := @(_EFL_EVENT_GESTURE_ROTATE);
end;


function EFL_EVENT_GESTURE_ZOOM: PEfl_Event_Description;
begin
  EFL_EVENT_GESTURE_ZOOM := @(_EFL_EVENT_GESTURE_ZOOM);
end;


function EFL_EVENT_GESTURE_CUSTOM: PEfl_Event_Description;
begin
  EFL_EVENT_GESTURE_CUSTOM := @(_EFL_EVENT_GESTURE_CUSTOM);
end;
{$endif}


{$ENDIF read_implementation}
