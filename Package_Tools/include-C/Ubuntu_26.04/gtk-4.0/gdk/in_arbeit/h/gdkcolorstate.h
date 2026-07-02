/* gdkcolorstate.h
 *
 * Copyright 2024 Red Hat, Inc.
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library. If not, see <http://www.gnu.org/licenses/>.
 */

#pragma once

#if !defined (__GDK_H_INSIDE__) && !defined (GTK_COMPILATION)
#error "Only <gdk/gdk.h> can be included directly."
#endif

#include <gdk/gdktypes.h>



#define GDK_TYPE_COLOR_STATE (gdk_color_state_get_type ())

extern
GType           gdk_color_state_get_type                (void) ;

extern
GdkColorState * gdk_color_state_ref                     (GdkColorState  *self);

extern
void            gdk_color_state_unref                   (GdkColorState  *self);

extern
GdkColorState * gdk_color_state_get_srgb                (void);

extern
GdkColorState * gdk_color_state_get_srgb_linear         (void);

extern
GdkColorState * gdk_color_state_get_rec2100_pq          (void);

extern
GdkColorState * gdk_color_state_get_rec2100_linear      (void);

extern
GdkColorState * gdk_color_state_get_oklab               (void);

extern
GdkColorState * gdk_color_state_get_oklch               (void);

extern
gboolean        gdk_color_state_equal                   (GdkColorState  *self,
                                                         GdkColorState  *other);

extern
gboolean        gdk_color_state_equivalent              (GdkColorState  *self,
                                                         GdkColorState  *other);

extern
GdkCicpParams  *gdk_color_state_create_cicp_params      (GdkColorState  *self);


////G_DEFINE_AUTOPTR_CLEANUP_FUNC  (GdkColorState, gdk_color_state_unref)


