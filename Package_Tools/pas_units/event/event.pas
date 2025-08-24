unit event;

interface

uses
  fp_event, event_config, util;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  Pevent_base = type Pointer;
  PPevent_base = ^Pevent_base;
  Pevent = type Pointer;
  Pevent_config = type Pointer;

procedure event_enable_debug_mode; cdecl; external libevent;
procedure event_debug_unassign(para1: Pevent); cdecl; external libevent;
function event_base_new: Pevent_base; cdecl; external libevent;
function event_reinit(base: Pevent_base): longint; cdecl; external libevent;
function event_base_dispatch(para1: Pevent_base): longint; cdecl; external libevent;
function event_base_get_method(para1: Pevent_base): pchar; cdecl; external libevent;
function event_get_supported_methods: PPchar; cdecl; external libevent;
function event_gettime_monotonic(base: Pevent_base; tp: Ptimeval): longint; cdecl; external libevent;

const
  EVENT_BASE_COUNT_ACTIVE = 1;
  EVENT_BASE_COUNT_VIRTUAL = 2;
  EVENT_BASE_COUNT_ADDED = 4;

function event_base_get_num_events(para1: Pevent_base; para2: dword): longint; cdecl; external libevent;
function event_base_get_max_events(para1: Pevent_base; para2: dword; para3: longint): longint; cdecl; external libevent;
function event_config_new: Pevent_config; cdecl; external libevent;
procedure event_config_free(cfg: Pevent_config); cdecl; external libevent;
function event_config_avoid_method(cfg: Pevent_config; method: pchar): longint; cdecl; external libevent;

type
  Tevent_method_feature = longint;

const
  EV_FEATURE_ET = $01;
  EV_FEATURE_O1 = $02;
  EV_FEATURE_FDS = $04;
  EV_FEATURE_EARLY_CLOSE = $08;

type
  Tevent_base_config_flag = longint;

const
  EVENT_BASE_FLAG_NOLOCK = $01;
  EVENT_BASE_FLAG_IGNORE_ENV = $02;
  EVENT_BASE_FLAG_STARTUP_IOCP = $04;
  EVENT_BASE_FLAG_NO_CACHE_TIME = $08;
  EVENT_BASE_FLAG_EPOLL_USE_CHANGELIST = $10;
  EVENT_BASE_FLAG_PRECISE_TIMER = $20;

function event_base_get_features(base: Pevent_base): longint; cdecl; external libevent;
function event_config_require_features(cfg: Pevent_config; feature: longint): longint; cdecl; external libevent;
function event_config_set_flag(cfg: Pevent_config; flag: longint): longint; cdecl; external libevent;
function event_config_set_num_cpus_hint(cfg: Pevent_config; cpus: longint): longint; cdecl; external libevent;
function event_config_set_max_dispatch_interval(cfg: Pevent_config; max_interval: Ptimeval; max_callbacks: longint; min_priority: longint): longint; cdecl; external libevent;
function event_base_new_with_config(para1: Pevent_config): Pevent_base; cdecl; external libevent;
procedure event_base_free(para1: Pevent_base); cdecl; external libevent;
procedure event_base_free_nofinalize(para1: Pevent_base); cdecl; external libevent;

const
  EVENT_LOG_DEBUG = 0;
  EVENT_LOG_MSG = 1;
  EVENT_LOG_WARN = 2;
  EVENT_LOG_ERR = 3;

const
  _EVENT_LOG_DEBUG = EVENT_LOG_DEBUG;
  _EVENT_LOG_MSG = EVENT_LOG_MSG;
  _EVENT_LOG_WARN = EVENT_LOG_WARN;
  _EVENT_LOG_ERR = EVENT_LOG_ERR;

type
  Tevent_log_cb = procedure(severity: longint; msg: pchar); cdecl;

procedure event_set_log_callback(cb: Tevent_log_cb); cdecl; external libevent;

type
  Tevent_fatal_cb = procedure(err: longint); cdecl;

procedure event_set_fatal_callback(cb: Tevent_fatal_cb); cdecl; external libevent;

const
  EVENT_DBG_ALL = $ffffffff;
  EVENT_DBG_NONE = 0;

procedure event_enable_debug_logging(which: Tev_uint32_t); cdecl; external libevent;
function event_base_set(para1: Pevent_base; para2: Pevent): longint; cdecl; external libevent;

const
  EVLOOP_ONCE = $01;
  EVLOOP_NONBLOCK = $02;
  EVLOOP_NO_EXIT_ON_EMPTY = $04;

function event_base_loop(para1: Pevent_base; para2: longint): longint; cdecl; external libevent;
function event_base_loopexit(para1: Pevent_base; para2: Ptimeval): longint; cdecl; external libevent;
function event_base_loopbreak(para1: Pevent_base): longint; cdecl; external libevent;
function event_base_loopcontinue(para1: Pevent_base): longint; cdecl; external libevent;
function event_base_got_exit(para1: Pevent_base): longint; cdecl; external libevent;
function event_base_got_break(para1: Pevent_base): longint; cdecl; external libevent;

const
  EV_TIMEOUT = $01;
  EV_READ = $02;
  EV_WRITE = $04;
  EV_SIGNAL = $08;
  EV_PERSIST = $10;
  EV_ET = $20;
  EV_FINALIZE = $40;
  EV_CLOSED = $80;

type
  Tevent_callback_fn = procedure(para1: Tevutil_socket_t; para2: smallint; para3: pointer); cdecl;
  Pevent_callback_fn = ^Tevent_callback_fn;

function event_self_cbarg: pointer; cdecl; external libevent;
function event_new(para1: Pevent_base; para2: Tevutil_socket_t; para3: smallint; para4: Tevent_callback_fn; para5: pointer): Pevent; cdecl; external libevent;
function event_assign(para1: Pevent; para2: Pevent_base; para3: Tevutil_socket_t; para4: smallint; para5: Tevent_callback_fn; para6: pointer): longint; cdecl; external libevent;
procedure event_free(para1: Pevent); cdecl; external libevent;

type
  Tevent_finalize_callback_fn = procedure(para1: Pevent; para2: pointer); cdecl;

function event_finalize(para1: dword; para2: Pevent; para3: Tevent_finalize_callback_fn): longint; cdecl; external libevent;
function event_free_finalize(para1: dword; para2: Pevent; para3: Tevent_finalize_callback_fn): longint; cdecl; external libevent;
function event_base_once(para1: Pevent_base; para2: Tevutil_socket_t; para3: smallint; para4: Tevent_callback_fn; para5: pointer; para6: Ptimeval): longint; cdecl; external libevent;
function event_add(ev: Pevent; timeout: Ptimeval): longint; cdecl; external libevent;
function event_remove_timer(ev: Pevent): longint; cdecl; external libevent;
function event_del(para1: Pevent): longint; cdecl; external libevent;
function event_del_noblock(ev: Pevent): longint; cdecl; external libevent;
function event_del_block(ev: Pevent): longint; cdecl; external libevent;
procedure event_active(ev: Pevent; res: longint; ncalls: smallint); cdecl; external libevent;
function event_pending(ev: Pevent; events: smallint; tv: Ptimeval): longint; cdecl; external libevent;
function event_base_get_running_event(base: Pevent_base): Pevent; cdecl; external libevent;
function event_initialized(ev: Pevent): longint; cdecl; external libevent;

function event_get_fd(ev: Pevent): Tevutil_socket_t; cdecl; external libevent;
function event_get_base(ev: Pevent): Pevent_base; cdecl; external libevent;
function event_get_events(ev: Pevent): smallint; cdecl; external libevent;
function event_get_callback(ev: Pevent): Tevent_callback_fn; cdecl; external libevent;
function event_get_callback_arg(ev: Pevent): pointer; cdecl; external libevent;
function event_get_priority(ev: Pevent): longint; cdecl; external libevent;
procedure event_get_assignment(event: Pevent; base_out: PPevent_base; fd_out: Pevutil_socket_t; events_out: Psmallint; callback_out: Pevent_callback_fn; arg_out: Ppointer); cdecl; external libevent;
function event_get_struct_event_size: Tsize_t; cdecl; external libevent;
function event_get_version: pchar; cdecl; external libevent;
function event_get_version_number: Tev_uint32_t; cdecl; external libevent;

const
  LIBEVENT_VERSION = EVENT__VERSION;
  LIBEVENT_VERSION_NUMBER = EVENT__NUMERIC_VERSION;
  EVENT_MAX_PRIORITIES = 256;

function event_base_priority_init(para1: Pevent_base; para2: longint): longint; cdecl; external libevent;
function event_base_get_npriorities(eb: Pevent_base): longint; cdecl; external libevent;
function event_priority_set(para1: Pevent; para2: longint): longint; cdecl; external libevent;
function event_base_init_common_timeout(base: Pevent_base; duration: Ptimeval): Ptimeval; cdecl; external libevent;

type
  TmallocFunc = function(sz: Tsize_t): pointer;
  TreallicFunc = function(ptr: pointer; sz: Tsize_t): pointer;
  TfreeFunc = procedure(ptr: pointer);

procedure event_set_mem_functions(malloc_fn: TmallocFunc; realloc_fn: TreallicFunc; free_fn: TfreeFunc); cdecl; external libevent;
procedure event_base_dump_events(para1: Pevent_base; para2: PFILE); cdecl; external libevent;
procedure event_base_active_by_fd(base: Pevent_base; fd: Tevutil_socket_t; events: smallint); cdecl; external libevent;
procedure event_base_active_by_signal(base: Pevent_base; sig: longint); cdecl; external libevent;

type
  Tevent_base_foreach_event_cb = function(para1: Pevent_base; para2: Pevent; para3: pointer): longint; cdecl;

function event_base_foreach_event(base: Pevent_base; fn: Tevent_base_foreach_event_cb; arg: pointer): longint; cdecl; external libevent;
function event_base_gettimeofday_cached(base: Pevent_base; tv: Ptimeval): longint; cdecl; external libevent;
function event_base_update_cache_time(base: Pevent_base): longint; cdecl; external libevent;
procedure libevent_global_shutdown; cdecl; external libevent;


function evtimer_assign(ev:Pevent; b:Pevent_base; cb:Tevent_callback_fn;arg: Pointer): longint;
function evtimer_new(b, cb, arg: longint): longint;
function evtimer_add(ev, tv: longint): longint;
function evtimer_del(ev: longint): longint;
function evtimer_pending(ev, tv: longint): longint;
function evtimer_initialized(ev: longint): longint;

function evsignal_add(ev, tv: longint): longint;
function evsignal_assign(ev, b, x, cb, arg: longint): longint;
function evsignal_new(b, x, cb, arg: longint): longint;
function evsignal_del(ev: longint): longint;
function evsignal_pending(ev, tv: longint): longint;
function evsignal_initialized(ev: longint): longint;

function evuser_new(b, cb, arg: longint): longint;
function evuser_del(ev: longint): longint;
function evuser_pending(ev, tv: longint): longint;
function evuser_initialized(ev: longint): longint;
function evuser_trigger(ev: longint): longint;

function event_get_signal(ev: longint): longint;



// === Konventiert am: 24-8-25 17:11:59 ===


implementation


function evtimer_assign(ev: Pevent; b: Pevent_base; cb: Tevent_callback_fn;
  arg: Pointer): longint;
begin
  evtimer_assign := event_assign(ev, b, -(1), 0, cb, arg);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }
function evtimer_new(b, cb, arg: longint): longint;
begin
  evtimer_new := event_new(b, -(1), 0, cb, arg);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }
function evtimer_add(ev, tv: longint): longint;
begin
  evtimer_add := event_add(ev, tv);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }
function evtimer_del(ev: longint): longint;
begin
  evtimer_del := event_del(ev);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }
function evtimer_pending(ev, tv: longint): longint;
begin
  evtimer_pending := event_pending(ev, EV_TIMEOUT, tv);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }
function evtimer_initialized(ev: longint): longint;
begin
  evtimer_initialized := event_initialized(ev);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }
function evsignal_add(ev, tv: longint): longint;
begin
  evsignal_add := event_add(ev, tv);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }
function evsignal_assign(ev, b, x, cb, arg: longint): longint;
begin
  evsignal_assign := event_assign(ev, b, x, EV_SIGNAL or EV_PERSIST, cb, arg);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }
function evsignal_new(b, x, cb, arg: longint): longint;
begin
  evsignal_new := event_new(b, x, EV_SIGNAL or EV_PERSIST, cb, arg);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }
function evsignal_del(ev: longint): longint;
begin
  evsignal_del := event_del(ev);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }
function evsignal_pending(ev, tv: longint): longint;
begin
  evsignal_pending := event_pending(ev, EV_SIGNAL, tv);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }
function evsignal_initialized(ev: longint): longint;
begin
  evsignal_initialized := event_initialized(ev);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }
function evuser_new(b, cb, arg: longint): longint;
begin
  evuser_new := event_new(b, -(1), 0, cb, arg);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }
function evuser_del(ev: longint): longint;
begin
  evuser_del := event_del(ev);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }
function evuser_pending(ev, tv: longint): longint;
begin
  evuser_pending := event_pending(ev, 0, tv);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }
function evuser_initialized(ev: longint): longint;
begin
  evuser_initialized := event_initialized(ev);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }
function evuser_trigger(ev: longint): longint;
begin
  evuser_trigger := event_active(ev, 0, 0);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function event_get_signal(ev: longint): longint;
begin
  event_get_signal := longint(event_get_fd(ev));
end;


end.
