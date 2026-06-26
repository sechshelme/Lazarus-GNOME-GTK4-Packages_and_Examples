/*
 * Copyright © 2008 Christian Kellner, Samuel Cormier-Iijima
 * Copyright © 2009 Codethink Limited
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
 *
 * Authors: Christian Kellner <gicmo@gnome.org>
 *          Samuel Cormier-Iijima <sciyoshi@gmail.com>
 *          Ryan Lortie <desrt@desrt.ca>
 */

#ifndef __G_SOCKET_H__
#define __G_SOCKET_H__

#if !defined (__GIO_GIO_H_INSIDE__) && !defined (GIO_COMPILATION)
#error "Only <gio/gio.h> can be included directly."
#endif

#include <gio/giotypes.h>



#define G_TYPE_SOCKET                                       (g_socket_get_type ())
#define G_SOCKET(inst)                                      (G_TYPE_CHECK_INSTANCE_CAST ((inst),                     \
                                                             G_TYPE_SOCKET, GSocket))
#define G_SOCKET_CLASS(class)                               (G_TYPE_CHECK_CLASS_CAST ((class),                       \
                                                             G_TYPE_SOCKET, GSocketClass))
#define G_IS_SOCKET(inst)                                   (G_TYPE_CHECK_INSTANCE_TYPE ((inst),                     \
                                                             G_TYPE_SOCKET))
#define G_IS_SOCKET_CLASS(class)                            (G_TYPE_CHECK_CLASS_TYPE ((class),                       \
                                                             G_TYPE_SOCKET))
#define G_SOCKET_GET_CLASS(inst)                            (G_TYPE_INSTANCE_GET_CLASS ((inst),                      \
                                                             G_TYPE_SOCKET, GSocketClass))

typedef struct _GSocketPrivate                              GSocketPrivate;
typedef struct _GSocketClass                                GSocketClass;

struct _GSocketClass
{
  GObjectClass parent_class;

  /*< private >*/

  /* Padding for future expansion */
  void (*_g_reserved1) (void);
  void (*_g_reserved2) (void);
  void (*_g_reserved3) (void);
  void (*_g_reserved4) (void);
  void (*_g_reserved5) (void);
  void (*_g_reserved6) (void);
  void (*_g_reserved7) (void);
  void (*_g_reserved8) (void);
  void (*_g_reserved9) (void);
  void (*_g_reserved10) (void);
};

struct _GSocket
{
  GObject parent_instance;
  GSocketPrivate *priv;
};

extern
GType                  g_socket_get_type                (void) ;
extern
GSocket *              g_socket_new                     (GSocketFamily            family,
							 GSocketType              type,
							 GSocketProtocol          protocol,
							 GError                 **error);
extern
GSocket *              g_socket_new_from_fd             (gint                     fd,
							 GError                 **error);
extern
int                    g_socket_get_fd                  (GSocket                 *socket);
extern
GSocketFamily          g_socket_get_family              (GSocket                 *socket);
extern
GSocketType            g_socket_get_socket_type         (GSocket                 *socket);
extern
GSocketProtocol        g_socket_get_protocol            (GSocket                 *socket);
extern
GSocketAddress *       g_socket_get_local_address       (GSocket                 *socket,
							 GError                 **error);
extern
GSocketAddress *       g_socket_get_remote_address      (GSocket                 *socket,
							 GError                 **error);
extern
void                   g_socket_set_blocking            (GSocket                 *socket,
							 gboolean                 blocking);
extern
gboolean               g_socket_get_blocking            (GSocket                 *socket);
extern
void                   g_socket_set_keepalive           (GSocket                 *socket,
							 gboolean                 keepalive);
extern
gboolean               g_socket_get_keepalive           (GSocket                 *socket);
extern
gint                   g_socket_get_listen_backlog      (GSocket                 *socket);
extern
void                   g_socket_set_listen_backlog      (GSocket                 *socket,
							 gint                     backlog);
extern
guint                  g_socket_get_timeout             (GSocket                 *socket);
extern
void                   g_socket_set_timeout             (GSocket                 *socket,
							 guint                    timeout);

extern
guint                  g_socket_get_ttl                 (GSocket                 *socket);
extern
void                   g_socket_set_ttl                 (GSocket                 *socket,
                                                         guint                    ttl);

extern
gboolean               g_socket_get_broadcast           (GSocket                 *socket);
extern
void                   g_socket_set_broadcast           (GSocket                 *socket,
                                                         gboolean		  broadcast);

extern
gboolean               g_socket_get_multicast_loopback  (GSocket                 *socket);
extern
void                   g_socket_set_multicast_loopback  (GSocket                 *socket,
                                                         gboolean		  loopback);
extern
guint                  g_socket_get_multicast_ttl       (GSocket                 *socket);
extern
void                   g_socket_set_multicast_ttl       (GSocket                 *socket,
                                                         guint                    ttl);
extern
gboolean               g_socket_is_connected            (GSocket                 *socket);
extern
gboolean               g_socket_bind                    (GSocket                 *socket,
							 GSocketAddress          *address,
							 gboolean                 allow_reuse,
							 GError                 **error);
extern
gboolean               g_socket_join_multicast_group    (GSocket                 *socket,
                                                         GInetAddress            *group,
                                                         gboolean                 source_specific,
                                                         const gchar             *iface,
                                                         GError                 **error);
extern
gboolean               g_socket_leave_multicast_group   (GSocket                 *socket,
                                                         GInetAddress            *group,
                                                         gboolean                 source_specific,
                                                         const gchar             *iface,
                                                         GError                 **error);
extern
gboolean               g_socket_join_multicast_group_ssm    (GSocket                 *socket,
                                                             GInetAddress            *group,
                                                             GInetAddress            *source_specific,
                                                             const gchar             *iface,
                                                             GError                 **error);
extern
gboolean               g_socket_leave_multicast_group_ssm   (GSocket                 *socket,
                                                             GInetAddress            *group,
                                                             GInetAddress            *source_specific,
                                                             const gchar             *iface,
                                                             GError                 **error);
extern
gboolean               g_socket_connect                 (GSocket                 *socket,
							 GSocketAddress          *address,
							 GCancellable            *cancellable,
							 GError                 **error);
extern
gboolean               g_socket_check_connect_result    (GSocket                 *socket,
							 GError                 **error);

extern
gssize                 g_socket_get_available_bytes     (GSocket                 *socket);

extern
GIOCondition           g_socket_condition_check         (GSocket                 *socket,
							 GIOCondition             condition);
extern
gboolean               g_socket_condition_wait          (GSocket                 *socket,
							 GIOCondition             condition,
							 GCancellable            *cancellable,
							 GError                 **error);
extern
gboolean               g_socket_condition_timed_wait    (GSocket                 *socket,
							 GIOCondition             condition,
							 gint64                   timeout_us,
							 GCancellable            *cancellable,
							 GError                 **error);
extern
GSocket *              g_socket_accept                  (GSocket                 *socket,
							 GCancellable            *cancellable,
							 GError                 **error);
extern
gboolean               g_socket_listen                  (GSocket                 *socket,
							 GError                 **error);
extern
gssize                 g_socket_receive                 (GSocket                 *socket,
							 gchar                   *buffer,
							 gsize                    size,
							 GCancellable            *cancellable,
							 GError                 **error);
extern
GBytes *               g_socket_receive_bytes           (GSocket                 *socket,
                                                         gsize                    size,
                                                         gint64                   timeout_us,
                                                         GCancellable            *cancellable,
                                                         GError                 **error);
extern
gssize                 g_socket_receive_from            (GSocket                 *socket,
							 GSocketAddress         **address,
							 gchar                   *buffer,
							 gsize                    size,
							 GCancellable            *cancellable,
							 GError                 **error);
extern
GBytes *               g_socket_receive_bytes_from      (GSocket                 *socket,
                                                         GSocketAddress         **address,
                                                         gsize                    size,
                                                         gint64                   timeout_us,
                                                         GCancellable            *cancellable,
                                                         GError                 **error);
extern
gssize                 g_socket_send                    (GSocket                 *socket,
							 const gchar             *buffer,
							 gsize                    size,
							 GCancellable            *cancellable,
							 GError                 **error);
extern
gssize                 g_socket_send_to                 (GSocket                 *socket,
							 GSocketAddress          *address,
							 const gchar             *buffer,
							 gsize                    size,
							 GCancellable            *cancellable,
							 GError                 **error);
extern
gssize                 g_socket_receive_message         (GSocket                 *socket,
							 GSocketAddress         **address,
							 GInputVector            *vectors,
							 gint                     num_vectors,
							 GSocketControlMessage ***messages,
							 gint                    *num_messages,
							 gint                    *flags,
							 GCancellable            *cancellable,
							 GError                 **error);
extern
gssize                 g_socket_send_message            (GSocket                 *socket,
							 GSocketAddress          *address,
							 GOutputVector           *vectors,
							 gint                     num_vectors,
							 GSocketControlMessage  **messages,
							 gint                     num_messages,
							 gint                     flags,
							 GCancellable            *cancellable,
							 GError                 **error);

extern
gint                   g_socket_receive_messages        (GSocket                 *socket,
                                                         GInputMessage           *messages,
                                                         guint                    num_messages,
                                                         gint                     flags,
                                                         GCancellable            *cancellable,
                                                         GError                 **error);
extern
gint                   g_socket_send_messages           (GSocket                 *socket,
							 GOutputMessage          *messages,
							 guint                    num_messages,
							 gint                     flags,
							 GCancellable            *cancellable,
							 GError                 **error);

extern
gboolean               g_socket_close                   (GSocket                 *socket,
							 GError                 **error);
extern
gboolean               g_socket_shutdown                (GSocket                 *socket,
							 gboolean                 shutdown_read,
							 gboolean                 shutdown_write,
							 GError                 **error);
extern
gboolean               g_socket_is_closed               (GSocket                 *socket);
extern
GSource *              g_socket_create_source           (GSocket                 *socket,
							 GIOCondition             condition,
							 GCancellable            *cancellable);
extern
gboolean               g_socket_speaks_ipv4             (GSocket                 *socket);
extern
GCredentials          *g_socket_get_credentials         (GSocket                 *socket,
                                                         GError                 **error);

extern
gssize                 g_socket_receive_with_blocking   (GSocket                 *socket,
							 gchar                   *buffer,
							 gsize                    size,
							 gboolean                 blocking,
							 GCancellable            *cancellable,
							 GError                 **error);
extern
gssize                 g_socket_send_with_blocking      (GSocket                 *socket,
							 const gchar             *buffer,
							 gsize                    size,
							 gboolean                 blocking,
							 GCancellable            *cancellable,
							 GError                 **error);
extern
GPollableReturn        g_socket_send_message_with_timeout (GSocket                *socket,
							   GSocketAddress         *address,
							   const GOutputVector    *vectors,
							   gint                    num_vectors,
							   GSocketControlMessage **messages,
							   gint                    num_messages,
							   gint                    flags,
							   gint64                  timeout_us,
							   gsize                  *bytes_written,
							   GCancellable           *cancellable,
							   GError                **error);
extern
gboolean               g_socket_get_option              (GSocket                 *socket,
							 gint                     level,
							 gint                     optname,
							 gint                    *value,
							 GError                 **error);
extern
gboolean               g_socket_set_option              (GSocket                 *socket,
							 gint                     level,
							 gint                     optname,
							 gint                     value,
							 GError                 **error);



#endif /* __G_SOCKET_H__ */
