{$IFDEF read_interface}


const
  BEV_EVENT_READING = $01;
  BEV_EVENT_WRITING = $02;
  BEV_EVENT_EOF = $10;
  BEV_EVENT_ERROR = $20;
  BEV_EVENT_TIMEOUT = $40;
  BEV_EVENT_CONNECTED = $80;

type
  Tbufferevent_options = longint;

const
  BEV_OPT_CLOSE_ON_FREE = 1 shl 0;
  BEV_OPT_THREADSAFE = 1 shl 1;
  BEV_OPT_DEFER_CALLBACKS = 1 shl 2;
  BEV_OPT_UNLOCK_CALLBACKS = 1 shl 3;

function bufferevent_socket_new(base: Pevent_base; fd: Tevutil_socket_t; options: longint): Pbufferevent; cdecl; external libevent;
function bufferevent_socket_connect(para1: Pbufferevent; para2: Psockaddr; para3: longint): longint; cdecl; external libevent;
function bufferevent_socket_connect_hostname(para1: Pbufferevent; para2: Pevdns_base; para3: longint; para4: pchar; para5: longint): longint; cdecl; external libevent;
function bufferevent_socket_get_dns_error(bev: Pbufferevent): longint; cdecl; external libevent;
function bufferevent_base_set(base: Pevent_base; bufev: Pbufferevent): longint; cdecl; external libevent;
function bufferevent_get_base(bev: Pbufferevent): Pevent_base; cdecl; external libevent;
function bufferevent_priority_set(bufev: Pbufferevent; pri: longint): longint; cdecl; external libevent;
function bufferevent_get_priority(bufev: Pbufferevent): longint; cdecl; external libevent;
procedure bufferevent_free(bufev: Pbufferevent); cdecl; external libevent;
procedure bufferevent_setcb(bufev: Pbufferevent; readcb: Tbufferevent_data_cb; writecb: Tbufferevent_data_cb; eventcb: Tbufferevent_event_cb; cbarg: pointer); cdecl; external libevent;
procedure bufferevent_getcb(bufev: Pbufferevent; readcb_ptr: Pbufferevent_data_cb; writecb_ptr: Pbufferevent_data_cb; eventcb_ptr: Pbufferevent_event_cb; cbarg_ptr: Ppointer); cdecl; external libevent;
function bufferevent_setfd(bufev: Pbufferevent; fd: Tevutil_socket_t): longint; cdecl; external libevent;
function bufferevent_getfd(bufev: Pbufferevent): Tevutil_socket_t; cdecl; external libevent;
function bufferevent_get_underlying(bufev: Pbufferevent): Pbufferevent; cdecl; external libevent;
function bufferevent_write(bufev: Pbufferevent; data: pointer; size: Tsize_t): longint; cdecl; external libevent;
function bufferevent_write_buffer(bufev: Pbufferevent; buf: Pevbuffer): longint; cdecl; external libevent;
function bufferevent_read(bufev: Pbufferevent; data: pointer; size: Tsize_t): Tsize_t; cdecl; external libevent;
function bufferevent_read_buffer(bufev: Pbufferevent; buf: Pevbuffer): longint; cdecl; external libevent;
function bufferevent_get_input(bufev: Pbufferevent): Pevbuffer; cdecl; external libevent;
function bufferevent_get_output(bufev: Pbufferevent): Pevbuffer; cdecl; external libevent;
function bufferevent_enable(bufev: Pbufferevent; event: smallint): longint; cdecl; external libevent;
function bufferevent_disable(bufev: Pbufferevent; event: smallint): longint; cdecl; external libevent;
function bufferevent_get_enabled(bufev: Pbufferevent): smallint; cdecl; external libevent;
function bufferevent_set_timeouts(bufev: Pbufferevent; timeout_read: Ptimeval; timeout_write: Ptimeval): longint; cdecl; external libevent;
procedure bufferevent_setwatermark(bufev: Pbufferevent; events: smallint; lowmark: Tsize_t; highmark: Tsize_t); cdecl; external libevent;
function bufferevent_getwatermark(bufev: Pbufferevent; events: smallint; lowmark: Psize_t; highmark: Psize_t): longint; cdecl; external libevent;
procedure bufferevent_lock(bufev: Pbufferevent); cdecl; external libevent;
procedure bufferevent_unlock(bufev: Pbufferevent); cdecl; external libevent;
procedure bufferevent_incref(bufev: Pbufferevent); cdecl; external libevent;
function bufferevent_decref(bufev: Pbufferevent): longint; cdecl; external libevent;

type
  Tbufferevent_flush_mode = longint;

const
  BEV_NORMAL = 0;
  BEV_FLUSH = 1;
  BEV_FINISHED = 2;

function bufferevent_flush(bufev: Pbufferevent; iotype: smallint; mode: Tbufferevent_flush_mode): longint; cdecl; external libevent;

type
  Tbufferevent_trigger_options = longint;

const
  BEV_TRIG_IGNORE_WATERMARKS = 1 shl 16;
  BEV_TRIG_DEFER_CALLBACKS = BEV_OPT_DEFER_CALLBACKS;

procedure bufferevent_trigger(bufev: Pbufferevent; iotype: smallint; options: longint); cdecl; external libevent;
procedure bufferevent_trigger_event(bufev: Pbufferevent; what: smallint; options: longint); cdecl; external libevent;

type
  Tbufferevent_filter_result = longint;

const
  BEV_OK = 0;
  BEV_NEED_MORE = 1;
  BEV_ERROR = 2;

type
  Tbufferevent_filter_cb = function(src: Pevbuffer; dst: Pevbuffer; dst_limit: Tev_ssize_t; mode: Tbufferevent_flush_mode; ctx: pointer): Tbufferevent_filter_result; cdecl;

type
  TFree_Proc = procedure(para1: pointer);

function bufferevent_filter_new(underlying: Pbufferevent; input_filter: Tbufferevent_filter_cb; output_filter: Tbufferevent_filter_cb; options: longint; free_context: TFree_Proc;
  ctx: pointer): Pbufferevent; cdecl; external libevent;
function bufferevent_pair_new(base: Pevent_base; options: longint; pair: Pbufferevent): longint; cdecl; external libevent;
function bufferevent_pair_get_partner(bev: Pbufferevent): Pbufferevent; cdecl; external libevent;

type
  Pev_token_bucket_cfg = type Pointer;
  Pbufferevent_rate_limit_group = type Pointer;

const
  EV_RATE_LIMIT_MAX = EV_SSIZE_MAX;

function ev_token_bucket_cfg_new(read_rate: Tsize_t; read_burst: Tsize_t; write_rate: Tsize_t; write_burst: Tsize_t; tick_len: Ptimeval): Pev_token_bucket_cfg; cdecl; external libevent;
procedure ev_token_bucket_cfg_free(cfg: Pev_token_bucket_cfg); cdecl; external libevent;
function bufferevent_set_rate_limit(bev: Pbufferevent; cfg: Pev_token_bucket_cfg): longint; cdecl; external libevent;
function bufferevent_rate_limit_group_new(base: Pevent_base; cfg: Pev_token_bucket_cfg): Pbufferevent_rate_limit_group; cdecl; external libevent;
function bufferevent_rate_limit_group_set_cfg(para1: Pbufferevent_rate_limit_group; para2: Pev_token_bucket_cfg): longint; cdecl; external libevent;
function bufferevent_rate_limit_group_set_min_share(para1: Pbufferevent_rate_limit_group; para2: Tsize_t): longint; cdecl; external libevent;
procedure bufferevent_rate_limit_group_free(para1: Pbufferevent_rate_limit_group); cdecl; external libevent;
function bufferevent_add_to_rate_limit_group(bev: Pbufferevent; g: Pbufferevent_rate_limit_group): longint; cdecl; external libevent;
function bufferevent_remove_from_rate_limit_group(bev: Pbufferevent): longint; cdecl; external libevent;
function bufferevent_set_max_single_read(bev: Pbufferevent; size: Tsize_t): longint; cdecl; external libevent;
function bufferevent_set_max_single_write(bev: Pbufferevent; size: Tsize_t): longint; cdecl; external libevent;
function bufferevent_get_max_single_read(bev: Pbufferevent): Tev_ssize_t; cdecl; external libevent;
function bufferevent_get_max_single_write(bev: Pbufferevent): Tev_ssize_t; cdecl; external libevent;
function bufferevent_get_read_limit(bev: Pbufferevent): Tev_ssize_t; cdecl; external libevent;
function bufferevent_get_write_limit(bev: Pbufferevent): Tev_ssize_t; cdecl; external libevent;
function bufferevent_get_max_to_read(bev: Pbufferevent): Tev_ssize_t; cdecl; external libevent;
function bufferevent_get_max_to_write(bev: Pbufferevent): Tev_ssize_t; cdecl; external libevent;
function bufferevent_get_token_bucket_cfg(bev: Pbufferevent): Pev_token_bucket_cfg; cdecl; external libevent;
function bufferevent_rate_limit_group_get_read_limit(para1: Pbufferevent_rate_limit_group): Tev_ssize_t; cdecl; external libevent;
function bufferevent_rate_limit_group_get_write_limit(para1: Pbufferevent_rate_limit_group): Tev_ssize_t; cdecl; external libevent;
function bufferevent_decrement_read_limit(bev: Pbufferevent; decr: Tev_ssize_t): longint; cdecl; external libevent;
function bufferevent_decrement_write_limit(bev: Pbufferevent; decr: Tev_ssize_t): longint; cdecl; external libevent;
function bufferevent_rate_limit_group_decrement_read(para1: Pbufferevent_rate_limit_group; para2: Tev_ssize_t): longint; cdecl; external libevent;
function bufferevent_rate_limit_group_decrement_write(para1: Pbufferevent_rate_limit_group; para2: Tev_ssize_t): longint; cdecl; external libevent;
procedure bufferevent_rate_limit_group_get_totals(grp: Pbufferevent_rate_limit_group; total_read_out: Pev_uint64_t; total_written_out: Pev_uint64_t); cdecl; external libevent;
procedure bufferevent_rate_limit_group_reset_totals(grp: Pbufferevent_rate_limit_group); cdecl; external libevent;

// === Konventiert am: 26-8-25 17:43:37 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
