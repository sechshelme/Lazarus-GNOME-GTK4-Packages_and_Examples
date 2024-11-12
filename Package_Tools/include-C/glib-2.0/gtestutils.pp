
unit gtestutils;
interface

{
  Automatically converted by H2Pas 1.0.0 from gtestutils.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gtestutils.h
}

{ Pointers to basic pascal types, inserted by h2pas conversion program.}
Type
  PLongint  = ^Longint;
  PSmallInt = ^SmallInt;
  PByte     = ^Byte;
  PWord     = ^Word;
  PDWord    = ^DWord;
  PDouble   = ^Double;

Type
Pchar  = ^char;
Pgchar  = ^gchar;
PGError  = ^GError;
PGSList  = ^GSList;
PGString  = ^GString;
PGTestCase  = ^GTestCase;
PGTestConfig  = ^GTestConfig;
PGTestFileType  = ^GTestFileType;
PGTestLogBuffer  = ^GTestLogBuffer;
PGTestLogMsg  = ^GTestLogMsg;
PGTestLogType  = ^GTestLogType;
PGTestResult  = ^GTestResult;
PGTestSubprocessFlags  = ^GTestSubprocessFlags;
PGTestSuite  = ^GTestSuite;
PGTestTrapFlags  = ^GTestTrapFlags;
Pguint8  = ^guint8;
Plong_double  = ^long_double;
Plongint  = ^longint;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GLib testing utilities
 * Copyright (C) 2007 Imendio AB
 * Authors: Tim Janik
 *
 * SPDX-License-Identifier: LGPL-2.1-or-later
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library; if not, see <http://www.gnu.org/licenses/>.
  }
{$ifndef __G_TEST_UTILS_H__}
{$define __G_TEST_UTILS_H__}
{$if !defined (__GLIB_H_INSIDE__) && !defined (GLIB_COMPILATION)}
{$error "Only <glib.h> can be included directly."}
{$endif}
{$include <glib/gmessages.h>}
{$include <glib/gstring.h>}
{$include <glib/gerror.h>}
{$include <glib/gslist.h>}
{$include <errno.h>}
{$include <stdlib.h>}
{$include <string.h>}
type

  TGTestFunc = procedure (para1:pointer);cdecl;

  TGTestDataFunc = procedure (user_data:Tgconstpointer);cdecl;

  TGTestFixtureFunc = procedure (fixture:Tgpointer; user_data:Tgconstpointer);cdecl;
{#define g_assert(expr)                  G_STMT_START  \ }
{                                             if G_LIKELY (expr) ; else \ }
{                                               g_assertion_message_expr (G_LOG_DOMAIN, __FILE__, __LINE__, G_STRFUNC, \ }
{                                                                         #expr); \ }
{                                         G_STMT_END }
(* Const before type ignored *)
(* Const before type ignored *)

function g_strcmp0(str1:Pchar; str2:Pchar):longint;cdecl;external;
{ report performance results  }
(* Const before type ignored *)
procedure g_test_minimized_result(minimized_quantity:Tdouble; format:Pchar; args:array of const);cdecl;external;
procedure g_test_minimized_result(minimized_quantity:Tdouble; format:Pchar);cdecl;external;
(* Const before type ignored *)
procedure g_test_maximized_result(maximized_quantity:Tdouble; format:Pchar; args:array of const);cdecl;external;
procedure g_test_maximized_result(maximized_quantity:Tdouble; format:Pchar);cdecl;external;
{ initialize testing framework  }
procedure g_test_init(argc:Plongint; argv:PPPchar; args:array of const);cdecl;external;
procedure g_test_init(argc:Plongint; argv:PPPchar);cdecl;external;
const
  G_TEST_OPTION_ISOLATE_DIRS = 'isolate_dirs';  
{ query testing framework config  }
{ was #define dname(params) para_def_expr }
{ return type might be wrong }   

function g_test_initialized : longint;

{ was #define dname(params) para_def_expr }
{ return type might be wrong }   
function g_test_quick : longint;

{ was #define dname(params) para_def_expr }
{ return type might be wrong }   
function g_test_slow : longint;

{ was #define dname(params) para_def_expr }
{ return type might be wrong }   
function g_test_thorough : longint;

{ was #define dname(params) para_def_expr }
{ return type might be wrong }   
function g_test_perf : longint;

{ was #define dname(params) para_def_expr }
{ return type might be wrong }   
function g_test_verbose : longint;

{ was #define dname(params) para_def_expr }
{ return type might be wrong }   
function g_test_quiet : longint;

{ was #define dname(params) para_def_expr }
{ return type might be wrong }   
function g_test_undefined : longint;

function g_test_subprocess:Tgboolean;cdecl;external;
{ run all tests under toplevel suite (path: /)  }
function g_test_run:longint;cdecl;external;
{ hook up a test functions under test path  }
(* Const before type ignored *)
procedure g_test_add_func(testpath:Pchar; test_func:TGTestFunc);cdecl;external;
(* Const before type ignored *)
procedure g_test_add_data_func(testpath:Pchar; test_data:Tgconstpointer; test_func:TGTestDataFunc);cdecl;external;
(* Const before type ignored *)
procedure g_test_add_data_func_full(testpath:Pchar; test_data:Tgpointer; test_func:TGTestDataFunc; data_free_func:TGDestroyNotify);cdecl;external;
{ tell about currently run test  }
(* Const before type ignored *)
function g_test_get_path:Pchar;cdecl;external;
{ tell about failure  }
procedure g_test_fail;cdecl;external;
(* Const before type ignored *)
procedure g_test_fail_printf(format:Pchar; args:array of const);cdecl;external;
procedure g_test_fail_printf(format:Pchar);cdecl;external;
(* Const before type ignored *)
procedure g_test_incomplete(msg:Pgchar);cdecl;external;
(* Const before type ignored *)
procedure g_test_incomplete_printf(format:Pchar; args:array of const);cdecl;external;
procedure g_test_incomplete_printf(format:Pchar);cdecl;external;
(* Const before type ignored *)
procedure g_test_skip(msg:Pgchar);cdecl;external;
(* Const before type ignored *)
procedure g_test_skip_printf(format:Pchar; args:array of const);cdecl;external;
procedure g_test_skip_printf(format:Pchar);cdecl;external;
function g_test_failed:Tgboolean;cdecl;external;
procedure g_test_set_nonfatal_assertions;cdecl;external;
procedure g_test_disable_crash_reporting;cdecl;external;
{ add test messages to the test report  }
(* Const before type ignored *)
procedure g_test_message(format:Pchar; args:array of const);cdecl;external;
procedure g_test_message(format:Pchar);cdecl;external;
(* Const before type ignored *)
procedure g_test_bug_base(uri_pattern:Pchar);cdecl;external;
(* Const before type ignored *)
procedure g_test_bug(bug_uri_snippet:Pchar);cdecl;external;
(* Const before type ignored *)
procedure g_test_summary(summary:Pchar);cdecl;external;
{ measure test timings  }
procedure g_test_timer_start;cdecl;external;
function g_test_timer_elapsed:Tdouble;cdecl;external;
{ elapsed seconds  }
function g_test_timer_last:Tdouble;cdecl;external;
{ repeat last elapsed() result  }
{ automatically g_free or g_object_unref upon teardown  }
procedure g_test_queue_free(gfree_pointer:Tgpointer);cdecl;external;
procedure g_test_queue_destroy(destroy_func:TGDestroyNotify; destroy_data:Tgpointer);cdecl;external;
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function g_test_queue_unref(gobject : longint) : longint;

type
  PGTestTrapFlags = ^TGTestTrapFlags;
  TGTestTrapFlags =  Longint;
  Const
    G_TEST_TRAP_DEFAULT = 0;
    G_TEST_TRAP_SILENCE_STDOUT = 1 shl 7;
    G_TEST_TRAP_SILENCE_STDERR = 1 shl 8;
    G_TEST_TRAP_INHERIT_STDIN = 1 shl 9;
;

function g_test_trap_fork(usec_timeout:Tguint64; test_trap_flags:TGTestTrapFlags):Tgboolean;cdecl;external;
type
  PGTestSubprocessFlags = ^TGTestSubprocessFlags;
  TGTestSubprocessFlags =  Longint;
  Const
    G_TEST_SUBPROCESS_DEFAULT = 0;
    G_TEST_SUBPROCESS_INHERIT_STDIN = 1 shl 0;
    G_TEST_SUBPROCESS_INHERIT_STDOUT = 1 shl 1;
    G_TEST_SUBPROCESS_INHERIT_STDERR = 1 shl 2;
;
(* Const before type ignored *)

procedure g_test_trap_subprocess(test_path:Pchar; usec_timeout:Tguint64; test_flags:TGTestSubprocessFlags);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before declarator ignored *)
procedure g_test_trap_subprocess_with_envp(test_path:Pchar; envp:PPchar; usec_timeout:Tguint64; test_flags:TGTestSubprocessFlags);cdecl;external;
function g_test_trap_has_passed:Tgboolean;cdecl;external;
function g_test_trap_reached_timeout:Tgboolean;cdecl;external;
{ was #define dname(params) para_def_expr }
{ return type might be wrong }   
function g_test_rand_bit : longint;

function g_test_rand_int:Tgint32;cdecl;external;
function g_test_rand_int_range(begin:Tgint32; end:Tgint32):Tgint32;cdecl;external;
function g_test_rand_double:Tdouble;cdecl;external;
function g_test_rand_double_range(range_start:Tdouble; range_end:Tdouble):Tdouble;cdecl;external;
(* Const before type ignored *)
function g_test_create_case(test_name:Pchar; data_size:Tgsize; test_data:Tgconstpointer; data_setup:TGTestFixtureFunc; data_test:TGTestFixtureFunc; 
           data_teardown:TGTestFixtureFunc):PGTestCase;cdecl;external;
(* Const before type ignored *)
function g_test_create_suite(suite_name:Pchar):PGTestSuite;cdecl;external;
function g_test_get_root:PGTestSuite;cdecl;external;
procedure g_test_suite_add(suite:PGTestSuite; test_case:PGTestCase);cdecl;external;
procedure g_test_suite_add_suite(suite:PGTestSuite; nestedsuite:PGTestSuite);cdecl;external;
function g_test_run_suite(suite:PGTestSuite):longint;cdecl;external;
procedure g_test_case_free(test_case:PGTestCase);cdecl;external;
procedure g_test_suite_free(suite:PGTestSuite);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure g_test_trap_assertions(domain:Pchar; file:Pchar; line:longint; func:Pchar; assertion_flags:Tguint64; 
            pattern:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure g_assertion_message(domain:Pchar; file:Pchar; line:longint; func:Pchar; message:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure g_assertion_message_expr(domain:Pchar; file:Pchar; line:longint; func:Pchar; expr:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure g_assertion_message_cmpstr(domain:Pchar; file:Pchar; line:longint; func:Pchar; expr:Pchar; 
            arg1:Pchar; cmp:Pchar; arg2:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before declarator ignored *)
(* Const before type ignored *)
(* Const before declarator ignored *)
procedure g_assertion_message_cmpstrv(domain:Pchar; file:Pchar; line:longint; func:Pchar; expr:Pchar; 
            arg1:PPchar; arg2:PPchar; first_wrong_idx:Tgsize);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure g_assertion_message_cmpint(domain:Pchar; file:Pchar; line:longint; func:Pchar; expr:Pchar; 
            arg1:Tguint64; cmp:Pchar; arg2:Tguint64; numtype:char);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure g_assertion_message_cmpnum(domain:Pchar; file:Pchar; line:longint; func:Pchar; expr:Pchar; 
            arg1:Tlong_double; cmp:Pchar; arg2:Tlong_double; numtype:char);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure g_assertion_message_error(domain:Pchar; file:Pchar; line:longint; func:Pchar; expr:Pchar; 
            error:PGError; error_domain:TGQuark; error_code:longint);cdecl;external;
(* Const before type ignored *)
procedure g_test_add_vtable(testpath:Pchar; data_size:Tgsize; test_data:Tgconstpointer; data_setup:TGTestFixtureFunc; data_test:TGTestFixtureFunc; 
            data_teardown:TGTestFixtureFunc);cdecl;external;
{ disable thorough tests  }
{ run performance tests  }
{ extra info  }
{ reduce output  }
{ run tests that are meant to assert  }
type
  PGTestConfig = ^TGTestConfig;
  TGTestConfig = record
      test_initialized : Tgboolean;
      test_quick : Tgboolean;
      test_perf : Tgboolean;
      test_verbose : Tgboolean;
      test_quiet : Tgboolean;
      test_undefined : Tgboolean;
    end;
(* Const before type ignored *)
(* Const before declarator ignored *)
  var
    g_test_config_vars : PGTestConfig;cvar;external;
{ internal logging API  }
type
  PGTestResult = ^TGTestResult;
  TGTestResult =  Longint;
  Const
    G_TEST_RUN_SUCCESS = 0;
    G_TEST_RUN_SKIPPED = 1;
    G_TEST_RUN_FAILURE = 2;
    G_TEST_RUN_INCOMPLETE = 3;
;
{ s:msg  }
{ s:binaryname s:seed  }
{ s:testpath  }
{ s:testpath  }
{ s:testpath  }
{ d:status d:nforks d:elapsed  }
{ s:blurb d:result  }
{ s:blurb d:result  }
{ s:blurb  }
type
  PGTestLogType = ^TGTestLogType;
  TGTestLogType =  Longint;
  Const
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
;
{ NULL terminated  }
type
  PGTestLogMsg = ^TGTestLogMsg;
  TGTestLogMsg = record
      log_type : TGTestLogType;
      n_strings : Tguint;
      strings : ^Pgchar;
      n_nums : Tguint;
      nums : Plong_double;
    end;
{< private > }

  PGTestLogBuffer = ^TGTestLogBuffer;
  TGTestLogBuffer = record
      data : PGString;
      msgs : PGSList;
    end;
(* Const before type ignored *)

function g_test_log_type_name(log_type:TGTestLogType):Pchar;cdecl;external;
function g_test_log_buffer_new:PGTestLogBuffer;cdecl;external;
procedure g_test_log_buffer_free(tbuffer:PGTestLogBuffer);cdecl;external;
(* Const before type ignored *)
procedure g_test_log_buffer_push(tbuffer:PGTestLogBuffer; n_bytes:Tguint; bytes:Pguint8);cdecl;external;
function g_test_log_buffer_pop(tbuffer:PGTestLogBuffer):PGTestLogMsg;cdecl;external;
procedure g_test_log_msg_free(tmsg:PGTestLogMsg);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
type

  TGTestLogFatalFunc = function (log_domain:Pgchar; log_level:TGLogLevelFlags; message:Pgchar; user_data:Tgpointer):Tgboolean;cdecl;

procedure g_test_log_set_fatal_handler(log_func:TGTestLogFatalFunc; user_data:Tgpointer);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure g_test_expect_message(log_domain:Pgchar; log_level:TGLogLevelFlags; pattern:Pgchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure g_test_assert_expected_messages_internal(domain:Pchar; file:Pchar; line:longint; func:Pchar);cdecl;external;
type
  PGTestFileType = ^TGTestFileType;
  TGTestFileType =  Longint;
  Const
    G_TEST_DIST = 0;
    G_TEST_BUILT = 1;
;
(* Const before type ignored *)

function g_test_build_filename(file_type:TGTestFileType; first_path:Pgchar; args:array of const):Pgchar;cdecl;external;
function g_test_build_filename(file_type:TGTestFileType; first_path:Pgchar):Pgchar;cdecl;external;
(* Const before type ignored *)
function g_test_get_dir(file_type:TGTestFileType):Pgchar;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function g_test_get_filename(file_type:TGTestFileType; first_path:Pgchar; args:array of const):Pgchar;cdecl;external;
function g_test_get_filename(file_type:TGTestFileType; first_path:Pgchar):Pgchar;cdecl;external;

implementation

{ was #define dname(params) para_def_expr }
{ return type might be wrong }   
function g_test_initialized : longint;
begin
  g_test_initialized:=g_test_config_vars^.test_initialized;
end;

{ was #define dname(params) para_def_expr }
{ return type might be wrong }   
function g_test_quick : longint;
begin
  g_test_quick:=g_test_config_vars^.test_quick;
end;

{ was #define dname(params) para_def_expr }
{ return type might be wrong }   
function g_test_slow : longint;
begin
  g_test_slow:= not (g_test_config_vars^.test_quick);
end;

{ was #define dname(params) para_def_expr }
{ return type might be wrong }   
function g_test_thorough : longint;
begin
  g_test_thorough:= not (g_test_config_vars^.test_quick);
end;

{ was #define dname(params) para_def_expr }
{ return type might be wrong }   
function g_test_perf : longint;
begin
  g_test_perf:=g_test_config_vars^.test_perf;
end;

{ was #define dname(params) para_def_expr }
{ return type might be wrong }   
function g_test_verbose : longint;
begin
  g_test_verbose:=g_test_config_vars^.test_verbose;
end;

{ was #define dname(params) para_def_expr }
{ return type might be wrong }   
function g_test_quiet : longint;
begin
  g_test_quiet:=g_test_config_vars^.test_quiet;
end;

{ was #define dname(params) para_def_expr }
{ return type might be wrong }   
function g_test_undefined : longint;
begin
  g_test_undefined:=g_test_config_vars^.test_undefined;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function g_test_queue_unref(gobject : longint) : longint;
begin
  g_test_queue_unref:=g_test_queue_destroy(g_object_unref,gobject);
end;

{ was #define dname(params) para_def_expr }
{ return type might be wrong }   
function g_test_rand_bit : longint;
begin
  g_test_rand_bit:=0<>((g_test_rand_int) and (1 shl 15));
end;


end.
