/* GTK - The GIMP Toolkit
 * Copyright (C) 2023 Benjamin Otte
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



#define GDK_TYPE_TEXTURE_DOWNLOADER    (gdk_texture_downloader_get_type ())

extern
GType                   gdk_texture_downloader_get_type         (void) ;
extern
GdkTextureDownloader *  gdk_texture_downloader_new              (GdkTexture                     *texture);

extern
GdkTextureDownloader *  gdk_texture_downloader_copy             (const GdkTextureDownloader     *self);
extern
void                    gdk_texture_downloader_free             (GdkTextureDownloader           *self);


extern
void                    gdk_texture_downloader_set_texture      (GdkTextureDownloader           *self,
                                                                 GdkTexture                     *texture);
extern
GdkTexture *            gdk_texture_downloader_get_texture      (const GdkTextureDownloader     *self);
extern
void                    gdk_texture_downloader_set_format       (GdkTextureDownloader           *self,
                                                                 GdkMemoryFormat                 format);
extern
GdkMemoryFormat         gdk_texture_downloader_get_format       (const GdkTextureDownloader     *self);
extern
void                    gdk_texture_downloader_set_color_state  (GdkTextureDownloader           *self,
                                                                 GdkColorState                  *color_state);
extern
GdkColorState *         gdk_texture_downloader_get_color_state  (const GdkTextureDownloader     *self);


extern
void                    gdk_texture_downloader_download_into    (const GdkTextureDownloader     *self,
                                                                 guchar                         *data,
                                                                 gsize                           stride);
extern
GBytes *                gdk_texture_downloader_download_bytes   (const GdkTextureDownloader     *self,
                                                                 gsize                          *out_stride);
extern
GBytes *                gdk_texture_downloader_download_bytes_with_planes
                                                                (const GdkTextureDownloader     *self,
                                                                 gsize                           out_offsets[4],
                                                                 gsize                           out_strides[4]);

////G_DEFINE_AUTOPTR_CLEANUP_FUNC  (GdkTextureDownloader, gdk_texture_downloader_free)



