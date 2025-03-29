/*
 * This file is part of GtkSourceView
 *
 * Copyright 2002-2005 - Paolo Maggi
 * Copyright 2014, 2015 - Sébastien Wilmet <swilmet@gnome.org>
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

#include <glib.h>
#include <glib-object.h>

#include "gtksourcetypes.h"



#define GTK_SOURCE_TYPE_ENCODING (gtk_source_encoding_get_type ())

extern
GType                    gtk_source_encoding_get_type               (void) ;
extern
const GtkSourceEncoding *gtk_source_encoding_get_from_charset       (const gchar             *charset);
extern
gchar                   *gtk_source_encoding_to_string              (const GtkSourceEncoding *enc);
extern
const gchar             *gtk_source_encoding_get_name               (const GtkSourceEncoding *enc);
extern
const gchar             *gtk_source_encoding_get_charset            (const GtkSourceEncoding *enc);
extern
const GtkSourceEncoding *gtk_source_encoding_get_utf8               (void);
extern
const GtkSourceEncoding *gtk_source_encoding_get_current            (void);
extern
GSList                  *gtk_source_encoding_get_all                (void);
extern
GSList                  *gtk_source_encoding_get_default_candidates (void);

/* These should not be used, they are just to make python bindings happy */
extern
GtkSourceEncoding       *gtk_source_encoding_copy                   (const GtkSourceEncoding *enc);
extern
void                     gtk_source_encoding_free                   (GtkSourceEncoding       *enc);


