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
#include <gsk/gskrendernode.h>



typedef struct _GskLinearGradientNode           GskLinearGradientNode;
typedef struct _GskRepeatingLinearGradientNode  GskRepeatingLinearGradientNode;

#define GSK_TYPE_LINEAR_GRADIENT_NODE (gsk_linear_gradient_node_get_type())
#define GSK_TYPE_REPEATING_LINEAR_GRADIENT_NODE (gsk_repeating_linear_gradient_node_get_type())

extern
GType                   gsk_linear_gradient_node_get_type           (void) ;
extern
GskRenderNode *         gsk_linear_gradient_node_new                (const graphene_rect_t    *bounds,
                                                                     const graphene_point_t   *start,
                                                                     const graphene_point_t   *end,
                                                                     const GskColorStop       *color_stops,
                                                                     gsize                     n_color_stops);
extern
const graphene_point_t * gsk_linear_gradient_node_get_start         (const GskRenderNode      *node) ;
extern
const graphene_point_t * gsk_linear_gradient_node_get_end           (const GskRenderNode      *node) ;
extern
gsize                    gsk_linear_gradient_node_get_n_color_stops (const GskRenderNode      *node) ;
extern
const GskColorStop *     gsk_linear_gradient_node_get_color_stops   (const GskRenderNode      *node,
                                                                     gsize                    *n_stops);

extern
GType                   gsk_repeating_linear_gradient_node_get_type (void) ;
extern
GskRenderNode *         gsk_repeating_linear_gradient_node_new      (const graphene_rect_t    *bounds,
                                                                     const graphene_point_t   *start,
                                                                     const graphene_point_t   *end,
                                                                     const GskColorStop       *color_stops,
                                                                     gsize                     n_color_stops);


