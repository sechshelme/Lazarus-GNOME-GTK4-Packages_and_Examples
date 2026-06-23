unit gmain;

interface

uses
  common_GLIB, gtypes, gslist, gthread, gpoll;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PGIOCondition = ^TGIOCondition;
  TGIOCondition = longint;
const
  G_IO_IN = GLIB_SYSDEF_POLLIN;
  G_IO_OUT = GLIB_SYSDEF_POLLOUT;
  G_IO_PRI = GLIB_SYSDEF_POLLPRI;
  G_IO_ERR = GLIB_SYSDEF_POLLERR;
  G_IO_HUP = GLIB_SYSDEF_POLLHUP;
  //  G_IO_NVAL  =GLIB_SYSDEF_POLLNVA;

type
  PGMainContextFlags = ^TGMainContextFlags;
  TGMainContextFlags = longint;
const
  G_MAIN_CONTEXT_FLAGS_NONE = 0;
  G_MAIN_CONTEXT_FLAGS_OWNERLESS_POLLING = 1;

type
  PGMainContext = type Pointer;
  PGMainLoop = type Pointer;
  PGSourcePrivate = type Pointer;

  PGSource = ^TGSource;

  PGSourceFunc = ^TGSourceFunc;
  TGSourceFunc = function(user_data: Tgpointer): Tgboolean; cdecl;
  TGSourceOnceFunc = procedure(user_data: Tgpointer); cdecl;

  {xxxxxxxxxxxxxx#define G_SOURCE_FUNC(f) ((GSourceFunc) (void (*)(void)) (f)) GLIB_AVAILABLE_MACRO_IN_2_58 }

  TGChildWatchFunc = procedure(pid: TGPid; wait_status: Tgint; user_data: Tgpointer); cdecl;
  TGSourceDisposeFunc = procedure(source: PGSource); cdecl;

  PGSourceCallbackFuncs = ^TGSourceCallbackFuncs;
  PGSourceFuncs = ^TGSourceFuncs;

  TGSource = record
    callback_data: Tgpointer;
    callback_funcs: PGSourceCallbackFuncs;
    source_funcs: PGSourceFuncs;
    ref_count: Tguint;
    context: PGMainContext;
    priority: Tgint;
    flags: Tguint;
    source_id: Tguint;
    poll_fds: PGSList;
    prev: PGSource;
    next: PGSource;
    name: pchar;
    priv: PGSourcePrivate;
  end;

  TGSourceCallbackFuncs = record
    ref: procedure(cb_data: Tgpointer); cdecl;
    unref: procedure(cb_data: Tgpointer); cdecl;
    get: procedure(cb_data: Tgpointer; source: PGSource; func: PGSourceFunc; data: Pgpointer); cdecl;
  end;

  TGSourceDummyMarshal = procedure(para1: pointer); cdecl;
  TGSourceFuncsPrepareFunc = function(source: PGSource; timeout_: Pgint): Tgboolean; cdecl;
  TGSourceFuncsCheckFunc = function(source: PGSource): Tgboolean; cdecl;
  TGSourceFuncsDispatchFunc = function(source: PGSource; callback: TGSourceFunc; user_data: Tgpointer): Tgboolean; cdecl;
  TGSourceFuncsFinalizeFunc = procedure(source: PGSource); cdecl;

  TGSourceFuncs = record
    prepare: TGSourceFuncsPrepareFunc;
    check: TGSourceFuncsCheckFunc;
    dispatch: TGSourceFuncsDispatchFunc;
    finalize: TGSourceFuncsFinalizeFunc;
    closure_callback: TGSourceFunc;
    closure_marshal: TGSourceDummyMarshal;
  end;

const
  G_PRIORITY_HIGH = -(100);
  G_PRIORITY_DEFAULT = 0;
  G_PRIORITY_HIGH_IDLE = 100;
  G_PRIORITY_DEFAULT_IDLE = 200;
  G_PRIORITY_LOW = 300;
  G_SOURCE_REMOVE_ = False;
  G_SOURCE_CONTINUE = True;

function g_main_context_new: PGMainContext; cdecl; external libglib2;
function g_main_context_new_with_flags(flags: TGMainContextFlags): PGMainContext; cdecl; external libglib2;
function g_main_context_ref(context: PGMainContext): PGMainContext; cdecl; external libglib2;
procedure g_main_context_unref(context: PGMainContext); cdecl; external libglib2;
function g_main_context_default: PGMainContext; cdecl; external libglib2;
function g_main_context_iteration(context: PGMainContext; may_block: Tgboolean): Tgboolean; cdecl; external libglib2;
function g_main_context_pending(context: PGMainContext): Tgboolean; cdecl; external libglib2;

function g_main_context_find_source_by_id(context: PGMainContext; source_id: Tguint): PGSource; cdecl; external libglib2;
function g_main_context_find_source_by_user_data(context: PGMainContext; user_data: Tgpointer): PGSource; cdecl; external libglib2;
function g_main_context_find_source_by_funcs_user_data(context: PGMainContext; funcs: PGSourceFuncs; user_data: Tgpointer): PGSource; cdecl; external libglib2;

procedure g_main_context_wakeup(context: PGMainContext); cdecl; external libglib2;
function g_main_context_acquire(context: PGMainContext): Tgboolean; cdecl; external libglib2;
procedure g_main_context_release(context: PGMainContext); cdecl; external libglib2;
function g_main_context_is_owner(context: PGMainContext): Tgboolean; cdecl; external libglib2;
function g_main_context_wait(context: PGMainContext; cond: PGCond; mutex: PGMutex): Tgboolean; cdecl; external libglib2; deprecated;
function g_main_context_prepare(context: PGMainContext; priority: Pgint): Tgboolean; cdecl; external libglib2;
function g_main_context_query(context: PGMainContext; max_priority: Tgint; timeout_: Pgint; fds: PGPollFD; n_fds: Tgint): Tgint; cdecl; external libglib2;
function g_main_context_check(context: PGMainContext; max_priority: Tgint; fds: PGPollFD; n_fds: Tgint): Tgboolean; cdecl; external libglib2;
procedure g_main_context_dispatch(context: PGMainContext); cdecl; external libglib2;
procedure g_main_context_set_poll_func(context: PGMainContext; func: TGPollFunc); cdecl; external libglib2;
function g_main_context_get_poll_func(context: PGMainContext): TGPollFunc; cdecl; external libglib2;

procedure g_main_context_add_poll(context: PGMainContext; fd: PGPollFD; priority: Tgint); cdecl; external libglib2;
procedure g_main_context_remove_poll(context: PGMainContext; fd: PGPollFD); cdecl; external libglib2;
function g_main_depth: Tgint; cdecl; external libglib2;
function g_main_current_source: PGSource; cdecl; external libglib2;

procedure g_main_context_push_thread_default(context: PGMainContext); cdecl; external libglib2;
procedure g_main_context_pop_thread_default(context: PGMainContext); cdecl; external libglib2;
function g_main_context_get_thread_default: PGMainContext; cdecl; external libglib2;
function g_main_context_ref_thread_default: PGMainContext; cdecl; external libglib2;
type
  PGMainContextPusher = ^TGMainContextPusher;
  TGMainContextPusher = pointer;
{*xxxxxxxxxxxxx

GLIB_AVAILABLE_STATIC_INLINE_IN_2_64
static inline GMainContextPusher *g_main_context_pusher_new (GMainContext *main_context);

GLIB_AVAILABLE_STATIC_INLINE_IN_2_64
static inline GMainContextPusher *
g_main_context_pusher_new (GMainContext *main_context)

  g_main_context_push_thread_default (main_context);
  return (GMainContextPusher *) main_context;




GLIB_AVAILABLE_STATIC_INLINE_IN_2_64
static inline void g_main_context_pusher_free (GMainContextPusher *pusher);

GLIB_AVAILABLE_STATIC_INLINE_IN_2_64
static inline void
g_main_context_pusher_free (GMainContextPusher *pusher)

  g_main_context_pop_thread_default ((GMainContext *) pusher);


  }
function g_main_loop_new(context: PGMainContext; is_running: Tgboolean): PGMainLoop; cdecl; external libglib2;
procedure g_main_loop_run(loop: PGMainLoop); cdecl; external libglib2;
procedure g_main_loop_quit(loop: PGMainLoop); cdecl; external libglib2;
function g_main_loop_ref(loop: PGMainLoop): PGMainLoop; cdecl; external libglib2;
procedure g_main_loop_unref(loop: PGMainLoop); cdecl; external libglib2;
function g_main_loop_is_running(loop: PGMainLoop): Tgboolean; cdecl; external libglib2;
function g_main_loop_get_context(loop: PGMainLoop): PGMainContext; cdecl; external libglib2;

function g_source_new(source_funcs: PGSourceFuncs; struct_size: Tguint): PGSource; cdecl; external libglib2;
procedure g_source_set_dispose_function(source: PGSource; _dispose: TGSourceDisposeFunc); cdecl; external libglib2;
function g_source_ref(source: PGSource): PGSource; cdecl; external libglib2;
procedure g_source_unref(source: PGSource); cdecl; external libglib2;
function g_source_attach(source: PGSource; context: PGMainContext): Tguint; cdecl; external libglib2;
procedure g_source_destroy(source: PGSource); cdecl; external libglib2;
procedure g_source_set_priority(source: PGSource; priority: Tgint); cdecl; external libglib2;
function g_source_get_priority(source: PGSource): Tgint; cdecl; external libglib2;
procedure g_source_set_can_recurse(source: PGSource; can_recurse: Tgboolean); cdecl; external libglib2;
function g_source_get_can_recurse(source: PGSource): Tgboolean; cdecl; external libglib2;
function g_source_get_id(source: PGSource): Tguint; cdecl; external libglib2;
function g_source_get_context(source: PGSource): PGMainContext; cdecl; external libglib2;
function g_source_dup_context(source: PGSource): PGMainContext; cdecl; external libglib2;
procedure g_source_set_callback(source: PGSource; func: TGSourceFunc; data: Tgpointer; notify: TGDestroyNotify); cdecl; external libglib2;
procedure g_source_set_funcs(source: PGSource; funcs: PGSourceFuncs); cdecl; external libglib2;
function g_source_is_destroyed(source: PGSource): Tgboolean; cdecl; external libglib2;
procedure g_source_set_name(source: PGSource; name: pchar); cdecl; external libglib2;
procedure g_source_set_static_name(source: PGSource; name: pchar); cdecl; external libglib2;
function g_source_get_name(source: PGSource): pchar; cdecl; external libglib2;
procedure g_source_set_name_by_id(tag: Tguint; name: pchar); cdecl; external libglib2;
procedure g_source_set_ready_time(source: PGSource; ready_time: Tgint64); cdecl; external libglib2;
function g_source_get_ready_time(source: PGSource): Tgint64; cdecl; external libglib2;
{$ifdef G_OS_UNIX}
function g_source_add_unix_fd(source: PGSource; fd: Tgint; events: TGIOCondition): Tgpointer; cdecl; external libglib2;
procedure g_source_modify_unix_fd(source: PGSource; tag: Tgpointer; new_events: TGIOCondition); cdecl; external libglib2;
procedure g_source_remove_unix_fd(source: PGSource; tag: Tgpointer); cdecl; external libglib2;
function g_source_query_unix_fd(source: PGSource; tag: Tgpointer): TGIOCondition; cdecl; external libglib2;
{$endif}

procedure g_source_set_callback_indirect(source: PGSource; callback_data: Tgpointer; callback_funcs: PGSourceCallbackFuncs); cdecl; external libglib2;
procedure g_source_add_poll(source: PGSource; fd: PGPollFD); cdecl; external libglib2;
procedure g_source_remove_poll(source: PGSource; fd: PGPollFD); cdecl; external libglib2;
procedure g_source_add_child_source(source: PGSource; child_source: PGSource); cdecl; external libglib2;
procedure g_source_remove_child_source(source: PGSource; child_source: PGSource); cdecl; external libglib2;
procedure g_source_get_current_time(source: PGSource; timeval: PGTimeVal); cdecl; external libglib2; deprecated;
function g_source_get_time(source: PGSource): Tgint64; cdecl; external libglib2;

function g_idle_source_new: PGSource; cdecl; external libglib2;
function g_child_watch_source_new(pid: TGPid): PGSource; cdecl; external libglib2;
function g_timeout_source_new(interval: Tguint): PGSource; cdecl; external libglib2;
function g_timeout_source_new_seconds(interval: Tguint): PGSource; cdecl; external libglib2;

procedure g_get_current_time(result: PGTimeVal); cdecl; external libglib2; deprecated;
function g_get_monotonic_time: Tgint64; cdecl; external libglib2;
function g_get_monotonic_time_ns: uint64; cdecl; external libglib2;
function g_get_real_time: Tgint64; cdecl; external libglib2;

function g_source_remove(tag: Tguint): Tgboolean; cdecl; external libglib2;
function g_source_remove_by_user_data(user_data: Tgpointer): Tgboolean; cdecl; external libglib2;
function g_source_remove_by_funcs_user_data(funcs: PGSourceFuncs; user_data: Tgpointer): Tgboolean; cdecl; external libglib2;
type
  TGClearHandleFunc = procedure(handle_id: Tguint); cdecl;

procedure g_clear_handle_id(tag_ptr: Pguint; clear_func: TGClearHandleFunc); cdecl; external libglib2;
{* xxxxxxxxxxx
GLIB_AVAILABLE_STATIC_INLINE_IN_2_84
static inline unsigned int g_steal_handle_id (unsigned int *handle_pointer);

GLIB_AVAILABLE_STATIC_INLINE_IN_2_84
static inline unsigned int
g_steal_handle_id (unsigned int *handle_pointer)

  unsigned int handle;

  handle = *handle_pointer;
  *handle_pointer = 0;

  return handle;

  }
function g_timeout_add_full(priority: Tgint; interval: Tguint; _function: TGSourceFunc; data: Tgpointer; notify: TGDestroyNotify): Tguint; cdecl; external libglib2;
function g_timeout_add(interval: Tguint; _function: TGSourceFunc; data: Tgpointer): Tguint; cdecl; external libglib2;
function g_timeout_add_once(interval: Tguint; _function: TGSourceOnceFunc; data: Tgpointer): Tguint; cdecl; external libglib2;
function g_timeout_add_seconds_full(priority: Tgint; interval: Tguint; _function: TGSourceFunc; data: Tgpointer; notify: TGDestroyNotify): Tguint; cdecl; external libglib2;
function g_timeout_add_seconds(interval: Tguint; _function: TGSourceFunc; data: Tgpointer): Tguint; cdecl; external libglib2;
function g_timeout_add_seconds_once(interval: Tguint; _function: TGSourceOnceFunc; data: Tgpointer): Tguint; cdecl; external libglib2;
function g_child_watch_add_full(priority: Tgint; pid: TGPid; _function: TGChildWatchFunc; data: Tgpointer; notify: TGDestroyNotify): Tguint; cdecl; external libglib2;
function g_child_watch_add(pid: TGPid; _function: TGChildWatchFunc; data: Tgpointer): Tguint; cdecl; external libglib2;
function g_idle_add(_function: TGSourceFunc; data: Tgpointer): Tguint; cdecl; external libglib2;
function g_idle_add_full(priority: Tgint; _function: TGSourceFunc; data: Tgpointer; notify: TGDestroyNotify): Tguint; cdecl; external libglib2;
function g_idle_add_once(_function: TGSourceOnceFunc; data: Tgpointer): Tguint; cdecl; external libglib2;
function g_idle_remove_by_data(data: Tgpointer): Tgboolean; cdecl; external libglib2;
procedure g_main_context_invoke_full(context: PGMainContext; priority: Tgint; _function: TGSourceFunc; data: Tgpointer; notify: TGDestroyNotify); cdecl; external libglib2;
procedure g_main_context_invoke(context: PGMainContext; _function: TGSourceFunc; data: Tgpointer); cdecl; external libglib2;
{*xxxxxxxxxxxxxxxxxx
GLIB_AVAILABLE_STATIC_INLINE_IN_2_70
static inline int g_steal_fd (int *fd_ptr);

GLIB_AVAILABLE_STATIC_INLINE_IN_2_70
static inline int
g_steal_fd (int *fd_ptr)

  int fd = *fd_ptr;
  *fd_ptr = -1;
  return fd;

  }
var
  g_timeout_funcs: TGSourceFuncs; cvar;external libglib2;
  g_child_watch_funcs: TGSourceFuncs; cvar;external libglib2;
  g_idle_funcs: TGSourceFuncs; cvar;external libglib2;
  {$ifdef linux}
  g_unix_signal_funcs: TGSourceFuncs; cvar;external libglib2;
  g_unix_fd_source_funcs: TGSourceFuncs; cvar;external libglib2;
  {$endif}

  // === Konventiert am: 22-6-26 17:10:43 ===


implementation



end.
