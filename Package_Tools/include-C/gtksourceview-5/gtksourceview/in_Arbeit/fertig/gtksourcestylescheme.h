/*
 * This file is part of GtkSourceView
 *
 * Copyright 2003 - Paolo Maggi <paolo.maggi@polito.it>
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

 * You should have received a copy of the GNU Lesser General Public License
 * along with this library; if not, see <http://www.gnu.org/licenses/>.
 */

#include <gtk/gtk.h>

#include "gtksourcetypes.h"



#define GTK_SOURCE_TYPE_STYLE_SCHEME (gtk_source_style_scheme_get_type())

//G_DECLARE_FINAL_TYPE (GtkSourceStyleScheme, gtk_source_style_scheme, GTK_SOURCE, STYLE_SCHEME, GObject)

extern
const gchar         *gtk_source_style_scheme_get_id          (GtkSourceStyleScheme *scheme);
extern
const gchar         *gtk_source_style_scheme_get_name        (GtkSourceStyleScheme *scheme);
extern
const gchar         *gtk_source_style_scheme_get_description (GtkSourceStyleScheme *scheme);
extern
const gchar * const *gtk_source_style_scheme_get_authors     (GtkSourceStyleScheme *scheme);
extern
const gchar         *gtk_source_style_scheme_get_filename    (GtkSourceStyleScheme *scheme);
extern
GtkSourceStyle      *gtk_source_style_scheme_get_style       (GtkSourceStyleScheme *scheme,
                                                              const gchar          *style_id);
extern
const char          *gtk_source_style_scheme_get_metadata    (GtkSourceStyleScheme *scheme,
                                                              const char           *name);


