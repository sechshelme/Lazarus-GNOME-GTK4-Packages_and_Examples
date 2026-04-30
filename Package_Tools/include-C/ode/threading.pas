unit threading;

interface

uses
  fp_ode, odeconfig;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PdxThreadingImplementation = type Pointer;

  PdThreadingImplementationID = ^TdThreadingImplementationID;
  TdThreadingImplementationID = PdxThreadingImplementation;

  Pdmutexindex_t = ^Tdmutexindex_t;
  Tdmutexindex_t = dword;

  PdMutexGroupID = ^TdMutexGroupID;

  PdxMutexGroup=type Pointer;
  TdMutexGroupID = PdxMutexGroup;

const
  dTHREADING_THREAD_COUNT_UNLIMITED = 0;

type
  TdMutexGroupAllocFunction = function(impl: TdThreadingImplementationID; Mutex_count: Tdmutexindex_t; Mutex_names_ptr: PPchar): TdMutexGroupID; cdecl;
  TdMutexGroupFreeFunction = procedure(impl: TdThreadingImplementationID; mutex_group: TdMutexGroupID); cdecl;
  TdMutexGroupMutexLockFunction = procedure(impl: TdThreadingImplementationID; mutex_group: TdMutexGroupID; mutex_index: Tdmutexindex_t); cdecl;
  TdMutexGroupMutexUnlockFunction = procedure(impl: TdThreadingImplementationID; mutex_group: TdMutexGroupID; mutex_index: Tdmutexindex_t); cdecl;

  PdxCallReleasee = type Pointer;

  PdCallReleaseeID = ^TdCallReleaseeID;
  TdCallReleaseeID = PdxCallReleasee;

  PdxCallWait = type Pointer;

  PdCallWaitID = ^TdCallWaitID;
  TdCallWaitID = PdxCallWait;

  Pddependencycount_t = ^Tddependencycount_t;
  Tddependencycount_t = Tdsizeint;

  Pddependencychange_t = ^Tddependencychange_t;
  Tddependencychange_t = Tddiffint;

  Pdcallindex_t = ^Tdcallindex_t;
  Tdcallindex_t = Tdsizeint;

  TdThreadedCallFunction = function(call_context: pointer; instance_index: Tdcallindex_t; this_releasee: TdCallReleaseeID): longint; cdecl;

  TdxThreadedWaitTime = record
    wait_sec: Ttime_t;
    wait_nsec: dword;
  end;
  PdxThreadedWaitTime = ^TdxThreadedWaitTime;

  TdThreadedWaitTime = TdxThreadedWaitTime;
  PdThreadedWaitTime = ^TdThreadedWaitTime;

  TdThreadedCallWaitAllocFunction = function(impl: TdThreadingImplementationID): TdCallWaitID; cdecl;
  TdThreadedCallWaitResetFunction = procedure(impl: TdThreadingImplementationID; call_wait: TdCallWaitID); cdecl;
  TdThreadedCallWaitFreeFunction = procedure(impl: TdThreadingImplementationID; call_wait: TdCallWaitID); cdecl;
  TdThreadedCallPostFunction = procedure(impl: TdThreadingImplementationID; out_summary_fault: Plongint; out_post_releasee: PdCallReleaseeID; dependencies_count: Tddependencycount_t; dependent_releasee: TdCallReleaseeID; call_wait: TdCallWaitID;
    call_func: TdThreadedCallFunction; call_context: pointer; instance_index: Tdcallindex_t; call_name: pchar); cdecl;
  TdThreadedCallDependenciesCountAlterFunction = procedure(impl: TdThreadingImplementationID; target_releasee: TdCallReleaseeID; dependencies_count_change: Tddependencychange_t); cdecl;
  TdThreadedCallWaitFunction = procedure(impl: TdThreadingImplementationID; out_wait_status: Plongint; call_wait: TdCallWaitID; timeout_time_ptr: PdThreadedWaitTime; wait_name: pchar); cdecl;
  TdThreadingImplThreadCountRetrieveFunction = function(impl: TdThreadingImplementationID): dword; cdecl;
  TdThreadingImplResourcesForCallsPreallocateFunction = function(impl: TdThreadingImplementationID; max_simultaneous_calls_estimate: Tddependencycount_t): longint; cdecl;

  TdxThreadingFunctionsInfo = record
    struct_size: dword;
    alloc_mutex_group: TdMutexGroupAllocFunction;
    free_mutex_group: TdMutexGroupFreeFunction;
    lock_group_mutex: TdMutexGroupMutexLockFunction;
    unlock_group_mutex: TdMutexGroupMutexUnlockFunction;
    alloc_call_wait: TdThreadedCallWaitAllocFunction;
    reset_call_wait: TdThreadedCallWaitResetFunction;
    free_call_wait: TdThreadedCallWaitFreeFunction;
    post_call: TdThreadedCallPostFunction;
    alter_call_dependencies_count: TdThreadedCallDependenciesCountAlterFunction;
    wait_call: TdThreadedCallWaitFunction;
    retrieve_thread_count: TdThreadingImplThreadCountRetrieveFunction;
    preallocate_resources_for_calls: TdThreadingImplResourcesForCallsPreallocateFunction;
  end;
  PdxThreadingFunctionsInfo = ^TdxThreadingFunctionsInfo;

  TdThreadingFunctionsInfo = TdxThreadingFunctionsInfo;
  PdThreadingFunctionsInfo = ^TdThreadingFunctionsInfo;

  // === Konventiert am: 30-4-26 17:09:13 ===


implementation



end.
