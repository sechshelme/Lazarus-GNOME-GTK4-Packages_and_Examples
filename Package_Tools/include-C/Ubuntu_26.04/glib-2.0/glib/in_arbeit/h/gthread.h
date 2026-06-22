/* GLIB - Library of useful routines for C programming
 * Copyright (C) 1995-1997  Peter Mattis, Spencer Kimball and Josh MacDonald
 *
 * SPDX-License-Identifier: LGPL-2.1-or-later
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful, but
 * WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library; if not, see <http://www.gnu.org/licenses/>.
 */

/*
 * Modified by the GLib Team and others 1997-2000.  See the AUTHORS
 * file for a list of people on the GLib Team.  See the ChangeLog
 * files for a list of changes.  These files are distributed with
 * GLib at ftp://ftp.gtk.org/pub/gtk/.
 */

#ifndef __G_THREAD_H__
#define __G_THREAD_H__

#if !defined (__GLIB_H_INSIDE__) && !defined (GLIB_COMPILATION)
#error "Only <glib.h> can be included directly."
#endif

#include <glib/gatomic.h>
#include <glib/gerror.h>
#include <glib/gutils.h>



#define G_THREAD_ERROR g_thread_error_quark ()
extern
GQuark g_thread_error_quark (void);

typedef enum
{
  G_THREAD_ERROR_AGAIN /* Resource temporarily unavailable */
} GThreadError;

typedef gpointer (*GThreadFunc) (gpointer data);

typedef struct _GThread         GThread;

typedef union  _GMutex          GMutex;
typedef struct _GRecMutex       GRecMutex;
typedef struct _GRWLock         GRWLock;
typedef struct _GCond           GCond;
typedef struct _GPrivate        GPrivate;
typedef struct _GOnce           GOnce;

union _GMutex
{
  /*< private >*/
  gpointer p;
  guint i[2];
};

struct _GRWLock
{
  /*< private >*/
  gpointer p;
  guint i[2];
};

struct _GCond
{
  /*< private >*/
  gpointer p;
  guint i[2];
};

struct _GRecMutex
{
  /*< private >*/
  gpointer p;
  guint i[2];
};

//xxxxxxx #define G_PRIVATE_INIT(notify) { NULL, (notify), { NULL, NULL } }
struct _GPrivate
{
  /*< private >*/
  gpointer       p;
  GDestroyNotify notify;
  gpointer future[2];
};

typedef enum
{
  G_ONCE_STATUS_NOTCALLED,
  G_ONCE_STATUS_PROGRESS,
  G_ONCE_STATUS_READY
} GOnceStatus;

// xxxxxxxxxx#define G_ONCE_INIT { G_ONCE_STATUS_NOTCALLED, NULL }
struct _GOnce
{
   GOnceStatus status;
   gpointer retval;
};


extern
GThread *       g_thread_ref                    (GThread        *thread);
extern
void            g_thread_unref                  (GThread        *thread);
extern
GThread *       g_thread_new                    (const gchar    *name,
                                                 GThreadFunc     func,
                                                 gpointer        data);
extern
GThread *       g_thread_try_new                (const gchar    *name,
                                                 GThreadFunc     func,
                                                 gpointer        data,
                                                 GError        **error);
extern
GThread *       g_thread_self                   (void);
extern
void            g_thread_exit                   (gpointer        retval);
extern
gpointer        g_thread_join                   (GThread        *thread);
extern
void            g_thread_yield                  (void);

extern
const char *    g_thread_get_name               (GThread        *thread);

extern
void            g_mutex_init                    (GMutex         *mutex);
extern
void            g_mutex_clear                   (GMutex         *mutex);
extern
void            g_mutex_lock                    (GMutex         *mutex);
extern
gboolean        g_mutex_trylock                 (GMutex         *mutex);
extern
void            g_mutex_unlock                  (GMutex         *mutex);

extern
void            g_rw_lock_init                  (GRWLock        *rw_lock);
extern
void            g_rw_lock_clear                 (GRWLock        *rw_lock);
extern
void            g_rw_lock_writer_lock           (GRWLock        *rw_lock);
extern
gboolean        g_rw_lock_writer_trylock        (GRWLock        *rw_lock);
extern
void            g_rw_lock_writer_unlock         (GRWLock        *rw_lock);
extern
void            g_rw_lock_reader_lock           (GRWLock        *rw_lock);
extern
gboolean        g_rw_lock_reader_trylock        (GRWLock        *rw_lock);
extern
void            g_rw_lock_reader_unlock         (GRWLock        *rw_lock);

extern
void            g_rec_mutex_init                (GRecMutex      *rec_mutex);
extern
void            g_rec_mutex_clear               (GRecMutex      *rec_mutex);
extern
void            g_rec_mutex_lock                (GRecMutex      *rec_mutex);
extern
gboolean        g_rec_mutex_trylock             (GRecMutex      *rec_mutex);
extern
void            g_rec_mutex_unlock              (GRecMutex      *rec_mutex);

extern
void            g_cond_init                     (GCond          *cond);
extern
void            g_cond_clear                    (GCond          *cond);
extern
void            g_cond_wait                     (GCond          *cond,
                                                 GMutex         *mutex);
extern
void            g_cond_signal                   (GCond          *cond);
extern
void            g_cond_broadcast                (GCond          *cond);
extern
gboolean        g_cond_wait_until               (GCond          *cond,
                                                 GMutex         *mutex,
                                                 gint64          end_time);

extern
gpointer        g_private_get                   (GPrivate       *key);
extern
void            g_private_set                   (GPrivate       *key,
                                                 gpointer        value);
extern
void            g_private_replace               (GPrivate       *key,
                                                 gpointer        value);

extern
gpointer        g_once_impl                     (GOnce          *once,
                                                 GThreadFunc     func,
                                                 gpointer        arg);
extern
gboolean        g_once_init_enter               ( void  *location);
extern
void            g_once_init_leave               ( void  *location,
                                                 gsize           result);

extern
gboolean g_once_init_enter_pointer              (void *location);
extern
void g_once_init_leave_pointer                  (void *location,
                                                 gpointer result);


extern
guint          g_get_num_processors (void);

/**
 * GMutexLocker:
 *
 * Opaque type. See g_mutex_locker_new() for details.
 * Since: 2.44
 */
typedef void GMutexLocker;

/**xxxxxxxxxx
GLIB_AVAILABLE_STATIC_INLINE_IN_2_44
static inline GMutexLocker *
g_mutex_locker_new (GMutex *mutex)
{
  g_mutex_lock (mutex);
  return (GMutexLocker *) mutex;
}

GLIB_AVAILABLE_STATIC_INLINE_IN_2_44
static inline void
g_mutex_locker_free (GMutexLocker *locker)
{
  g_mutex_unlock ((GMutex *) locker);
}

 */
typedef void GRecMutexLocker;

/**xxxxxxxxx

static inline GRecMutexLocker *
g_rec_mutex_locker_new (GRecMutex *rec_mutex)
{
  g_rec_mutex_lock (rec_mutex);
  return (GRecMutexLocker *) rec_mutex;
}


static inline void
g_rec_mutex_locker_free (GRecMutexLocker *locker)
{
  g_rec_mutex_unlock ((GRecMutex *) locker);
}


 */
#ifdef g_autoptr
/**
 * GRWLockWriterLocker:
 *
 * Opaque type. See g_rw_lock_writer_locker_new() for details.
 * Since: 2.62
 */
typedef void GRWLockWriterLocker;

/**
static inline GRWLockWriterLocker *
g_rw_lock_writer_locker_new (GRWLock *rw_lock)
{
  g_rw_lock_writer_lock (rw_lock);
  return (GRWLockWriterLocker *) rw_lock;
}


static inline void
g_rw_lock_writer_locker_free (GRWLockWriterLocker *locker)
{
  g_rw_lock_writer_unlock ((GRWLock *) locker);
}

static inline GRWLockReaderLocker *
g_rw_lock_reader_locker_new (GRWLock *rw_lock)
{
  g_rw_lock_reader_lock (rw_lock);
  return (GRWLockReaderLocker *) rw_lock;
}


static inline void
g_rw_lock_reader_locker_free (GRWLockReaderLocker *locker)
{
  g_rw_lock_reader_unlock ((GRWLock *) locker);
}
_ */
