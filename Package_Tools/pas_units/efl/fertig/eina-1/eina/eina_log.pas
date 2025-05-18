unit eina_log;

interface

uses
  ctypes, efl, eina_types;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


const
  EINA_COLOR_LIGHTRED = '\033[31;1m';
  EINA_COLOR_RED = '\033[31m';
  EINA_COLOR_LIGHTBLUE = '\033[34;1m';
  EINA_COLOR_BLUE = '\033[34m';
  EINA_COLOR_GREEN = '\033[32;1m';
  EINA_COLOR_YELLOW = '\033[33;1m';
  EINA_COLOR_ORANGE = '\033[0;33m';
  EINA_COLOR_WHITE = '\033[37;1m';
  EINA_COLOR_LIGHTCYAN = '\033[36;1m';
  EINA_COLOR_CYAN = '\033[36m';
  EINA_COLOR_RESET = '\033[0m';
  EINA_COLOR_HIGH = '\033[1m';

var
  EINA_LOG_DOMAIN_GLOBAL: longint; cvar;external libeina;
  EINA_LOG_DOMAIN_DEFAULT: longint absolute EINA_LOG_DOMAIN_GLOBAL;

type
  TEina_Log_Domain = bitpacked record
    level: longint;
    domain_str: pchar;
    name: pchar;
    namelen: Tsize_t;
    deleted: 0..1;
    color: pchar;
  end;
  PEina_Log_Domain = ^TEina_Log_Domain;

procedure eina_log_threads_enable; cdecl; external libeina;

type
  PEina_Log_Level = ^TEina_Log_Level;
  TEina_Log_Level = longint;

const
  EINA_LOG_LEVEL_CRITICAL = 0;
  EINA_LOG_LEVEL_ERR = 1;
  EINA_LOG_LEVEL_WARN = 2;
  EINA_LOG_LEVEL_INFO = 3;
  EINA_LOG_LEVEL_DBG = 4;
  EINA_LOG_LEVELS = 5;
  EINA_LOG_LEVEL_UNKNOWN = (-(2147483647)) - 1;

type
  TEina_Log_Print_Cb = procedure(d: PEina_Log_Domain; level: TEina_Log_Level; file_: pchar; fnc: pchar; line: longint;
    fmt: pchar; data: pointer; args: Tva_list); cdecl;

type
  PEina_Log_State = ^TEina_Log_State;
  TEina_Log_State = longint;

const
  EINA_LOG_STATE_START = 0;
  EINA_LOG_STATE_STOP = 1;

procedure eina_log_print_cb_set(cb: TEina_Log_Print_Cb; data: pointer); cdecl; external libeina;
procedure eina_log_level_set(level: longint); cdecl; external libeina;
function eina_log_level_get: longint; cdecl; external libeina;
function eina_log_main_thread_check: TEina_Bool; cdecl; external libeina;
procedure eina_log_color_disable_set(disabled: TEina_Bool); cdecl; external libeina;
function eina_log_color_disable_get: TEina_Bool; cdecl; external libeina;
procedure eina_log_file_disable_set(disabled: TEina_Bool); cdecl; external libeina;
function eina_log_file_disable_get: TEina_Bool; cdecl; external libeina;
procedure eina_log_function_disable_set(disabled: TEina_Bool); cdecl; external libeina;
function eina_log_function_disable_get: TEina_Bool; cdecl; external libeina;
procedure eina_log_abort_on_critical_set(abort_on_critical: TEina_Bool); cdecl; external libeina;
function eina_log_abort_on_critical_get: TEina_Bool; cdecl; external libeina;
procedure eina_log_abort_on_critical_level_set(critical_level: longint); cdecl; external libeina;
function eina_log_abort_on_critical_level_get: longint; cdecl; external libeina;
procedure eina_log_domain_level_set(domain_name: pchar; level: longint); cdecl; external libeina;
function eina_log_domain_level_get(domain_name: pchar): longint; cdecl; external libeina;
function eina_log_domain_registered_level_get(domain: longint): longint; cdecl; external libeina;
procedure eina_log_domain_registered_level_set(domain: longint; level: longint); cdecl; external libeina;
function eina_log_domain_register(name: pchar; color: pchar): longint; cdecl; external libeina;
procedure eina_log_domain_unregister(domain: longint); cdecl; external libeina;
procedure eina_log_print(domain: longint; level: TEina_Log_Level; file_: pchar; _function: pchar; line: longint; fmt: pchar; args: array of const); cdecl; external libeina;
procedure eina_log_print(domain: longint; level: TEina_Log_Level; file_: pchar; _function: pchar; line: longint; fmt: pchar); cdecl; external libeina;
procedure eina_log_vprint(domain: longint; level: TEina_Log_Level; file_: pchar; fnc: pchar; line: longint; fmt: pchar; args: Tva_list); cdecl; external libeina;
procedure eina_log_print_cb_stdout(d: PEina_Log_Domain; level: TEina_Log_Level; file_: pchar; fnc: pchar; line: longint; fmt: pchar; data: pointer; args: Tva_list); cdecl; external libeina;
procedure eina_log_print_cb_stderr(d: PEina_Log_Domain; level: TEina_Log_Level; file_: pchar; fnc: pchar; line: longint; fmt: pchar; data: pointer; args: Tva_list); cdecl; external libeina;
procedure eina_log_print_cb_file(d: PEina_Log_Domain; level: TEina_Log_Level; file_: pchar; fnc: pchar; line: longint; fmt: pchar; data: pointer; args: Tva_list); cdecl; external libeina;
procedure eina_log_print_cb_journald(d: PEina_Log_Domain; level: TEina_Log_Level; file_: pchar; fnc: pchar; line: longint; fmt: pchar; data: pointer; args: Tva_list); cdecl; external libeina;
procedure eina_log_console_color_set(fp: PFILE; color: pchar); cdecl; external libeina;

var
  _eina_log_state_init: pchar; cvar;external libeina;
  _eina_log_state_shutdown: pchar; cvar;external libeina;

var
  EINA_LOG_STATE_INIT: pchar absolute _eina_log_state_init;
  EINA_LOG_STATE_SHUTDOWN: pchar absolute _eina_log_state_shutdown;

procedure eina_log_timing(domain: longint; state: TEina_Log_State; phase: pchar); cdecl; external libeina;

// === Konventiert am: 15-5-25 19:15:29 ===


implementation


end.
