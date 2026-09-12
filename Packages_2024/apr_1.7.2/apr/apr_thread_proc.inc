{$IFDEF read_interface}


type
  Papr_cmdtype_e = ^Tapr_cmdtype_e;
  Tapr_cmdtype_e = longint;
const
  APR_SHELLCMD = 0;
  APR_PROGRAM = 1;
  APR_PROGRAM_ENV = 2;
  APR_PROGRAM_PATH = 3;
  APR_SHELLCMD_ENV = 4;

type
  Papr_wait_how_e = ^Tapr_wait_how_e;
  Tapr_wait_how_e = longint;
const
  APR_WAIT = 0;
  APR_NOWAIT = 1;

type
  Papr_exit_why_e = ^Tapr_exit_why_e;
  Tapr_exit_why_e = longint;
const
  APR_PROC_EXIT = 1;
  APR_PROC_SIGNAL = 2;
  APR_PROC_SIGNAL_CORE = 4;

function APR_PROC_CHECK_EXIT(x: longint): longint;
function APR_PROC_CHECK_SIGNALED(x: longint): longint;
function APR_PROC_CHECK_CORE_DUMP(x: longint): longint;

const
  APR_NO_PIPE = 0;
  APR_FULL_BLOCK = 1;
  APR_FULL_NONBLOCK = 2;
  APR_PARENT_BLOCK = 3;
  APR_CHILD_BLOCK = 4;
  APR_NO_FILE = 8;
  APR_READ_BLOCK = 3;
  APR_WRITE_BLOCK = 4;
  APR_LIMIT_CPU = 0;
  APR_LIMIT_MEM = 1;
  APR_LIMIT_NPROC = 2;
  APR_LIMIT_NOFILE = 3;
  APR_OC_REASON_DEATH = 0;
  APR_OC_REASON_UNWRITABLE = 1;
  APR_OC_REASON_RESTART = 2;
  APR_OC_REASON_UNREGISTER = 3;
  APR_OC_REASON_LOST = 4;
  APR_OC_REASON_RUNNING = 5;

type
  Papr_proc_t = type Pointer;

  Tapr_child_errfn_t = procedure(proc: Papr_pool_t; err: Tapr_status_t; description: pchar); cdecl;
  Tapr_thread_start_t = function(para1: Papr_thread_t; para2: pointer): pointer; cdecl;

  Papr_threadattr_t = type Pointer;
  PPapr_threadattr_t = ^Papr_threadattr_t;

  Papr_procattr_t = type Pointer;
  PPapr_procattr_t = ^Papr_procattr_t;

  Papr_thread_once_t = type Pointer;
  PPapr_thread_once_t = ^Papr_thread_once_t;

  Papr_threadkey_t = type Pointer;
  PPapr_threadkey_t = ^Papr_threadkey_t;

  Papr_other_child_rec_t = type Pointer;
  PPapr_other_child_rec_t = ^Papr_other_child_rec_t;

type
  Papr_kill_conditions_e = ^Tapr_kill_conditions_e;
  Tapr_kill_conditions_e = longint;
const
  APR_KILL_NEVER = 0;
  APR_KILL_ALWAYS = 1;
  APR_KILL_AFTER_TIMEOUT = 2;
  APR_JUST_WAIT = 3;
  APR_KILL_ONLY_ONCE = 4;

function apr_threadattr_create(new_attr: PPapr_threadattr_t; cont: Papr_pool_t): Tapr_status_t; cdecl; external libapr;
function apr_threadattr_detach_set(attr: Papr_threadattr_t; on_: Tapr_int32_t): Tapr_status_t; cdecl; external libapr;
function apr_threadattr_detach_get(attr: Papr_threadattr_t): Tapr_status_t; cdecl; external libapr;
function apr_threadattr_stacksize_set(attr: Papr_threadattr_t; stacksize: Tapr_size_t): Tapr_status_t; cdecl; external libapr;
function apr_threadattr_guardsize_set(attr: Papr_threadattr_t; guardsize: Tapr_size_t): Tapr_status_t; cdecl; external libapr;
function apr_thread_create(new_thread: PPapr_thread_t; attr: Papr_threadattr_t; func: Tapr_thread_start_t; data: pointer; cont: Papr_pool_t): Tapr_status_t; cdecl; external libapr;
function apr_thread_exit(thd: Papr_thread_t; retval: Tapr_status_t): Tapr_status_t; cdecl; external libapr;
function apr_thread_join(retval: Papr_status_t; thd: Papr_thread_t): Tapr_status_t; cdecl; external libapr;
procedure apr_thread_yield; cdecl; external libapr;
function apr_thread_once_init(control: PPapr_thread_once_t; p: Papr_pool_t): Tapr_status_t; cdecl; external libapr;
function apr_thread_once(control: Papr_thread_once_t; func: Pointer): Tapr_status_t; cdecl; external libapr;
function apr_thread_detach(thd: Papr_thread_t): Tapr_status_t; cdecl; external libapr;
function apr_thread_data_get(data: Ppointer; key: pchar; thread: Papr_thread_t): Tapr_status_t; cdecl; external libapr;
function apr_thread_data_set(data: pointer; key: pchar; cleanup: Pointer; thread: Papr_thread_t): Tapr_status_t; cdecl; external libapr;
function apr_threadkey_private_create(key: PPapr_threadkey_t; dest: Pointer; cont: Papr_pool_t): Tapr_status_t; cdecl; external libapr;
function apr_threadkey_private_get(new_mem: Ppointer; key: Papr_threadkey_t): Tapr_status_t; cdecl; external libapr;
function apr_threadkey_private_set(priv: pointer; key: Papr_threadkey_t): Tapr_status_t; cdecl; external libapr;
function apr_threadkey_private_delete(key: Papr_threadkey_t): Tapr_status_t; cdecl; external libapr;
function apr_threadkey_data_get(data: Ppointer; key: pchar; threadkey: Papr_threadkey_t): Tapr_status_t; cdecl; external libapr;
function apr_threadkey_data_set(data: pointer; key: pchar; cleanup: Pointer; threadkey: Papr_threadkey_t): Tapr_status_t; cdecl; external libapr;
function apr_procattr_create(new_attr: PPapr_procattr_t; cont: Papr_pool_t): Tapr_status_t; cdecl; external libapr;
function apr_procattr_io_set(attr: Papr_procattr_t; in_: Tapr_int32_t; out_: Tapr_int32_t; err: Tapr_int32_t): Tapr_status_t; cdecl; external libapr;
function apr_procattr_child_in_set(attr: Papr_procattr_t; child_in: Papr_file_t; parent_in: Papr_file_t): Tapr_status_t; cdecl; external libapr;
function apr_procattr_child_out_set(attr: Papr_procattr_t; child_out: Papr_file_t; parent_out: Papr_file_t): Tapr_status_t; cdecl; external libapr;
function apr_procattr_child_err_set(attr: Papr_procattr_t; child_err: Papr_file_t; parent_err: Papr_file_t): Tapr_status_t; cdecl; external libapr;
function apr_procattr_dir_set(attr: Papr_procattr_t; dir: pchar): Tapr_status_t; cdecl; external libapr;
function apr_procattr_cmdtype_set(attr: Papr_procattr_t; cmd: Tapr_cmdtype_e): Tapr_status_t; cdecl; external libapr;
function apr_procattr_detach_set(attr: Papr_procattr_t; detach: Tapr_int32_t): Tapr_status_t; cdecl; external libapr;
function apr_procattr_limit_set(attr: Papr_procattr_t; what: Tapr_int32_t; limit: Prlimit): Tapr_status_t; cdecl; external libapr;
function apr_procattr_child_errfn_set(attr: Papr_procattr_t; errfn: Tapr_child_errfn_t): Tapr_status_t; cdecl; external libapr;
function apr_procattr_error_check_set(attr: Papr_procattr_t; chk: Tapr_int32_t): Tapr_status_t; cdecl; external libapr;
function apr_procattr_addrspace_set(attr: Papr_procattr_t; addrspace: Tapr_int32_t): Tapr_status_t; cdecl; external libapr;
function apr_procattr_user_set(attr: Papr_procattr_t; username: pchar; password: pchar): Tapr_status_t; cdecl; external libapr;
function apr_procattr_group_set(attr: Papr_procattr_t; groupname: pchar): Tapr_status_t; cdecl; external libapr;
function apr_procattr_perms_set_register(attr: Papr_procattr_t; perms_set_fn: Tapr_perms_setfn_t; data: pointer; perms: Tapr_fileperms_t): Tapr_status_t; cdecl; external libapr;
function apr_proc_fork(proc: Papr_proc_t; cont: Papr_pool_t): Tapr_status_t; cdecl; external libapr;
function apr_proc_create(new_proc: Papr_proc_t; progname: pchar; args: PPchar; env: PPchar; attr: Papr_procattr_t; pool: Papr_pool_t): Tapr_status_t; cdecl; external libapr;
function apr_proc_wait(proc: Papr_proc_t; exitcode: Plongint; exitwhy: Papr_exit_why_e; waithow: Tapr_wait_how_e): Tapr_status_t; cdecl; external libapr;
function apr_proc_wait_all_procs(proc: Papr_proc_t; exitcode: Plongint; exitwhy: Papr_exit_why_e; waithow: Tapr_wait_how_e; p: Papr_pool_t): Tapr_status_t; cdecl; external libapr;

const
  APR_PROC_DETACH_FOREGROUND = 0;
  APR_PROC_DETACH_DAEMONIZE = 1;

function apr_proc_detach(daemonize: longint): Tapr_status_t; cdecl; external libapr;
procedure apr_proc_other_child_register(proc: Papr_proc_t; maintenance: Pointer; data: pointer; write_fd: Papr_file_t; p: Papr_pool_t); cdecl; external libapr;
procedure apr_proc_other_child_unregister(data: pointer); cdecl; external libapr;
function apr_proc_other_child_alert(proc: Papr_proc_t; reason: longint; status: longint): Tapr_status_t; cdecl; external libapr;
procedure apr_proc_other_child_refresh(ocr: Papr_other_child_rec_t; reason: longint); cdecl; external libapr;
procedure apr_proc_other_child_refresh_all(reason: longint); cdecl; external libapr;
function apr_proc_kill(proc: Papr_proc_t; sig: longint): Tapr_status_t; cdecl; external libapr;
procedure apr_pool_note_subprocess(a: Papr_pool_t; proc: Papr_proc_t; how: Tapr_kill_conditions_e); cdecl; external libapr;
function apr_setup_signal_thread: Tapr_status_t; cdecl; external libapr;
function apr_signal_thread(signal_handler: Pointer): Tapr_status_t; cdecl; external libapr;

// === Konventiert am: 10-9-26 16:58:39 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


function APR_PROC_CHECK_EXIT(x: longint): longint;
begin
  APR_PROC_CHECK_EXIT := x and APR_PROC_EXIT;
end;

function APR_PROC_CHECK_SIGNALED(x: longint): longint;
begin
  APR_PROC_CHECK_SIGNALED := x and APR_PROC_SIGNAL;
end;

function APR_PROC_CHECK_CORE_DUMP(x: longint): longint;
begin
  APR_PROC_CHECK_CORE_DUMP := x and APR_PROC_SIGNAL_CORE;
end;


{$ENDIF read_implementation}
