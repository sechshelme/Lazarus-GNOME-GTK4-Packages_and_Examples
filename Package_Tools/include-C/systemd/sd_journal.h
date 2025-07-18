/* SPDX-License-Identifier: LGPL-2.1-or-later */
#ifndef foosdjournalhfoo
#define foosdjournalhfoo

/***
  systemd is free software; you can redistribute it and/or modify it
  under the terms of the GNU Lesser General Public License as published by
  the Free Software Foundation; either version 2.1 of the License, or
  (at your option) any later version.

  systemd is distributed in the hope that it will be useful, but
  WITHOUT ANY WARRANTY; without even the implied warranty of
  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
  Lesser General Public License for more details.

  You should have received a copy of the GNU Lesser General Public License
  along with systemd; If not, see <https://www.gnu.org/licenses/>.
***/

#include <inttypes.h>
#include <stdarg.h>
#include <sys/types.h>
#include <sys/uio.h>
#include <syslog.h>

#include "sd-id128.h"

#include "_sd-common.h"

/* Journal APIs. See sd-journal(3) for more information. */


/* Write to daemon */
int sd_journal_print(int priority, const char *format, ...) ;
int sd_journal_printv(int priority, const char *format, va_list ap) ;
int sd_journal_send(const char *format, ...) ;
int sd_journal_sendv(const struct iovec *iov, int n);
int sd_journal_perror(const char *message);

/* Used by the macros below. You probably don't want to call this directly. */
int sd_journal_print_with_location(int priority, const char *file, const char *line, const char *func, const char *format, ...);
int sd_journal_printv_with_location(int priority, const char *file, const char *line, const char *func, const char *format, va_list ap) ;
int sd_journal_send_with_location(const char *file, const char *line, const char *func, const char *format, ...) ;
int sd_journal_sendv_with_location(const char *file, const char *line, const char *func, const struct iovec *iov, int n);
int sd_journal_perror_with_location(const char *file, const char *line, const char *func, const char *message);

/* implicitly add code location to messages sent, if this is enabled */
#ifndef SD_JOURNAL_SUPPRESS_LOCATION


#endif

int sd_journal_stream_fd(const char *identifier, int priority, int level_prefix);

/* Browse journal stream */

typedef struct sd_journal sd_journal;

/* Open flags */
enum xxxx{
        SD_JOURNAL_LOCAL_ONLY                = 1 << 0,
        SD_JOURNAL_RUNTIME_ONLY              = 1 << 1,
        SD_JOURNAL_SYSTEM                    = 1 << 2,
        SD_JOURNAL_CURRENT_USER              = 1 << 3,
        SD_JOURNAL_OS_ROOT                   = 1 << 4,
        SD_JOURNAL_ALL_NAMESPACES            = 1 << 5, /* Show all namespaces, not just the default or specified one */
        SD_JOURNAL_INCLUDE_DEFAULT_NAMESPACE = 1 << 6, /* Show default namespace in addition to specified one */
        SD_JOURNAL_TAKE_DIRECTORY_FD         = 1 << 7, /* sd_journal_open_directory_fd() will take ownership of the provided file descriptor. */

        SD_JOURNAL_SYSTEM_ONLY  = SD_JOURNAL_SYSTEM /* old name */
};

/* Wakeup event types */
enum xxxxx{
        SD_JOURNAL_NOP,
        SD_JOURNAL_APPEND,
        SD_JOURNAL_INVALIDATE
};

int sd_journal_open(sd_journal **ret, int flags);
int sd_journal_open_namespace(sd_journal **ret, const char *name_space, int flags);
int sd_journal_open_directory(sd_journal **ret, const char *path, int flags);
int sd_journal_open_directory_fd(sd_journal **ret, int fd, int flags);
int sd_journal_open_files(sd_journal **ret, const char **paths, int flags);
int sd_journal_open_files_fd(sd_journal **ret, int fds[], unsigned n_fds, int flags);
int sd_journal_open_container(sd_journal **ret, const char *machine, int flags) /*_sd_deprecated_*/;
void sd_journal_close(sd_journal *j);

int sd_journal_previous(sd_journal *j);
int sd_journal_next(sd_journal *j);
int sd_journal_step_one(sd_journal *j, int advanced);

int sd_journal_previous_skip(sd_journal *j, uint64_t skip);
int sd_journal_next_skip(sd_journal *j, uint64_t skip);

int sd_journal_get_realtime_usec(sd_journal *j, uint64_t *ret);
int sd_journal_get_monotonic_usec(sd_journal *j, uint64_t *ret, sd_id128_t *ret_boot_id);
int sd_journal_get_seqnum(sd_journal *j, uint64_t *ret_seqnum, sd_id128_t *ret_seqnum_id);

int sd_journal_set_data_threshold(sd_journal *j, size_t sz);
int sd_journal_get_data_threshold(sd_journal *j, size_t *sz);

int sd_journal_get_data(sd_journal *j, const char *field, const void **data, size_t *l);
int sd_journal_enumerate_data(sd_journal *j, const void **data, size_t *l);
int sd_journal_enumerate_available_data(sd_journal *j, const void **data, size_t *l);
void sd_journal_restart_data(sd_journal *j);

int sd_journal_add_match(sd_journal *j, const void *data, size_t size);
int sd_journal_add_disjunction(sd_journal *j);
int sd_journal_add_conjunction(sd_journal *j);
void sd_journal_flush_matches(sd_journal *j);

int sd_journal_seek_head(sd_journal *j);
int sd_journal_seek_tail(sd_journal *j);
int sd_journal_seek_monotonic_usec(sd_journal *j, sd_id128_t boot_id, uint64_t usec);
int sd_journal_seek_realtime_usec(sd_journal *j, uint64_t usec);
int sd_journal_seek_cursor(sd_journal *j, const char *cursor);

int sd_journal_get_cursor(sd_journal *j, char **cursor);
int sd_journal_test_cursor(sd_journal *j, const char *cursor);

int sd_journal_get_cutoff_realtime_usec(sd_journal *j, uint64_t *from, uint64_t *to);
int sd_journal_get_cutoff_monotonic_usec(sd_journal *j, const sd_id128_t boot_id, uint64_t *from, uint64_t *to);

int sd_journal_get_usage(sd_journal *j, uint64_t *bytes);

int sd_journal_query_unique(sd_journal *j, const char *field);
int sd_journal_enumerate_unique(sd_journal *j, const void **data, size_t *l);
int sd_journal_enumerate_available_unique(sd_journal *j, const void **data, size_t *l);
void sd_journal_restart_unique(sd_journal *j);

int sd_journal_enumerate_fields(sd_journal *j, const char **field);
void sd_journal_restart_fields(sd_journal *j);

int sd_journal_get_fd(sd_journal *j);
int sd_journal_get_events(sd_journal *j);
int sd_journal_get_timeout(sd_journal *j, uint64_t *timeout_usec);
int sd_journal_process(sd_journal *j);
int sd_journal_wait(sd_journal *j, uint64_t timeout_usec);
int sd_journal_reliable_fd(sd_journal *j);

int sd_journal_get_catalog(sd_journal *j, char **text);
int sd_journal_get_catalog_for_message_id(sd_id128_t id, char **text);

int sd_journal_has_runtime_files(sd_journal *j);
int sd_journal_has_persistent_files(sd_journal *j);


#endif
