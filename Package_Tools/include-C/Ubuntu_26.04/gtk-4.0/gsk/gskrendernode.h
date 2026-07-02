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

#include <gsk/gskroundedrect.h>
#include <gsk/gsktypes.h>
#include <gtk/css/gtkcss.h>



#define GSK_TYPE_RENDER_NODE (gsk_render_node_get_type ())

#define GSK_IS_RENDER_NODE(obj) (G_TYPE_CHECK_INSTANCE_TYPE ((obj), GSK_TYPE_RENDER_NODE))

#define GSK_SERIALIZATION_ERROR       (gsk_serialization_error_quark ())

typedef struct _GskColorStop            GskColorStop;

/**
 * GskColorStop:
 * @offset: the offset of the color stop
 * @color: the color at the given offset
 *
 * A color stop in a gradient node.
 */
struct _GskColorStop
{
  float offset;
  GdkRGBA color;
};

typedef struct _GskParseLocation GskParseLocation;

/**
 * GskParseLocation:
 * @bytes: the offset of the location in the parse buffer, as bytes
 * @chars: the offset of the location in the parse buffer, as characters
 * @lines: the line of the location in the parse buffer
 * @line_bytes: the position in the line, as bytes
 * @line_chars: the position in the line, as characters
 *
 * A location in a parse buffer.
 */
struct _GskParseLocation
{
  gsize bytes;
  gsize chars;
  gsize lines;
  gsize line_bytes;
  gsize line_chars;
};

/**
 * GskParseErrorFunc:
 * @start: start of the error location
 * @end: end of the error location
 * @error: the error
 * @user_data: user data
 *
 * Type of callback that is called when an error occurs
 * during node deserialization.
 */
typedef void           (* GskParseErrorFunc)                    (const GskParseLocation *start,
                                                                 const GskParseLocation *end,
                                                                 const GError           *error,
                                                                 gpointer                user_data);

extern
GType                   gsk_render_node_get_type                (void) ;

extern
GQuark                  gsk_serialization_error_quark           (void);

extern
GskRenderNode *         gsk_render_node_ref                     (GskRenderNode *node);
extern
void                    gsk_render_node_unref                   (GskRenderNode *node);

extern
GskRenderNodeType       gsk_render_node_get_node_type           (const GskRenderNode *node);

extern
void                    gsk_render_node_get_bounds              (GskRenderNode   *node,
                                                                 graphene_rect_t *bounds);
extern
GskRenderNode **        gsk_render_node_get_children            (GskRenderNode   *self,
                                                                 gsize           *n_children);

extern
gboolean                gsk_render_node_get_opaque_rect         (GskRenderNode   *self,
                                                                 graphene_rect_t *out_opaque) ;

extern
void                    gsk_render_node_draw                    (GskRenderNode *node,
                                                                 cairo_t       *cr);

extern
GBytes *                gsk_render_node_serialize               (GskRenderNode *node);
extern
gboolean                gsk_render_node_write_to_file           (GskRenderNode *node,
                                                                 const char    *filename,
                                                                 GError       **error);
extern
GskRenderNode *         gsk_render_node_deserialize             (GBytes            *bytes,
                                                                 GskParseErrorFunc  error_func,
                                                                 gpointer           user_data);

/**
 * GSK_VALUE_HOLDS_RENDER_NODE:
 * @value: a `GValue`
 *
 * Evaluates to true if @value was initialized with `GSK_TYPE_RENDER_NODE`.
 */
#define GSK_VALUE_HOLDS_RENDER_NODE(value)       (G_VALUE_HOLDS ((value), GSK_TYPE_RENDER_NODE))

extern
void                    gsk_value_set_render_node               (GValue                   *value,
                                                                 GskRenderNode            *node);
extern
void                    gsk_value_take_render_node              (GValue                   *value,
                                                                 GskRenderNode            *node);
extern
GskRenderNode *         gsk_value_get_render_node               (const GValue             *value);
extern
GskRenderNode *         gsk_value_dup_render_node               (const GValue             *value);

////G_DEFINE_AUTOPTR_CLEANUP_FUNC  (GskRenderNode, gsk_render_node_unref)


