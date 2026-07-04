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



typedef struct _GskBlendNode                    GskBlendNode;

#define GSK_TYPE_BLEND_NODE (gsk_blend_node_get_type())

extern
GType                   gsk_blend_node_get_type                 (void) ;
extern
GskRenderNode *         gsk_blend_node_new                      (GskRenderNode            *bottom,
                                                                 GskRenderNode            *top,
                                                                 GskBlendMode              blend_mode);
extern
GskRenderNode *         gsk_blend_node_get_bottom_child         (const GskRenderNode      *node) ;
extern
GskRenderNode *         gsk_blend_node_get_top_child            (const GskRenderNode      *node) ;
extern
GskBlendMode            gsk_blend_node_get_blend_mode           (const GskRenderNode      *node) ;



