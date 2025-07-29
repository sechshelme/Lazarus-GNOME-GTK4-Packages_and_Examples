unit dbus_threads;

interface

uses
  fp_dbus, dbus_types;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PDBusMutex = type Pointer;
  PDBusCondVar = type Pointer;

  TDBusMutexNewFunction = function: PDBusMutex; cdecl;
  TDBusMutexFreeFunction = procedure(mutex: PDBusMutex); cdecl;
  TDBusMutexLockFunction = function(mutex: PDBusMutex): Tdbus_bool_t; cdecl;
  TDBusMutexUnlockFunction = function(mutex: PDBusMutex): Tdbus_bool_t; cdecl;
  TDBusRecursiveMutexNewFunction = function: PDBusMutex; cdecl;
  TDBusRecursiveMutexFreeFunction = procedure(mutex: PDBusMutex); cdecl;
  TDBusRecursiveMutexLockFunction = procedure(mutex: PDBusMutex); cdecl;
  TDBusRecursiveMutexUnlockFunction = procedure(mutex: PDBusMutex); cdecl;
  TDBusCondVarNewFunction = function: PDBusCondVar; cdecl;
  TDBusCondVarFreeFunction = procedure(cond: PDBusCondVar); cdecl;
  TDBusCondVarWaitFunction = procedure(cond: PDBusCondVar; mutex: PDBusMutex); cdecl;
  TDBusCondVarWaitTimeoutFunction = function(cond: PDBusCondVar; mutex: PDBusMutex; timeout_milliseconds: longint): Tdbus_bool_t; cdecl;
  TDBusCondVarWakeOneFunction = procedure(cond: PDBusCondVar); cdecl;
  TDBusCondVarWakeAllFunction = procedure(cond: PDBusCondVar); cdecl;

  PDBusThreadFunctionsMask = ^TDBusThreadFunctionsMask;
  TDBusThreadFunctionsMask = longint;

const
  DBUS_THREAD_FUNCTIONS_MUTEX_NEW_MASK = 1 shl 0;
  DBUS_THREAD_FUNCTIONS_MUTEX_FREE_MASK = 1 shl 1;
  DBUS_THREAD_FUNCTIONS_MUTEX_LOCK_MASK = 1 shl 2;
  DBUS_THREAD_FUNCTIONS_MUTEX_UNLOCK_MASK = 1 shl 3;
  DBUS_THREAD_FUNCTIONS_CONDVAR_NEW_MASK = 1 shl 4;
  DBUS_THREAD_FUNCTIONS_CONDVAR_FREE_MASK = 1 shl 5;
  DBUS_THREAD_FUNCTIONS_CONDVAR_WAIT_MASK = 1 shl 6;
  DBUS_THREAD_FUNCTIONS_CONDVAR_WAIT_TIMEOUT_MASK = 1 shl 7;
  DBUS_THREAD_FUNCTIONS_CONDVAR_WAKE_ONE_MASK = 1 shl 8;
  DBUS_THREAD_FUNCTIONS_CONDVAR_WAKE_ALL_MASK = 1 shl 9;
  DBUS_THREAD_FUNCTIONS_RECURSIVE_MUTEX_NEW_MASK = 1 shl 10;
  DBUS_THREAD_FUNCTIONS_RECURSIVE_MUTEX_FREE_MASK = 1 shl 11;
  DBUS_THREAD_FUNCTIONS_RECURSIVE_MUTEX_LOCK_MASK = 1 shl 12;
  DBUS_THREAD_FUNCTIONS_RECURSIVE_MUTEX_UNLOCK_MASK = 1 shl 13;
  DBUS_THREAD_FUNCTIONS_ALL_MASK = (1 shl 14) - 1;

type
  TDBusThreadFunctions = record
    mask: dword;
    mutex_new: TDBusMutexNewFunction;
    mutex_free: TDBusMutexFreeFunction;
    mutex_lock: TDBusMutexLockFunction;
    mutex_unlock: TDBusMutexUnlockFunction;
    condvar_new: TDBusCondVarNewFunction;
    condvar_free: TDBusCondVarFreeFunction;
    condvar_wait: TDBusCondVarWaitFunction;
    condvar_wait_timeout: TDBusCondVarWaitTimeoutFunction;
    condvar_wake_one: TDBusCondVarWakeOneFunction;
    condvar_wake_all: TDBusCondVarWakeAllFunction;
    recursive_mutex_new: TDBusRecursiveMutexNewFunction;
    recursive_mutex_free: TDBusRecursiveMutexFreeFunction;
    recursive_mutex_lock: TDBusRecursiveMutexLockFunction;
    recursive_mutex_unlock: TDBusRecursiveMutexUnlockFunction;
    padding1: procedure; cdecl;
    padding2: procedure; cdecl;
    padding3: procedure; cdecl;
    padding4: procedure; cdecl;
  end;
  PDBusThreadFunctions = ^TDBusThreadFunctions;

function dbus_threads_init(functions: PDBusThreadFunctions): Tdbus_bool_t; cdecl; external libdbus_1;
function dbus_threads_init_default: Tdbus_bool_t; cdecl; external libdbus_1;

// === Konventiert am: 29-7-25 15:07:31 ===


implementation



end.
