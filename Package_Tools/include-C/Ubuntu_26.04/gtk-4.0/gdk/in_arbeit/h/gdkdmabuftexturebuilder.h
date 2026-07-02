/*
 * Copyright © 2023 Red Hat, Inc.
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library. If not, see <http://www.gnu.org/licenses/>.
 *
 * Authors: Matthias Clasen <mclasen@redhat.com>
 */

#pragma once

#if !defined (__GDK_H_INSIDE__) && !defined (GTK_COMPILATION)
#error "Only <gdk/gdk.h> can be included directly."
#endif

#include <gdk/gdktypes.h>



#define GDK_TYPE_DMABUF_TEXTURE_BUILDER (gdk_dmabuf_texture_builder_get_type ())
extern
//GDK_DECLARE_INTERNAL_TYPE (GdkDmabufTextureBuilder, gdk_dmabuf_texture_builder, GDK, DMABUF_TEXTURE_BUILDER, GObject)

extern
GdkDmabufTextureBuilder *gdk_dmabuf_texture_builder_new              (void);

extern
GdkDisplay *             gdk_dmabuf_texture_builder_get_display      (GdkDmabufTextureBuilder    *self) ;
extern
void                     gdk_dmabuf_texture_builder_set_display      (GdkDmabufTextureBuilder    *self,
                                                                      GdkDisplay                 *display);

extern
unsigned int             gdk_dmabuf_texture_builder_get_width        (GdkDmabufTextureBuilder    *self) ;
extern
void                     gdk_dmabuf_texture_builder_set_width        (GdkDmabufTextureBuilder    *self,
                                                                      unsigned int                width);

extern
unsigned int             gdk_dmabuf_texture_builder_get_height       (GdkDmabufTextureBuilder    *self) ;
extern
void                     gdk_dmabuf_texture_builder_set_height       (GdkDmabufTextureBuilder    *self,
                                                                      unsigned int                height);

extern
guint32                  gdk_dmabuf_texture_builder_get_fourcc       (GdkDmabufTextureBuilder    *self) ;
extern
void                     gdk_dmabuf_texture_builder_set_fourcc       (GdkDmabufTextureBuilder    *self,
                                                                      guint32                     fourcc);

extern
guint64                  gdk_dmabuf_texture_builder_get_modifier     (GdkDmabufTextureBuilder    *self) ;
extern
void                     gdk_dmabuf_texture_builder_set_modifier     (GdkDmabufTextureBuilder    *self,
                                                                      guint64                     modifier);

extern
gboolean                 gdk_dmabuf_texture_builder_get_premultiplied (GdkDmabufTextureBuilder    *self) ;
extern
void                     gdk_dmabuf_texture_builder_set_premultiplied (GdkDmabufTextureBuilder    *self,
                                                                       gboolean                    premultiplied);

extern
unsigned int             gdk_dmabuf_texture_builder_get_n_planes     (GdkDmabufTextureBuilder    *self) ;
extern
void                     gdk_dmabuf_texture_builder_set_n_planes     (GdkDmabufTextureBuilder    *self,
                                                                      unsigned int                n_planes);

extern
int                      gdk_dmabuf_texture_builder_get_fd           (GdkDmabufTextureBuilder    *self,
                                                                      unsigned int                plane) ;
extern
void                     gdk_dmabuf_texture_builder_set_fd           (GdkDmabufTextureBuilder    *self,
                                                                      unsigned int                plane,
                                                                      int                         fd);

extern
unsigned int             gdk_dmabuf_texture_builder_get_stride       (GdkDmabufTextureBuilder    *self,
                                                                      unsigned int                plane) ;
extern
void                     gdk_dmabuf_texture_builder_set_stride       (GdkDmabufTextureBuilder    *self,
                                                                      unsigned int                plane,
                                                                      unsigned int                stride);

extern
unsigned int             gdk_dmabuf_texture_builder_get_offset       (GdkDmabufTextureBuilder    *self,
                                                                      unsigned int                plane) ;
extern
void                     gdk_dmabuf_texture_builder_set_offset       (GdkDmabufTextureBuilder    *self,
                                                                      unsigned int                plane,
                                                                      unsigned int                offset);

extern
GdkColorState *          gdk_dmabuf_texture_builder_get_color_state    (GdkDmabufTextureBuilder  *self);
extern
void                     gdk_dmabuf_texture_builder_set_color_state    (GdkDmabufTextureBuilder  *self,
                                                                        GdkColorState            *color_state);

extern
GdkTexture *             gdk_dmabuf_texture_builder_get_update_texture (GdkDmabufTextureBuilder  *self) ;
extern
void                     gdk_dmabuf_texture_builder_set_update_texture (GdkDmabufTextureBuilder  *self,
                                                                        GdkTexture               *texture);

extern
cairo_region_t *         gdk_dmabuf_texture_builder_get_update_region (GdkDmabufTextureBuilder   *self) ;
extern
void                     gdk_dmabuf_texture_builder_set_update_region (GdkDmabufTextureBuilder   *self,
                                                                       cairo_region_t            *region);

extern
GdkTexture *             gdk_dmabuf_texture_builder_build            (GdkDmabufTextureBuilder    *self,
                                                                      GDestroyNotify              destroy,
                                                                      gpointer                    data,
                                                                      GError                    **error);



