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



typedef struct _GskRepeatNode                   GskRepeatNode;

#define GSK_TYPE_REPEAT_NODE                    (gsk_repeat_node_get_type())

extern
GType                   gsk_repeat_node_get_type                (void) ;
extern
GskRenderNode *         gsk_repeat_node_new                     (const graphene_rect_t    *bounds,
                                                                 GskRenderNode            *child,
                                                                 const graphene_rect_t    *child_bounds);
extern
GskRenderNode *         gsk_repeat_node_get_child               (const GskRenderNode      *node) G_GNUC_PURE;
extern
const graphene_rect_t * gsk_repeat_node_get_child_bounds        (const GskRenderNode      *node) G_GNUC_PURE;



