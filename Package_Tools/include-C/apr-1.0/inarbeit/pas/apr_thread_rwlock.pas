unit apr_thread_rwlock;

interface

uses
  fp_apr, apr_errno;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  Papr_thread_rwlock_t = type Pointer;
  PPapr_thread_rwlock_t = ^Papr_thread_rwlock_t;

function apr_thread_rwlock_create(rwlock: PPapr_thread_rwlock_t; pool: Papr_pool_t): Tapr_status_t; cdecl; external libapr;
function apr_thread_rwlock_rdlock(rwlock: Papr_thread_rwlock_t): Tapr_status_t; cdecl; external libapr;
function apr_thread_rwlock_tryrdlock(rwlock: Papr_thread_rwlock_t): Tapr_status_t; cdecl; external libapr;
function apr_thread_rwlock_wrlock(rwlock: Papr_thread_rwlock_t): Tapr_status_t; cdecl; external libapr;
function apr_thread_rwlock_trywrlock(rwlock: Papr_thread_rwlock_t): Tapr_status_t; cdecl; external libapr;
function apr_thread_rwlock_unlock(rwlock: Papr_thread_rwlock_t): Tapr_status_t; cdecl; external libapr;
function apr_thread_rwlock_destroy(rwlock: Papr_thread_rwlock_t): Tapr_status_t; cdecl; external libapr;

// === Konventiert am: 10-9-26 16:58:37 ===


implementation



end.
