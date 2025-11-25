{$IFDEF read_interface}


const
  EVTHREAD_WRITE = $04;
  EVTHREAD_READ = $08;
  EVTHREAD_TRY = $10;

const
  EVTHREAD_LOCK_API_VERSION = 1;
  EVTHREAD_LOCKTYPE_RECURSIVE = 1;
  EVTHREAD_LOCKTYPE_READWRITE = 2;

type
  Tevthread_lock_callbacks = record
    lock_api_version: longint;
    supported_locktypes: dword;
    alloc: function(locktype: dword): pointer; cdecl;
    free: procedure(lock: pointer; locktype: dword); cdecl;
    lock: function(mode: dword; lock: pointer): longint; cdecl;
    unlock: function(mode: dword; lock: pointer): longint; cdecl;
  end;
  Pevthread_lock_callbacks = ^Tevthread_lock_callbacks;

function evthread_set_lock_callbacks(para1: Pevthread_lock_callbacks): longint; cdecl; external libevent;

const
  EVTHREAD_CONDITION_API_VERSION = 1;

type
  Tevthread_condition_callbacks = record
    condition_api_version: longint;
    alloc_condition: function(condtype: dword): pointer; cdecl;
    free_condition: procedure(cond: pointer); cdecl;
    signal_condition: function(cond: pointer; broadcast: longint): longint; cdecl;
    wait_condition: function(cond: pointer; lock: pointer; timeout: Ptimeval): longint; cdecl;
  end;
  Pevthread_condition_callbacks = ^Tevthread_condition_callbacks;

function evthread_set_condition_callbacks(para1: Pevthread_condition_callbacks): longint; cdecl; external libevent;

type
  TFunc2 = function: Tculong; cdecl;

procedure evthread_set_id_callback(id_fn: TFunc2); cdecl; external libevent;

{$ifdef windows}
function evthread_use_windows_threads: longint; cdecl; external libevent;

const
  EVTHREAD_USE_WINDOWS_THREADS_IMPLEMENTED = 1;
  {$endif}

function evthread_use_pthreads: longint; cdecl; external libevent;

const
  EVTHREAD_USE_PTHREADS_IMPLEMENTED = 1;

procedure evthread_enable_lock_debugging; cdecl; external libevent;
procedure evthread_enable_lock_debuging; cdecl; external libevent;

function evthread_make_base_notifiable(base: Pevent_base): longint; cdecl; external libevent;

// === Konventiert am: 26-8-25 19:38:08 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
