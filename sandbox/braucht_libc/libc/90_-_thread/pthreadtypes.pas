unit pthreadtypes;

interface

uses
  pthreadtypes_arch, struct_mutex, thread_shared_types, struct_rwlock;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

  // /usr/include/x86_64-linux-gnu/bits/pthreadtypes.h

type
  Ppthread_t = ^Tpthread_t;
  Tpthread_t = dword;

  Tpthread_mutexattr_t = record
    case longint of
      0: (__size: array[0..(__SIZEOF_PTHREAD_MUTEXATTR_T) - 1] of char);
      1: (__align: longint);
  end;
  Ppthread_mutexattr_t = ^Tpthread_mutexattr_t;

  Tpthread_condattr_t = record
    case longint of
      0: (__size: array[0..(__SIZEOF_PTHREAD_CONDATTR_T) - 1] of char);
      1: (__align: longint);
  end;
  Ppthread_condattr_t = ^Tpthread_condattr_t;

  Tpthread_key_t = dword;
  Ppthread_key_t = ^Tpthread_key_t;

  Tpthread_once_t = longint;
  Ppthread_once_t = ^Tpthread_once_t;

  Tpthread_attr_t = record
    case longint of
      0: (__size: array[0..(__SIZEOF_PTHREAD_ATTR_T) - 1] of char);
      1: (__align: longint);
  end;
  Ppthread_attr_t = ^Tpthread_attr_t;

type
  Tpthread_mutex_t = record
    case longint of
      0: (__data: T_pthread_mutex_s);
      1: (__size: array[0..(__SIZEOF_PTHREAD_MUTEX_T) - 1] of char);
      2: (__align: longint);
  end;
  Ppthread_mutex_t = ^Tpthread_mutex_t;

  Tpthread_cond_t = record
    case longint of
      0: (__data: T_pthread_cond_s);
      1: (__size: array[0..(__SIZEOF_PTHREAD_COND_T) - 1] of char);
      2: (__align: int64);
  end;
  Ppthread_cond_t = ^Tpthread_cond_t;

type
  Tpthread_rwlock_t = record
    case longint of
      0: (__data: T_pthread_rwlock_arch_t);
      1: (__size: array[0..(__SIZEOF_PTHREAD_RWLOCK_T) - 1] of char);
      2: (__align: longint);
  end;
  Ppthread_rwlock_t = ^Tpthread_rwlock_t;

  Tpthread_rwlockattr_t = record
    case longint of
      0: (__size: array[0..(__SIZEOF_PTHREAD_RWLOCKATTR_T) - 1] of char);
      1: (__align: longint);
  end;
  Ppthread_rwlockattr_t = ^Tpthread_rwlockattr_t;

type
  Tpthread_spinlock_t = longint;
  Ppthread_spinlock_t = ^Tpthread_spinlock_t;

  Tpthread_barrier_t = record
    case longint of
      0: (__size: array[0..(__SIZEOF_PTHREAD_BARRIER_T) - 1] of char);
      1: (__align: longint);
  end;
  Ppthread_barrier_t = ^Tpthread_barrier_t;

  Tpthread_barrierattr_t = record
    case longint of
      0: (__size: array[0..(__SIZEOF_PTHREAD_BARRIERATTR_T) - 1] of char);
      1: (__align: longint);
  end;
  Ppthread_barrierattr_t = ^Tpthread_barrierattr_t;

  // === Konventiert am: 8-8-25 14:52:48 ===


implementation



end.
