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



#define GTK_SOURCE_TYPE_LANGUAGE (gtk_source_language_get_type())

//G_DECLARE_FINAL_TYPE (GtkSourceLanguage, gtk_source_language, GTK_SOURCE, LANGUAGE, GObject)

extern
const gchar  *gtk_source_language_get_id             (GtkSourceLanguage *language);
extern
const gchar  *gtk_source_language_get_name           (GtkSourceLanguage *language);
extern
const gchar  *gtk_source_language_get_section        (GtkSourceLanguage *language);
extern
gboolean      gtk_source_language_get_hidden         (GtkSourceLanguage *language);
extern
const gchar  *gtk_source_language_get_metadata       (GtkSourceLanguage *language,
                                                      const gchar       *name);
extern
gchar       **gtk_source_language_get_mime_types     (GtkSourceLanguage *language);
extern
gchar       **gtk_source_language_get_globs          (GtkSourceLanguage *language);
extern
gchar       **gtk_source_language_get_style_ids      (GtkSourceLanguage *language);
extern
const gchar  *gtk_source_language_get_style_name     (GtkSourceLanguage *language,
                                                      const gchar       *style_id);
extern
const gchar  *gtk_source_language_get_style_fallback (GtkSourceLanguage *language,
                                                      const gchar       *style_id);


