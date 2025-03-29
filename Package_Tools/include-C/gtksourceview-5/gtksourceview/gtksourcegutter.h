/*
 * This file is part of GtkSourceView
 *
 * Copyright 2009 - Jesse van den Kieboom
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

#include <gtk/gtk.h>

#include "gtksourcetypes.h"



#define GTK_SOURCE_TYPE_GUTTER (gtk_source_gutter_get_type())

extern
G_DECLARE_FINAL_TYPE (GtkSourceGutter, gtk_source_gutter, GTK_SOURCE, GUTTER, GtkWidget)

extern
GtkSourceView     *gtk_source_gutter_get_view        (GtkSourceGutter         *gutter);
extern
gboolean           gtk_source_gutter_insert          (GtkSourceGutter         *gutter,
                                                      GtkSourceGutterRenderer *renderer,
                                                      gint                     position);
extern
void               gtk_source_gutter_reorder         (GtkSourceGutter         *gutter,
                                                      GtkSourceGutterRenderer *renderer,
                                                      gint                     position);
extern
void               gtk_source_gutter_remove          (GtkSourceGutter         *gutter,
                                                      GtkSourceGutterRenderer *renderer);


