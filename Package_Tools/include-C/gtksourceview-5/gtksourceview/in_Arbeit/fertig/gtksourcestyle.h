/*
 * This file is part of GtkSourceView
 *
 * Copyright 2003 - Paolo Maggi <paolo.maggi@polito.it>
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



#define GTK_SOURCE_TYPE_STYLE (gtk_source_style_get_type ())

//G_DECLARE_FINAL_TYPE (GtkSourceStyle, gtk_source_style, GTK_SOURCE, STYLE, GObject)

extern
GtkSourceStyle *gtk_source_style_copy  (const GtkSourceStyle *style);
extern
void            gtk_source_style_apply (const GtkSourceStyle *style,
                                        GtkTextTag           *tag);


