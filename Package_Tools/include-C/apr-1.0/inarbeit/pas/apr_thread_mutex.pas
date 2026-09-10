unit apr_thread_mutex;

interface

uses
  fp_apr, apr_errno, apr_time;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


const
  APR_THREAD_MUTEX_DEFAULT = $0;
  APR_THREAD_MUTEX_NESTED = $1;
  APR_THREAD_MUTEX_UNNESTED = $2;
  APR_THREAD_MUTEX_TIMED = $4;

type
  Papr_thread_mutex_t = type Pointer;
  PPapr_thread_mutex_t = ^Papr_thread_mutex_t;

function apr_thread_mutex_create(mutex: PPapr_thread_mutex_t; flags: dword; pool: Papr_pool_t): Tapr_status_t; cdecl; external libapr;
function apr_thread_mutex_lock(mutex: Papr_thread_mutex_t): Tapr_status_t; cdecl; external libapr;
function apr_thread_mutex_trylock(mutex: Papr_thread_mutex_t): Tapr_status_t; cdecl; external libapr;
function apr_thread_mutex_timedlock(mutex: Papr_thread_mutex_t; timeout: Tapr_interval_time_t): Tapr_status_t; cdecl; external libapr;
function apr_thread_mutex_unlock(mutex: Papr_thread_mutex_t): Tapr_status_t; cdecl; external libapr;
function apr_thread_mutex_destroy(mutex: Papr_thread_mutex_t): Tapr_status_t; cdecl; external libapr;

  // === Konventiert am: 10-9-26 16:58:41 ===


implementation



end.
