unit pthreads_cross;

interface

uses
  fp_apriltag;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  Tpthread_mutex_t = type Pointer;
  Ppthread_mutex_t = ^Tpthread_mutex_t;
  Ppthread_mutexattr_t = type Pointer;
  Ppthread_attr_t = type Pointer;
  Ppthread_condattr_t = type Pointer;
  Ppthread_rwlockattr_t = type Pointer;
  Tpthread_t = type Pointer;
  Ppthread_t = ^Tpthread_t;
  Ppthread_cond_t = type Pointer;

function pthread_create(thread: Ppthread_t; attr: Ppthread_attr_t; start_routine: pointer; arg: pointer): longint; cdecl; external libapriltag;
function pthread_join(thread: Tpthread_t; value_ptr: Ppointer): longint; cdecl; external libapriltag;
function pthread_detach(para1: Tpthread_t): longint; cdecl; external libapriltag;
function pthread_mutex_init(mutex: Ppthread_mutex_t; attr: Ppthread_mutexattr_t): longint; cdecl; external libapriltag;
function pthread_mutex_destroy(mutex: Ppthread_mutex_t): longint; cdecl; external libapriltag;
function pthread_mutex_lock(mutex: Ppthread_mutex_t): longint; cdecl; external libapriltag;
function pthread_mutex_unlock(mutex: Ppthread_mutex_t): longint; cdecl; external libapriltag;
function pthread_cond_init(cond: Ppthread_cond_t; attr: Ppthread_condattr_t): longint; cdecl; external libapriltag;
function pthread_cond_destroy(cond: Ppthread_cond_t): longint; cdecl; external libapriltag;
function pthread_cond_wait(cond: Ppthread_cond_t; mutex: Ppthread_mutex_t): longint; cdecl; external libapriltag;
function pthread_cond_timedwait(cond: Ppthread_cond_t; mutex: Ppthread_mutex_t; abstime: Ptimespec): longint; cdecl; external libapriltag;
function pthread_cond_signal(cond: Ppthread_cond_t): longint; cdecl; external libapriltag;
function pthread_cond_broadcast(cond: Ppthread_cond_t): longint; cdecl; external libapriltag;
function sched_yield: longint; cdecl; external libapriltag;

function pcthread_get_num_procs: dword; cdecl; external libapriltag;
procedure ms_to_timespec(ts: Ptimespec; ms: dword); cdecl; external libapriltag;
function timespec_to_ms(abstime: Ptimespec): dword; cdecl; external libapriltag;

// === Konventiert am: 12-9-26 17:22:23 ===


implementation



end.
