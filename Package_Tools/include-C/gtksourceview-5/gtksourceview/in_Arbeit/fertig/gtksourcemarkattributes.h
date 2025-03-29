/*
 * This file is part of GtkSourceView
 *
 * Copyright 2010 - Jesse van den Kieboom
 * Copyright 2010 - Krzesimir Nowak
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

#include <gtk/gtk.h>

#include "gtksourcetypes.h"



#define GTK_SOURCE_TYPE_MARK_ATTRIBUTES (gtk_source_mark_attributes_get_type())

//G_DECLARE_FINAL_TYPE (GtkSourceMarkAttributes, gtk_source_mark_attributes, GTK_SOURCE, MARK_ATTRIBUTES, GObject)

extern
GtkSourceMarkAttributes *gtk_source_mark_attributes_new                (void);
extern
void                     gtk_source_mark_attributes_set_background     (GtkSourceMarkAttributes *attributes,
                                                                        const GdkRGBA           *background);
extern
gboolean                 gtk_source_mark_attributes_get_background     (GtkSourceMarkAttributes *attributes,
                                                                        GdkRGBA                 *background);
extern
void                     gtk_source_mark_attributes_set_icon_name      (GtkSourceMarkAttributes *attributes,
                                                                        const gchar             *icon_name);
extern
const gchar             *gtk_source_mark_attributes_get_icon_name      (GtkSourceMarkAttributes *attributes);
extern
void                     gtk_source_mark_attributes_set_gicon          (GtkSourceMarkAttributes *attributes,
                                                                        GIcon                   *gicon);
extern
GIcon                   *gtk_source_mark_attributes_get_gicon          (GtkSourceMarkAttributes *attributes);
extern
void                     gtk_source_mark_attributes_set_pixbuf         (GtkSourceMarkAttributes *attributes,
                                                                        const GdkPixbuf         *pixbuf);
extern
const GdkPixbuf         *gtk_source_mark_attributes_get_pixbuf         (GtkSourceMarkAttributes *attributes);
extern
GdkPaintable            *gtk_source_mark_attributes_render_icon        (GtkSourceMarkAttributes *attributes,
                                                                        GtkWidget               *widget,
                                                                        gint                     size);
extern
gchar                   *gtk_source_mark_attributes_get_tooltip_text   (GtkSourceMarkAttributes *attributes,
                                                                        GtkSourceMark           *mark);
extern
gchar                   *gtk_source_mark_attributes_get_tooltip_markup (GtkSourceMarkAttributes *attributes,
                                                                        GtkSourceMark           *mark);


