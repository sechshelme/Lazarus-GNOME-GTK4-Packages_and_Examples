/*
 * This file is part of GtkSourceView
 *
 * Copyright 2010 - Jesse van den Kieboom
 *
 * GtkSourceView is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 *
 * GtkSourceView is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public License
 * along with this library; if not, see <http://www.gnu.org/licenses/>.
 */

#pragma once

#if !defined (GTK_SOURCE_H_INSIDE) && !defined (GTK_SOURCE_COMPILATION)
#error "Only <gtksourceview/gtksource.h> can be included directly."
#endif

#include "gtksourcetypes.h"
#include "gtksourcegutterrenderer.h"



#define GTK_SOURCE_TYPE_GUTTER_RENDERER_PIXBUF (gtk_source_gutter_renderer_pixbuf_get_type())

extern
G_DECLARE_DERIVABLE_TYPE (GtkSourceGutterRendererPixbuf, gtk_source_gutter_renderer_pixbuf, GTK_SOURCE, GUTTER_RENDERER_PIXBUF, GtkSourceGutterRenderer)

struct _GtkSourceGutterRendererPixbufClass
{
	GtkSourceGutterRendererClass parent_class;

	/*< private >*/
	gpointer _reserved[10];
};

extern
GtkSourceGutterRenderer *gtk_source_gutter_renderer_pixbuf_new               (void);
extern
void                     gtk_source_gutter_renderer_pixbuf_set_pixbuf        (GtkSourceGutterRendererPixbuf *renderer,
                                                                              GdkPixbuf                     *pixbuf);
extern
GdkPixbuf               *gtk_source_gutter_renderer_pixbuf_get_pixbuf        (GtkSourceGutterRendererPixbuf *renderer);
extern
void                     gtk_source_gutter_renderer_pixbuf_set_gicon         (GtkSourceGutterRendererPixbuf *renderer,
                                                                              GIcon                         *icon);
extern
GIcon                   *gtk_source_gutter_renderer_pixbuf_get_gicon         (GtkSourceGutterRendererPixbuf *renderer);
extern
void                     gtk_source_gutter_renderer_pixbuf_set_icon_name     (GtkSourceGutterRendererPixbuf *renderer,
                                                                              const gchar                   *icon_name);
extern
const gchar             *gtk_source_gutter_renderer_pixbuf_get_icon_name     (GtkSourceGutterRendererPixbuf *renderer);
extern
GdkPaintable            *gtk_source_gutter_renderer_pixbuf_get_paintable     (GtkSourceGutterRendererPixbuf *renderer);
extern
void                     gtk_source_gutter_renderer_pixbuf_set_paintable     (GtkSourceGutterRendererPixbuf *renderer,
                                                                              GdkPaintable                  *paintable);
extern
void                     gtk_source_gutter_renderer_pixbuf_overlay_paintable (GtkSourceGutterRendererPixbuf *renderer,
                                                                              GdkPaintable                  *paintable);


