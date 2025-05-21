unit efl_app_eo;

interface

uses
  efl, fp_eo, fp_eina, fp_efl;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PEfl_App = ^TEfl_App;
  TEfl_App = TEo;

function EFL_APP_CLASS: PEfl_Class;

function efl_app_class_get: PEfl_Class; cdecl; external libecore;
function efl_app_main_get: PEfl_App; cdecl; external libecore;
function efl_app_build_efl_version_get(obj: PEo): PEfl_Version; cdecl; external libecore;
function efl_app_efl_version_get(obj: PEo): PEfl_Version; cdecl; external libecore;

var
  _EFL_APP_EVENT_PAUSE: TEfl_Event_Description; cvar;external libecore;
  _EFL_APP_EVENT_RESUME: TEfl_Event_Description; cvar;external libecore;
  _EFL_APP_EVENT_STANDBY: TEfl_Event_Description; cvar;external libecore;
  _EFL_APP_EVENT_TERMINATE: TEfl_Event_Description; cvar;external libecore;
  _EFL_APP_EVENT_SIGNAL_USR1: TEfl_Event_Description; cvar;external libecore;
  _EFL_APP_EVENT_SIGNAL_USR2: TEfl_Event_Description; cvar;external libecore;
  _EFL_APP_EVENT_SIGNAL_HUP: TEfl_Event_Description; cvar;external libecore;

function EFL_APP_EVENT_PAUSE: PEfl_Event_Description;
function EFL_APP_EVENT_RESUME: PEfl_Event_Description;
function EFL_APP_EVENT_STANDBY: PEfl_Event_Description;
function EFL_APP_EVENT_TERMINATE: PEfl_Event_Description;
function EFL_APP_EVENT_SIGNAL_USR1: PEfl_Event_Description;
function EFL_APP_EVENT_SIGNAL_USR2: PEfl_Event_Description;
function EFL_APP_EVENT_SIGNAL_HUP: PEfl_Event_Description;

// === Konventiert am: 21-5-25 15:43:47 ===


implementation


function EFL_APP_CLASS: PEfl_Class;
begin
  EFL_APP_CLASS := efl_app_class_get;
end;

function EFL_APP_EVENT_PAUSE: PEfl_Event_Description;
begin
  EFL_APP_EVENT_PAUSE := @(_EFL_APP_EVENT_PAUSE);
end;

function EFL_APP_EVENT_RESUME: PEfl_Event_Description;
begin
  EFL_APP_EVENT_RESUME := @(_EFL_APP_EVENT_RESUME);
end;

function EFL_APP_EVENT_STANDBY: PEfl_Event_Description;
begin
  EFL_APP_EVENT_STANDBY := @(_EFL_APP_EVENT_STANDBY);
end;

function EFL_APP_EVENT_TERMINATE: PEfl_Event_Description;
begin
  EFL_APP_EVENT_TERMINATE := @(_EFL_APP_EVENT_TERMINATE);
end;

function EFL_APP_EVENT_SIGNAL_USR1: PEfl_Event_Description;
begin
  EFL_APP_EVENT_SIGNAL_USR1 := @(_EFL_APP_EVENT_SIGNAL_USR1);
end;

function EFL_APP_EVENT_SIGNAL_USR2: PEfl_Event_Description;
begin
  EFL_APP_EVENT_SIGNAL_USR2 := @(_EFL_APP_EVENT_SIGNAL_USR2);
end;

function EFL_APP_EVENT_SIGNAL_HUP: PEfl_Event_Description;
begin
  EFL_APP_EVENT_SIGNAL_HUP := @(_EFL_APP_EVENT_SIGNAL_HUP);
end;


end.
