unit elm_clock_eo;

interface

uses
  efl, fp_eo, fp_eina, fp_efl, fp_evas, fp_ecore, fp_edje;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PElm_Clock = ^TElm_Clock;
  TElm_Clock = TEo;

type
  PElm_Clock_Edit_Mode = ^TElm_Clock_Edit_Mode;
  TElm_Clock_Edit_Mode = longint;

const
  ELM_CLOCK_EDIT_DEFAULT = 0;
  ELM_CLOCK_EDIT_HOUR_DECIMAL = 1;
  ELM_CLOCK_EDIT_HOUR_UNIT = 2;
  ELM_CLOCK_EDIT_MIN_DECIMAL = 4;
  ELM_CLOCK_EDIT_MIN_UNIT = 8;
  ELM_CLOCK_EDIT_SEC_DECIMAL = 16;
  ELM_CLOCK_EDIT_SEC_UNIT = 32;
  ELM_CLOCK_EDIT_ALL = 63;

function ELM_CLOCK_CLASS: PEfl_Class;

function elm_clock_class_get: PEfl_Class; cdecl; external libelementary;
procedure elm_obj_clock_show_am_pm_set(obj: PEo; am_pm: TEina_Bool); cdecl; external libelementary;
function elm_obj_clock_show_am_pm_get(obj: PEo): TEina_Bool; cdecl; external libelementary;
procedure elm_obj_clock_first_interval_set(obj: PEo; interval: double); cdecl; external libelementary;
function elm_obj_clock_first_interval_get(obj: PEo): double; cdecl; external libelementary;
procedure elm_obj_clock_show_seconds_set(obj: PEo; seconds: TEina_Bool); cdecl; external libelementary;
function elm_obj_clock_show_seconds_get(obj: PEo): TEina_Bool; cdecl; external libelementary;
procedure elm_obj_clock_edit_set(obj: PEo; edit: TEina_Bool); cdecl; external libelementary;
function elm_obj_clock_edit_get(obj: PEo): TEina_Bool; cdecl; external libelementary;
procedure elm_obj_clock_pause_set(obj: PEo; paused: TEina_Bool); cdecl; external libelementary;
function elm_obj_clock_pause_get(obj: PEo): TEina_Bool; cdecl; external libelementary;
procedure elm_obj_clock_time_set(obj: PEo; hrs: longint; min: longint; sec: longint); cdecl; external libelementary;
procedure elm_obj_clock_time_get(obj: PEo; hrs: Plongint; min: Plongint; sec: Plongint); cdecl; external libelementary;
procedure elm_obj_clock_edit_mode_set(obj: PEo; digedit: TElm_Clock_Edit_Mode); cdecl; external libelementary;
function elm_obj_clock_edit_mode_get(obj: PEo): TElm_Clock_Edit_Mode; cdecl; external libelementary;

var
  _ELM_CLOCK_EVENT_CHANGED: TEfl_Event_Description; cvar;external libelementary;

function ELM_CLOCK_EVENT_CHANGED: PEfl_Event_Description;


// === Konventiert am: 26-5-25 19:35:33 ===


implementation


function ELM_CLOCK_CLASS: PEfl_Class;
begin
  ELM_CLOCK_CLASS := elm_clock_class_get;
end;

function ELM_CLOCK_EVENT_CHANGED: PEfl_Event_Description;
begin
  ELM_CLOCK_EVENT_CHANGED := @(_ELM_CLOCK_EVENT_CHANGED);
end;


end.
