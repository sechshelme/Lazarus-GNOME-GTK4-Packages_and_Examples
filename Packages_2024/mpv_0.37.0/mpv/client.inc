{$IFDEF read_interface}


const
  MPV_ENABLE_DEPRECATED = 1;

function mpv_client_api_version: dword; cdecl; external libmpv;

type
  Pmpv_handle = type Pointer;

type
  Pmpv_error = ^Tmpv_error;
  Tmpv_error = longint;

const
  MPV_ERROR_SUCCESS = 0;
  MPV_ERROR_EVENT_QUEUE_FULL = -(1);
  MPV_ERROR_NOMEM = -(2);
  MPV_ERROR_UNINITIALIZED = -(3);
  MPV_ERROR_INVALID_PARAMETER = -(4);
  MPV_ERROR_OPTION_NOT_FOUND = -(5);
  MPV_ERROR_OPTION_FORMAT = -(6);
  MPV_ERROR_OPTION_ERROR = -(7);
  MPV_ERROR_PROPERTY_NOT_FOUND = -(8);
  MPV_ERROR_PROPERTY_FORMAT = -(9);
  MPV_ERROR_PROPERTY_UNAVAILABLE = -(10);
  MPV_ERROR_PROPERTY_ERROR = -(11);
  MPV_ERROR_COMMAND = -(12);
  MPV_ERROR_LOADING_FAILED = -(13);
  MPV_ERROR_AO_INIT_FAILED = -(14);
  MPV_ERROR_VO_INIT_FAILED = -(15);
  MPV_ERROR_NOTHING_TO_PLAY = -(16);
  MPV_ERROR_UNKNOWN_FORMAT = -(17);
  MPV_ERROR_UNSUPPORTED = -(18);
  MPV_ERROR_NOT_IMPLEMENTED = -(19);
  MPV_ERROR_GENERIC = -(20);

function mpv_error_string(error: longint): pchar; cdecl; external libmpv;
procedure mpv_free(data: pointer); cdecl; external libmpv;
function mpv_client_name(ctx: Pmpv_handle): pchar; cdecl; external libmpv;
function mpv_client_id(ctx: Pmpv_handle): Tint64_t; cdecl; external libmpv;
function mpv_create: Pmpv_handle; cdecl; external libmpv;
function mpv_initialize(ctx: Pmpv_handle): longint; cdecl; external libmpv;
procedure mpv_destroy(ctx: Pmpv_handle); cdecl; external libmpv;
procedure mpv_terminate_destroy(ctx: Pmpv_handle); cdecl; external libmpv;
function mpv_create_client(ctx: Pmpv_handle; name: pchar): Pmpv_handle; cdecl; external libmpv;
function mpv_create_weak_client(ctx: Pmpv_handle; name: pchar): Pmpv_handle; cdecl; external libmpv;
function mpv_load_config_file(ctx: Pmpv_handle; filename: pchar): longint; cdecl; external libmpv;
function mpv_get_time_ns(ctx: Pmpv_handle): Tint64_t; cdecl; external libmpv;
function mpv_get_time_us(ctx: Pmpv_handle): Tint64_t; cdecl; external libmpv;

type
  Pmpv_format = ^Tmpv_format;
  Tmpv_format = longint;

const
  MPV_FORMAT_NONE = 0;
  MPV_FORMAT_STRING = 1;
  MPV_FORMAT_OSD_STRING = 2;
  MPV_FORMAT_FLAG = 3;
  MPV_FORMAT_INT64 = 4;
  MPV_FORMAT_DOUBLE = 5;
  MPV_FORMAT_NODE = 6;
  MPV_FORMAT_NODE_ARRAY = 7;
  MPV_FORMAT_NODE_MAP = 8;
  MPV_FORMAT_BYTE_ARRAY = 9;

type
  Pmpv_node_list = ^Tmpv_node_list;
  Pmpv_byte_array = ^Tmpv_byte_array;
  Pmpv_node = ^Tmpv_node;

  Tmpv_node = record
    u: record
      case longint of
        0: (_string: pchar);
        1: (flag: longint);
        2: (int64_: Tint64_t);
        3: (double_: double);
        4: (list: Pmpv_node_list);
        5: (ba: Pmpv_byte_array);
      end;
    format: Tmpv_format;
  end;

  Tmpv_node_list = record
    num: longint;
    values: Pmpv_node;
    keys: ^pchar;
  end;

  Tmpv_byte_array = record
    data: pointer;
    size: Tsize_t;
  end;

procedure mpv_free_node_contents(node: Pmpv_node); cdecl; external libmpv;
function mpv_set_option(ctx: Pmpv_handle; name: pchar; format: Tmpv_format; data: pointer): longint; cdecl; external libmpv;
function mpv_set_option_string(ctx: Pmpv_handle; name: pchar; data: pchar): longint; cdecl; external libmpv;
function mpv_command(ctx: Pmpv_handle; args: PPchar): longint; cdecl; external libmpv;
function mpv_command_node(ctx: Pmpv_handle; args: Pmpv_node; result: Pmpv_node): longint; cdecl; external libmpv;
function mpv_command_ret(ctx: Pmpv_handle; args: PPchar; result: Pmpv_node): longint; cdecl; external libmpv;
function mpv_command_string(ctx: Pmpv_handle; args: pchar): longint; cdecl; external libmpv;
function mpv_command_async(ctx: Pmpv_handle; reply_userdata: Tuint64_t; args: PPchar): longint; cdecl; external libmpv;
function mpv_command_node_async(ctx: Pmpv_handle; reply_userdata: Tuint64_t; args: Pmpv_node): longint; cdecl; external libmpv;
procedure mpv_abort_async_command(ctx: Pmpv_handle; reply_userdata: Tuint64_t); cdecl; external libmpv;
function mpv_set_property(ctx: Pmpv_handle; name: pchar; format: Tmpv_format; data: pointer): longint; cdecl; external libmpv;
function mpv_set_property_string(ctx: Pmpv_handle; name: pchar; data: pchar): longint; cdecl; external libmpv;
function mpv_del_property(ctx: Pmpv_handle; name: pchar): longint; cdecl; external libmpv;
function mpv_set_property_async(ctx: Pmpv_handle; reply_userdata: Tuint64_t; name: pchar; format: Tmpv_format; data: pointer): longint; cdecl; external libmpv;
function mpv_get_property(ctx: Pmpv_handle; name: pchar; format: Tmpv_format; data: pointer): longint; cdecl; external libmpv;
function mpv_get_property_string(ctx: Pmpv_handle; name: pchar): pchar; cdecl; external libmpv;
function mpv_get_property_osd_string(ctx: Pmpv_handle; name: pchar): pchar; cdecl; external libmpv;
function mpv_get_property_async(ctx: Pmpv_handle; reply_userdata: Tuint64_t; name: pchar; format: Tmpv_format): longint; cdecl; external libmpv;
function mpv_observe_property(mpv: Pmpv_handle; reply_userdata: Tuint64_t; name: pchar; format: Tmpv_format): longint; cdecl; external libmpv;
function mpv_unobserve_property(mpv: Pmpv_handle; registered_reply_userdata: Tuint64_t): longint; cdecl; external libmpv;

type
  Pmpv_event_id = ^Tmpv_event_id;
  Tmpv_event_id = longint;

const
  MPV_EVENT_NONE = 0;
  MPV_EVENT_SHUTDOWN = 1;
  MPV_EVENT_LOG_MESSAGE = 2;
  MPV_EVENT_GET_PROPERTY_REPLY = 3;
  MPV_EVENT_SET_PROPERTY_REPLY = 4;
  MPV_EVENT_COMMAND_REPLY = 5;
  MPV_EVENT_START_FILE = 6;
  MPV_EVENT_END_FILE = 7;
  MPV_EVENT_FILE_LOADED = 8;
  MPV_EVENT_IDLE = 11;
  MPV_EVENT_TICK = 14;
  MPV_EVENT_CLIENT_MESSAGE = 16;
  MPV_EVENT_VIDEO_RECONFIG = 17;
  MPV_EVENT_AUDIO_RECONFIG = 18;
  MPV_EVENT_SEEK = 20;
  MPV_EVENT_PLAYBACK_RESTART = 21;
  MPV_EVENT_PROPERTY_CHANGE = 22;
  MPV_EVENT_QUEUE_OVERFLOW = 24;
  MPV_EVENT_HOOK = 25;

function mpv_event_name(event: Tmpv_event_id): pchar; cdecl; external libmpv;

type
  Tmpv_event_property = record
    name: pchar;
    format: Tmpv_format;
    data: pointer;
  end;
  Pmpv_event_property = ^Tmpv_event_property;

type
  Pmpv_log_level = ^Tmpv_log_level;
  Tmpv_log_level = longint;

const
  MPV_LOG_LEVEL_NONE = 0;
  MPV_LOG_LEVEL_FATAL = 10;
  MPV_LOG_LEVEL_ERROR = 20;
  MPV_LOG_LEVEL_WARN = 30;
  MPV_LOG_LEVEL_INFO = 40;
  MPV_LOG_LEVEL_V = 50;
  MPV_LOG_LEVEL_DEBUG = 60;
  MPV_LOG_LEVEL_TRACE = 70;

type
  Tmpv_event_log_message = record
    prefix: pchar;
    level: pchar;
    text: pchar;
    log_level: Tmpv_log_level;
  end;
  Pmpv_event_log_message = ^Tmpv_event_log_message;

type
  Pmpv_end_file_reason = ^Tmpv_end_file_reason;
  Tmpv_end_file_reason = longint;

const
  MPV_END_FILE_REASON_EOF = 0;
  MPV_END_FILE_REASON_STOP = 2;
  MPV_END_FILE_REASON_QUIT = 3;
  MPV_END_FILE_REASON_ERROR = 4;
  MPV_END_FILE_REASON_REDIRECT = 5;

type
  Tmpv_event_start_file = record
    playlist_entry_id: Tint64_t;
  end;
  Pmpv_event_start_file = ^Tmpv_event_start_file;

  Tmpv_event_end_file = record
    reason: Tmpv_end_file_reason;
    error: longint;
    playlist_entry_id: Tint64_t;
    playlist_insert_id: Tint64_t;
    playlist_insert_num_entries: longint;
  end;
  Pmpv_event_end_file = ^Tmpv_event_end_file;

  Tmpv_event_client_message = record
    num_args: longint;
    args: ^pchar;
  end;
  Pmpv_event_client_message = ^Tmpv_event_client_message;

  Tmpv_event_hook = record
    name: pchar;
    id: Tuint64_t;
  end;
  Pmpv_event_hook = ^Tmpv_event_hook;

  Tmpv_event_command = record
    result: Tmpv_node;
  end;
  Pmpv_event_command = ^Tmpv_event_command;

  Tmpv_event = record
    event_id: Tmpv_event_id;
    error: longint;
    reply_userdata: Tuint64_t;
    data: pointer;
  end;
  Pmpv_event = ^Tmpv_event;

function mpv_event_to_node(dst: Pmpv_node; src: Pmpv_event): longint; cdecl; external libmpv;
function mpv_request_event(ctx: Pmpv_handle; event: Tmpv_event_id; enable: longint): longint; cdecl; external libmpv;
function mpv_request_log_messages(ctx: Pmpv_handle; min_level: pchar): longint; cdecl; external libmpv;
function mpv_wait_event(ctx: Pmpv_handle; timeout: double): Pmpv_event; cdecl; external libmpv;
procedure mpv_wakeup(ctx: Pmpv_handle); cdecl; external libmpv;

type
  Twakeup_func = procedure(d: pointer); cdecl;

procedure mpv_set_wakeup_callback(ctx: Pmpv_handle; cb: Twakeup_func; d: pointer); cdecl; external libmpv;
procedure mpv_wait_async_requests(ctx: Pmpv_handle); cdecl; external libmpv;
function mpv_hook_add(ctx: Pmpv_handle; reply_userdata: Tuint64_t; name: pchar; priority: longint): longint; cdecl; external libmpv;
function mpv_hook_continue(ctx: Pmpv_handle; id: Tuint64_t): longint; cdecl; external libmpv;

function mpv_get_wakeup_pipe(ctx: Pmpv_handle): longint; cdecl; external libmpv;

// === Konventiert am: 25-1-26 13:13:30 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


{$ENDIF read_implementation}
