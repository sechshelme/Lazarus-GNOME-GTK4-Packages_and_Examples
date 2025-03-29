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


#include <glib-object.h>

#include "gtksourcetypes.h"



#define GTK_SOURCE_TYPE_LANGUAGE_MANAGER (gtk_source_language_manager_get_type())

//G_DECLARE_FINAL_TYPE (GtkSourceLanguageManager, gtk_source_language_manager, GTK_SOURCE, LANGUAGE_MANAGER, GObject)

extern
GtkSourceLanguageManager *gtk_source_language_manager_new                 (void);
extern
GtkSourceLanguageManager *gtk_source_language_manager_get_default         (void);
extern
const gchar * const      *gtk_source_language_manager_get_search_path     (GtkSourceLanguageManager *lm);
extern
void                      gtk_source_language_manager_set_search_path     (GtkSourceLanguageManager *lm,
                                                                           const gchar * const      *dirs);
extern
void                      gtk_source_language_manager_append_search_path  (GtkSourceLanguageManager *lm,
                                                                           const gchar              *path);
extern
void                      gtk_source_language_manager_prepend_search_path (GtkSourceLanguageManager *lm,
                                                                           const gchar              *path);
extern
const gchar * const      *gtk_source_language_manager_get_language_ids    (GtkSourceLanguageManager *lm);
extern
GtkSourceLanguage        *gtk_source_language_manager_get_language        (GtkSourceLanguageManager *lm,
                                                                           const gchar              *id);
extern
GtkSourceLanguage        *gtk_source_language_manager_guess_language      (GtkSourceLanguageManager *lm,
                                                                           const gchar              *filename,
                                                                           const gchar              *content_type);


