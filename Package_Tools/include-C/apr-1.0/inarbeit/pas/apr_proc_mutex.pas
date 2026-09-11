unit apr_proc_mutex;

interface

uses
  fp_apr, apr_errno, apr_time;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  Papr_lockmech_e = ^Tapr_lockmech_e;
  Tapr_lockmech_e = longint;
const
  APR_LOCK_FCNTL = 0;
  APR_LOCK_FLOCK = 1;
  APR_LOCK_SYSVSEM = 2;
  APR_LOCK_PROC_PTHREAD = 3;
  APR_LOCK_POSIXSEM = 4;
  APR_LOCK_DEFAULT = 5;
  APR_LOCK_DEFAULT_TIMED = 6;

type
  Papr_proc_mutex_t = type Pointer;
  PPapr_proc_mutex_t = ^Papr_proc_mutex_t;

function apr_proc_mutex_create(mutex: PPapr_proc_mutex_t; fname: pchar; mech: Tapr_lockmech_e; pool: Papr_pool_t): Tapr_status_t; cdecl; external libapr;
function apr_proc_mutex_child_init(mutex: PPapr_proc_mutex_t; fname: pchar; pool: Papr_pool_t): Tapr_status_t; cdecl; external libapr;
function apr_proc_mutex_lock(mutex: Papr_proc_mutex_t): Tapr_status_t; cdecl; external libapr;
function apr_proc_mutex_trylock(mutex: Papr_proc_mutex_t): Tapr_status_t; cdecl; external libapr;
function apr_proc_mutex_timedlock(mutex: Papr_proc_mutex_t; timeout: Tapr_interval_time_t): Tapr_status_t; cdecl; external libapr;
function apr_proc_mutex_unlock(mutex: Papr_proc_mutex_t): Tapr_status_t; cdecl; external libapr;
function apr_proc_mutex_destroy(mutex: Papr_proc_mutex_t): Tapr_status_t; cdecl; external libapr;
function apr_proc_mutex_cleanup(mutex: pointer): Tapr_status_t; cdecl; external libapr;
function apr_proc_mutex_lockfile(mutex: Papr_proc_mutex_t): pchar; cdecl; external libapr;
function apr_proc_mutex_mech(mutex: Papr_proc_mutex_t): Tapr_lockmech_e; cdecl; external libapr;
function apr_proc_mutex_name(mutex: Papr_proc_mutex_t): pchar; cdecl; external libapr;
function apr_proc_mutex_defname: pchar; cdecl; external libapr;

// === Konventiert am: 10-9-26 16:47:42 ===


implementation



end.
