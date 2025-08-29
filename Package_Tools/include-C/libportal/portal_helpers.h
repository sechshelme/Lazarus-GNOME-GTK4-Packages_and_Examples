/*
 * Copyright (C) 2018, Matthias Clasen
 *
 * This file is free software; you can redistribute it and/or modify it
 * under the terms of the GNU Lesser General Public License as
 * published by the Free Software Foundation, version 3.0 of the
 * License.
 *
 * This file is distributed in the hope that it will be useful, but
 * WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this program.  If not, see <http://www.gnu.org/licenses/>.
 *
 * SPDX-License-Identifier: LGPL-3.0-only
 */

#pragma once

#include <gio/gio.h>




#define XDP_TYPE_PORTAL (xdp_portal_get_type ())

// xxxxxxxxxxxxxxxxxxxxxxxxxxx
//G_DECLARE_FINAL_TYPE (XdpPortal, xdp_portal, XDP, PORTAL, GObject)

extern
XdpPortal *xdp_portal_new                   (void);

extern
XdpPortal *xdp_portal_initable_new          (GError **error);

extern
gboolean   xdp_portal_running_under_flatpak (void);

extern
gboolean   xdp_portal_running_under_snap    (GError **error);

extern
gboolean   xdp_portal_running_under_sandbox (void);


