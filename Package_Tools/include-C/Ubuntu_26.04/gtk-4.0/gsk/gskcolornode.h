/* GSK - The GTK Scene Kit
 *
 * Copyright 2016  Endless
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

#if !defined (__GSK_H_INSIDE__) && !defined (GTK_COMPILATION)
#error "Only <gsk/gsk.h> can be included directly."
#endif

#include <gsk/gsktypes.h>



typedef struct _GskColorNode                    GskColorNode;

#define GSK_TYPE_COLOR_NODE (gsk_color_node_get_type())

extern
GType                   gsk_color_node_get_type                 (void) ;
extern
GskRenderNode *         gsk_color_node_new                      (const GdkRGBA            *rgba,
                                                                 const graphene_rect_t    *bounds);
extern
const GdkRGBA *         gsk_color_node_get_color                (const GskRenderNode      *node) G_GNUC_PURE;



