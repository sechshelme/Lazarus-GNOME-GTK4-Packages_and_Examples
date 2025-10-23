{$IFDEF read_interface}

type
  Psd_event_source = type Pointer;
  PPsd_event_source = ^Psd_event_source;

const
  SD_EVENT_DEFAULT_ = Psd_event(1);

const
  SD_EVENT_OFF = 0;
  SD_EVENT_ON = 1;
  SD_EVENT_ONESHOT = -(1);

const
  SD_EVENT_INITIAL = 0;
  SD_EVENT_ARMED = 1;
  SD_EVENT_PENDING = 2;
  SD_EVENT_RUNNING = 3;
  SD_EVENT_EXITING = 4;
  SD_EVENT_FINISHED = 5;
  SD_EVENT_PREPARING = 6;

const
  SD_EVENT_PRIORITY_IMPORTANT = -(100);
  SD_EVENT_PRIORITY_NORMAL = 0;
  SD_EVENT_PRIORITY_IDLE = 100;

  SD_EVENT_SIGNAL_PROCMASK = 1 shl 30;

type
  Tsd_event_handler_t = function(s: Psd_event_source; userdata: pointer): longint; cdecl;
  Tsd_event_io_handler_t = function(s: Psd_event_source; fd: longint; revents: uint32; userdata: pointer): longint; cdecl;
  Tsd_event_time_handler_t = function(s: Psd_event_source; usec: uint64; userdata: pointer): longint; cdecl;
  Tsd_event_signal_handler_t = function(s: Psd_event_source; si: Psignalfd_siginfo; userdata: pointer): longint; cdecl;
  Tsd_event_child_handler_t = function(s: Psd_event_source; si: Psiginfo_t; userdata: pointer): longint; cdecl;
  Tsd_event_inotify_handler_t = function(s: Psd_event_source; event: Pinotify_event; userdata: pointer): longint; cdecl;

  Tsd_event_destroy_t = Tsd_destroy_t;
  Psd_event_destroy_t = Psd_destroy_t;

function sd_event_default(e: PPsd_event): longint; cdecl; external libsystemd;
function sd_event_new(e: PPsd_event): longint; cdecl; external libsystemd;
function sd_event_ref(e: Psd_event): Psd_event; cdecl; external libsystemd;
function sd_event_unref(e: Psd_event): Psd_event; cdecl; external libsystemd;
function sd_event_add_io(e: Psd_event; s: PPsd_event_source; fd: longint; events: uint32; callback: Tsd_event_io_handler_t; userdata: pointer): longint; cdecl; external libsystemd;
function sd_event_add_time(e: Psd_event; s: PPsd_event_source; clock: Tclockid_t; usec: uint64; accuracy: uint64; callback: Tsd_event_time_handler_t; userdata: pointer): longint; cdecl; external libsystemd;
function sd_event_add_time_relative(e: Psd_event; s: PPsd_event_source; clock: Tclockid_t; usec: uint64; accuracy: uint64; callback: Tsd_event_time_handler_t; userdata: pointer): longint; cdecl; external libsystemd;
function sd_event_add_signal(e: Psd_event; s: PPsd_event_source; sig: longint; callback: Tsd_event_signal_handler_t; userdata: pointer): longint; cdecl; external libsystemd;
function sd_event_add_child(e: Psd_event; s: PPsd_event_source; pid: Tpid_t; options: longint; callback: Tsd_event_child_handler_t; userdata: pointer): longint; cdecl; external libsystemd;
function sd_event_add_child_pidfd(e: Psd_event; s: PPsd_event_source; pidfd: longint; options: longint; callback: Tsd_event_child_handler_t; userdata: pointer): longint; cdecl; external libsystemd;
function sd_event_add_inotify(e: Psd_event; s: PPsd_event_source; path: pchar; mask: uint32; callback: Tsd_event_inotify_handler_t; userdata: pointer): longint; cdecl; external libsystemd;
function sd_event_add_inotify_fd(e: Psd_event; s: PPsd_event_source; fd: longint; mask: uint32; callback: Tsd_event_inotify_handler_t; userdata: pointer): longint; cdecl; external libsystemd;
function sd_event_add_defer(e: Psd_event; s: PPsd_event_source; callback: Tsd_event_handler_t; userdata: pointer): longint; cdecl; external libsystemd;
function sd_event_add_post(e: Psd_event; s: PPsd_event_source; callback: Tsd_event_handler_t; userdata: pointer): longint; cdecl; external libsystemd;
function sd_event_add_exit(e: Psd_event; s: PPsd_event_source; callback: Tsd_event_handler_t; userdata: pointer): longint; cdecl; external libsystemd;
function sd_event_add_memory_pressure(e: Psd_event; s: PPsd_event_source; callback: Tsd_event_handler_t; userdata: pointer): longint; cdecl; external libsystemd;
function sd_event_prepare(e: Psd_event): longint; cdecl; external libsystemd;
function sd_event_wait(e: Psd_event; usec: uint64): longint; cdecl; external libsystemd;
function sd_event_dispatch(e: Psd_event): longint; cdecl; external libsystemd;
function sd_event_run(e: Psd_event; usec: uint64): longint; cdecl; external libsystemd;
function sd_event_loop(e: Psd_event): longint; cdecl; external libsystemd;
function sd_event_exit(e: Psd_event; code: longint): longint; cdecl; external libsystemd;
function sd_event_now(e: Psd_event; clock: Tclockid_t; usec: Puint64): longint; cdecl; external libsystemd;
function sd_event_get_fd(e: Psd_event): longint; cdecl; external libsystemd;
function sd_event_get_state(e: Psd_event): longint; cdecl; external libsystemd;
function sd_event_get_tid(e: Psd_event; tid: Ppid_t): longint; cdecl; external libsystemd;
function sd_event_get_exit_code(e: Psd_event; code: Plongint): longint; cdecl; external libsystemd;
function sd_event_set_watchdog(e: Psd_event; b: longint): longint; cdecl; external libsystemd;
function sd_event_get_watchdog(e: Psd_event): longint; cdecl; external libsystemd;
function sd_event_get_iteration(e: Psd_event; ret: Puint64): longint; cdecl; external libsystemd;
function sd_event_set_signal_exit(e: Psd_event; b: longint): longint; cdecl; external libsystemd;
function sd_event_source_ref(s: Psd_event_source): Psd_event_source; cdecl; external libsystemd;
function sd_event_source_unref(s: Psd_event_source): Psd_event_source; cdecl; external libsystemd;
function sd_event_source_disable_unref(s: Psd_event_source): Psd_event_source; cdecl; external libsystemd;
function sd_event_source_get_event(s: Psd_event_source): Psd_event; cdecl; external libsystemd;
function sd_event_source_get_userdata(s: Psd_event_source): pointer; cdecl; external libsystemd;
function sd_event_source_set_userdata(s: Psd_event_source; userdata: pointer): pointer; cdecl; external libsystemd;
function sd_event_source_set_description(s: Psd_event_source; description: pchar): longint; cdecl; external libsystemd;
function sd_event_source_get_description(s: Psd_event_source; description: PPchar): longint; cdecl; external libsystemd;
function sd_event_source_set_prepare(s: Psd_event_source; callback: Tsd_event_handler_t): longint; cdecl; external libsystemd;
function sd_event_source_get_pending(s: Psd_event_source): longint; cdecl; external libsystemd;
function sd_event_source_get_priority(s: Psd_event_source; priority: Pint64): longint; cdecl; external libsystemd;
function sd_event_source_set_priority(s: Psd_event_source; priority: int64): longint; cdecl; external libsystemd;
function sd_event_source_get_enabled(s: Psd_event_source; enabled: Plongint): longint; cdecl; external libsystemd;
function sd_event_source_set_enabled(s: Psd_event_source; enabled: longint): longint; cdecl; external libsystemd;
function sd_event_source_get_io_fd(s: Psd_event_source): longint; cdecl; external libsystemd;
function sd_event_source_set_io_fd(s: Psd_event_source; fd: longint): longint; cdecl; external libsystemd;
function sd_event_source_get_io_fd_own(s: Psd_event_source): longint; cdecl; external libsystemd;
function sd_event_source_set_io_fd_own(s: Psd_event_source; own: longint): longint; cdecl; external libsystemd;
function sd_event_source_get_io_events(s: Psd_event_source; events: Puint32): longint; cdecl; external libsystemd;
function sd_event_source_set_io_events(s: Psd_event_source; events: uint32): longint; cdecl; external libsystemd;
function sd_event_source_get_io_revents(s: Psd_event_source; revents: Puint32): longint; cdecl; external libsystemd;
function sd_event_source_get_time(s: Psd_event_source; usec: Puint64): longint; cdecl; external libsystemd;
function sd_event_source_set_time(s: Psd_event_source; usec: uint64): longint; cdecl; external libsystemd;
function sd_event_source_set_time_relative(s: Psd_event_source; usec: uint64): longint; cdecl; external libsystemd;
function sd_event_source_get_time_accuracy(s: Psd_event_source; usec: Puint64): longint; cdecl; external libsystemd;
function sd_event_source_set_time_accuracy(s: Psd_event_source; usec: uint64): longint; cdecl; external libsystemd;
function sd_event_source_get_time_clock(s: Psd_event_source; clock: Pclockid_t): longint; cdecl; external libsystemd;
function sd_event_source_get_signal(s: Psd_event_source): longint; cdecl; external libsystemd;
function sd_event_source_get_child_pid(s: Psd_event_source; pid: Ppid_t): longint; cdecl; external libsystemd;
function sd_event_source_get_child_pidfd(s: Psd_event_source): longint; cdecl; external libsystemd;
function sd_event_source_get_child_pidfd_own(s: Psd_event_source): longint; cdecl; external libsystemd;
function sd_event_source_set_child_pidfd_own(s: Psd_event_source; own: longint): longint; cdecl; external libsystemd;
function sd_event_source_get_child_process_own(s: Psd_event_source): longint; cdecl; external libsystemd;
function sd_event_source_set_child_process_own(s: Psd_event_source; own: longint): longint; cdecl; external libsystemd;
function sd_event_source_send_child_signal(s: Psd_event_source; sig: longint; si: Psiginfo_t; flags: dword): longint; cdecl; external libsystemd;
function sd_event_source_get_inotify_mask(s: Psd_event_source; ret: Puint32): longint; cdecl; external libsystemd;
function sd_event_source_set_memory_pressure_type(e: Psd_event_source; ty: pchar): longint; cdecl; external libsystemd;
function sd_event_source_set_memory_pressure_period(s: Psd_event_source; threshold_usec: uint64; window_usec: uint64): longint; cdecl; external libsystemd;
function sd_event_source_set_destroy_callback(s: Psd_event_source; callback: Tsd_event_destroy_t): longint; cdecl; external libsystemd;
function sd_event_source_get_destroy_callback(s: Psd_event_source; ret: Psd_event_destroy_t): longint; cdecl; external libsystemd;
function sd_event_source_get_floating(s: Psd_event_source): longint; cdecl; external libsystemd;
function sd_event_source_set_floating(s: Psd_event_source; b: longint): longint; cdecl; external libsystemd;
function sd_event_source_get_exit_on_failure(s: Psd_event_source): longint; cdecl; external libsystemd;
function sd_event_source_set_exit_on_failure(s: Psd_event_source; b: longint): longint; cdecl; external libsystemd;
function sd_event_source_set_ratelimit(s: Psd_event_source; interval_usec: uint64; burst: dword): longint; cdecl; external libsystemd;
function sd_event_source_get_ratelimit(s: Psd_event_source; ret_interval_usec: Puint64; ret_burst: Pdword): longint; cdecl; external libsystemd;
function sd_event_source_is_ratelimited(s: Psd_event_source): longint; cdecl; external libsystemd;
function sd_event_source_set_ratelimit_expire_callback(s: Psd_event_source; callback: Tsd_event_handler_t): longint; cdecl; external libsystemd;
function sd_event_source_leave_ratelimit(s: Psd_event_source): longint; cdecl; external libsystemd;
function sd_event_trim_memory: longint; cdecl; external libsystemd;

// === Konventiert am: 16-7-25 19:03:59 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


{$ENDIF read_implementation}
