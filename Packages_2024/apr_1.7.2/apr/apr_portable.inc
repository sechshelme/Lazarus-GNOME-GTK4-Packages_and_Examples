{$IFDEF read_interface}


type
  Papr_os_file_t = ^Tapr_os_file_t;
  Tapr_os_file_t = longint;

  PPapr_os_dir_t = ^Papr_os_dir_t;
  Papr_os_dir_t = ^Tapr_os_dir_t;
  Tapr_os_dir_t = Pointer;

  Papr_os_sock_t = ^Tapr_os_sock_t;
  Tapr_os_sock_t = longint;

  Papr_os_proc_mutex_t = ^Tapr_os_proc_mutex_t;
  Tapr_os_proc_mutex_t = longint;

  PPapr_os_thread_t = ^Papr_os_thread_t;
  Papr_os_thread_t = ^Tapr_os_thread_t;
  Tapr_os_thread_t = PtrUInt;

  Papr_os_proc_t = ^Tapr_os_proc_t;
  Tapr_os_proc_t = longint;

  Papr_os_threadkey_t = ^Tapr_os_threadkey_t;
  Tapr_os_threadkey_t = PtrUInt;

  PPapr_os_imp_time_t = ^Papr_os_imp_time_t;
  Papr_os_imp_time_t = ^Tapr_os_imp_time_t;
  Tapr_os_imp_time_t = PtrUInt;

  PPapr_os_exp_time_t = ^Papr_os_exp_time_t;
  Papr_os_exp_time_t = ^Tapr_os_exp_time_t;
  Tapr_os_exp_time_t = PtrUInt;

  PPapr_os_dso_handle_t = ^Papr_os_dso_handle_t;
  Papr_os_dso_handle_t = ^Tapr_os_dso_handle_t;
  Tapr_os_dso_handle_t = Pointer;

  Papr_os_shm_t = ^Tapr_os_shm_t;
  Tapr_os_shm_t = Pointer;

type
  Papr_os_sock_info_t = type Pointer;

type
  Papr_os_global_mutex_t = ^Tapr_os_global_mutex_t;
  Tapr_os_global_mutex_t = record
    pool: Papr_pool_t;
    proc_mutex: Papr_proc_mutex_t;
    thread_mutex: Papr_thread_mutex_t;
  end;

function apr_os_global_mutex_get(ospmutex: Papr_os_global_mutex_t; pmutex: Papr_global_mutex_t): Tapr_status_t; cdecl; external libapr;
function apr_os_file_get(thefile: Papr_os_file_t; file_: Papr_file_t): Tapr_status_t; cdecl; external libapr;
function apr_os_dir_get(thedir: PPapr_os_dir_t; dir: Papr_dir_t): Tapr_status_t; cdecl; external libapr;
function apr_os_sock_get(thesock: Papr_os_sock_t; sock: Papr_socket_t): Tapr_status_t; cdecl; external libapr;
function apr_os_proc_mutex_get(ospmutex: Papr_os_proc_mutex_t; pmutex: Papr_proc_mutex_t): Tapr_status_t; cdecl; external libapr;
function apr_os_proc_mutex_get_ex(ospmutex: Papr_os_proc_mutex_t; pmutex: Papr_proc_mutex_t; mech: Papr_lockmech_e): Tapr_status_t; cdecl; external libapr;
function apr_os_exp_time_get(ostime: PPapr_os_exp_time_t; aprtime: Papr_time_exp_t): Tapr_status_t; cdecl; external libapr;
function apr_os_imp_time_get(ostime: PPapr_os_imp_time_t; aprtime: Papr_time_t): Tapr_status_t; cdecl; external libapr;
function apr_os_shm_get(osshm: Papr_os_shm_t; shm: Papr_shm_t): Tapr_status_t; cdecl; external libapr;
function apr_os_thread_get(thethd: PPapr_os_thread_t; thd: Papr_thread_t): Tapr_status_t; cdecl; external libapr;
function apr_os_threadkey_get(thekey: Papr_os_threadkey_t; key: Papr_threadkey_t): Tapr_status_t; cdecl; external libapr;
function apr_os_thread_put(thd: PPapr_thread_t; thethd: Papr_os_thread_t; cont: Papr_pool_t): Tapr_status_t; cdecl; external libapr;
function apr_os_threadkey_put(key: PPapr_threadkey_t; thekey: Papr_os_threadkey_t; cont: Papr_pool_t): Tapr_status_t; cdecl; external libapr;
function apr_os_thread_current: Tapr_os_thread_t; cdecl; external libapr;
function apr_os_thread_equal(tid1: Tapr_os_thread_t; tid2: Tapr_os_thread_t): longint; cdecl; external libapr;
function apr_os_file_put(file_: PPapr_file_t; thefile: Papr_os_file_t; flags: Tapr_int32_t; cont: Papr_pool_t): Tapr_status_t; cdecl; external libapr;
function apr_os_pipe_put(file_: PPapr_file_t; thefile: Papr_os_file_t; cont: Papr_pool_t): Tapr_status_t; cdecl; external libapr;
function apr_os_pipe_put_ex(file_: PPapr_file_t; thefile: Papr_os_file_t; register_cleanup: longint; cont: Papr_pool_t): Tapr_status_t; cdecl; external libapr;
function apr_os_dir_put(dir: PPapr_dir_t; thedir: Papr_os_dir_t; cont: Papr_pool_t): Tapr_status_t; cdecl; external libapr;
function apr_os_sock_put(sock: PPapr_socket_t; thesock: Papr_os_sock_t; cont: Papr_pool_t): Tapr_status_t; cdecl; external libapr;
function apr_os_sock_make(apr_sock: PPapr_socket_t; os_sock_info: Papr_os_sock_info_t; cont: Papr_pool_t): Tapr_status_t; cdecl; external libapr;
function apr_os_proc_mutex_put(pmutex: PPapr_proc_mutex_t; ospmutex: Papr_os_proc_mutex_t; cont: Papr_pool_t): Tapr_status_t; cdecl; external libapr;
function apr_os_proc_mutex_put_ex(pmutex: PPapr_proc_mutex_t; ospmutex: Papr_os_proc_mutex_t; mech: Tapr_lockmech_e; register_cleanup: longint; cont: Papr_pool_t): Tapr_status_t; cdecl; external libapr;
function apr_os_imp_time_put(aprtime: Papr_time_t; ostime: PPapr_os_imp_time_t; cont: Papr_pool_t): Tapr_status_t; cdecl; external libapr;
function apr_os_exp_time_put(aprtime: Papr_time_exp_t; ostime: PPapr_os_exp_time_t; cont: Papr_pool_t): Tapr_status_t; cdecl; external libapr;
function apr_os_shm_put(shm: PPapr_shm_t; osshm: Papr_os_shm_t; cont: Papr_pool_t): Tapr_status_t; cdecl; external libapr;
function apr_os_dso_handle_put(dso: PPapr_dso_handle_t; thedso: Tapr_os_dso_handle_t; pool: Papr_pool_t): Tapr_status_t; cdecl; external libapr;
function apr_os_dso_handle_get(dso: Papr_os_dso_handle_t; aprdso: Papr_dso_handle_t): Tapr_status_t; cdecl; external libapr;
function apr_os_uuid_get(uuid_data: pbyte): Tapr_status_t; cdecl; external libapr;
function apr_os_default_encoding(pool: Papr_pool_t): pchar; cdecl; external libapr;
function apr_os_locale_encoding(pool: Papr_pool_t): pchar; cdecl; external libapr;

// === Konventiert am: 10-9-26 16:47:44 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
