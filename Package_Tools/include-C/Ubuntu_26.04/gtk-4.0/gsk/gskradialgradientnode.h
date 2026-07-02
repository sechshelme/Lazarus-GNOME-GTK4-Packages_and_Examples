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



typedef struct _GskRadialGradientNode           GskRadialGradientNode;
typedef struct _GskRepeatingRadialGradientNode  GskRepeatingRadialGradientNode;

#define GSK_TYPE_RADIAL_GRADIENT_NODE (gsk_radial_gradient_node_get_type())

#define GSK_TYPE_REPEATING_RADIAL_GRADIENT_NODE (gsk_repeating_radial_gradient_node_get_type())


extern
GType                   gsk_radial_gradient_node_get_type (void) ;
extern
GskRenderNode *         gsk_radial_gradient_node_new      (const graphene_rect_t    *bounds,
                                                           const graphene_point_t   *center,
                                                           float                     hradius,
                                                           float                     vradius,
                                                           float                     start,
                                                           float                     end,
                                                           const GskColorStop       *color_stops,
                                                           gsize                     n_color_stops);
extern
gsize                   gsk_radial_gradient_node_get_n_color_stops (const GskRenderNode *node) G_GNUC_PURE;
extern
const GskColorStop *    gsk_radial_gradient_node_get_color_stops   (const GskRenderNode *node,
                                                                    gsize               *n_stops);
extern
const graphene_point_t *gsk_radial_gradient_node_get_center        (const GskRenderNode *node) G_GNUC_PURE;
extern
float                   gsk_radial_gradient_node_get_hradius       (const GskRenderNode *node) G_GNUC_PURE;
extern
float                   gsk_radial_gradient_node_get_vradius       (const GskRenderNode *node) G_GNUC_PURE;
extern
float                   gsk_radial_gradient_node_get_start         (const GskRenderNode *node) G_GNUC_PURE;
extern
float                   gsk_radial_gradient_node_get_end           (const GskRenderNode *node) G_GNUC_PURE;

extern
GType                   gsk_repeating_radial_gradient_node_get_type (void) ;
extern
GskRenderNode *         gsk_repeating_radial_gradient_node_new      (const graphene_rect_t    *bounds,
                                                                     const graphene_point_t   *center,
                                                                     float                     hradius,
                                                                     float                     vradius,
                                                                     float                     start,
                                                                     float                     end,
                                                                     const GskColorStop       *color_stops,
                                                                     gsize                     n_color_stops);


