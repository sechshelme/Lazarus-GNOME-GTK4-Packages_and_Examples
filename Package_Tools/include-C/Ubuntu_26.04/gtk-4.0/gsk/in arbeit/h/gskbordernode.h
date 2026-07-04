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



typedef struct _GskBorderNode                    GskBorderNode;

#define GSK_TYPE_BORDER_NODE (gsk_border_node_get_type())

extern
GType                   gsk_border_node_get_type                (void) ;
extern
GskRenderNode *         gsk_border_node_new                     (const GskRoundedRect     *outline,
                                                                 const float               border_width[4],
                                                                 const GdkRGBA             border_color[4]);
extern
const GskRoundedRect *  gsk_border_node_get_outline             (const GskRenderNode      *node) ;
extern
const float *           gsk_border_node_get_widths              (const GskRenderNode      *node) ;
extern
const GdkRGBA *         gsk_border_node_get_colors              (const GskRenderNode      *node) ;



