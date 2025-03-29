/*
 * Copyright 2015 Christian Hergert <christian@hergert.me>
 * Copyright 2015 Ignacio Casal Quinteiro <icq@gnome.org>
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
#include "gtksourceview.h"



#define GTK_SOURCE_TYPE_MAP (gtk_source_map_get_type())

//G_DECLARE_DERIVABLE_TYPE (GtkSourceMap, gtk_source_map, GTK_SOURCE, MAP, GtkSourceView)

struct _GtkSourceMapClass
{
	GtkSourceViewClass parent_class;

	/*< private >*/
	gpointer _reserved[10];
};

extern
GtkWidget     *gtk_source_map_new      (void);
extern
void           gtk_source_map_set_view (GtkSourceMap  *map,
                                        GtkSourceView *view);
extern
GtkSourceView *gtk_source_map_get_view (GtkSourceMap  *map);


