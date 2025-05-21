unit efl_loop_timer_eo;

interface

uses
  efl, fp_eo, fp_eina, fp_efl;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PEfl_Loop_Timer = ^TEfl_Loop_Timer;
  TEfl_Loop_Timer = TEo;

function EFL_LOOP_TIMER_CLASS: PEfl_Class;

function efl_loop_timer_class_get: PEfl_Class; cdecl; external libecore;
procedure efl_loop_timer_interval_set(obj: PEo; in_: double); cdecl; external libecore;
function efl_loop_timer_interval_get(obj: PEo): double; cdecl; external libecore;
function efl_loop_timer_time_pending_get(obj: PEo): double; cdecl; external libecore;
procedure efl_loop_timer_reset(obj: PEo); cdecl; external libecore;
procedure efl_loop_timer_loop_reset(obj: PEo); cdecl; external libecore;
procedure efl_loop_timer_delay(obj: PEo; add: double); cdecl; external libecore;

var
  _EFL_LOOP_TIMER_EVENT_TIMER_TICK: TEfl_Event_Description; cvar;external libecore;

function EFL_LOOP_TIMER_EVENT_TIMER_TICK: PEfl_Event_Description;

// === Konventiert am: 21-5-25 15:44:05 ===


implementation


function EFL_LOOP_TIMER_CLASS: PEfl_Class;
begin
  EFL_LOOP_TIMER_CLASS := efl_loop_timer_class_get;
end;

function EFL_LOOP_TIMER_EVENT_TIMER_TICK: PEfl_Event_Description;
begin
  EFL_LOOP_TIMER_EVENT_TIMER_TICK := @(_EFL_LOOP_TIMER_EVENT_TIMER_TICK);
end;


end.
