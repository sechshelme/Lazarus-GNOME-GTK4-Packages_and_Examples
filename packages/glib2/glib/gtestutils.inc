/////////////////////////////////////////////////////////////
//                                                         //
//   WARNUNG, dies Datei wird automatisch durch            //
//   das Program "Convert_Unit_to_pas_includes" erzeugt !  //
//   Erzeugt am: 12-11-2024   17:50                        //
//                                                         //
/////////////////////////////////////////////////////////////

{$IFDEF read_interface}


type
  TGTestCase = record
  end;
  PGTestCase = ^TGTestCase;

  TGTestSuite = record
  end;
  PGTestSuite = ^TGTestSuite;

  TGTestFunc = procedure(para1: pointer); cdecl;
  TGTestDataFunc = procedure(user_data: Tgconstpointer); cdecl;
  TGTestFixtureFunc = procedure(fixture: Tgpointer; user_data: Tgconstpointer); cdecl;

function g_strcmp0(str1: pchar; str2: pchar): longint; cdecl; external libglib2;
procedure g_test_minimized_result(minimized_quantity: Tdouble; format: pchar; args: array of const); cdecl; external libglib2;
procedure g_test_minimized_result(minimized_quantity: Tdouble; format: pchar); cdecl; external libglib2;
procedure g_test_maximized_result(maximized_quantity: Tdouble; format: pchar; args: array of const); cdecl; external libglib2;
procedure g_test_maximized_result(maximized_quantity: Tdouble; format: pchar); cdecl; external libglib2;
procedure g_test_init(argc: Plongint; argv: PPPchar; args: array of const); cdecl; external libglib2;
procedure g_test_init(argc: Plongint; argv: PPPchar); cdecl; external libglib2;

const
  G_TEST_OPTION_ISOLATE_DIRS = 'isolate_dirs';

function g_test_subprocess: Tgboolean; cdecl; external libglib2;
function g_test_run: longint; cdecl; external libglib2;
procedure g_test_add_func(testpath: pchar; test_func: TGTestFunc); cdecl; external libglib2;
procedure g_test_add_data_func(testpath: pchar; test_data: Tgconstpointer; test_func: TGTestDataFunc); cdecl; external libglib2;
procedure g_test_add_data_func_full(testpath: pchar; test_data: Tgpointer; test_func: TGTestDataFunc; data_free_func: TGDestroyNotify); cdecl; external libglib2;
function g_test_get_path: pchar; cdecl; external libglib2;
procedure g_test_fail; cdecl; external libglib2;
procedure g_test_fail_printf(format: pchar; args: array of const); cdecl; external libglib2;
procedure g_test_fail_printf(format: pchar); cdecl; external libglib2;
procedure g_test_incomplete(msg: Pgchar); cdecl; external libglib2;
procedure g_test_incomplete_printf(format: pchar; args: array of const); cdecl; external libglib2;
procedure g_test_incomplete_printf(format: pchar); cdecl; external libglib2;
procedure g_test_skip(msg: Pgchar); cdecl; external libglib2;
procedure g_test_skip_printf(format: pchar; args: array of const); cdecl; external libglib2;
procedure g_test_skip_printf(format: pchar); cdecl; external libglib2;
function g_test_failed: Tgboolean; cdecl; external libglib2;
procedure g_test_set_nonfatal_assertions; cdecl; external libglib2;
procedure g_test_disable_crash_reporting; cdecl; external libglib2;
procedure g_test_message(format: pchar; args: array of const); cdecl; external libglib2;
procedure g_test_message(format: pchar); cdecl; external libglib2;
procedure g_test_bug_base(uri_pattern: pchar); cdecl; external libglib2;
procedure g_test_bug(bug_uri_snippet: pchar); cdecl; external libglib2;
procedure g_test_summary(summary: pchar); cdecl; external libglib2;
procedure g_test_timer_start; cdecl; external libglib2;
function g_test_timer_elapsed: Tdouble; cdecl; external libglib2;
function g_test_timer_last: Tdouble; cdecl; external libglib2;
procedure g_test_queue_free(gfree_pointer: Tgpointer); cdecl; external libglib2;
procedure g_test_queue_destroy(destroy_func: TGDestroyNotify; destroy_data: Tgpointer); cdecl; external libglib2;

type
  PGTestTrapFlags = ^TGTestTrapFlags;
  TGTestTrapFlags = longint;

const
  G_TEST_TRAP_DEFAULT = 0;
  G_TEST_TRAP_SILENCE_STDOUT = 1 shl 7;
  G_TEST_TRAP_SILENCE_STDERR = 1 shl 8;
  G_TEST_TRAP_INHERIT_STDIN = 1 shl 9;

function g_test_trap_fork(usec_timeout: Tguint64; test_trap_flags: TGTestTrapFlags): Tgboolean; cdecl; external libglib2;

type
  PGTestSubprocessFlags = ^TGTestSubprocessFlags;
  TGTestSubprocessFlags = longint;

const
  G_TEST_SUBPROCESS_DEFAULT = 0;
  G_TEST_SUBPROCESS_INHERIT_STDIN = 1 shl 0;
  G_TEST_SUBPROCESS_INHERIT_STDOUT = 1 shl 1;
  G_TEST_SUBPROCESS_INHERIT_STDERR = 1 shl 2;

procedure g_test_trap_subprocess(test_path: pchar; usec_timeout: Tguint64; test_flags: TGTestSubprocessFlags); cdecl; external libglib2;
procedure g_test_trap_subprocess_with_envp(test_path: pchar; envp: PPchar; usec_timeout: Tguint64; test_flags: TGTestSubprocessFlags); cdecl; external libglib2;
function g_test_trap_has_passed: Tgboolean; cdecl; external libglib2;
function g_test_trap_reached_timeout: Tgboolean; cdecl; external libglib2;

function g_test_rand_int: Tgint32; cdecl; external libglib2;
function g_test_rand_int_range(begin_: Tgint32; end_: Tgint32): Tgint32; cdecl; external libglib2;
function g_test_rand_double: Tdouble; cdecl; external libglib2;
function g_test_rand_double_range(range_start: Tdouble; range_end: Tdouble): Tdouble; cdecl; external libglib2;
function g_test_create_case(test_name: pchar; data_size: Tgsize; test_data: Tgconstpointer; data_setup: TGTestFixtureFunc; data_test: TGTestFixtureFunc;
  data_teardown: TGTestFixtureFunc): PGTestCase; cdecl; external libglib2;
function g_test_create_suite(suite_name: pchar): PGTestSuite; cdecl; external libglib2;
function g_test_get_root: PGTestSuite; cdecl; external libglib2;
procedure g_test_suite_add(suite: PGTestSuite; test_case: PGTestCase); cdecl; external libglib2;
procedure g_test_suite_add_suite(suite: PGTestSuite; nestedsuite: PGTestSuite); cdecl; external libglib2;
function g_test_run_suite(suite: PGTestSuite): longint; cdecl; external libglib2;
procedure g_test_case_free(test_case: PGTestCase); cdecl; external libglib2;
procedure g_test_suite_free(suite: PGTestSuite); cdecl; external libglib2;
procedure g_test_trap_assertions(domain: pchar; file_: pchar; line: longint; func: pchar; assertion_flags: Tguint64;
  pattern: pchar); cdecl; external libglib2;
procedure g_assertion_message(domain: pchar; file_: pchar; line: longint; func: pchar; message: pchar); cdecl; external libglib2;
procedure g_assertion_message_expr(domain: pchar; file_: pchar; line: longint; func: pchar; expr: pchar); cdecl; external libglib2;
procedure g_assertion_message_cmpstr(domain: pchar; file_: pchar; line: longint; func: pchar; expr: pchar;
  arg1: pchar; cmp: pchar; arg2: pchar); cdecl; external libglib2;
procedure g_assertion_message_cmpstrv(domain: pchar; file_: pchar; line: longint; func: pchar; expr: pchar;
  arg1: PPchar; arg2: PPchar; first_wrong_idx: Tgsize); cdecl; external libglib2;
procedure g_assertion_message_cmpint(domain: pchar; file_: pchar; line: longint; func: pchar; expr: pchar;
  arg1: Tguint64; cmp: pchar; arg2: Tguint64; numtype: char); cdecl; external libglib2;
procedure g_assertion_message_cmpnum(domain: pchar; file_: pchar; line: longint; func: pchar; expr: pchar;
  arg1: clongdouble; cmp: pchar; arg2: clongdouble; numtype: char); cdecl; external libglib2;
procedure g_assertion_message_error(domain: pchar; file_: pchar; line: longint; func: pchar; expr: pchar;
  error: PGError; error_domain: TGQuark; error_code: longint); cdecl; external libglib2;
procedure g_test_add_vtable(testpath: pchar; data_size: Tgsize; test_data: Tgconstpointer; data_setup: TGTestFixtureFunc; data_test: TGTestFixtureFunc;
  data_teardown: TGTestFixtureFunc); cdecl; external libglib2;

type
  TGTestConfig = record
    test_initialized: Tgboolean;
    test_quick: Tgboolean;
    test_perf: Tgboolean;
    test_verbose: Tgboolean;
    test_quiet: Tgboolean;
    test_undefined: Tgboolean;
  end;
  PGTestConfig = ^TGTestConfig;

var
  g_test_config_vars: PGTestConfig; cvar;external libglib2;

type
  PGTestResult = ^TGTestResult;
  TGTestResult = longint;

const
  G_TEST_RUN_SUCCESS = 0;
  G_TEST_RUN_SKIPPED = 1;
  G_TEST_RUN_FAILURE = 2;
  G_TEST_RUN_INCOMPLETE = 3;

type
  PGTestLogType = ^TGTestLogType;
  TGTestLogType = longint;

const
  G_TEST_LOG_NONE = 0;
  G_TEST_LOG_ERROR = 1;
  G_TEST_LOG_START_BINARY = 2;
  G_TEST_LOG_LIST_CASE = 3;
  G_TEST_LOG_SKIP_CASE = 4;
  G_TEST_LOG_START_CASE = 5;
  G_TEST_LOG_STOP_CASE = 6;
  G_TEST_LOG_MIN_RESULT = 7;
  G_TEST_LOG_MAX_RESULT = 8;
  G_TEST_LOG_MESSAGE = 9;
  G_TEST_LOG_START_SUITE = 10;
  G_TEST_LOG_STOP_SUITE = 11;

type
  TGTestLogMsg = record
    log_type: TGTestLogType;
    n_strings: Tguint;
    strings: ^Pgchar;
    n_nums: Tguint;
    nums: Pclongdouble;
  end;
  PGTestLogMsg = ^TGTestLogMsg;

  TGTestLogBuffer = record
    Data: PGString;
    msgs: PGSList;
  end;
  PGTestLogBuffer = ^TGTestLogBuffer;

function g_test_log_type_name(log_type: TGTestLogType): pchar; cdecl; external libglib2;
function g_test_log_buffer_new: PGTestLogBuffer; cdecl; external libglib2;
procedure g_test_log_buffer_free(tbuffer: PGTestLogBuffer); cdecl; external libglib2;
procedure g_test_log_buffer_push(tbuffer: PGTestLogBuffer; n_bytes: Tguint; bytes: Pguint8); cdecl; external libglib2;
function g_test_log_buffer_pop(tbuffer: PGTestLogBuffer): PGTestLogMsg; cdecl; external libglib2;
procedure g_test_log_msg_free(tmsg: PGTestLogMsg); cdecl; external libglib2;

type
  TGTestLogFatalFunc = function(log_domain: Pgchar; log_level: TGLogLevelFlags; message: Pgchar; user_data: Tgpointer): Tgboolean; cdecl;

procedure g_test_log_set_fatal_handler(log_func: TGTestLogFatalFunc; user_data: Tgpointer); cdecl; external libglib2;
procedure g_test_expect_message(log_domain: Pgchar; log_level: TGLogLevelFlags; pattern: Pgchar); cdecl; external libglib2;
procedure g_test_assert_expected_messages_internal(domain: pchar; file_: pchar; line: longint; func: pchar); cdecl; external libglib2;

type
  PGTestFileType = ^TGTestFileType;
  TGTestFileType = longint;

const
  G_TEST_DIST = 0;
  G_TEST_BUILT = 1;

function g_test_build_filename(file_type: TGTestFileType; first_path: Pgchar; args: array of const): Pgchar; cdecl; external libglib2;
function g_test_build_filename(file_type: TGTestFileType; first_path: Pgchar): Pgchar; cdecl; external libglib2;
function g_test_get_dir(file_type: TGTestFileType): Pgchar; cdecl; external libglib2;
function g_test_get_filename(file_type: TGTestFileType; first_path: Pgchar; args: array of const): Pgchar; cdecl; external libglib2;
function g_test_get_filename(file_type: TGTestFileType; first_path: Pgchar): Pgchar; cdecl; external libglib2;

function g_test_initialized: Tgboolean;
function g_test_quick: Tgboolean;
function g_test_slow: Tgboolean;
function g_test_thorough: Tgboolean;
function g_test_perf: Tgboolean;
function g_test_verbose: Tgboolean;
function g_test_quiet: Tgboolean;
function g_test_undefined: Tgboolean;

procedure g_test_queue_unref(gobject: Tgpointer);
function g_test_rand_bit: Tgboolean;
procedure g_assert(expr: Tgboolean);

// === Konventiert am: 12-11-24 17:12:11 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


function g_test_initialized: Tgboolean;
begin
  g_test_initialized := g_test_config_vars^.test_initialized;
end;

function g_test_quick: Tgboolean;
begin
  g_test_quick := g_test_config_vars^.test_quick;
end;

function g_test_slow: Tgboolean;
begin
  g_test_slow := not (g_test_config_vars^.test_quick);
end;

function g_test_thorough: Tgboolean;
begin
  g_test_thorough := not (g_test_config_vars^.test_quick);
end;

function g_test_perf: Tgboolean;
begin
  g_test_perf := g_test_config_vars^.test_perf;
end;

function g_test_verbose: Tgboolean;
begin
  g_test_verbose := g_test_config_vars^.test_verbose;
end;

function g_test_quiet: Tgboolean;
begin
  g_test_quiet := g_test_config_vars^.test_quiet;
end;

function g_test_undefined: Tgboolean;
begin
  g_test_undefined := g_test_config_vars^.test_undefined;
end;

procedure g_test_queue_unref(gobject: Tgpointer);
begin
  g_test_queue_destroy(@g_object_unref, gobject);
end;

function g_test_rand_bit: Tgboolean;
begin
  g_test_rand_bit := 0 <> ((g_test_rand_int) and (1 shl 15));
end;

procedure g_assert(expr: Tgboolean);
begin
  if not expr then begin
    g_assertion_message_expr(G_LOG_DOMAIN, 'file', 0, 'error', 'gFALSE');
  end;
end;


{$ENDIF read_implementation}
