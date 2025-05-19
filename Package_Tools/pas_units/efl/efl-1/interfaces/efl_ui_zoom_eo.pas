unit efl_ui_zoom_eo;

interface

uses
  efl, fp_eo, fp_eina;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PEfl_Ui_Zoom = ^TEfl_Ui_Zoom;
  TEfl_Ui_Zoom = TEo;

  {$ifdef EFL_BETA_API_SUPPORT}
type
  PEfl_Ui_Zoom_Mode = ^TEfl_Ui_Zoom_Mode;
  TEfl_Ui_Zoom_Mode = longint;

const
  EFL_UI_ZOOM_MODE_MANUAL = 0;
  EFL_UI_ZOOM_MODE_AUTO_FIT = 1;
  EFL_UI_ZOOM_MODE_AUTO_FILL = 2;
  EFL_UI_ZOOM_MODE_AUTO_FIT_IN = 3;
  EFL_UI_ZOOM_MODE_LAST = 4;
  {$endif}

{$ifdef EFL_BETA_API_SUPPORT}
function EFL_UI_ZOOM_INTERFACE: PEfl_Class;

function efl_ui_zoom_interface_get: PEfl_Class; cdecl; external libefl;
procedure efl_ui_zoom_animation_set(obj: PEo; paused: TEina_Bool); cdecl; external libefl;
function efl_ui_zoom_animation_get(obj: PEo): TEina_Bool; cdecl; external libefl;
procedure efl_ui_zoom_level_set(obj: PEo; zoom: double); cdecl; external libefl;
function efl_ui_zoom_level_get(obj: PEo): double; cdecl; external libefl;
procedure efl_ui_zoom_mode_set(obj: PEo; mode: TEfl_Ui_Zoom_Mode); cdecl; external libefl;
function efl_ui_zoom_mode_get(obj: PEo): TEfl_Ui_Zoom_Mode; cdecl; external libefl;

var
  _EFL_UI_EVENT_ZOOM_START: TEfl_Event_Description; cvar;external libefl;
  _EFL_UI_EVENT_ZOOM_STOP: TEfl_Event_Description; cvar;external libefl;
  _EFL_UI_EVENT_ZOOM_CHANGE: TEfl_Event_Description; cvar;external libefl;

function EFL_UI_EVENT_ZOOM_START: PEfl_Event_Description;
function EFL_UI_EVENT_ZOOM_STOP: PEfl_Event_Description;
function EFL_UI_EVENT_ZOOM_CHANGE: PEfl_Event_Description;
{$endif}

// === Konventiert am: 19-5-25 19:44:16 ===


implementation


function EFL_UI_ZOOM_INTERFACE: PEfl_Class;
begin
  EFL_UI_ZOOM_INTERFACE := efl_ui_zoom_interface_get;
end;

function EFL_UI_EVENT_ZOOM_START: PEfl_Event_Description;
begin
  EFL_UI_EVENT_ZOOM_START := @(_EFL_UI_EVENT_ZOOM_START);
end;

function EFL_UI_EVENT_ZOOM_STOP: PEfl_Event_Description;
begin
  EFL_UI_EVENT_ZOOM_STOP := @(_EFL_UI_EVENT_ZOOM_STOP);
end;

function EFL_UI_EVENT_ZOOM_CHANGE: PEfl_Event_Description;
begin
  EFL_UI_EVENT_ZOOM_CHANGE := @(_EFL_UI_EVENT_ZOOM_CHANGE);
end;


end.
