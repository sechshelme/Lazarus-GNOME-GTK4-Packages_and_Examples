/*
 * This file is part of GtkSourceView
 *
 * Copyright 2015 - Université Catholique de Louvain
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
 *
 * Author: Sébastien Wilmet
 */


#include <gtk/gtk.h>

#include "gtksourcetypes.h"



#define GTK_SOURCE_TYPE_TAG (gtk_source_tag_get_type())

//G_DECLARE_DERIVABLE_TYPE (GtkSourceTag, gtk_source_tag, GTK_SOURCE, TAG, GtkTextTag)

struct _GtkSourceTagClass
{
	GtkTextTagClass parent_class;

  /*< private >*/
	gpointer _reserved[10];
};

extern
GtkTextTag *gtk_source_tag_new (const gchar *name);


