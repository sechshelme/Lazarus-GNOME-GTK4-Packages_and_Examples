/*
 * Copyright © 2009, 2010 Christian Persch
 *
 * This library is free software: you can redistribute it and/or modify
 * it under the terms of the GNU Lesser General Public License as published
 * by the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public License
 * along with this library.  If not, see <https://www.gnu.org/licenses/>.
 */

#pragma once

#if !defined (__VTE_VTE_H_INSIDE__) && !defined (VTE_COMPILATION)
#error "Only <vte/vte.h> can be included directly."
#endif

#include <gio/gio.h>

#include "vteenums.h"
#include "vtemacros.h"



#define VTE_SPAWN_NO_PARENT_ENVV        (1 << 25)
#define VTE_SPAWN_NO_SYSTEMD_SCOPE      (1 << 26)
#define VTE_SPAWN_REQUIRE_SYSTEMD_SCOPE (1 << 27)

extern
GQuark vte_pty_error_quark (void) ;

/**
 * VTE_PTY_ERROR:
 *
 * Error domain for VTE PTY errors. Errors in this domain will be from the #VtePtyError
 * enumeration. See #GError for more information on error domains.
 */
#define VTE_PTY_ERROR (vte_pty_error_quark ())

/* VTE PTY object */

#define VTE_TYPE_PTY            (vte_pty_get_type())
#define VTE_PTY(obj)            (G_TYPE_CHECK_INSTANCE_CAST ((obj), VTE_TYPE_PTY, VtePty))
#define VTE_PTY_CLASS(klass)    (G_TYPE_CHECK_CLASS_CAST ((klass),  VTE_TYPE_PTY, VtePtyClass))
#define VTE_IS_PTY(obj)         (G_TYPE_CHECK_INSTANCE_TYPE ((obj), VTE_TYPE_PTY))
#define VTE_IS_PTY_CLASS(klass) (G_TYPE_CHECK_CLASS_TYPE ((klass),  VTE_TYPE_PTY))
#define VTE_PTY_GET_CLASS(obj)  (G_TYPE_INSTANCE_GET_CLASS ((obj),  VTE_TYPE_PTY, VtePtyClass))

typedef struct _VtePty        VtePty;
typedef struct _VtePtyClass   VtePtyClass;

extern
GType vte_pty_get_type (void);

extern
VtePty *vte_pty_new_sync (VtePtyFlags flags,
                          GCancellable *cancellable,
                          GError **error) ;

extern
VtePty *vte_pty_new_foreign_sync (int fd,
                                  GCancellable *cancellable,
                                  GError **error) ;

extern
int vte_pty_get_fd (VtePty *pty)  ;

extern
void vte_pty_child_setup (VtePty *pty)  ;

extern
gboolean vte_pty_get_size (VtePty *pty,
                           int *rows,
                           int *columns,
                           GError **error)  ;

extern
gboolean vte_pty_set_size (VtePty *pty,
                           int rows,
                           int columns,
                           GError **error)  ;

extern
gboolean vte_pty_set_utf8 (VtePty *pty,
                           gboolean utf8,
                           GError **error)  ;

extern
void vte_pty_spawn_async(VtePty *pty,
                         const char *working_directory,
                         char **argv,
                         char **envv,
                         GSpawnFlags spawn_flags,
                         GSpawnChildSetupFunc child_setup,
                         gpointer child_setup_data,
                         GDestroyNotify child_setup_data_destroy,
                         int timeout,
                         GCancellable *cancellable,
                         GAsyncReadyCallback callback,
                         gpointer user_data)  ;

extern
void vte_pty_spawn_with_fds_async(VtePty *pty,
                                  char const* working_directory,
                                  char const* const* argv,
                                  char const* const* envv,
                                  int const* fds,
                                  int n_fds,
                                  int const* map_fds,
                                  int n_map_fds,
                                  GSpawnFlags spawn_flags,
                                  GSpawnChildSetupFunc child_setup,
                                  gpointer child_setup_data,
                                  GDestroyNotify child_setup_data_destroy,
                                  int timeout,
                                  GCancellable *cancellable,
                                  GAsyncReadyCallback callback,
                                  gpointer user_data)  ;

extern
gboolean vte_pty_spawn_finish(VtePty *pty,
                              GAsyncResult *result,
                              GPid *child_pid /* out */,
                              GError **error) ;



