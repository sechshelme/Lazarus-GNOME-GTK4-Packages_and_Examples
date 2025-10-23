
{$IFDEF read_interface}

const
  CHECK_MAJOR_VERSION_ = 0;
  CHECK_MINOR_VERSION_ = 9;
  CHECK_MICRO_VERSION_ = 14;

var
  check_major_version: longint; cvar;external libgstcheck;
  check_minor_version: longint; cvar;external libgstcheck;
  check_micro_version: longint; cvar;external libgstcheck;

type
  pid_t = longint;

type
  TTFun = procedure(para1: longint); cdecl;
  TSFun = procedure(para1: pointer); cdecl;

type
  TSuite = record
  end;
  PSuite = ^TSuite;

  TCase = record
  end;
  PTCase = ^TCase;

function suite_create(Name: pchar): PSuite; cdecl; external libgstcheck;
function suite_tcase(s: PSuite; tcname: pchar): longint; cdecl; external libgstcheck;
procedure suite_add_tcase(s: PSuite; tc: PTCase); cdecl; external libgstcheck;
function tcase_create(Name: pchar): PTCase; cdecl; external libgstcheck;
procedure tcase_set_tags(tc: PTCase; tags: pchar); cdecl; external libgstcheck;
procedure _tcase_add_test(tc: PTCase; tf: TTFun; fname: pchar; _signal: longint; allowed_exit_value: longint;
  start: longint; end_: longint); cdecl; external libgstcheck;

procedure tcase_add_unchecked_fixture(tc: PTCase; setup: TSFun; teardown: TSFun); cdecl; external libgstcheck;
procedure tcase_add_checked_fixture(tc: PTCase; setup: TSFun; teardown: TSFun); cdecl; external libgstcheck;
procedure tcase_set_timeout(tc: PTCase; timeout: double); cdecl; external libgstcheck;
procedure tcase_fn_start(fname: pchar; file_: pchar; line: longint); cdecl; external libgstcheck;

procedure _ck_assert_failed(file_: pchar; line: longint; expr: pchar); varargs; cdecl; external libgstcheck;
procedure _mark_point(file_: pchar; line: longint); cdecl; external libgstcheck;

type
  Ttest_result = longint;

const
  CK_TEST_RESULT_INVALID = 0;
  CK_PASS = 1;
  CK_FAILURE = 2;
  CK_ERROR = 3;

type
  Tprint_output = longint;

const
  CK_SILENT = 0;
  CK_MINIMAL = 1;
  CK_NORMAL = 2;
  CK_VERBOSE = 3;
  CK_ENV = 4;
  CK_SUBUNIT = 5;
  CK_LAST = 6;

type
  Tck_result_ctx = longint;

const
  CK_CTX_INVALID = 0;
  CK_CTX_SETUP = 1;
  CK_CTX_TEST = 2;
  CK_CTX_TEARDOWN = 3;

type
  TTestResult = record
  end;
  PTestResult = ^TTestResult;
  PPTestResult = ^PTestResult;

type
  TSRunner = record
  end;
  PSRunner = ^TSRunner;

function tr_rtype(tr: PTestResult): longint; cdecl; external libgstcheck;
function tr_msg(tr: PTestResult): pchar; cdecl; external libgstcheck;
function tr_lno(tr: PTestResult): longint; cdecl; external libgstcheck;
function tr_lfile(tr: PTestResult): pchar; cdecl; external libgstcheck;
function tr_tcname(tr: PTestResult): pchar; cdecl; external libgstcheck;
function srunner_create(s: PSuite): PSRunner; cdecl; external libgstcheck;
procedure srunner_add_suite(sr: PSRunner; s: PSuite); cdecl; external libgstcheck;
procedure srunner_free(sr: PSRunner); cdecl; external libgstcheck;
procedure srunner_run_all(sr: PSRunner; print_mode: Tprint_output); cdecl; external libgstcheck;
procedure srunner_run(sr: PSRunner; sname: pchar; tcname: pchar; print_mode: Tprint_output); cdecl; external libgstcheck;
procedure srunner_run_tagged(sr: PSRunner; sname: pchar; tcname: pchar; include_tags: pchar; exclude_tags: pchar;
  print_mode: Tprint_output); cdecl; external libgstcheck;
function srunner_ntests_failed(sr: PSRunner): longint; cdecl; external libgstcheck;
function srunner_ntests_run(sr: PSRunner): longint; cdecl; external libgstcheck;
function srunner_failures(sr: PSRunner): PPTestResult; cdecl; external libgstcheck;
function srunner_results(sr: PSRunner): PPTestResult; cdecl; external libgstcheck;
procedure srunner_print(sr: PSRunner; print_mode: Tprint_output); cdecl; external libgstcheck;
procedure srunner_set_log(sr: PSRunner; fname: pchar); cdecl; external libgstcheck;
function srunner_has_log(sr: PSRunner): longint; cdecl; external libgstcheck;
function srunner_log_fname(sr: PSRunner): pchar; cdecl; external libgstcheck;
procedure srunner_set_xml(sr: PSRunner; fname: pchar); cdecl; external libgstcheck;
function srunner_has_xml(sr: PSRunner): longint; cdecl; external libgstcheck;
function srunner_xml_fname(sr: PSRunner): pchar; cdecl; external libgstcheck;
procedure srunner_set_tap(sr: PSRunner; fname: pchar); cdecl; external libgstcheck;
function srunner_has_tap(sr: PSRunner): longint; cdecl; external libgstcheck;
function srunner_tap_fname(sr: PSRunner): pchar; cdecl; external libgstcheck;

type
  Tfork_status = longint;

const
  CK_FORK_GETENV = 0;
  CK_FORK = 1;
  CK_NOFORK = 2;

procedure srunner_set_fork_status(sr: PSRunner; fstat: Tfork_status); cdecl; external libgstcheck;
function check_fork: Tpid_t; cdecl; external libgstcheck;
procedure check_waitpid_and_exit(pid: Tpid_t); cdecl; external libgstcheck;


// === Konventiert am: 2-10-24 17:00:02 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


{$ENDIF read_implementation}
