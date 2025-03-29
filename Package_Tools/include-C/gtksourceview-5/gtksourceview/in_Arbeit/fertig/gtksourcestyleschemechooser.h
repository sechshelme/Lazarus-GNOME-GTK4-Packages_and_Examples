/*
 * This file is part of GtkSourceView
 *
 * Copyright 2014 - Ignacio Casal Quinteiro
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
 * along with GtkSourceView. If not, see <http://www.gnu.org/licenses/>.
 */


#include <glib-object.h>

#include "gtksourcetypes.h"



#define GTK_SOURCE_TYPE_STYLE_SCHEME_CHOOSER (gtk_source_style_scheme_chooser_get_type())

//G_DECLARE_INTERFACE (GtkSourceStyleSchemeChooser, gtk_source_style_scheme_chooser, GTK_SOURCE, STYLE_SCHEME_CHOOSER, GObject)

struct _GtkSourceStyleSchemeChooserInterface
{
	GTypeInterface base_interface;

	/* Methods */
	GtkSourceStyleScheme *(*get_style_scheme) (GtkSourceStyleSchemeChooser *chooser);

	void                  (*set_style_scheme) (GtkSourceStyleSchemeChooser *chooser,
	                                           GtkSourceStyleScheme        *scheme);

	/*< private >*/
	gpointer _reserved[12];
};

extern
GtkSourceStyleScheme *gtk_source_style_scheme_chooser_get_style_scheme (GtkSourceStyleSchemeChooser *chooser);
extern
void                  gtk_source_style_scheme_chooser_set_style_scheme (GtkSourceStyleSchemeChooser *chooser,
                                                                        GtkSourceStyleScheme        *scheme);


