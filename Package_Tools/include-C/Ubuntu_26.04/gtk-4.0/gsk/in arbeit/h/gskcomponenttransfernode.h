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



typedef struct _GskComponentTransferNode        GskComponentTransferNode;

#define GSK_TYPE_COMPONENT_TRANSFER_NODE (gsk_component_transfer_node_get_type())

extern
GType                   gsk_component_transfer_node_get_type    (void) ;

extern
GskRenderNode *         gsk_component_transfer_node_new         (GskRenderNode              *child,
                                                                 const GskComponentTransfer *r,
                                                                 const GskComponentTransfer *g,
                                                                 const GskComponentTransfer *b,
                                                                 const GskComponentTransfer *a);
extern
GskRenderNode *         gsk_component_transfer_node_get_child   (const GskRenderNode      *node) ;
extern
const GskComponentTransfer *
                        gsk_component_transfer_node_get_transfer (const GskRenderNode     *node,
                                                                  GdkColorChannel          component) ;



