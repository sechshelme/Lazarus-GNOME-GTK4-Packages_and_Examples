unit fp_pthread;

interface

uses
  clib, fp_setjmp, thread_db, pthreadtypes;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

  // /usr/include/pthread.h


const
  PTHREAD_CREATE_JOINABLE = 0;
  PTHREAD_CREATE_DETACHED = 1;

const
  PTHREAD_MUTEX_TIMED_NP = 0;
  PTHREAD_MUTEX_RECURSIVE_NP = 1;
  PTHREAD_MUTEX_ERRORCHECK_NP = 2;
  PTHREAD_MUTEX_ADAPTIVE_NP = 3;
  PTHREAD_MUTEX_NORMAL = PTHREAD_MUTEX_TIMED_NP;
  PTHREAD_MUTEX_RECURSIVE = PTHREAD_MUTEX_RECURSIVE_NP;
  PTHREAD_MUTEX_ERRORCHECK = PTHREAD_MUTEX_ERRORCHECK_NP;
  PTHREAD_MUTEX_DEFAULT = PTHREAD_MUTEX_NORMAL;
  PTHREAD_MUTEX_FAST_NP = PTHREAD_MUTEX_TIMED_NP;

const
  PTHREAD_MUTEX_STALLED = 0;
  PTHREAD_MUTEX_STALLED_NP = PTHREAD_MUTEX_STALLED;
  PTHREAD_MUTEX_ROBUST = (PTHREAD_MUTEX_STALLED) + 1;
  PTHREAD_MUTEX_ROBUST_NP = PTHREAD_MUTEX_ROBUST;

const
  PTHREAD_PRIO_NONE = 0;
  PTHREAD_PRIO_INHERIT = 1;
  PTHREAD_PRIO_PROTECT = 2;

const
  PTHREAD_RWLOCK_PREFER_READER_NP = 0;
  PTHREAD_RWLOCK_PREFER_WRITER_NP = 1;
  PTHREAD_RWLOCK_PREFER_WRITER_NONRECURSIVE_NP = 2;
  PTHREAD_RWLOCK_DEFAULT_NP = PTHREAD_RWLOCK_PREFER_READER_NP;

const
  PTHREAD_INHERIT_SCHED = 0;
  PTHREAD_EXPLICIT_SCHED = 1;

const
  PTHREAD_SCOPE_SYSTEM = 0;
  PTHREAD_SCOPE_PROCESS = 1;

const
  PTHREAD_PROCESS_PRIVATE = 0;
  PTHREAD_PROCESS_SHARED = 1;

type
  Ppthread_cleanup_buffer = ^Tpthread_cleanup_buffer;

  Tpthread_cleanup_buffer = record
    __routine: procedure(para1: pointer); cdecl;
    __arg: pointer;
    __canceltype: longint;
    __prev: Ppthread_cleanup_buffer;
  end;

const
  PTHREAD_CANCEL_ENABLE = 0;
  PTHREAD_CANCEL_DISABLE = 1;

const
  PTHREAD_CANCEL_DEFERRED = 0;
  PTHREAD_CANCEL_ASYNCHRONOUS = 1;

function PTHREAD_CANCELED: pointer;

const
  PTHREAD_ONCE_INIT = 0;
  PTHREAD_BARRIER_SERIAL_THREAD = -(1);

type
  TStartProc = function(para1: pointer): pointer;

function pthread_create(__newthread: Ppthread_t; __attr: Ppthread_attr_t; __start_routine: TStartProc; __arg: pointer): longint; cdecl; external libc;
procedure pthread_exit(__retval: pointer); cdecl; external libc;
function pthread_join(__th: Tpthread_t; __thread_return: Ppointer): longint; cdecl; external libc;
function pthread_tryjoin_np(__th: Tpthread_t; __thread_return: Ppointer): longint; cdecl; external libc;
function pthread_timedjoin_np(__th: Tpthread_t; __thread_return: Ppointer; __abstime: Ptimespec): longint; cdecl; external libc;
function pthread_clockjoin_np(__th: Tpthread_t; __thread_return: Ppointer; __clockid: Tclockid_t; __abstime: Ptimespec): longint; cdecl; external libc;
function pthread_detach(__th: Tpthread_t): longint; cdecl; external libc;
function pthread_self: Tpthread_t; cdecl; external libc;
function pthread_equal(__thread1: Tpthread_t; __thread2: Tpthread_t): longint; cdecl; external libc;
function pthread_attr_init(__attr: Ppthread_attr_t): longint; cdecl; external libc;
function pthread_attr_destroy(__attr: Ppthread_attr_t): longint; cdecl; external libc;
function pthread_attr_getdetachstate(__attr: Ppthread_attr_t; __detachstate: Plongint): longint; cdecl; external libc;
function pthread_attr_setdetachstate(__attr: Ppthread_attr_t; __detachstate: longint): longint; cdecl; external libc;
function pthread_attr_getguardsize(__attr: Ppthread_attr_t; __guardsize: Psize_t): longint; cdecl; external libc;
function pthread_attr_setguardsize(__attr: Ppthread_attr_t; __guardsize: Tsize_t): longint; cdecl; external libc;
function pthread_attr_getschedparam(__attr: Ppthread_attr_t; __param: Psched_param): longint; cdecl; external libc;
function pthread_attr_setschedparam(__attr: Ppthread_attr_t; __param: Psched_param): longint; cdecl; external libc;
function pthread_attr_getschedpolicy(__attr: Ppthread_attr_t; __policy: Plongint): longint; cdecl; external libc;
function pthread_attr_setschedpolicy(__attr: Ppthread_attr_t; __policy: longint): longint; cdecl; external libc;
function pthread_attr_getinheritsched(__attr: Ppthread_attr_t; __inherit: Plongint): longint; cdecl; external libc;
function pthread_attr_setinheritsched(__attr: Ppthread_attr_t; __inherit: longint): longint; cdecl; external libc;
function pthread_attr_getscope(__attr: Ppthread_attr_t; __scope: Plongint): longint; cdecl; external libc;
function pthread_attr_setscope(__attr: Ppthread_attr_t; __scope: longint): longint; cdecl; external libc;
function pthread_attr_getstackaddr(__attr: Ppthread_attr_t; __stackaddr: Ppointer): longint; cdecl; external libc;
function pthread_attr_setstackaddr(__attr: Ppthread_attr_t; __stackaddr: pointer): longint; cdecl; external libc;
function pthread_attr_getstacksize(__attr: Ppthread_attr_t; __stacksize: Psize_t): longint; cdecl; external libc;
function pthread_attr_setstacksize(__attr: Ppthread_attr_t; __stacksize: Tsize_t): longint; cdecl; external libc;
function pthread_attr_getstack(__attr: Ppthread_attr_t; __stackaddr: Ppointer; __stacksize: Psize_t): longint; cdecl; external libc;
function pthread_attr_setstack(__attr: Ppthread_attr_t; __stackaddr: pointer; __stacksize: Tsize_t): longint; cdecl; external libc;
function pthread_attr_setaffinity_np(__attr: Ppthread_attr_t; __cpusetsize: Tsize_t; __cpuset: Pcpu_set_t): longint; cdecl; external libc;
function pthread_attr_getaffinity_np(__attr: Ppthread_attr_t; __cpusetsize: Tsize_t; __cpuset: Pcpu_set_t): longint; cdecl; external libc;
function pthread_getattr_default_np(__attr: Ppthread_attr_t): longint; cdecl; external libc;
function pthread_attr_setsigmask_np(__attr: Ppthread_attr_t; sigmask: Psigset_t): longint; cdecl; external libc;
function pthread_attr_getsigmask_np(__attr: Ppthread_attr_t; sigmask: Psigset_t): longint; cdecl; external libc;

const
  PTHREAD_ATTR_NO_SIGMASK_NP = -(1);

function pthread_setattr_default_np(__attr: Ppthread_attr_t): longint; cdecl; external libc;
function pthread_getattr_np(__th: Tpthread_t; __attr: Ppthread_attr_t): longint; cdecl; external libc;
function pthread_setschedparam(__target_thread: Tpthread_t; __policy: longint; __param: Psched_param): longint; cdecl; external libc;
function pthread_getschedparam(__target_thread: Tpthread_t; __policy: Plongint; __param: Psched_param): longint; cdecl; external libc;
function pthread_setschedprio(__target_thread: Tpthread_t; __prio: longint): longint; cdecl; external libc;
function pthread_getname_np(__target_thread: Tpthread_t; __buf: pchar; __buflen: Tsize_t): longint; cdecl; external libc;
function pthread_setname_np(__target_thread: Tpthread_t; __name: pchar): longint; cdecl; external libc;
function pthread_getconcurrency: longint; cdecl; external libc;
function pthread_setconcurrency(__level: longint): longint; cdecl; external libc;
function pthread_yield: longint; cdecl; external libc;
function pthread_setaffinity_np(__th: Tpthread_t; __cpusetsize: Tsize_t; __cpuset: Pcpu_set_t): longint; cdecl; external libc;
function pthread_getaffinity_np(__th: Tpthread_t; __cpusetsize: Tsize_t; __cpuset: Pcpu_set_t): longint; cdecl; external libc;

type
  Tproc = procedure;

function pthread_once(__once_control: Ppthread_once_t; __init_routine: Tproc): longint; cdecl; external libc;
function pthread_setcancelstate(__state: longint; __oldstate: Plongint): longint; cdecl; external libc;
function pthread_setcanceltype(__type: longint; __oldtype: Plongint): longint; cdecl; external libc;
function pthread_cancel(__th: Tpthread_t): longint; cdecl; external libc;
procedure pthread_testcancel; cdecl; external libc;

type
  T_cancel_jmp_buf_tag = record
    __cancel_jmp_buf: Tjmp_buf;
    __mask_was_saved: longint;
  end;
  P_cancel_jmp_buf_tag = ^T_cancel_jmp_buf_tag;

  T_pthread_unwind_buf_t = record
    __cancel_jmp_buf: array[0..0] of T_cancel_jmp_buf_tag;
    __pad: array[0..3] of pointer;
  end;
  P_pthread_unwind_buf_t = ^T_pthread_unwind_buf_t;

type
  T_pthread_cleanup_frame = record
    __cancel_routine: procedure(para1: pointer); cdecl;
    __cancel_arg: pointer;
    __do_it: longint;
    __cancel_type: longint;
  end;
  P_pthread_cleanup_frame = ^T_pthread_cleanup_frame;

function pthread_mutex_init(__mutex: Ppthread_mutex_t; __mutexattr: Ppthread_mutexattr_t): longint; cdecl; external libc;
function pthread_mutex_destroy(__mutex: Ppthread_mutex_t): longint; cdecl; external libc;
function pthread_mutex_trylock(__mutex: Ppthread_mutex_t): longint; cdecl; external libc;
function pthread_mutex_lock(__mutex: Ppthread_mutex_t): longint; cdecl; external libc;
function pthread_mutex_timedlock(__mutex: Ppthread_mutex_t; __abstime: Ptimespec): longint; cdecl; external libc;
function pthread_mutex_clocklock(__mutex: Ppthread_mutex_t; __clockid: Tclockid_t; __abstime: Ptimespec): longint; cdecl; external libc;
function pthread_mutex_unlock(__mutex: Ppthread_mutex_t): longint; cdecl; external libc;
function pthread_mutex_getprioceiling(__mutex: Ppthread_mutex_t; __prioceiling: Plongint): longint; cdecl; external libc;
function pthread_mutex_setprioceiling(__mutex: Ppthread_mutex_t; __prioceiling: longint; __old_ceiling: Plongint): longint; cdecl; external libc;
function pthread_mutex_consistent(__mutex: Ppthread_mutex_t): longint; cdecl; external libc;
function pthread_mutexattr_init(__attr: Ppthread_mutexattr_t): longint; cdecl; external libc;
function pthread_mutexattr_destroy(__attr: Ppthread_mutexattr_t): longint; cdecl; external libc;
function pthread_mutexattr_getpshared(__attr: Ppthread_mutexattr_t; __pshared: Plongint): longint; cdecl; external libc;
function pthread_mutexattr_setpshared(__attr: Ppthread_mutexattr_t; __pshared: longint): longint; cdecl; external libc;
function pthread_mutexattr_gettype(__attr: Ppthread_mutexattr_t; __kind: Plongint): longint; cdecl; external libc;
function pthread_mutexattr_settype(__attr: Ppthread_mutexattr_t; __kind: longint): longint; cdecl; external libc;
function pthread_mutexattr_getprotocol(__attr: Ppthread_mutexattr_t; __protocol: Plongint): longint; cdecl; external libc;
function pthread_mutexattr_setprotocol(__attr: Ppthread_mutexattr_t; __protocol: longint): longint; cdecl; external libc;
function pthread_mutexattr_getprioceiling(__attr: Ppthread_mutexattr_t; __prioceiling: Plongint): longint; cdecl; external libc;
function pthread_mutexattr_setprioceiling(__attr: Ppthread_mutexattr_t; __prioceiling: longint): longint; cdecl; external libc;
function pthread_mutexattr_getrobust(__attr: Ppthread_mutexattr_t; __robustness: Plongint): longint; cdecl; external libc;
function pthread_mutexattr_setrobust(__attr: Ppthread_mutexattr_t; __robustness: longint): longint; cdecl; external libc;
function pthread_rwlock_init(__rwlock: Ppthread_rwlock_t; __attr: Ppthread_rwlockattr_t): longint; cdecl; external libc;
function pthread_rwlock_destroy(__rwlock: Ppthread_rwlock_t): longint; cdecl; external libc;
function pthread_rwlock_rdlock(__rwlock: Ppthread_rwlock_t): longint; cdecl; external libc;
function pthread_rwlock_tryrdlock(__rwlock: Ppthread_rwlock_t): longint; cdecl; external libc;
function pthread_rwlock_timedrdlock(__rwlock: Ppthread_rwlock_t; __abstime: Ptimespec): longint; cdecl; external libc;
function pthread_rwlock_clockrdlock(__rwlock: Ppthread_rwlock_t; __clockid: Tclockid_t; __abstime: Ptimespec): longint; cdecl; external libc;
function pthread_rwlock_wrlock(__rwlock: Ppthread_rwlock_t): longint; cdecl; external libc;
function pthread_rwlock_trywrlock(__rwlock: Ppthread_rwlock_t): longint; cdecl; external libc;
function pthread_rwlock_timedwrlock(__rwlock: Ppthread_rwlock_t; __abstime: Ptimespec): longint; cdecl; external libc;
function pthread_rwlock_clockwrlock(__rwlock: Ppthread_rwlock_t; __clockid: Tclockid_t; __abstime: Ptimespec): longint; cdecl; external libc;
function pthread_rwlock_unlock(__rwlock: Ppthread_rwlock_t): longint; cdecl; external libc;
function pthread_rwlockattr_init(__attr: Ppthread_rwlockattr_t): longint; cdecl; external libc;
function pthread_rwlockattr_destroy(__attr: Ppthread_rwlockattr_t): longint; cdecl; external libc;
function pthread_rwlockattr_getpshared(__attr: Ppthread_rwlockattr_t; __pshared: Plongint): longint; cdecl; external libc;
function pthread_rwlockattr_setpshared(__attr: Ppthread_rwlockattr_t; __pshared: longint): longint; cdecl; external libc;
function pthread_rwlockattr_getkind_np(__attr: Ppthread_rwlockattr_t; __pref: Plongint): longint; cdecl; external libc;
function pthread_rwlockattr_setkind_np(__attr: Ppthread_rwlockattr_t; __pref: longint): longint; cdecl; external libc;
function pthread_cond_init(__cond: Ppthread_cond_t; __cond_attr: Ppthread_condattr_t): longint; cdecl; external libc;
function pthread_cond_destroy(__cond: Ppthread_cond_t): longint; cdecl; external libc;
function pthread_cond_signal(__cond: Ppthread_cond_t): longint; cdecl; external libc;
function pthread_cond_broadcast(__cond: Ppthread_cond_t): longint; cdecl; external libc;
function pthread_cond_wait(__cond: Ppthread_cond_t; __mutex: Ppthread_mutex_t): longint; cdecl; external libc;
function pthread_cond_timedwait(__cond: Ppthread_cond_t; __mutex: Ppthread_mutex_t; __abstime: Ptimespec): longint; cdecl; external libc;
function pthread_cond_clockwait(__cond: Ppthread_cond_t; __mutex: Ppthread_mutex_t; __clock_id: Tclockid_t; __abstime: Ptimespec): longint; cdecl; external libc;
function pthread_condattr_init(__attr: Ppthread_condattr_t): longint; cdecl; external libc;
function pthread_condattr_destroy(__attr: Ppthread_condattr_t): longint; cdecl; external libc;
function pthread_condattr_getpshared(__attr: Ppthread_condattr_t; __pshared: Plongint): longint; cdecl; external libc;
function pthread_condattr_setpshared(__attr: Ppthread_condattr_t; __pshared: longint): longint; cdecl; external libc;
function pthread_condattr_getclock(__attr: Ppthread_condattr_t; __clock_id: Pclockid_t): longint; cdecl; external libc;
function pthread_condattr_setclock(__attr: Ppthread_condattr_t; __clock_id: Tclockid_t): longint; cdecl; external libc;
function pthread_spin_init(__lock: Ppthread_spinlock_t; __pshared: longint): longint; cdecl; external libc;
function pthread_spin_destroy(__lock: Ppthread_spinlock_t): longint; cdecl; external libc;
function pthread_spin_lock(__lock: Ppthread_spinlock_t): longint; cdecl; external libc;
function pthread_spin_trylock(__lock: Ppthread_spinlock_t): longint; cdecl; external libc;
function pthread_spin_unlock(__lock: Ppthread_spinlock_t): longint; cdecl; external libc;
function pthread_barrier_init(__barrier: Ppthread_barrier_t; __attr: Ppthread_barrierattr_t; __count: dword): longint; cdecl; external libc;
function pthread_barrier_destroy(__barrier: Ppthread_barrier_t): longint; cdecl; external libc;
function pthread_barrier_wait(__barrier: Ppthread_barrier_t): longint; cdecl; external libc;
function pthread_barrierattr_init(__attr: Ppthread_barrierattr_t): longint; cdecl; external libc;
function pthread_barrierattr_destroy(__attr: Ppthread_barrierattr_t): longint; cdecl; external libc;
function pthread_barrierattr_getpshared(__attr: Ppthread_barrierattr_t; __pshared: Plongint): longint; cdecl; external libc;
function pthread_barrierattr_setpshared(__attr: Ppthread_barrierattr_t; __pshared: longint): longint; cdecl; external libc;

type
  Tdestrproc = procedure(para1: pointer);

function pthread_key_create(__key: Ppthread_key_t; __destr_function: Tdestrproc): longint; cdecl; external libc;
function pthread_key_delete(__key: Tpthread_key_t): longint; cdecl; external libc;
function pthread_getspecific(__key: Tpthread_key_t): pointer; cdecl; external libc;
function pthread_setspecific(__key: Tpthread_key_t; __pointer: pointer): longint; cdecl; external libc;
function pthread_getcpuclockid(__thread_id: Tpthread_t; __clock_id: Pclockid_t): longint; cdecl; external libc;
function pthread_atfork(__prepare: Tproc; __parent: Tproc; __child: Tproc): longint; cdecl; external libc;

// === Konventiert am: 8-8-25 14:52:38 ===


implementation


{ was #define dname def_expr }
function PTHREAD_CANCELED: pointer;
begin
  PTHREAD_CANCELED := pointer(-(1));
end;


end.
