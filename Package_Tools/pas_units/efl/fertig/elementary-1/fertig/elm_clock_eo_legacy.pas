unit elm_clock_eo_legacy;

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

procedure elm_clock_show_am_pm_set(obj: PElm_Clock; am_pm: TEina_Bool); cdecl; external libelementary;
function elm_clock_show_am_pm_get(obj: PElm_Clock): TEina_Bool; cdecl; external libelementary;
procedure elm_clock_first_interval_set(obj: PElm_Clock; interval: double); cdecl; external libelementary;
function elm_clock_first_interval_get(obj: PElm_Clock): double; cdecl; external libelementary;
procedure elm_clock_show_seconds_set(obj: PElm_Clock; seconds: TEina_Bool); cdecl; external libelementary;
function elm_clock_show_seconds_get(obj: PElm_Clock): TEina_Bool; cdecl; external libelementary;
procedure elm_clock_edit_set(obj: PElm_Clock; edit: TEina_Bool); cdecl; external libelementary;
function elm_clock_edit_get(obj: PElm_Clock): TEina_Bool; cdecl; external libelementary;
procedure elm_clock_pause_set(obj: PElm_Clock; paused: TEina_Bool); cdecl; external libelementary;
function elm_clock_pause_get(obj: PElm_Clock): TEina_Bool; cdecl; external libelementary;
procedure elm_clock_time_set(obj: PElm_Clock; hrs: longint; min: longint; sec: longint); cdecl; external libelementary;
procedure elm_clock_time_get(obj: PElm_Clock; hrs: Plongint; min: Plongint; sec: Plongint); cdecl; external libelementary;
procedure elm_clock_edit_mode_set(obj: PElm_Clock; digedit: TElm_Clock_Edit_Mode); cdecl; external libelementary;
function elm_clock_edit_mode_get(obj: PElm_Clock): TElm_Clock_Edit_Mode; cdecl; external libelementary;

// === Konventiert am: 26-5-25 19:35:36 ===


implementation



end.
