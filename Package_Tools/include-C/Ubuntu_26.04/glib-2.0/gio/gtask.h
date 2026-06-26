/* GIO - GLib Input, Output and Streaming Library
 *
 * Copyright 2011 Red Hat, Inc.
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
 * You should have received a copy of the GNU Lesser General
 * Public License along with this library; if not, see <http://www.gnu.org/licenses/>.
 */

#ifndef __G_TASK_H__
#define __G_TASK_H__

#if !defined (__GIO_GIO_H_INSIDE__) && !defined (GIO_COMPILATION)
#error "Only <gio/gio.h> can be included directly."
#endif

#include <gio/giotypes.h>



#define G_TYPE_TASK         (g_task_get_type ())
#define G_TASK(o)           (G_TYPE_CHECK_INSTANCE_CAST ((o), G_TYPE_TASK, GTask))
#define G_TASK_CLASS(k)     (G_TYPE_CHECK_CLASS_CAST((k), G_TYPE_TASK, GTaskClass))
#define G_IS_TASK(o)        (G_TYPE_CHECK_INSTANCE_TYPE ((o), G_TYPE_TASK))
#define G_IS_TASK_CLASS(k)  (G_TYPE_CHECK_CLASS_TYPE ((k), G_TYPE_TASK))
#define G_TASK_GET_CLASS(o) (G_TYPE_INSTANCE_GET_CLASS ((o), G_TYPE_TASK, GTaskClass))

typedef struct _GTaskClass   GTaskClass;

extern
GType         g_task_get_type              (void) ;

extern
GTask        *g_task_new                   (gpointer             source_object,
                                            GCancellable        *cancellable,
                                            GAsyncReadyCallback  callback,
                                            gpointer             callback_data);

extern
void          g_task_report_error          (gpointer             source_object,
                                            GAsyncReadyCallback  callback,
                                            gpointer             callback_data,
                                            gpointer             source_tag,
                                            GError              *error);
extern
void          g_task_report_new_error      (gpointer             source_object,
                                            GAsyncReadyCallback  callback,
                                            gpointer             callback_data,
                                            gpointer             source_tag,
                                            GQuark               domain,
                                            gint                 code,
                                            const char          *format,
                                            ...) ;(7, 8);

extern
void          g_task_set_task_data         (GTask               *task,
                                            gpointer             task_data,
                                            GDestroyNotify       task_data_destroy);
extern
void          g_task_set_priority          (GTask               *task,
                                            gint                 priority);
extern
void          g_task_set_check_cancellable (GTask               *task,
                                            gboolean             check_cancellable);
extern
void          g_task_set_source_tag        (GTask               *task,
                                            gpointer             source_tag);
extern
void          g_task_set_name              (GTask               *task,
                                            const gchar         *name);
extern
void          g_task_set_static_name       (GTask               *task,
                                            const gchar         *name);

/* Macro wrapper to set the task name when setting the source tag. */
#if GLIB_VERSION_MIN_REQUIRED >= GLIB_VERSION_2_76
#define g_task_set_source_tag(task, tag) G_STMT_START { \
  GTask *_task = (task); \
  (g_task_set_source_tag) (_task, tag); \
  if (g_task_get_name (_task) == NULL) \
    g_task_set_static_name (_task, G_STRINGIFY (tag)); \
} G_STMT_END
#endif

#if GLIB_VERSION_MIN_REQUIRED >= GLIB_VERSION_2_76
#if defined (__GNUC__) && (__GNUC__ >= 2)
#define g_task_set_name(task, name) G_STMT_START { \
  GTask *_task = (task); \
  if (__builtin_constant_p (name)) \
    g_task_set_static_name (_task, name); \
  else \
    g_task_set_name (_task, name); \
} G_STMT_END
#endif
#endif

extern
gpointer      g_task_get_source_object     (GTask               *task);
extern
gpointer      g_task_get_task_data         (GTask               *task);
extern
gint          g_task_get_priority          (GTask               *task);
extern
GMainContext *g_task_get_context           (GTask               *task);
extern
GCancellable *g_task_get_cancellable       (GTask               *task);
extern
gboolean      g_task_get_check_cancellable (GTask               *task);
extern
gpointer      g_task_get_source_tag        (GTask               *task);
extern
const gchar  *g_task_get_name              (GTask               *task);

extern
gboolean      g_task_is_valid              (gpointer             result,
                                            gpointer             source_object);


typedef void (*GTaskThreadFunc)           (GTask           *task,
                                           gpointer         source_object,
                                           gpointer         task_data,
                                           GCancellable    *cancellable);
extern
void          g_task_run_in_thread        (GTask           *task,
                                           GTaskThreadFunc  task_func);
extern
void          g_task_run_in_thread_sync   (GTask           *task,
                                           GTaskThreadFunc  task_func);
extern
gboolean      g_task_set_return_on_cancel (GTask           *task,
                                           gboolean         return_on_cancel);
extern
gboolean      g_task_get_return_on_cancel (GTask           *task);

extern
void          g_task_attach_source        (GTask           *task,
                                           GSource         *source,
                                           GSourceFunc      callback);


extern
void          g_task_return_pointer            (GTask           *task,
                                                gpointer         result,
                                                GDestroyNotify   result_destroy);
extern
void          g_task_return_boolean            (GTask           *task,
                                                gboolean         result);
extern
void          g_task_return_int                (GTask           *task,
                                                gssize           result);

extern
void          g_task_return_error              (GTask           *task,
                                                GError          *error);
extern
void          g_task_return_prefixed_error     (GTask           *task,
                                                GError          *error,
                                                const char      *format,
                                                ...) ; (3, 4);

extern
void          g_task_return_new_error          (GTask           *task,
                                                GQuark           domain,
                                                gint             code,
                                                const char      *format,
                                                ...) ; (4, 5);

extern
void          g_task_return_new_error_literal  (GTask           *task,
                                                GQuark           domain,
                                                gint             code,
                                                const char      *message);
extern
void          g_task_return_value              (GTask           *task,
                                                GValue          *result);

extern
gboolean      g_task_return_error_if_cancelled (GTask           *task);

extern
gpointer      g_task_propagate_pointer         (GTask           *task,
                                                GError         **error);
extern
gboolean      g_task_propagate_boolean         (GTask           *task,
                                                GError         **error);
extern
gssize        g_task_propagate_int             (GTask           *task,
                                                GError         **error);
extern
gboolean      g_task_propagate_value           (GTask           *task,
                                                GValue          *value,
                                                GError         **error);
extern
gboolean      g_task_had_error                 (GTask           *task);
extern
gboolean      g_task_get_completed             (GTask           *task);

/*< private >*/
#ifndef __GTK_DOC_IGNORE__
#ifndef __GI_SCANNER__
/* Debugging API, not part of the public API */
void g_task_print_alive_tasks (void);
#endif /* !__GI_SCANNER__ */
#endif  /* !__GTK_DOC_IGNORE__ */



#endif /* __G_TASK_H__ */
