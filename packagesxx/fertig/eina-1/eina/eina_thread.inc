{$IFDEF read_interface}


type
  PEina_Thread = ^TEina_Thread;
  TEina_Thread = Tuintptr_t;

  PEina_Thread_Cb = ^TEina_Thread_Cb;
  TEina_Thread_Cb = function(data: pointer; t: TEina_Thread): pointer; cdecl;

  TEina_Thread_Cleanup_Cb = procedure(data: pointer); cdecl;

  PEina_Thread_Priority = ^TEina_Thread_Priority;
  TEina_Thread_Priority = longint;

const
  EINA_THREAD_URGENT = 0;
  EINA_THREAD_NORMAL = 1;
  EINA_THREAD_BACKGROUND = 2;
  EINA_THREAD_IDLE = 3;

function eina_thread_self: TEina_Thread; cdecl; external libeina;
function eina_thread_equal(t1: TEina_Thread; t2: TEina_Thread): TEina_Bool; cdecl; external libeina;
function eina_thread_create(t: PEina_Thread; prio: TEina_Thread_Priority; affinity: longint; func: TEina_Thread_Cb; data: pointer): TEina_Bool; cdecl; external libeina;

var
  EINA_THREAD_JOIN_CANCELED: pointer; cvar;external libeina;

function eina_thread_join(t: TEina_Thread): pointer; cdecl; external libeina;
function eina_thread_name_set(t: TEina_Thread; name: pchar): TEina_Bool; cdecl; external libeina;
function eina_thread_cancel(t: TEina_Thread): TEina_Bool; cdecl; external libeina;
function eina_thread_cancellable_set(cancellable: TEina_Bool; was_cancellable: PEina_Bool): TEina_Bool; cdecl; external libeina;
procedure eina_thread_cancel_checkpoint; cdecl; external libeina;
{$IFDEF mswindows}
function eina_thread_cleanup_push(fn: TEina_Thread_Cleanup_Cb; data: pointer): TEina_Bool; cdecl; external libeina;
{$endif}

{$IFDEF mswindows}
procedure eina_thread_cleanup_pop(execute: longint); cdecl; external libeina;
{$endif}

type
  PEina_Thread_Cancellable_Run_Cb = ^TEina_Thread_Cancellable_Run_Cb;
  TEina_Thread_Cancellable_Run_Cb = function(data: pointer): pointer; cdecl;

function eina_thread_cancellable_run(cb: TEina_Thread_Cancellable_Run_Cb; cleanup_cb: TEina_Free_Cb; data: pointer): pointer; cdecl; external libeina;
procedure eina_sched_prio_drop; cdecl; external libeina;

// === Konventiert am: 16-5-25 19:49:14 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


{$ENDIF read_implementation}
