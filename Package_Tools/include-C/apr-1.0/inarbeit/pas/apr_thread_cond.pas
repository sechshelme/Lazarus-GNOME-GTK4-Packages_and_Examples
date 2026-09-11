unit apr_thread_cond;

interface

uses
  fp_apr, apr_errno, apr_thread_mutex, apr_time;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  Papr_thread_cond_t = type Pointer;
  PPapr_thread_cond_t = ^Papr_thread_cond_t;

function apr_thread_cond_create(cond: PPapr_thread_cond_t; pool: Papr_pool_t): Tapr_status_t; cdecl; external libapr;
function apr_thread_cond_wait(cond: Papr_thread_cond_t; mutex: Papr_thread_mutex_t): Tapr_status_t; cdecl; external libapr;
function apr_thread_cond_timedwait(cond: Papr_thread_cond_t; mutex: Papr_thread_mutex_t; timeout: Tapr_interval_time_t): Tapr_status_t; cdecl; external libapr;
function apr_thread_cond_signal(cond: Papr_thread_cond_t): Tapr_status_t; cdecl; external libapr;
function apr_thread_cond_broadcast(cond: Papr_thread_cond_t): Tapr_status_t; cdecl; external libapr;
function apr_thread_cond_destroy(cond: Papr_thread_cond_t): Tapr_status_t; cdecl; external libapr;

// === Konventiert am: 10-9-26 16:58:44 ===


implementation



end.
