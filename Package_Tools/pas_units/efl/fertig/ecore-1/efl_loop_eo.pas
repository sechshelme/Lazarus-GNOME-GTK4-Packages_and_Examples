unit efl_loop_eo;

interface

uses
  efl, fp_eo, fp_eina, fp_efl;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PEfl_Loop = ^TEfl_Loop;
  TEfl_Loop = TEo;

type
  TEfl_Loop_Arguments = record
    argv: PEina_Array;
    initialization_: TEina_Bool;
  end;
  PEfl_Loop_Arguments = ^TEfl_Loop_Arguments;

function EFL_LOOP_CLASS: PEfl_Class;

function efl_loop_class_get: PEfl_Class; cdecl; external libecore;
procedure efl_loop_iterate(obj: PEo); cdecl; external libecore;
function efl_loop_iterate_may_block(obj: PEo; may_block: longint): longint; cdecl; external libecore;
function efl_loop_begin(obj: PEo): PEina_Value; cdecl; external libecore;
procedure efl_loop_quit(obj: PEo; exit_code: TEina_Value); cdecl; external libecore;
function efl_loop_job(obj: PEo): PEina_Future; cdecl; external libecore;
procedure efl_loop_throttle_set(obj: PEo; amount: double); cdecl; external libecore;
function efl_loop_throttle_get(obj: PEo): double; cdecl; external libecore;
procedure efl_loop_time_set(obj: PEo; timepoint: double); cdecl; external libecore;
function efl_loop_time_get(obj: PEo): double; cdecl; external libecore;
function efl_loop_idle(obj: PEo): PEina_Future; cdecl; external libecore;
function efl_loop_timeout(obj: PEo; time: double): PEina_Future; cdecl; external libecore;

var
  _EFL_LOOP_EVENT_IDLE_ENTER: TEfl_Event_Description; cvar;external libecore;
  _EFL_LOOP_EVENT_IDLE_EXIT: TEfl_Event_Description; cvar;external libecore;
  _EFL_LOOP_EVENT_IDLE: TEfl_Event_Description; cvar;external libecore;
  _EFL_LOOP_EVENT_ARGUMENTS: TEfl_Event_Description; cvar;external libecore;
  _EFL_LOOP_EVENT_POLL_HIGH: TEfl_Event_Description; cvar;external libecore;
  _EFL_LOOP_EVENT_POLL_MEDIUM: TEfl_Event_Description; cvar;external libecore;
  _EFL_LOOP_EVENT_POLL_LOW: TEfl_Event_Description; cvar;external libecore;
  _EFL_LOOP_EVENT_QUIT: TEfl_Event_Description; cvar;external libecore;

function EFL_LOOP_EVENT_IDLE_ENTER: PEfl_Event_Description;
function EFL_LOOP_EVENT_IDLE_EXIT: PEfl_Event_Description;
function EFL_LOOP_EVENT_IDLE: PEfl_Event_Description;
function EFL_LOOP_EVENT_ARGUMENTS: PEfl_Event_Description;
function EFL_LOOP_EVENT_POLL_HIGH: PEfl_Event_Description;
function EFL_LOOP_EVENT_POLL_MEDIUM: PEfl_Event_Description;
function EFL_LOOP_EVENT_POLL_LOW: PEfl_Event_Description;
function EFL_LOOP_EVENT_QUIT: PEfl_Event_Description;

// === Konventiert am: 21-5-25 15:25:25 ===


implementation


function EFL_LOOP_CLASS: PEfl_Class;
begin
  EFL_LOOP_CLASS := efl_loop_class_get;
end;

function EFL_LOOP_EVENT_IDLE_ENTER: PEfl_Event_Description;
begin
  EFL_LOOP_EVENT_IDLE_ENTER := @(_EFL_LOOP_EVENT_IDLE_ENTER);
end;

function EFL_LOOP_EVENT_IDLE_EXIT: PEfl_Event_Description;
begin
  EFL_LOOP_EVENT_IDLE_EXIT := @(_EFL_LOOP_EVENT_IDLE_EXIT);
end;

function EFL_LOOP_EVENT_IDLE: PEfl_Event_Description;
begin
  EFL_LOOP_EVENT_IDLE := @(_EFL_LOOP_EVENT_IDLE);
end;

function EFL_LOOP_EVENT_ARGUMENTS: PEfl_Event_Description;
begin
  EFL_LOOP_EVENT_ARGUMENTS := @(_EFL_LOOP_EVENT_ARGUMENTS);
end;

function EFL_LOOP_EVENT_POLL_HIGH: PEfl_Event_Description;
begin
  EFL_LOOP_EVENT_POLL_HIGH := @(_EFL_LOOP_EVENT_POLL_HIGH);
end;

function EFL_LOOP_EVENT_POLL_MEDIUM: PEfl_Event_Description;
begin
  EFL_LOOP_EVENT_POLL_MEDIUM := @(_EFL_LOOP_EVENT_POLL_MEDIUM);
end;

function EFL_LOOP_EVENT_POLL_LOW: PEfl_Event_Description;
begin
  EFL_LOOP_EVENT_POLL_LOW := @(_EFL_LOOP_EVENT_POLL_LOW);
end;

function EFL_LOOP_EVENT_QUIT: PEfl_Event_Description;
begin
  EFL_LOOP_EVENT_QUIT := @(_EFL_LOOP_EVENT_QUIT);
end;


end.
