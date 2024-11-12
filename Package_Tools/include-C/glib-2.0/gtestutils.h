/* GLib testing utilities
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
 */

#ifndef __G_TEST_UTILS_H__
#define __G_TEST_UTILS_H__

#if !defined (__GLIB_H_INSIDE__) && !defined (GLIB_COMPILATION)
#error "Only <glib.h> can be included directly."
#endif

#include <glib/gmessages.h>
#include <glib/gstring.h>
#include <glib/gerror.h>
#include <glib/gslist.h>
#include <errno.h>
#include <stdlib.h>
#include <string.h>


typedef struct GTestCase  GTestCase;
typedef struct GTestSuite GTestSuite;
typedef void (*GTestFunc)        (void);
typedef void (*GTestDataFunc)    (gconstpointer user_data);
typedef void (*GTestFixtureFunc) (gpointer      fixture,
                                  gconstpointer user_data);


//#define g_assert(expr)                  G_STMT_START { \
//                                             if G_LIKELY (expr) ; else \
//                                               g_assertion_message_expr (G_LOG_DOMAIN, __FILE__, __LINE__, G_STRFUNC, \
//                                                                         #expr); \
//                                        } G_STMT_END


int     g_strcmp0                       (const char     *str1,
                                         const char     *str2);

/* report performance results */

void    g_test_minimized_result         (double          minimized_quantity,
                                         const char     *format,
                                         ...) ;

void    g_test_maximized_result         (double          maximized_quantity,
                                         const char     *format,
                                         ...) ;

/* initialize testing framework */

void    g_test_init                     (int            *argc,
                                         char         ***argv,
                                         ...) ;

#define G_TEST_OPTION_ISOLATE_DIRS "isolate_dirs"


/* query testing framework config */
#define g_test_initialized()            (g_test_config_vars->test_initialized)
#define g_test_quick()                  (g_test_config_vars->test_quick)
#define g_test_slow()                   (!g_test_config_vars->test_quick)
#define g_test_thorough()               (!g_test_config_vars->test_quick)
#define g_test_perf()                   (g_test_config_vars->test_perf)
#define g_test_verbose()                (g_test_config_vars->test_verbose)
#define g_test_quiet()                  (g_test_config_vars->test_quiet)
#define g_test_undefined()              (g_test_config_vars->test_undefined)

gboolean g_test_subprocess (void);

/* run all tests under toplevel suite (path: /) */

int     g_test_run                      (void);
/* hook up a test functions under test path */

void    g_test_add_func                 (const char     *testpath,
                                         GTestFunc       test_func);


void    g_test_add_data_func            (const char     *testpath,
                                         gconstpointer   test_data,
                                         GTestDataFunc   test_func);


void    g_test_add_data_func_full       (const char     *testpath,
                                         gpointer        test_data,
                                         GTestDataFunc   test_func,
                                         GDestroyNotify  data_free_func);

/* tell about currently run test */

const char * g_test_get_path            (void);

/* tell about failure */

void    g_test_fail                     (void);

void    g_test_fail_printf              (const char *format,
                                         ...) ;

void    g_test_incomplete               (const gchar *msg);

void    g_test_incomplete_printf        (const char *format,
                                         ...) ;

void    g_test_skip                     (const gchar *msg);

void    g_test_skip_printf              (const char *format,
                                         ...) ;

gboolean g_test_failed                  (void);

void    g_test_set_nonfatal_assertions  (void);

void    g_test_disable_crash_reporting  (void);


/* add test messages to the test report */

void    g_test_message                  (const char *format,
                                         ...) ;

void    g_test_bug_base                 (const char *uri_pattern);

void    g_test_bug                      (const char *bug_uri_snippet);

void    g_test_summary                  (const char *summary);
/* measure test timings */

void    g_test_timer_start              (void);

double  g_test_timer_elapsed            (void); /* elapsed seconds */

double  g_test_timer_last               (void); /* repeat last elapsed() result */

/* automatically g_free or g_object_unref upon teardown */

void    g_test_queue_free               (gpointer gfree_pointer);

void    g_test_queue_destroy            (GDestroyNotify destroy_func,
                                         gpointer       destroy_data);
#define g_test_queue_unref(gobject)     g_test_queue_destroy (g_object_unref, gobject)

typedef enum {
  G_TEST_TRAP_DEFAULT  = 0,
  G_TEST_TRAP_SILENCE_STDOUT    = 1 << 7,
  G_TEST_TRAP_SILENCE_STDERR    = 1 << 8,
  G_TEST_TRAP_INHERIT_STDIN     = 1 << 9
} GTestTrapFlags;

gboolean g_test_trap_fork               (guint64              usec_timeout,
                                         GTestTrapFlags       test_trap_flags);


typedef enum {
  G_TEST_SUBPROCESS_DEFAULT  = 0,
  G_TEST_SUBPROCESS_INHERIT_STDIN  = 1 << 0,
  G_TEST_SUBPROCESS_INHERIT_STDOUT = 1 << 1,
  G_TEST_SUBPROCESS_INHERIT_STDERR = 1 << 2
} GTestSubprocessFlags;


void     g_test_trap_subprocess         (const char           *test_path,
                                         guint64               usec_timeout,
                                         GTestSubprocessFlags  test_flags);

void     g_test_trap_subprocess_with_envp (const char           *test_path,
                                           const char * const   *envp,
                                           guint64               usec_timeout,
                                           GTestSubprocessFlags  test_flags);


gboolean g_test_trap_has_passed         (void);

gboolean g_test_trap_reached_timeout    (void);

#define  g_test_rand_bit()              (0 != (g_test_rand_int() & (1 << 15)))

gint32   g_test_rand_int                (void);

gint32   g_test_rand_int_range          (gint32          begin,
                                         gint32          end);

double   g_test_rand_double             (void);

double   g_test_rand_double_range       (double          range_start,
                                         double          range_end);

GTestCase*    g_test_create_case        (const char       *test_name,
                                         gsize             data_size,
                                         gconstpointer     test_data,
                                         GTestFixtureFunc  data_setup,
                                         GTestFixtureFunc  data_test,
                                         GTestFixtureFunc  data_teardown);

GTestSuite*   g_test_create_suite       (const char       *suite_name);

GTestSuite*   g_test_get_root           (void);

void          g_test_suite_add          (GTestSuite     *suite,
                                         GTestCase      *test_case);

void          g_test_suite_add_suite    (GTestSuite     *suite,
                                         GTestSuite     *nestedsuite);

int           g_test_run_suite          (GTestSuite     *suite);


void          g_test_case_free          (GTestCase *test_case);


void          g_test_suite_free         (GTestSuite     *suite);


void    g_test_trap_assertions          (const char     *domain,
                                         const char     *file,
                                         int             line,
                                         const char     *func,
                                         guint64         assertion_flags, 
                                         const char     *pattern);

void    g_assertion_message             (const char     *domain,
                                         const char     *file,
                                         int             line,
                                         const char     *func,
                                         const char     *message) ;

void    g_assertion_message_expr        (const char     *domain,
                                         const char     *file,
                                         int             line,
                                         const char     *func,
                                         const char     *expr);

void    g_assertion_message_cmpstr      (const char     *domain,
                                         const char     *file,
                                         int             line,
                                         const char     *func,
                                         const char     *expr,
                                         const char     *arg1,
                                         const char     *cmp,
                                         const char     *arg2) ;


void    g_assertion_message_cmpstrv     (const char         *domain,
                                         const char         *file,
                                         int                 line,
                                         const char         *func,
                                         const char         *expr,
                                         const char * const *arg1,
                                         const char * const *arg2,
                                         gsize               first_wrong_idx) ;

void    g_assertion_message_cmpint      (const char     *domain,
                                         const char     *file,
                                         int             line,
                                         const char     *func,
                                         const char     *expr,
                                         guint64         arg1,
                                         const char     *cmp,
                                         guint64         arg2,
                                         char            numtype) ;

void    g_assertion_message_cmpnum      (const char     *domain,
                                         const char     *file,
                                         int             line,
                                         const char     *func,
                                         const char     *expr,
                                         long_double     arg1,
                                         const char     *cmp,
                                         long_double     arg2,
                                         char            numtype) ;

void    g_assertion_message_error       (const char     *domain,
                                         const char     *file,
                                         int             line,
                                         const char     *func,
                                         const char     *expr,
                                         const GError   *error,
                                         GQuark          error_domain,
                                         int             error_code) ;

void    g_test_add_vtable               (const char     *testpath,
                                         gsize           data_size,
                                         gconstpointer   test_data,
                                         GTestFixtureFunc  data_setup,
                                         GTestFixtureFunc  data_test,
                                         GTestFixtureFunc  data_teardown);
typedef struct {
  gboolean      test_initialized;
  gboolean      test_quick;     /* disable thorough tests */
  gboolean      test_perf;      /* run performance tests */
  gboolean      test_verbose;   /* extra info */
  gboolean      test_quiet;     /* reduce output */
  gboolean      test_undefined; /* run tests that are meant to assert */
} GTestConfig;
extern const GTestConfig * const g_test_config_vars;

/* internal logging API */
typedef enum {
  G_TEST_RUN_SUCCESS,
  G_TEST_RUN_SKIPPED,
  G_TEST_RUN_FAILURE,
  G_TEST_RUN_INCOMPLETE
} GTestResult;

typedef enum {
  G_TEST_LOG_NONE,
  G_TEST_LOG_ERROR,             /* s:msg */
  G_TEST_LOG_START_BINARY,      /* s:binaryname s:seed */
  G_TEST_LOG_LIST_CASE,         /* s:testpath */
  G_TEST_LOG_SKIP_CASE,         /* s:testpath */
  G_TEST_LOG_START_CASE,        /* s:testpath */
  G_TEST_LOG_STOP_CASE,         /* d:status d:nforks d:elapsed */
  G_TEST_LOG_MIN_RESULT,        /* s:blurb d:result */
  G_TEST_LOG_MAX_RESULT,        /* s:blurb d:result */
  G_TEST_LOG_MESSAGE,           /* s:blurb */
  G_TEST_LOG_START_SUITE,
  G_TEST_LOG_STOP_SUITE
} GTestLogType;

typedef struct {
  GTestLogType  log_type;
  guint         n_strings;
  gchar       **strings; /* NULL terminated */
  guint         n_nums;
  long_double  *nums;
} GTestLogMsg;
typedef struct {
  /*< private >*/
  GString     *data;
  GSList      *msgs;
} GTestLogBuffer;


const char*     g_test_log_type_name    (GTestLogType    log_type);

GTestLogBuffer* g_test_log_buffer_new   (void);

void            g_test_log_buffer_free  (GTestLogBuffer *tbuffer);

void            g_test_log_buffer_push  (GTestLogBuffer *tbuffer,
                                         guint           n_bytes,
                                         const guint8   *bytes);

GTestLogMsg*    g_test_log_buffer_pop   (GTestLogBuffer *tbuffer);

void            g_test_log_msg_free     (GTestLogMsg    *tmsg);
typedef gboolean        (*GTestLogFatalFunc)    (const gchar    *log_domain,
                                                 GLogLevelFlags  log_level,
                                                 const gchar    *message,
                                                 gpointer        user_data);

void
g_test_log_set_fatal_handler            (GTestLogFatalFunc log_func,
                                         gpointer          user_data);


void    g_test_expect_message                    (const gchar    *log_domain,
                                                  GLogLevelFlags  log_level,
                                                  const gchar    *pattern);

void    g_test_assert_expected_messages_internal (const char     *domain,
                                                  const char     *file,
                                                  int             line,
                                                  const char     *func);

typedef enum
{
  G_TEST_DIST,
  G_TEST_BUILT
} GTestFileType;


gchar * g_test_build_filename                    (GTestFileType   file_type,
                                                  const gchar    *first_path,
                                                  ...) ;

const gchar *g_test_get_dir                      (GTestFileType   file_type);

const gchar *g_test_get_filename                 (GTestFileType   file_type,
                                                  const gchar    *first_path,
                                                  ...) ;


