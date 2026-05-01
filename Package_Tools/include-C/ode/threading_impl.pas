unit threading_impl;

interface

uses
  fp_ode, threading, odeconfig;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PdxThreadingThreadPool = type Pointer;

  PdThreadingThreadPoolID = ^TdThreadingThreadPoolID;
  TdThreadingThreadPoolID = PdxThreadingThreadPool;

function dThreadingAllocateSelfThreadedImplementation: TdThreadingImplementationID; cdecl; external libodes;
function dThreadingAllocateMultiThreadedImplementation: TdThreadingImplementationID; cdecl; external libodes;
function dThreadingImplementationGetFunctions(impl: TdThreadingImplementationID): PdThreadingFunctionsInfo; cdecl; external libodes;
procedure dThreadingImplementationShutdownProcessing(impl: TdThreadingImplementationID); cdecl; external libodes;
procedure dThreadingImplementationCleanupForRestart(impl: TdThreadingImplementationID); cdecl; external libodes;
procedure dThreadingFreeImplementation(impl: TdThreadingImplementationID); cdecl; external libodes;

type
  TdThreadReadyToServeCallback = procedure(callback_context: Pointer); cdecl;

procedure dExternalThreadingServeMultiThreadedImplementation(impl: TdThreadingImplementationID; readiness_callback: TdThreadReadyToServeCallback; callback_context: pointer); cdecl; external libodes;
function dThreadingAllocateThreadPool(thread_count: dword; stack_size: Tdsizeint; ode_data_allocate_flags: dword; reserved: pointer): TdThreadingThreadPoolID; cdecl; external libodes;
procedure dThreadingThreadPoolServeMultiThreadedImplementation(pool: TdThreadingThreadPoolID; impl: TdThreadingImplementationID); cdecl; external libodes;
procedure dThreadingThreadPoolWaitIdleState(pool: TdThreadingThreadPoolID); cdecl; external libodes;
procedure dThreadingFreeThreadPool(pool: TdThreadingThreadPoolID); cdecl; external libodes;

// === Konventiert am: 30-4-26 17:09:11 ===


implementation



end.
