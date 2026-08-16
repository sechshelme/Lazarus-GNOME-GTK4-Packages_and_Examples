{$IFDEF read_interface}


type
  Trist_log_level = longint;
const
  RIST_LOG_DISABLE = -(1);
  RIST_LOG_ERROR = 3;
  RIST_LOG_WARN = 4;
  RIST_LOG_NOTICE = 5;
  RIST_LOG_INFO = 6;
  RIST_LOG_DEBUG = 7;
  RIST_LOG_SIMULATE = 100;

type
  PPrist_logging_settings = ^Prist_logging_settings;
  Prist_logging_settings = ^Trist_logging_settings;
  Trist_logging_settings = record
    log_level: Trist_log_level;
    log_cb: function(arg: pointer; para2: Trist_log_level; msg: pchar): longint; cdecl;
    log_cb_arg: pointer;
    log_socket: longint;
    log_stream: PFILE;
  end;

type Tlogging_set_func = function(arg: pointer; para2: Trist_log_level; msg: pchar): longint; cdecl;

procedure rist_log(logging_settings: Prist_logging_settings; level: Trist_log_level; format: pchar); cdecl; varargs; external librist;
function rist_logging_set(logging_settings: PPrist_logging_settings; log_level: Trist_log_level; log_cb: Tlogging_set_func; cb_arg: pointer; address: pchar;
  logfp: PFILE): longint; cdecl; external librist;
function rist_logging_set_global(logging_settings: Prist_logging_settings): longint; cdecl; external librist;
procedure rist_logging_unset_global; cdecl; external librist;
function rist_logging_settings_free(logging_settings: PPrist_logging_settings): longint; cdecl; external librist; deprecated;
function rist_logging_settings_free2(logging_settings: PPrist_logging_settings): longint; cdecl; external librist;

// === Konventiert am: 15-8-26 19:17:00 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
