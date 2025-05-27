{$IFDEF read_interface}


type
  PEcore_Poller_Type = ^TEcore_Poller_Type;
  TEcore_Poller_Type = longint;

const
  ECORE_POLLER_CORE = 0;

type
  TEcore_Poller = record
  end;
  PEcore_Poller = ^TEcore_Poller;

  TEcore_Animator = record
  end;
  PEcore_Animator = ^TEcore_Animator;

function ecore_poller_add(_type: TEcore_Poller_Type; interval: longint; func: TEcore_Task_Cb; data: pointer): PEcore_Poller; cdecl; external libecore;
function ecore_poller_del(poller: PEcore_Poller): pointer; cdecl; external libecore;
procedure ecore_poller_poll_interval_set(_type: TEcore_Poller_Type; poll_time: double); cdecl; external libecore;
function ecore_poller_poll_interval_get(_type: TEcore_Poller_Type): double; cdecl; external libecore;
function ecore_poller_poller_interval_set(obj: PEcore_Poller; interval: longint): TEina_Bool; cdecl; external libecore;
function ecore_poller_poller_interval_get(obj: PEcore_Poller): longint; cdecl; external libecore;
function ecore_animator_add(func: TEcore_Task_Cb; data: pointer): PEcore_Animator; cdecl; external libecore;
function ecore_animator_timeline_add(runtime: double; func: TEcore_Timeline_Cb; data: pointer): PEcore_Animator; cdecl; external libecore;
function ecore_animator_del(animator: PEcore_Animator): pointer; cdecl; external libecore;
procedure ecore_animator_freeze(animator: PEcore_Animator); cdecl; external libecore;
procedure ecore_animator_thaw(animator: PEcore_Animator); cdecl; external libecore;
function ecore_timer_add(in_: double; func: TEcore_Task_Cb; data: pointer): PEcore_Timer; cdecl; external libecore;
function ecore_timer_loop_add(in_: double; func: TEcore_Task_Cb; data: pointer): PEcore_Timer; cdecl; external libecore;
function ecore_timer_del(timer: PEcore_Timer): pointer; cdecl; external libecore;
procedure ecore_timer_freeze(timer: PEcore_Timer); cdecl; external libecore;
function ecore_timer_freeze_get(timer: PEcore_Timer): TEina_Bool; cdecl; external libecore;
procedure ecore_timer_thaw(timer: PEcore_Timer); cdecl; external libecore;
function ecore_idler_add(func: TEcore_Task_Cb; data: pointer): PEcore_Idler; cdecl; external libecore;
function ecore_idler_del(idler: PEcore_Idler): pointer; cdecl; external libecore;
function ecore_idle_enterer_add(func: TEcore_Task_Cb; data: pointer): PEcore_Idle_Enterer; cdecl; external libecore;
function ecore_idle_enterer_before_add(func: TEcore_Task_Cb; data: pointer): PEcore_Idle_Enterer; cdecl; external libecore;
function ecore_idle_enterer_del(idle_enterer: PEcore_Idle_Enterer): pointer; cdecl; external libecore;
function ecore_idle_exiter_add(func: TEcore_Task_Cb; data: pointer): PEcore_Idle_Exiter; cdecl; external libecore;
function ecore_idle_exiter_del(idle_exiter: PEcore_Idle_Exiter): pointer; cdecl; external libecore;
function ecore_job_add(func: TEcore_Cb; data: pointer): PEcore_Job; cdecl; external libecore;
function ecore_job_del(obj: PEcore_Job): pointer; cdecl; external libecore;
{$ifdef EFL_BETA_API_SUPPORT}
function ecore_evas_animator_timeline_add(evo: pointer; runtime: double; func: TEcore_Timeline_Cb; data: pointer): PEcore_Animator; cdecl; external libecore;
function ecore_evas_animator_add(evo: pointer; func: TEcore_Task_Cb; data: pointer): PEcore_Animator; cdecl; external libecore;
{$endif}

// === Konventiert am: 21-5-25 13:42:50 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
