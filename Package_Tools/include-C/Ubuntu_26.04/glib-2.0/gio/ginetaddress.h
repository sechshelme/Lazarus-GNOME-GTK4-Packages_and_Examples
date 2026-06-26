/* GIO - GLib Input, Output and Streaming Library
 *
 * Copyright (C) 2008 Christian Kellner, Samuel Cormier-Iijima
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
 */

#ifndef __G_INET_ADDRESS_H__
#define __G_INET_ADDRESS_H__

#if !defined (__GIO_GIO_H_INSIDE__) && !defined (GIO_COMPILATION)
#error "Only <gio/gio.h> can be included directly."
#endif

#include <gio/giotypes.h>



#define G_TYPE_INET_ADDRESS         (g_inet_address_get_type ())
#define G_INET_ADDRESS(o)           (G_TYPE_CHECK_INSTANCE_CAST ((o), G_TYPE_INET_ADDRESS, GInetAddress))
#define G_INET_ADDRESS_CLASS(k)     (G_TYPE_CHECK_CLASS_CAST((k), G_TYPE_INET_ADDRESS, GInetAddressClass))
#define G_IS_INET_ADDRESS(o)        (G_TYPE_CHECK_INSTANCE_TYPE ((o), G_TYPE_INET_ADDRESS))
#define G_IS_INET_ADDRESS_CLASS(k)  (G_TYPE_CHECK_CLASS_TYPE ((k), G_TYPE_INET_ADDRESS))
#define G_INET_ADDRESS_GET_CLASS(o) (G_TYPE_INSTANCE_GET_CLASS ((o), G_TYPE_INET_ADDRESS, GInetAddressClass))

typedef struct _GInetAddressClass   GInetAddressClass;
typedef struct _GInetAddressPrivate GInetAddressPrivate;

struct _GInetAddress
{
  GObject parent_instance;

  /*< private >*/
  GInetAddressPrivate *priv;
};

struct _GInetAddressClass
{
  GObjectClass parent_class;

  gchar *        (*to_string) (GInetAddress *address);
  const guint8 * (*to_bytes)  (GInetAddress *address);
};

extern
GType                 g_inet_address_get_type             (void) ;

extern
GInetAddress *        g_inet_address_new_from_string      (const gchar          *string);

extern
GInetAddress *        g_inet_address_new_from_bytes       (const guint8         *bytes,
							   GSocketFamily         family);

extern
GInetAddress *        g_inet_address_new_loopback         (GSocketFamily         family);

extern
GInetAddress *        g_inet_address_new_from_bytes_with_ipv6_info (const guint8  *bytes,
                                                                    GSocketFamily  family,
                                                                    guint32        flowinfo,
                                                                    guint32        scope_id);

extern
GInetAddress *        g_inet_address_new_any              (GSocketFamily         family);

extern
gboolean              g_inet_address_equal                (GInetAddress         *address,
                                                           GInetAddress         *other_address);

extern
gchar *               g_inet_address_to_string            (GInetAddress         *address);

extern
const guint8 *        g_inet_address_to_bytes             (GInetAddress         *address);

extern
gsize                 g_inet_address_get_native_size      (GInetAddress         *address);

extern
GSocketFamily         g_inet_address_get_family           (GInetAddress         *address);

extern
gboolean              g_inet_address_get_is_any           (GInetAddress         *address);

extern
gboolean              g_inet_address_get_is_loopback      (GInetAddress         *address);

extern
gboolean              g_inet_address_get_is_link_local    (GInetAddress         *address);

extern
gboolean              g_inet_address_get_is_site_local    (GInetAddress         *address);

extern
gboolean              g_inet_address_get_is_multicast     (GInetAddress         *address);

extern
gboolean              g_inet_address_get_is_mc_global     (GInetAddress         *address);

extern
gboolean              g_inet_address_get_is_mc_link_local (GInetAddress         *address);

extern
gboolean              g_inet_address_get_is_mc_node_local (GInetAddress         *address);

extern
gboolean              g_inet_address_get_is_mc_org_local  (GInetAddress         *address);

extern
gboolean              g_inet_address_get_is_mc_site_local (GInetAddress         *address);

extern
guint32               g_inet_address_get_scope_id         (GInetAddress         *address);

extern
guint32               g_inet_address_get_flowinfo         (GInetAddress         *address);



#endif /* __G_INET_ADDRESS_H__ */
