/*
 * Copyright (C) 2021, Georges Basile Stavracas Neto
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

#include <libportal/types.h>



#define XDP_TYPE_PARENT (xdp_parent_get_type ())

extern
GType xdp_parent_get_type (void) ;

extern
XdpParent *xdp_parent_copy (XdpParent *source);

extern
void xdp_parent_free (XdpParent *parent);




