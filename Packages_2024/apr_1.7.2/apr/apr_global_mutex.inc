{$IFDEF read_interface}


type
  Papr_global_mutex_t = type Pointer;
  PPapr_global_mutex_t = ^Papr_global_mutex_t;

function apr_global_mutex_create(mutex: PPapr_global_mutex_t; fname: pchar; mech: Tapr_lockmech_e; pool: Papr_pool_t): Tapr_status_t; cdecl; external libapr;
function apr_global_mutex_child_init(mutex: PPapr_global_mutex_t; fname: pchar; pool: Papr_pool_t): Tapr_status_t; cdecl; external libapr;
function apr_global_mutex_lock(mutex: Papr_global_mutex_t): Tapr_status_t; cdecl; external libapr;
function apr_global_mutex_trylock(mutex: Papr_global_mutex_t): Tapr_status_t; cdecl; external libapr;
function apr_global_mutex_timedlock(mutex: Papr_global_mutex_t; timeout: Tapr_interval_time_t): Tapr_status_t; cdecl; external libapr;
function apr_global_mutex_unlock(mutex: Papr_global_mutex_t): Tapr_status_t; cdecl; external libapr;
function apr_global_mutex_destroy(mutex: Papr_global_mutex_t): Tapr_status_t; cdecl; external libapr;
function apr_global_mutex_lockfile(mutex: Papr_global_mutex_t): pchar; cdecl; external libapr;
function apr_global_mutex_mech(mutex: Papr_global_mutex_t): Tapr_lockmech_e; cdecl; external libapr;
function apr_global_mutex_name(mutex: Papr_global_mutex_t): pchar; cdecl; external libapr;


// === Konventiert am: 10-9-26 16:37:18 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
