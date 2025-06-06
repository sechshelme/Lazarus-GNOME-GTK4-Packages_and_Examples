  {$IFDEF read_interface}


function ecore_init: longint; cdecl; external libecore;
function ecore_shutdown: longint; cdecl; external libecore;
function ecore_init_ex(argc: longint; argv: PPchar): dword; cdecl; external libecore;
procedure efl_build_version_set(vmaj: longint; vmin: longint; vmic: longint; revision: longint; flavor: pchar; build_id: pchar); cdecl; external libecore;

const
  ECORE_VERSION_MAJOR = EFL_VERSION_MAJOR;
  ECORE_VERSION_MINOR = EFL_VERSION_MINOR;

type
  TEcore_Version = record
    major: longint;
    minor: longint;
    micro: longint;
    revision: longint;
  end;
  PEcore_Version = ^TEcore_Version;

var
  ecore_version: PEcore_Version; cvar;external libecore;

const
  ECORE_CALLBACK_CANCEL = EINA_FALSE;
  ECORE_CALLBACK_RENEW = EINA_TRUE;
  ECORE_CALLBACK_PASS_ON = EINA_TRUE;
  ECORE_CALLBACK_DONE = EINA_FALSE;

type
  TEcore_Task_Cb = function(data: pointer): TEina_Bool; cdecl;
  TEcore_Select_Function = function(nfds: longint; readfds: Pfd_set; writefds: Pfd_set; exceptfds: Pfd_set; timeout: Ptimeval): longint; cdecl;

procedure ecore_main_loop_iterate; cdecl; external libecore;
function ecore_main_loop_iterate_may_block(may_block: longint): longint; cdecl; external libecore;
procedure ecore_main_loop_select_func_set(func: TEcore_Select_Function); cdecl; external libecore;
function ecore_main_loop_select_func_get: TEcore_Select_Function; cdecl; external libecore;
function ecore_main_loop_glib_integrate: TEina_Bool; cdecl; external libecore;
procedure ecore_main_loop_glib_always_integrate_disable; cdecl; external libecore;
procedure ecore_main_loop_begin; cdecl; external libecore;
procedure ecore_main_loop_quit; cdecl; external libecore;
function ecore_main_loop_animator_ticked_get: TEina_Bool; cdecl; external libecore;
function ecore_main_loop_nested_get: longint; cdecl; external libecore;

type
  TEcore_Cb = procedure(data: pointer); cdecl;

  PEcore_Data_Cb = ^TEcore_Data_Cb;
  TEcore_Data_Cb = function(data: pointer): pointer; cdecl;

function ecore_fork_reset_callback_add(func: TEcore_Cb; data: pointer): TEina_Bool; cdecl; external libecore;
function ecore_fork_reset_callback_del(func: TEcore_Cb; data: pointer): TEina_Bool; cdecl; external libecore;
procedure ecore_fork_reset; cdecl; external libecore;
procedure ecore_main_loop_thread_safe_call_async(callback: TEcore_Cb; data: pointer); cdecl; external libecore;
function ecore_main_loop_thread_safe_call_sync(callback: TEcore_Data_Cb; data: pointer): pointer; cdecl; external libecore;
procedure ecore_main_loop_thread_safe_call_wait(wait: double); cdecl; external libecore;
function ecore_thread_main_loop_begin: longint; cdecl; external libecore;
function ecore_thread_main_loop_end: longint; cdecl; external libecore;

const
  ECORE_EVENT_NONE = 0;
  ECORE_EVENT_SIGNAL_USER = 1;
  ECORE_EVENT_SIGNAL_HUP = 2;
  ECORE_EVENT_SIGNAL_EXIT = 3;
  ECORE_EVENT_SIGNAL_POWER = 4;
  ECORE_EVENT_SIGNAL_REALTIME = 5;
  ECORE_EVENT_MEMORY_STATE = 6;
  ECORE_EVENT_POWER_STATE = 7;
  ECORE_EVENT_LOCALE_CHANGED = 8;
  ECORE_EVENT_HOSTNAME_CHANGED = 9;
  ECORE_EVENT_SYSTEM_TIMEDATE_CHANGED = 10;
  ECORE_EVENT_COUNT = 11;

type
  TEcore_Win32_Handler = record
  end;
  PEcore_Win32_Handler = ^TEcore_Win32_Handler;

  TEcore_Event_Handler = record
  end;
  PEcore_Event_Handler = ^TEcore_Event_Handler;

  TEcore_Event = record
  end;
  PEcore_Event = ^TEcore_Event;

  TEcore_Event_Filter = record
  end;
  PEcore_Event_Filter = ^TEcore_Event_Filter;

  TEcore_Filter_Cb = function(data: pointer; loop_data: pointer; _type: longint; event: pointer): TEina_Bool; cdecl;
  TEcore_End_Cb = procedure(user_data: pointer; func_data: pointer); cdecl;
  TEcore_Event_Handler_Cb = function(data: pointer; _type: longint; event: pointer): TEina_Bool; cdecl;

type
  TEcore_Event_Signal_User = record
    number: longint;
    ext_data: pointer;
    data: Tsiginfo_t;
  end;
  PEcore_Event_Signal_User = ^TEcore_Event_Signal_User;

type
  TEcore_Event_Signal_Hup = record
    ext_data: pointer;
    data: Tsiginfo_t;
  end;
  PEcore_Event_Signal_Hup = ^TEcore_Event_Signal_Hup;

type
  TEcore_Event_Signal_Exit = bitpacked record
    interrupt: 0..1;
    quit: 0..1;
    terminate: 0..1;
    ext_data: pointer;
    data: Tsiginfo_t;
  end;
  PEcore_Event_Signal_Exit = ^TEcore_Event_Signal_Exit;

type
  TEcore_Event_Signal_Power = record
    ext_data: pointer;
    data: Tsiginfo_t;
  end;
  PEcore_Event_Signal_Power = ^TEcore_Event_Signal_Power;

type
  TEcore_Event_Signal_Realtime = record
    num: longint;
    data: Tsiginfo_t;
  end;
  PEcore_Event_Signal_Realtime = ^TEcore_Event_Signal_Realtime;

function ecore_event_handler_add(_type: longint; func: TEcore_Event_Handler_Cb; data: pointer): PEcore_Event_Handler; cdecl; external libecore;
function ecore_event_handler_prepend(_type: longint; func: TEcore_Event_Handler_Cb; data: pointer): PEcore_Event_Handler; cdecl; external libecore;
function ecore_event_handler_del(event_handler: PEcore_Event_Handler): pointer; cdecl; external libecore;
function ecore_event_add(_type: longint; ev: pointer; func_free: TEcore_End_Cb; data: pointer): PEcore_Event; cdecl; external libecore;
function ecore_event_del(event: PEcore_Event): pointer; cdecl; external libecore;
function ecore_event_handler_data_get(eh: PEcore_Event_Handler): pointer; cdecl; external libecore;
function ecore_event_handler_data_set(eh: PEcore_Event_Handler; data: pointer): pointer; cdecl; external libecore;
function ecore_event_type_new: longint; cdecl; external libecore;
procedure ecore_event_type_flush_internal(_type: longint; args: array of const); cdecl; external libecore;
procedure ecore_event_type_flush_internal(_type: longint); cdecl; external libecore;
function ecore_event_filter_add(func_start: TEcore_Data_Cb; func_filter: TEcore_Filter_Cb; func_end: TEcore_End_Cb; data: pointer): PEcore_Event_Filter; cdecl; external libecore;
function ecore_event_filter_del(ef: PEcore_Event_Filter): pointer; cdecl; external libecore;
function ecore_event_current_type_get: longint; cdecl; external libecore;
function ecore_event_current_event_get: pointer; cdecl; external libecore;

type
  TEcore_Memory_State = longint;
  PEcore_Memory_State = ^TEcore_Memory_State;

const
  ECORE_MEMORY_STATE_NORMAL = 0;
  ECORE_MEMORY_STATE_LOW = 1;

function ecore_memory_state_get: TEcore_Memory_State; cdecl; external libecore;
procedure ecore_memory_state_set(state: TEcore_Memory_State); cdecl; external libecore;

type
  TEcore_Power_State = longint;
  PEcore_Power_State = ^TEcore_Power_State;

const
  ECORE_POWER_STATE_MAINS = 0;
  ECORE_POWER_STATE_BATTERY = 1;
  ECORE_POWER_STATE_LOW = 2;

function ecore_power_state_get: TEcore_Power_State; cdecl; external libecore;
procedure ecore_power_state_set(state: TEcore_Power_State); cdecl; external libecore;

const
  ECORE_EXE_PRIORITY_INHERIT = 9999;

var
  ECORE_EXE_EVENT_ADD: longint; cvar;external libecore;
  ECORE_EXE_EVENT_DEL: longint; cvar;external libecore;
  ECORE_EXE_EVENT_DATA: longint; cvar;external libecore;
  ECORE_EXE_EVENT_ERROR: longint; cvar;external libecore;

type
  TEcore_Exe_Win32_Priority = longint;
  PEcore_Exe_Win32_Priority = ^TEcore_Exe_Win32_Priority;

const
  ECORE_EXE_WIN32_PRIORITY_IDLE = 0;
  ECORE_EXE_WIN32_PRIORITY_BELOW_NORMAL = 1;
  ECORE_EXE_WIN32_PRIORITY_NORMAL = 2;
  ECORE_EXE_WIN32_PRIORITY_ABOVE_NORMAL = 3;
  ECORE_EXE_WIN32_PRIORITY_HIGH = 4;
  ECORE_EXE_WIN32_PRIORITY_REALTIME = 5;

type
  TEcore_Exe_Cb = procedure(data: pointer; exe: PEcore_Exe); cdecl;

  TEcore_Exe_Event_Add = record
    exe: PEcore_Exe;
    ext_data: pointer;
  end;
  PEcore_Exe_Event_Add = ^TEcore_Exe_Event_Add;

type
  TEcore_Exe_Event_Del = bitpacked record
    pid: Tpid_t;
    exit_code: longint;
    exe: PEcore_Exe;
    exit_signal: longint;
    exited: 0..1;
    signalled: 0..1;
    ext_data: Pointer;
    data: Tsiginfo_t;
  end;
  PEcore_Exe_Event_Del = ^TEcore_Exe_Event_Del;

procedure ecore_exe_run_priority_set(pri: longint); cdecl; external libecore;
function ecore_exe_run_priority_get: longint; cdecl; external libecore;
function ecore_exe_run(exe_cmd: pchar; data: pointer): PEcore_Exe; cdecl; external libecore;
function ecore_exe_pipe_run(exe_cmd: pchar; flags: TEcore_Exe_Flags; data: pointer): PEcore_Exe; cdecl; external libecore;
procedure ecore_exe_callback_pre_free_set(exe: PEcore_Exe; func: TEcore_Exe_Cb); cdecl; external libecore;
function ecore_exe_send(exe: PEcore_Exe; data: pointer; size: longint): TEina_Bool; cdecl; external libecore;
procedure ecore_exe_close_stdin(exe: PEcore_Exe); cdecl; external libecore;
procedure ecore_exe_auto_limits_set(exe: PEcore_Exe; start_bytes: longint; end_bytes: longint; start_lines: longint; end_lines: longint); cdecl; external libecore;
function ecore_exe_event_data_get(exe: PEcore_Exe; flags: TEcore_Exe_Flags): PEcore_Exe_Event_Data; cdecl; external libecore;
procedure ecore_exe_event_data_free(data: PEcore_Exe_Event_Data); cdecl; external libecore;
function ecore_exe_free(exe: PEcore_Exe): pointer; cdecl; external libecore;
function ecore_exe_pid_get(exe: PEcore_Exe): Tpid_t; cdecl; external libecore;
procedure ecore_exe_tag_set(exe: PEcore_Exe; tag: pchar); cdecl; external libecore;
function ecore_exe_tag_get(exe: PEcore_Exe): pchar; cdecl; external libecore;
function ecore_exe_cmd_get(exe: PEcore_Exe): pchar; cdecl; external libecore;
function ecore_exe_data_get(exe: PEcore_Exe): pointer; cdecl; external libecore;
function ecore_exe_data_set(exe: PEcore_Exe; data: pointer): pointer; cdecl; external libecore;
function ecore_exe_flags_get(exe: PEcore_Exe): TEcore_Exe_Flags; cdecl; external libecore;
procedure ecore_exe_pause(exe: PEcore_Exe); cdecl; external libecore;
procedure ecore_exe_continue(exe: PEcore_Exe); cdecl; external libecore;
procedure ecore_exe_interrupt(exe: PEcore_Exe); cdecl; external libecore;
procedure ecore_exe_quit(exe: PEcore_Exe); cdecl; external libecore;
procedure ecore_exe_terminate(exe: PEcore_Exe); cdecl; external libecore;
procedure ecore_exe_kill(exe: PEcore_Exe); cdecl; external libecore;
procedure ecore_exe_signal(exe: PEcore_Exe; num: longint); cdecl; external libecore;
procedure ecore_exe_hup(exe: PEcore_Exe); cdecl; external libecore;

type
  TEcore_Fd_Handler = record
  end;
  PEcore_Fd_Handler = ^TEcore_Fd_Handler;

  TEcore_Fd_Handler_Flags = longint;
  PEcore_Fd_Handler_Flags = ^TEcore_Fd_Handler_Flags;

const
  ECORE_FD_READ = 1;
  ECORE_FD_WRITE = 2;
  ECORE_FD_ERROR = 4;
  ECORE_FD_ALWAYS = 8;

type
  TEcore_Fd_Cb = function(data: pointer; fd_handler: PEcore_Fd_Handler): TEina_Bool; cdecl;
  TEcore_Fd_Prep_Cb = procedure(data: pointer; fd_handler: PEcore_Fd_Handler); cdecl;
  TEcore_Win32_Handle_Cb = function(data: pointer; wh: PEcore_Win32_Handler): TEina_Bool; cdecl;

function ecore_main_fd_handler_add(fd: longint; flags: TEcore_Fd_Handler_Flags; func: TEcore_Fd_Cb; data: pointer; buf_func: TEcore_Fd_Cb; buf_data: pointer): PEcore_Fd_Handler; cdecl; external libecore;
function ecore_main_fd_handler_file_add(fd: longint; flags: TEcore_Fd_Handler_Flags; func: TEcore_Fd_Cb; data: pointer; buf_func: TEcore_Fd_Cb; buf_data: pointer): PEcore_Fd_Handler; cdecl; external libecore;
procedure ecore_main_fd_handler_prepare_callback_set(fd_handler: PEcore_Fd_Handler; func: TEcore_Fd_Prep_Cb; data: pointer); cdecl; external libecore;
function ecore_main_fd_handler_del(fd_handler: PEcore_Fd_Handler): pointer; cdecl; external libecore;
function ecore_main_fd_handler_fd_get(fd_handler: PEcore_Fd_Handler): longint; cdecl; external libecore;
function ecore_main_fd_handler_active_get(fd_handler: PEcore_Fd_Handler; flags: TEcore_Fd_Handler_Flags): TEina_Bool; cdecl; external libecore;
procedure ecore_main_fd_handler_active_set(fd_handler: PEcore_Fd_Handler; flags: TEcore_Fd_Handler_Flags); cdecl; external libecore;
function ecore_main_win32_handler_add(h: pointer; func: TEcore_Win32_Handle_Cb; data: pointer): PEcore_Win32_Handler; cdecl; external libecore;
function ecore_main_win32_handler_del(win32_handler: PEcore_Win32_Handler): pointer; cdecl; external libecore;
function ecore_time_get: double; cdecl; external libecore;
function ecore_time_unix_get: double; cdecl; external libecore;
function ecore_loop_time_get: double; cdecl; external libecore;
procedure ecore_loop_time_set(t: double); cdecl; external libecore;

type
  TEcore_Thread = record
  end;
  PEcore_Thread = ^TEcore_Thread;

  TEcore_Thread_Cb = procedure(data: pointer; thread: PEcore_Thread); cdecl;
  TEcore_Thread_Notify_Cb = procedure(data: pointer; thread: PEcore_Thread; msg_data: pointer); cdecl;

function ecore_thread_run(func_blocking: TEcore_Thread_Cb; func_end: TEcore_Thread_Cb; func_cancel: TEcore_Thread_Cb; data: pointer): PEcore_Thread; cdecl; external libecore;
function ecore_thread_feedback_run(func_heavy: TEcore_Thread_Cb; func_notify: TEcore_Thread_Notify_Cb; func_end: TEcore_Thread_Cb; func_cancel: TEcore_Thread_Cb; data: pointer; try_no_queue: TEina_Bool): PEcore_Thread; cdecl; external libecore;
function ecore_thread_cancel(thread: PEcore_Thread): TEina_Bool; cdecl; external libecore;
function ecore_thread_wait(thread: PEcore_Thread; wait: double): TEina_Bool; cdecl; external libecore;
function ecore_thread_check(thread: PEcore_Thread): TEina_Bool; cdecl; external libecore;
function ecore_thread_feedback(thread: PEcore_Thread; msg_data: pointer): TEina_Bool; cdecl; external libecore;
function ecore_thread_reschedule(thread: PEcore_Thread): TEina_Bool; cdecl; external libecore;
function ecore_thread_active_get: longint; cdecl; external libecore;
function ecore_thread_pending_get: longint; cdecl; external libecore;
function ecore_thread_pending_feedback_get: longint; cdecl; external libecore;
function ecore_thread_pending_total_get: longint; cdecl; external libecore;
function ecore_thread_max_get: longint; cdecl; external libecore;
procedure ecore_thread_max_set(num: longint); cdecl; external libecore;
procedure ecore_thread_max_reset; cdecl; external libecore;
function ecore_thread_available_get: longint; cdecl; external libecore;
function ecore_thread_name_set(thread: PEcore_Thread; name: pchar): TEina_Bool; cdecl; external libecore;
function ecore_thread_local_data_add(thread: PEcore_Thread; key: pchar; value: pointer; cb: TEina_Free_Cb; direct: TEina_Bool): TEina_Bool; cdecl; external libecore;
function ecore_thread_local_data_set(thread: PEcore_Thread; key: pchar; value: pointer; cb: TEina_Free_Cb): pointer; cdecl; external libecore;
function ecore_thread_local_data_find(thread: PEcore_Thread; key: pchar): pointer; cdecl; external libecore;
function ecore_thread_local_data_del(thread: PEcore_Thread; key: pchar): TEina_Bool; cdecl; external libecore;
function ecore_thread_global_data_add(key: pchar; value: pointer; cb: TEina_Free_Cb; direct: TEina_Bool): TEina_Bool; cdecl; external libecore;
function ecore_thread_global_data_set(key: pchar; value: pointer; cb: TEina_Free_Cb): pointer; cdecl; external libecore;
function ecore_thread_global_data_find(key: pchar): pointer; cdecl; external libecore;
function ecore_thread_global_data_del(key: pchar): TEina_Bool; cdecl; external libecore;
function ecore_thread_global_data_wait(key: pchar; seconds: double): pointer; cdecl; external libecore;

type
  TEcore_Pipe = record
  end;
  PEcore_Pipe = ^TEcore_Pipe;

  TEcore_Pipe_Cb = procedure(data: pointer; buffer: pointer; nbyte: dword); cdecl;

function ecore_pipe_add(handler: TEcore_Pipe_Cb; data: pointer): PEcore_Pipe; cdecl; external libecore;
function ecore_pipe_full_add(handler: TEcore_Pipe_Cb; data: pointer; fd_read: longint; fd_write: longint; read_survive_fork: TEina_Bool; write_survive_fork: TEina_Bool): PEcore_Pipe; cdecl; external libecore;
function ecore_pipe_del(p: PEcore_Pipe): pointer; cdecl; external libecore;
function ecore_pipe_write(p: PEcore_Pipe; buffer: pointer; nbytes: dword): TEina_Bool; cdecl; external libecore;
procedure ecore_pipe_write_close(p: PEcore_Pipe); cdecl; external libecore;
procedure ecore_pipe_read_close(p: PEcore_Pipe); cdecl; external libecore;
function ecore_pipe_read_fd(p: PEcore_Pipe): longint; cdecl; external libecore;
function ecore_pipe_write_fd(p: PEcore_Pipe): longint; cdecl; external libecore;
procedure ecore_pipe_thaw(p: PEcore_Pipe); cdecl; external libecore;
procedure ecore_pipe_freeze(p: PEcore_Pipe); cdecl; external libecore;
function ecore_pipe_wait(p: PEcore_Pipe; message_count: longint; wait: double): longint; cdecl; external libecore;
procedure ecore_app_args_set(argc: longint; argv: PPchar); cdecl; external libecore;
procedure ecore_app_args_get(argc: Plongint; argv: PPPchar); cdecl; external libecore;
procedure ecore_app_restart; cdecl; external libecore;
procedure ecore_app_no_system_modules; cdecl; external libecore;
procedure ecore_throttle_adjust(amount: double); cdecl; external libecore;
function ecore_throttle_get: double; cdecl; external libecore;

type
  PEcore_Animator_Source = ^TEcore_Animator_Source;
  TEcore_Animator_Source = longint;

const
  ECORE_ANIMATOR_SOURCE_TIMER = 0;
  ECORE_ANIMATOR_SOURCE_CUSTOM = 1;

type
  TEcore_Timeline_Cb = function(data: pointer; pos: double): TEina_Bool; cdecl;

type
  PEcore_Pos_Map = ^TEcore_Pos_Map;
  TEcore_Pos_Map = longint;

const
  ECORE_POS_MAP_LINEAR = 0;
  ECORE_POS_MAP_ACCELERATE = 1;
  ECORE_POS_MAP_DECELERATE = 2;
  ECORE_POS_MAP_SINUSOIDAL = 3;
  ECORE_POS_MAP_ACCELERATE_FACTOR = 4;
  ECORE_POS_MAP_DECELERATE_FACTOR = 5;
  ECORE_POS_MAP_SINUSOIDAL_FACTOR = 6;
  ECORE_POS_MAP_DIVISOR_INTERP = 7;
  ECORE_POS_MAP_BOUNCE = 8;
  ECORE_POS_MAP_SPRING = 9;
  ECORE_POS_MAP_CUBIC_BEZIER = 10;

procedure ecore_animator_frametime_set(frametime: double); cdecl; external libecore;
function ecore_animator_frametime_get: double; cdecl; external libecore;
function ecore_animator_pos_map(pos: double; map: TEcore_Pos_Map; v1: double; v2: double): double; cdecl; external libecore;
function ecore_animator_pos_map_n(pos: double; map: TEcore_Pos_Map; v_size: longint; v: Pdouble): double; cdecl; external libecore;
procedure ecore_animator_source_set(source: TEcore_Animator_Source); cdecl; external libecore;
function ecore_animator_source_get: TEcore_Animator_Source; cdecl; external libecore;
procedure ecore_animator_custom_source_tick_begin_callback_set(func: TEcore_Cb; data: pointer); cdecl; external libecore;
procedure ecore_animator_custom_source_tick_end_callback_set(func: TEcore_Cb; data: pointer); cdecl; external libecore;
procedure ecore_animator_custom_tick; cdecl; external libecore;

type
  PEcore_Timer = ^TEcore_Timer;
  TEcore_Timer = TEo;

function ecore_timer_precision_get: double; cdecl; external libecore;
procedure ecore_timer_precision_set(precision: double); cdecl; external libecore;
function ecore_timer_dump: pchar; cdecl; external libecore;

type
  TEcore_Factorized_Idle = record
  end;
  PEcore_Factorized_Idle = ^TEcore_Factorized_Idle;

  TEcore_Idler = TEcore_Factorized_Idle;
  PEcore_Idler = ^TEcore_Idler;
  TEcore_Idle_Enterer = TEcore_Factorized_Idle;
  PEcore_Idle_Enterer = ^TEcore_Idle_Enterer;
  TEcore_Idle_Exiter = TEcore_Factorized_Idle;
  PEcore_Idle_Exiter = ^TEcore_Idle_Exiter;

  TEcore_Job = record
  end;
  PEcore_Job = ^TEcore_Job;

  // === Konventiert am: 20-5-25 19:18:30 ===


  {$ENDIF read_interface}


  {$IFDEF read_implementation}


  {$ENDIF read_implementation}
