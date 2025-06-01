{$IFDEF read_interface}


type
  PEfl_Access_Window = ^TEfl_Access_Window;
  TEfl_Access_Window = TEo;

{$ifdef EFL_BETA_API_SUPPORT}
function efl_access_window_interface_get: PEfl_Class; cdecl; external libelementary;

function EFL_ACCESS_WINDOW_INTERFACE: PEfl_Class;

var
  _EFL_ACCESS_WINDOW_EVENT_WINDOW_CREATED: TEfl_Event_Description; cvar;external libelementary;
  _EFL_ACCESS_WINDOW_EVENT_WINDOW_DESTROYED: TEfl_Event_Description; cvar;external libelementary;
  _EFL_ACCESS_WINDOW_EVENT_WINDOW_ACTIVATED: TEfl_Event_Description; cvar;external libelementary;
  _EFL_ACCESS_WINDOW_EVENT_WINDOW_DEACTIVATED: TEfl_Event_Description; cvar;external libelementary;
  _EFL_ACCESS_WINDOW_EVENT_WINDOW_MAXIMIZED: TEfl_Event_Description; cvar;external libelementary;
  _EFL_ACCESS_WINDOW_EVENT_WINDOW_MINIMIZED: TEfl_Event_Description; cvar;external libelementary;
  _EFL_ACCESS_WINDOW_EVENT_WINDOW_RESTORED: TEfl_Event_Description; cvar;external libelementary;

function EFL_ACCESS_WINDOW_EVENT_WINDOW_CREATED: PEfl_Event_Description;
function EFL_ACCESS_WINDOW_EVENT_WINDOW_DESTROYED: PEfl_Event_Description;
function EFL_ACCESS_WINDOW_EVENT_WINDOW_ACTIVATED: PEfl_Event_Description;
function EFL_ACCESS_WINDOW_EVENT_WINDOW_DEACTIVATED: PEfl_Event_Description;
function EFL_ACCESS_WINDOW_EVENT_WINDOW_MAXIMIZED: PEfl_Event_Description;
function EFL_ACCESS_WINDOW_EVENT_WINDOW_MINIMIZED: PEfl_Event_Description;
function EFL_ACCESS_WINDOW_EVENT_WINDOW_RESTORED: PEfl_Event_Description;
{$endif}

// === Konventiert am: 31-5-25 13:24:39 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


{$ifdef EFL_BETA_API_SUPPORT}
function EFL_ACCESS_WINDOW_INTERFACE: PEfl_Class;
begin
  EFL_ACCESS_WINDOW_INTERFACE := efl_access_window_interface_get;
end;

function EFL_ACCESS_WINDOW_EVENT_WINDOW_CREATED: PEfl_Event_Description;
begin
  EFL_ACCESS_WINDOW_EVENT_WINDOW_CREATED := @(_EFL_ACCESS_WINDOW_EVENT_WINDOW_CREATED);
end;

function EFL_ACCESS_WINDOW_EVENT_WINDOW_DESTROYED: PEfl_Event_Description;
begin
  EFL_ACCESS_WINDOW_EVENT_WINDOW_DESTROYED := @(_EFL_ACCESS_WINDOW_EVENT_WINDOW_DESTROYED);
end;

function EFL_ACCESS_WINDOW_EVENT_WINDOW_ACTIVATED: PEfl_Event_Description;
begin
  EFL_ACCESS_WINDOW_EVENT_WINDOW_ACTIVATED := @(_EFL_ACCESS_WINDOW_EVENT_WINDOW_ACTIVATED);
end;

function EFL_ACCESS_WINDOW_EVENT_WINDOW_DEACTIVATED: PEfl_Event_Description;
begin
  EFL_ACCESS_WINDOW_EVENT_WINDOW_DEACTIVATED := @(_EFL_ACCESS_WINDOW_EVENT_WINDOW_DEACTIVATED);
end;

function EFL_ACCESS_WINDOW_EVENT_WINDOW_MAXIMIZED: PEfl_Event_Description;
begin
  EFL_ACCESS_WINDOW_EVENT_WINDOW_MAXIMIZED := @(_EFL_ACCESS_WINDOW_EVENT_WINDOW_MAXIMIZED);
end;

function EFL_ACCESS_WINDOW_EVENT_WINDOW_MINIMIZED: PEfl_Event_Description;
begin
  EFL_ACCESS_WINDOW_EVENT_WINDOW_MINIMIZED := @(_EFL_ACCESS_WINDOW_EVENT_WINDOW_MINIMIZED);
end;

function EFL_ACCESS_WINDOW_EVENT_WINDOW_RESTORED: PEfl_Event_Description;
begin
  EFL_ACCESS_WINDOW_EVENT_WINDOW_RESTORED := @(_EFL_ACCESS_WINDOW_EVENT_WINDOW_RESTORED);
end;
{$endif}


{$ENDIF read_implementation}
