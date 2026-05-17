

  {$IFDEF read_enum}
const
  MONGOC_LOG_DOMAIN = 'mongoc';

type
  Pmongoc_log_level_t = ^Tmongoc_log_level_t;
  Tmongoc_log_level_t = longint;

const
  MONGOC_LOG_LEVEL_ERROR = 0;
  MONGOC_LOG_LEVEL_CRITICAL = 1;
  MONGOC_LOG_LEVEL_WARNING = 2;
  MONGOC_LOG_LEVEL_MESSAGE = 3;
  MONGOC_LOG_LEVEL_INFO = 4;
  MONGOC_LOG_LEVEL_DEBUG = 5;
  MONGOC_LOG_LEVEL_TRACE = 6;
  {$ENDIF read_enum}

  {$IFDEF read_struct}
type
  Tmongoc_log_func_t = procedure(log_level: Tmongoc_log_level_t; log_domain: pchar; message: pchar; user_data: pointer); cdecl;
  {$ENDIF read_struct}

{$IFDEF read_function}
procedure mongoc_log_set_handler(log_func: Tmongoc_log_func_t; user_data: pointer); cdecl; external libmongoc;
procedure mongoc_log(log_level: Tmongoc_log_level_t; log_domain: pchar; format: pchar; args: array of const); cdecl; external libmongoc;
procedure mongoc_log(log_level: Tmongoc_log_level_t; log_domain: pchar; format: pchar); cdecl; external libmongoc;
procedure mongoc_log_default_handler(log_level: Tmongoc_log_level_t; log_domain: pchar; message: pchar; user_data: pointer); cdecl; external libmongoc;
function mongoc_log_level_str(log_level: Tmongoc_log_level_t): pchar; cdecl; external libmongoc;
procedure mongoc_log_trace_enable; cdecl; external libmongoc;
procedure mongoc_log_trace_disable; cdecl; external libmongoc;
{$ENDIF read_function}

// === Konventiert am: 15-5-26 15:15:22 ===



{$IFDEF read_implementation}



{$ENDIF read_implementation}
